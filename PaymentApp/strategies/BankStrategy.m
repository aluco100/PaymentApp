//
//  BankStrategy.m
//  PaymentApp
//
//  Created by Alfredo Luco on 09-09-18.
//  Copyright © 2018 aluco. All rights reserved.
//

#import "BankStrategy.h"
#import "CreditCardManager.h"

@implementation BankStrategy

-(void)retrieveData:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure{
    [[CreditCardManager sharedInstance] getBanks:^(NSArray* list){
        success(list);
    } failure:^(NSError* error){
        failure(error);
    }];
}

-(void)setupData:(id<DataProtocol>)data{
    [[NSUserDefaults standardUserDefaults] setObject:data.itemID forKey:@"bank"];
}

-(NSString *)cellIdentifier{
    return @"itemIdentifier";
}

@end
