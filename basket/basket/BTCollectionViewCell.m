//
//  CollectionViewCell.m
//  basket
//
//  Created by Lukáš Fečke on 27/03/2017.
//  Copyright © 2017 Lukáš Fečke. All rights reserved.
//

#import "BTCollectionViewCell.h"

@implementation BTCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    [self.layer setCornerRadius:10];
}

- (IBAction)addFoodToBasket:(id)sender
{
    [self.delegate addFoodToBasket:self.food];
}

@end
