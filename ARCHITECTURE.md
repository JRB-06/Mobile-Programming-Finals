# Architecture

## 1. Overview

### Los Pollos Hermanos
      A Pharmaceutical E-commerce 




## 2. Pipeline

```
                                                      [Cart]
                                                            |
[Stage 1] → [Stage 2] → [Stage 3] [Stage 4] → [Stage 5] → [Stage 1]
      |
[Admin Page]
```
*. `App components`  
      (Top Navigation) - Logo, cart  
      (Bottom Navigation) - Search, Profile

1. `Authentication`  
            Username, Password   (login credentials will determine whether the user is an admin or consumer)
            → 
            Stage 2 || Admin Page
2. `HomePage`  
      A page where the user selects/search the desired pharmacist directly
            Pharmacist input
            → 
            Stage 3
3. `Pharmacist products` 
      Displays the product of the selected pharmacist, where the user can add to cart 
            add to cart 
            → 

4. `Add to cart` 
      Displays the items in cart for checkout
            checkout
            → 
            Stage 5

5. `checkout` 
      contains checkout details
            complete order, shipping details, payment
            → 
            Stage 1  

*. `Admin Page` 
      idk
      
*. `Profile Page` 
      Contains profile details
            Edit profile
            → 
            New profile details


## 3. Components

`[Mobile app]` | `` 

 `[Database]` | `` 



