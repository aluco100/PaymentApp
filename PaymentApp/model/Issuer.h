//
//  Issuer.h
//  PaymentApp
//
//  Created by Alfredo Luco on 09-09-18.
//  Copyright © 2018 aluco. All rights reserved.
//

#import "JSONModel.h"
#import "PayerCost.h"

@interface Issuer : JSONModel

@property (nonatomic) NSString *payment_method_id;
@property (nonatomic) NSString *payment_type_id;
//@property (nonatomic) NSString *status;
@property (nonatomic) NSArray <PayerCost> *payer_costs;

@end
