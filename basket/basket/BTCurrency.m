//
//  BTCurrency.m
//  basket
//
//  Created by Lukáš Fečke on 27/03/2017.
//  Copyright © 2017 Lukáš Fečke. All rights reserved.
//

#import "BTCurrency.h"

@implementation BTCurrency

- (id)initWithName:(NSString *)currencyName andWithSign:(NSString *)currencySign andWithExchangeRateVsDollar:(float)exchangeRate
{
    self = [super init];
    
    if (self)
    {
        self.currencyName = currencyName;
        self.currencySign = currencySign;
        self.exchangeRateVsDollar = exchangeRate;
    }
    
    return self;
}

@end
