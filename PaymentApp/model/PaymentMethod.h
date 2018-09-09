//
//  PaymentMethod.h
//  PaymentApp
//
//  Created by Alfredo Luco on 08-09-18.
//  Copyright © 2018 aluco. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel/JSONModel.h>
#import "dataProtocol.h"

@interface PaymentMethod : JSONModel<DataProtocol>
@property (nonatomic) NSString *id;
@property (nonatomic) NSString *name;
//@property (nonatomic) NSString *status;
@property (nonatomic) NSString *thumbnail;
@end
