//
//  BTBasket.m
//  basket
//
//  Created by Lukáš Fečke on 27/03/2017.
//  Copyright © 2017 Lukáš Fečke. All rights reserved.
//

#import "BTBasket.h"
#import "BTFood.h"

@implementation BTBasket

- (id)init
{
    self = [super init];
    
    if (self)
    {
        self.food = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (id)initWithFood:(NSMutableArray *)food
{
    self = [super init];
    
    if (self)
    {
        self.food = food;
    }
    
    return self;
}

// edited getter for total price in dollars
- (float)basketTotalPriceInDollars
{
    __block float totalPrice = 0;
    
    [self.food enumerateObjectsUsingBlock:^(id object, NSUInteger inde, BOOL *stop){
        if ([object isKindOfClass:[BTFood class]])
        {
            BTFood *food = (BTFood *)object;
            totalPrice += (food.price);
        }
    }];
    
    return totalPrice;
}

//for adding food
- (void)addFood:(BTFood *)food
{
    [self.food addObject:food];
}

- (void)clear
{
    [self.food removeAllObjects];
}

@end
