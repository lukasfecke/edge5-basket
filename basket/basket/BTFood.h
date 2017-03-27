//
//  BTFood.h
//  basket
//
//  Created by Lukáš Fečke on 27/03/2017.
//  Copyright © 2017 Lukáš Fečke. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BTFood : NSObject

@property(nonatomic,strong) NSString *foodName;
@property(nonatomic,assign) int quantity;
@property(nonatomic,assign) float price;

@property(nonatomic,strong) UIImage *foodImage;

@end
