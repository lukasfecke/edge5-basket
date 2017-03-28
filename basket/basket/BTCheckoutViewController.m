//
//  BTCheckoutViewController.m
//  basket
//
//  Created by Lukáš Fečke on 27/03/2017.
//  Copyright © 2017 Lukáš Fečke. All rights reserved.
//

#import "BTCheckoutViewController.h"

@interface BTCheckoutViewController () <UIPickerViewDataSource, UIPickerViewDelegate>

@property(nonatomic,weak) IBOutlet UILabel *priceLabel;
@property(nonatomic,weak) IBOutlet UIPickerView *pickerView;

@end

@implementation BTCheckoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self updateUI];
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

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    [self.delegate setCurrencyAtIndex:row];
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    return 200;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 50;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSMutableArray *currencies = [self.delegate retrieveAllCurrencies];
    BTCurrency *currency = [currencies objectAtIndex:row];
    
    NSString *componentTitle = [currency currencyName];
    
    return componentTitle;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [[self.delegate retrieveAllCurrencies] count];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (void)updateUI
{
    [self.priceLabel setText:[NSString stringWithFormat:@"%.2f %@", [self.delegate getTotalPriceInCurrentCurrency], [self.delegate retrieveActiveCurrencyName]]];
}

@end
