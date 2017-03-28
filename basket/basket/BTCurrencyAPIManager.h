//
//  BTCurrencyAPIManager.h
//  basket
//
//  Created by Lukáš Fečke on 28/03/2017.
//  Copyright © 2017 Lukáš Fečke. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BTCurrencyAPIManager : NSObject

+ (NSMutableArray *)downloadCurrenciesWithBlock:(void (^)(NSDictionary *currencies))currencyBlock;

@end
