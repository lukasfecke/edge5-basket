//
//  BTBasket.h
//  basket
//
//  Created by Lukáš Fečke on 27/03/2017.
//  Copyright © 2017 Lukáš Fečke. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BTFood.h"

@interface BTBasket : NSObject

//properties
@property(nonatomic,strong) NSMutableArray *food;
@property(nonatomic,assign) float basketTotalPriceInDollars;

//methods
- (id)init;
- (id)initWithFood:(NSMutableArray *)food;
- (void)addFood:(BTFood *)food;
- (void)clear;

@end
