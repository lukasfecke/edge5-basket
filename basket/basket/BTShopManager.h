//
//  BTShopManager.h
//  basket
//
//  Created by Lukáš Fečke on 27/03/2017.
//  Copyright © 2017 Lukáš Fečke. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BTBasket.h"
#import "BTFood.h"
#import "BTCurrency.h"
#import "BTViewController.h"

//delegate
@protocol ShopManagerDelegate <NSObject>

@required
- (void)addFoodToBasket:(BTFood *)food;
- (void)emptyBasket;
- (void)setCustomCurrentViewController:(BTViewController *)viewController;
- (void)setCurrency:(NSString *)currency;
- (float)getTotalPriceInCurrentCurrency;
- (NSMutableArray *)retrieveAllFood;
- (NSMutableArray *)retrieveAllFoodInBasket;

@end

@interface BTShopManager : NSObject <ShopManagerDelegate>

//properties
@property(nonatomic,strong) BTBasket *basket;
@property(nonatomic,strong) BTCurrency *activeCurrency;
@property(nonatomic,strong) NSMutableArray *currencies;
@property(nonatomic,strong) NSMutableArray *food;

@property(nonatomic,strong) BTViewController *currentViewController;

//methods
- (id)initWithFood:(NSMutableArray *)food;

@end
