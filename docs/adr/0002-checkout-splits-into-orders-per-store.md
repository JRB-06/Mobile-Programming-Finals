# One Checkout creates one Order per Store

A Cart can hold Variants from several Stores. Checkout pays once but creates a separate Order for each Store, each with its own Order Status, Shipping Fee, Platform Fee and Refund. We chose this over one Order containing items from many Stores because each Pharmacist fulfills and ships independently. A single combined status would have no meaning, and its access rules would have to filter Order Items per Store.
