//
//  BTButton.m
//  basket
//
//  Created by Lukáš Fečke on 28/03/2017.
//  Copyright © 2017 Lukáš Fečke. All rights reserved.
//

#import "BTButton.h"

@implementation BTButton

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self.layer setCornerRadius:10];
}

@end
