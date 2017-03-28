//
//  BTShopViewController.m
//  basket
//
//  Created by Lukáš Fečke on 27/03/2017.
//  Copyright © 2017 Lukáš Fečke. All rights reserved.
//

#import "BTShopViewController.h"
#import "BTCollectionViewCell.h"
#import "BTFood.h"
#import "Constants.h"
#import "BTBean.h"
#import "BTEgg.h"
#import "BTMilk.h"
#import "BTTomato.h"
#import "BTCurrencyAPIManager.h"
#import "BTCheckoutViewController.h"

@interface BTShopViewController ()
//@property(nonatomic,strong) NSMutableArray *food;

@property(nonatomic,weak) IBOutlet UICollectionView *colectionView;
@property(nonatomic,weak) IBOutlet UILabel *priceLabel;

@end

@implementation BTShopViewController

//variables
static BOOL nibMyCellloaded = NO;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    BTBean *bean = [[BTBean alloc] init];
    BTMilk *milk = [[BTMilk alloc] init];
    BTEgg *eggs = [[BTEgg alloc] init];
    BTTomato *tomato = [[BTTomato alloc] init];
    BTBean *bean1 = [[BTBean alloc] init];
    BTMilk *milk1 = [[BTMilk alloc] init];
    BTEgg *eggs1 = [[BTEgg alloc] init];
    BTTomato *tomato1 = [[BTTomato alloc] init];
    
    NSMutableArray *food = [[NSMutableArray alloc] initWithObjects:bean, milk, eggs, tomato, bean1, milk1, eggs1, tomato1, nil];
    
    self.delegate = [[BTShopManager alloc] initWithFood:food];
    [self.delegate setCustomCurrentViewController:self];
    self.priceLabel.layer.masksToBounds = YES;
    self.priceLabel.layer.cornerRadius = 20;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.delegate setCustomCurrentViewController:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateUI
{
    [self.priceLabel setText:[NSString stringWithFormat:@"$ %.2f", [self.delegate getTotalPriceInCurrentCurrency]]];
}

#pragma mark - Collection View
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout*)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = self.colectionView.frame.size.width;
    width = (width - 60) / 2;
    CGFloat height = width * 1.2;
    CGSize size = CGSizeMake(width, height);
    
    return size;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:      (NSInteger)section
{
    return [[self.delegate retrieveAllFood] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(!nibMyCellloaded)
    {
        UINib *nib = [UINib nibWithNibName:@"BTCollectionViewCell" bundle: nil];
        [collectionView registerNib:nib forCellWithReuseIdentifier:kCell];
        nibMyCellloaded = YES;
    }
    
    BTCollectionViewCell *cell = (BTCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:kCell forIndexPath:indexPath];
    
    BTFood *food = [[self.delegate retrieveAllFood] objectAtIndex:indexPath.row];
    [cell.foodImage setImage:[food foodImage]];
    [cell.foodName setText:[food foodName]];
    [cell.price setText:[NSString stringWithFormat:@"$ %.2f", [food price]]];
    [cell setDelegate:self.delegate];
    [cell setFood:food];
//    cell.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    
    return cell;
}


- (IBAction)checkout:(id)sender
{
    [BTCurrencyAPIManager downloadCurrenciesWithBlock:^(NSDictionary *currencies){
        NSDictionary *dict = [currencies objectForKey:@"quotes"];
        NSLog(@"%@", dict);
    }];
}

#pragma mark - Navigation
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    BTCheckoutViewController *vc = (BTCheckoutViewController *)[segue destinationViewController];
    [vc setDelegate:self.delegate];
}

@end
