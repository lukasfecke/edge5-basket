//
//  BTShopManager.m
//  basket
//
//  Created by Lukáš Fečke on 27/03/2017.
//  Copyright © 2017 Lukáš Fečke. All rights reserved.
//

#import "BTShopManager.h"
#import "BTCurrencyAPIManager.h"

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
//    self.activeCurrency = [[BTCurrency alloc] initWithName:@"USD" andWithExchangeRateVsDollar:1.];
    self.currencies = [[NSMutableArray alloc] init];
    
    [BTCurrencyAPIManager downloadCurrenciesWithBlock:^(NSDictionary *currencies){
        __block NSDictionary *dict = [currencies objectForKey:@"quotes"];
        __block NSMutableArray *currenciesNames = [[NSMutableArray alloc] initWithObjects:@"USDAUD", @"USDCAD", @"USDEUR", @"USDMXN", @"USDPLN", @"USDUSD", nil];
        [currenciesNames enumerateObjectsUsingBlock:^(id object, NSUInteger inde, BOOL *stop){
            if ([object isKindOfClass:[NSString class]])
            {
                NSString *name = (NSString *)object;
                BTCurrency *currency = [[BTCurrency alloc] initWithName:[name substringFromIndex:3] andWithExchangeRateVsDollar:[[dict objectForKey:name] floatValue]];
                [self.currencies addObject:currency];
                if ([name isEqualToString:@"USDUSD"])
                {
                    self.activeCurrency = currency;
                }
            }
        }];
    }];
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

- (void)setCurrencyAtIndex:(NSInteger)currencyIndex
{
    self.activeCurrency = [self.currencies objectAtIndex:currencyIndex];
    [self.currentViewController updateUI];
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

- (NSMutableArray *)retrieveAllCurrencies
{
    return self.currencies;
}

- (NSString *)retrieveActiveCurrencyName
{
    return [self.activeCurrency currencyName];
}
@end
