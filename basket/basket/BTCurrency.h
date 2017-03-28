//
//  BTCurrency.h
//  basket
//
//  Created by Lukáš Fečke on 27/03/2017.
//  Copyright © 2017 Lukáš Fečke. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BTCurrency : NSObject

//properties
@property(nonatomic,strong) NSString *currencyName;
@property(nonatomic,strong) NSString *currencySign;
@property(nonatomic,assign) float exchangeRateVsDollar;

//methods
- (id)initWithName:(NSString *)currencyName andWithExchangeRateVsDollar:(float)exchangeRate;
@end
