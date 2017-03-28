//
//  BTCurrencyAPIManager.m
//  basket
//
//  Created by Lukáš Fečke on 28/03/2017.
//  Copyright © 2017 Lukáš Fečke. All rights reserved.
//

#import "BTCurrencyAPIManager.h"
#import "BTShopManager.h"

@implementation BTCurrencyAPIManager

+ (NSMutableArray *)downloadCurrenciesWithBlock:(void (^)(NSDictionary *currencies))currencyBlock;
{
    NSString *urlString = @"http://apilayer.net/api/live?access_key=eebefb0a6f7c5f93b782aa4862d67f33&currencies=USD,EUR,AUD,CAD,PLN,MXN&format=1";
    
    NSURL *currenciesURL = [NSURL URLWithString:urlString];

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:currenciesURL];
    
    // Specify that it will be a POST request
    request.HTTPMethod = @"GET";
    
    // This is how we set header fields
    [request setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];

    NSURLSessionDataTask *task =
    [[NSURLSession sharedSession] dataTaskWithRequest:request
                                    completionHandler:^(NSData *data,
                                                        NSURLResponse *response,
                                                        NSError *error) {
                                        NSDictionary *dict = [self getJsonFromDataOrReturnError:data];
                                        currencyBlock(dict);
                                        NSLog(@"RESPONSE:%@, ERROR:%@", dict, error);
                                    }];
    [task resume];
    
    return nil;
}

+ (NSDictionary *)getJsonFromDataOrReturnError:(NSData *)data
{
    NSError *error = nil;
    NSDictionary *jsonArray;
    if (data)
    {
        jsonArray = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        if (error != nil) {
            NSLog(@"Error parsing JSON.");
        }
        else {
            NSLog(@"Array: %@", jsonArray);
        }
    }
    
    return jsonArray;
}

@end
