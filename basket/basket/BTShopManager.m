//
//  BTShopManager.m
//  basket
//
//  Created by Lukáš Fečke on 27/03/2017.
//  Copyright © 2017 Lukáš Fečke. All rights reserved.
//

#import "BTShopManager.h"

@implementation BTShopManager

- (id)initWithFood:(NSMutableArray *)food
{
    self = [super init];
    
    if (self)
    {
        self.food = food;
        self.basket = [[BTBasket alloc] init];
        
        [self setupCurrencies];
    }
    
    return self;
}

- (void)setupCurrencies
{
    self.activeCurrency = [[BTCurrency alloc] initWithName:@"USD" andWithSign:@"$" andWithExchangeRateVsDollar:1.];
    //todo: methods for the retrieving currencies trough api manager and populate array
}

- (void)addFoodToBasket:(BTFood *)food
{
    [self.basket addFood:food];
    [self.currentViewController updateUI];
}

- (void)emptyBasket
{
    [self.basket clear];
}

- (void)setCurrency:(NSString *)currency
{
    self.currency = currency;
}

- (float)getTotalPriceInCurrentCurrency
{
    float price = [self.basket basketTotalPriceInDollars];
    
    price *= [self.activeCurrency exchangeRateVsDollar];
    
    return price;
}


- (NSMutableArray *)retrieveAllFoodInBasket
{
    return [self.basket food];
}

- (NSMutableArray *)retrieveAllFood
{
    return self.food;
}

- (void)setCustomCurrentViewController:(BTViewController *)viewController
{
    self.currentViewController = viewController;
}

@end
