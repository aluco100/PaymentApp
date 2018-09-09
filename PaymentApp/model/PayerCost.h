//
//  PayerCost.h
//  PaymentApp
//
//  Created by Alfredo Luco on 09-09-18.
//  Copyright © 2018 aluco. All rights reserved.
//

#import "JSONModel.h"
#import "dataProtocol.h"

@protocol PayerCost;
@interface PayerCost : JSONModel<DataProtocol>
@property (nonatomic) NSString *recommended_message;
@property (nonatomic) NSNumber *installment_amount;
@property (nonatomic) NSNumber *total_amount;

@end
