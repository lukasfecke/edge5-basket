//
//  BTCheckoutViewController.h
//  basket
//
//  Created by Lukáš Fečke on 27/03/2017.
//  Copyright © 2017 Lukáš Fečke. All rights reserved.
//

#import "BTViewController.h"
#import "BTShopManager.h"

@interface BTCheckoutViewController : BTViewController

@property(nonatomic,strong) id<ShopManagerDelegate> delegate;

@end
