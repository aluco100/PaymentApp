//
//  CreditCardManager.m
//  PaymentApp
//
//  Created by Alfredo Luco on 08-09-18.
//  Copyright © 2018 aluco. All rights reserved.
//

#import "CreditCardManager.h"
#import "PaymentMethod.h"
#import "Issuer.h"

@implementation CreditCardManager

-(NSString*)apiKey{
    return @"444a9ef5-8a6b-429f-abdf-587639155d88";
}

+ (instancetype)sharedInstance
{
    static CreditCardManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[CreditCardManager alloc] init];
        // Do any other initialisation stuff here
    });
    return sharedInstance;
}

-(void)getPaymentMethods:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure{
    NSString* api = [self apiKey];
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.mercadopago.com/v1/payment_methods?public_key=%@",api]];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:URL.absoluteString parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        //TODO: Mapping de la respuesta
        
        NSLog(@"%@",[responseObject class]);
        
        NSMutableArray* list = [NSMutableArray array];
        
        for (id item in responseObject) {
            NSLog(@"%@", item);
            NSError *error;
            PaymentMethod* method = [[PaymentMethod alloc] initWithDictionary:item error:&error];
            [list addObject:method];
        }
        
        success(list);
        
        NSLog(@"JSON: %@", responseObject);
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        failure(error);
    }];
}

-(void)getBanks:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure{
    NSString* api = [self apiKey];
    NSString* paymentMethodID = [[NSUserDefaults standardUserDefaults] valueForKey:@"method"];
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.mercadopago.com/v1/payment_methods/card_issuers?public_key=%@&payment_method_id=%@",api,paymentMethodID]];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:URL.absoluteString parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        //TODO: Mapping de la respuesta
        NSMutableArray* list = [NSMutableArray array];
        
        for (id item in responseObject) {
            NSLog(@"%@", item);
            NSError *error;
            PaymentMethod* method = [[PaymentMethod alloc] initWithDictionary:item error:&error];
            [list addObject:method];
        }
        
        success(list);
        NSLog(@"JSON: %@", responseObject);
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        failure(error);
    }];
}

-(void)retreiveRecomendMessage:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure{
    NSString* api = [self apiKey];
    NSString* amount = [[NSUserDefaults standardUserDefaults] valueForKey:@"amount"];
    NSString* paymentMethod = [[NSUserDefaults standardUserDefaults] valueForKey:@"method"];
    NSString* issuer = [[NSUserDefaults standardUserDefaults] valueForKey:@"bank"];
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.mercadopago.com/v1/payment_methods/installments?public_key=%@&amount=%@&payment_method_id=%@&issuer.id=%@",api,amount,paymentMethod,issuer]];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:URL.absoluteString parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        //TODO: Mapping de la respuesta
        NSError *error;
        Issuer *issuer = [[Issuer alloc] initWithDictionary:responseObject[0] error:&error];
        success(issuer.payer_costs);
        NSLog(@"JSON: %@", responseObject);
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        failure(error);
    }];
}


@end
