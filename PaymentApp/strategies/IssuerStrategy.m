//
//  IssuerStrategy.m
//  PaymentApp
//
//  Created by Alfredo Luco on 09-09-18.
//  Copyright © 2018 aluco. All rights reserved.
//

#import "IssuerStrategy.h"
#import "CreditCardManager.h"

@implementation IssuerStrategy

-(void)retrieveData:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure{
    [[CreditCardManager sharedInstance] retreiveRecomendMessage:^(NSArray* list){
        success(list);
    } failure:^(NSError* error){
        failure(error);
    }];
}

-(void)setupData:(id<DataProtocol>)data{
    [[NSUserDefaults standardUserDefaults] setValue:data.itemID forKey:@"issuer"];
}

-(NSString *)cellIdentifier{
    return @"messageIdentifier";
}

@end
