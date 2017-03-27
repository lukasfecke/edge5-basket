//
//  BTMilk.m
//  basket
//
//  Created by Lukáš Fečke on 27/03/2017.
//  Copyright © 2017 Lukáš Fečke. All rights reserved.
//

#import "BTMilk.h"

@implementation BTMilk

- (id)init
{
    self = [super init];
    
    if (self)
    {
        self.foodName = @"Milk";
        self.foodImage = [UIImage imageNamed:@"milk"];
        self.price = 1.30;
    }
    
    return self;
}

@end
