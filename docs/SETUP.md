# Dev Setup: Flutter + Android Emulator (Pixel 8) on Windows, without Android Studio

Tested target: Windows 11, Intel CPU. Commands are **PowerShell**.
Install everything under `D:\dev\` (no spaces in paths, and not under Program Files).

## Versions

| Tool | Version | Why |
|---|---|---|
| JDK | **Eclipse Temurin 17 (LTS)** | Flutter's Android Gradle Plugin builds target 17. 21 also works, but 17 has the fewest surprises. |
| Flutter | **3.50.1 stable** (Dart 3.14) | Both teammates should use the same version (`flutter --version`) |
| Android cmdline-tools | **latest** | Replaces Android Studio's SDK manager |
| Android platform | `platforms;android-36` (**required** by Flutter 3.50) + `platforms;android-35` | Missing 36 makes `flutter doctor` fail and the first build slow |
| Build tools | `build-tools;36.0.0` (+ `35.0.0`) | |
| Emulator image | `system-images;android-35;google_apis_playstore;x86_64` | x86_64 runs fast on Intel through the hypervisor |
| Device profile | `pixel_8` | |
| Editor | VS Code + **Flutter** extension (installs Dart too) | |

## 1. Install the JDK
```powershell
winget install EclipseAdoptium.Temurin.17.JDK
```
Note the install path (usually `C:\Program Files\Eclipse Adoptium\jdk-17.x.x-hotspot`).

## 2. Install Flutter
1. Download the **Windows stable zip** from https://docs.flutter.dev/get-started/install/windows (the "Android" path).
2. Extract it so you have `D:\dev\flutter\bin\flutter.bat`.

## 3. Install the Android command-line tools
1. Open https://developer.android.com/studio, scroll to **"Command line tools only"**, and download the Windows zip.
2. Extract it. The zip contains a `cmdline-tools` folder. Rearrange it so the final layout is exactly:
```
D:\dev\Android\Sdk\cmdline-tools\latest\bin\sdkmanager.bat
```
   (Create the `latest` folder and move `bin`, `lib` and the other contents into it. The tools refuse to work without this layout.)

## 4. Environment variables (user level)
Run this once, then **close and reopen** the terminal (and VS Code):
```powershell
$jdk = (Get-ChildItem "C:\Program Files\Eclipse Adoptium" -Directory | Where-Object Name -like "jdk-17*" | Select-Object -First 1).FullName
[Environment]::SetEnvironmentVariable("JAVA_HOME", $jdk, "User")
[Environment]::SetEnvironmentVariable("ANDROID_HOME", "D:\dev\Android\Sdk", "User")
$p = [Environment]::GetEnvironmentVariable("Path", "User")
$add = "D:\dev\flutter\bin;D:\dev\Android\Sdk\cmdline-tools\latest\bin;D:\dev\Android\Sdk\platform-tools;D:\dev\Android\Sdk\emulator"
[Environment]::SetEnvironmentVariable("Path", "$p;$add", "User")
```
Check:
```powershell
java -version        # 17.x
sdkmanager --version
flutter --version
```

## 5. Enable hardware acceleration
The emulator on Intel uses **Windows Hypervisor Platform (WHPX)**.
1. Make sure **virtualization (VT-x)** is enabled in the BIOS. Task Manager → Performance → CPU shows "Virtualization: Enabled".
2. In an **admin** PowerShell:
```powershell
Enable-WindowsOptionalFeature -Online -FeatureName HypervisorPlatform -All
```
3. Reboot.

## 6. Install the SDK packages
```powershell
sdkmanager --install "platform-tools" "emulator" "platforms;android-36" "build-tools;36.0.0" "platforms;android-35" "build-tools;35.0.0" "system-images;android-35;google_apis_playstore;x86_64"
sdkmanager --licenses      # press y for each
```
(About 3–4 GB download. The terminal can look frozen during the system-image download, so let it finish.)

Ignore the "sdkmanager is deprecated, use Android CLI" warning. Do **not** switch to the new `android` binary: on this machine Smart App Control blocks its bundled Java runtime.

## 7. Create the Pixel 8 emulator
```powershell
avdmanager create avd -n pixel8 -k "system-images;android-35;google_apis_playstore;x86_64" -d pixel_8
```
Answer `no` to "custom hardware profile".
An `Error: Could not load devices from ...\devices.xml` message is harmless. The AVD is still created (check `%USERPROFILE%\.android\avd\pixel8.avd`).

Optional tuning in `%USERPROFILE%\.android\avd\pixel8.avd\config.ini`:
```
hw.keyboard=yes        # type with your PC keyboard
hw.ramSize=4096
hw.gpu.enabled=yes
hw.gpu.mode=host
```

Check that acceleration works:
```powershell
emulator -accel-check     # should say WHPX is installed and usable
```

## 8. Point Flutter at the SDK
```powershell
flutter config --android-sdk D:\dev\Android\Sdk
flutter config --jdk-dir "$env:JAVA_HOME"
flutter doctor --android-licenses
flutter doctor -v
```
Expected: ✓ Flutter, ✓ Android toolchain. **Ignore** "Android Studio (not installed)" and "Visual Studio" (only needed for Windows desktop apps). Chrome is optional.

## 9. Run it
```powershell
flutter emulators --launch pixel8     # or: emulator -avd pixel8
flutter devices                        # should list "sdk gphone64 x86 64"
flutter create smoke_test
cd smoke_test
flutter run
```
The **first build takes 5–15 min** (it downloads Gradle, ~240 MB, plus the Android dependencies into `%USERPROFILE%\.gradle`). Later builds take ~30–60 s. Keep `flutter run` open and use `r` (hot reload) and `R` (hot restart) instead of re-running.
**Never start a second `flutter run` while the first is still on `assembleDebug`.** The second one waits on the Gradle download lock and fails with `Timeout ... waiting for exclusive access`.

In VS Code: open the project, click the device name in the status bar (bottom right), pick **pixel8**, and press F5.

## 10. Supabase (for later)
1. Create a free project at https://supabase.com.
2. Go to Project Settings → API and copy the **Project URL** and **anon public** key.
3. Put them in `env.json` (add it to `.gitignore`):
```json
{ "SUPABASE_URL": "https://xxxx.supabase.co", "SUPABASE_ANON_KEY": "eyJ..." }
```
4. Run with `flutter run --dart-define-from-file=env.json`.
5. Go to Authentication → URL Configuration and add the redirect `com.lospolloshermanos.app://login-callback` (used for email confirmation and password reset deep links).

## Troubleshooting

| Problem | Fix |
|---|---|
| `cmdline-tools component is missing` | The folder layout from step 3 is wrong. It must be `cmdline-tools\latest\bin`. |
| Emulator shows a black screen or crashes | `emulator -avd pixel8 -gpu swiftshader_indirect` |
| Emulator very slow, "x86 emulation requires hardware acceleration" | Step 5 isn't done (BIOS VT-x or HypervisorPlatform), or you didn't reboot |
| Gradle error about the Java version | `flutter config --jdk-dir "<path to jdk-17>"` |
| `flutter` not recognized | Reopen the terminal. Check PATH from step 4. |
| Emulator can't reach the internet | Cold boot it: `emulator -avd pixel8 -no-snapshot-load` |
| `Timeout of 120000 reached waiting for exclusive access` | Another build is still downloading Gradle. Wait for it to finish, or run `cd android; .\gradlew --stop` and run again. |
| `cmdline-tools` → `ClassNotFoundException SdkManagerCli` | `lib` is not inside `latest`. Move everything into `cmdline-tools\latest`. |
| Builds slow in general | Add the project folder and `%USERPROFILE%\.gradle` to the Windows Defender exclusions |
| Disk space | SDK + image + Gradle cache is ~10 GB. Keep it on D:. |
