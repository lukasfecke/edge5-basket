//
//  BTViewController.m
//  basket
//
//  Created by Lukáš Fečke on 27/03/2017.
//  Copyright © 2017 Lukáš Fečke. All rights reserved.
//

#import "BTViewController.h"

@interface BTViewController ()

@end

@implementation BTViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *image = [UIImage imageNamed:@"bg"];
    UIColor *bgColor = [UIColor colorWithPatternImage:image];
    
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlackTranslucent];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self.view setBackgroundColor:bgColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
