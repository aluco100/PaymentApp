//
//  PaymentMethodStrategy.m
//  PaymentApp
//
//  Created by Alfredo Luco on 09-09-18.
//  Copyright © 2018 aluco. All rights reserved.
//

#import "PaymentMethodStrategy.h"
#import "CreditCardManager.h"

@implementation PaymentMethodStrategy

-(void)retrieveData:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure{
    [[CreditCardManager sharedInstance] getPaymentMethods:^(NSArray* list){
        success(list);
    } failure:^(NSError* error){
        failure(error);
    }];
}

-(void)setupData:(id<DataProtocol>)data{
    [[NSUserDefaults standardUserDefaults] setValue:data.itemID forKey:@"method"];
}

-(NSString *)cellIdentifier{
    return @"itemIdentifier";
}
@end
