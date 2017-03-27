//
//  BTTomato.m
//  basket
//
//  Created by Lukáš Fečke on 27/03/2017.
//  Copyright © 2017 Lukáš Fečke. All rights reserved.
//

#import "BTTomato.h"

@implementation BTTomato

- (id)init
{
    self = [super init];
    
    if (self)
    {
        self.foodName = @"Tomatoes";
        self.foodImage = [UIImage imageNamed:@"tomato"];
        self.price = 0.95;
    }
    
    return self;
}

@end
