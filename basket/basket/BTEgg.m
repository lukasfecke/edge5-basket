//
//  BTEgg.m
//  basket
//
//  Created by Lukáš Fečke on 27/03/2017.
//  Copyright © 2017 Lukáš Fečke. All rights reserved.
//

#import "BTEgg.h"

@implementation BTEgg

- (id)init
{
    self = [super init];
    
    if (self)
    {
        self.foodName = @"Dozen eggs";
        self.foodImage = [UIImage imageNamed:@"eggs"];
        self.price = 2.10;
    }
    
    return self;
}

@end
