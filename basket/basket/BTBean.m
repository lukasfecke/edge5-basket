//
//  BTBean.m
//  basket
//
//  Created by Lukáš Fečke on 27/03/2017.
//  Copyright © 2017 Lukáš Fečke. All rights reserved.
//

#import "BTBean.h"

@implementation BTBean

- (id)init
{
    self = [super init];
    
    if (self)
    {
        self.foodName = @"Beans";
        self.foodImage = [UIImage imageNamed:@"beans"];
        self.price = 0.73;
    }
    
    return self;
}

@end
