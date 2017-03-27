//
//  CollectionViewCell.h
//  basket
//
//  Created by Lukáš Fečke on 27/03/2017.
//  Copyright © 2017 Lukáš Fečke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BTShopManager.h"
#import "BTFood.h"

@interface BTCollectionViewCell : UICollectionViewCell

@property(nonatomic,weak) IBOutlet UIImageView *foodImage;
@property(nonatomic,weak) IBOutlet UILabel *foodName;
@property(nonatomic,weak) IBOutlet UILabel *price;

@property(nonatomic,weak) BTFood *food;
@property(nonatomic,strong) id<ShopManagerDelegate> delegate;
@property(nonatomic,strong) BTViewController *controller;

@end
