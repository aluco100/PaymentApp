//
//  CreditCardManager.h
//  PaymentApp
//
//  Created by Alfredo Luco on 08-09-18.
//  Copyright © 2018 aluco. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

@interface CreditCardManager : NSObject

+ (instancetype)sharedInstance;
- (void)getPaymentMethods:(void (^)(NSArray* list))success failure:(void (^)(NSError* error))failure;
- (void)getBanks:(void (^)(NSArray* list))success failure:(void (^)(NSError* error))failure;
- (void)retreiveRecomendMessage:(void (^)(NSArray* list))success failure:(void (^)(NSError* error))failure;


@end
