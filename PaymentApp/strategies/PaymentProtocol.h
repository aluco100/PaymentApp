//
//  PaymentProtocol.h
//  PaymentApp
//
//  Created by Alfredo Luco on 09-09-18.
//  Copyright © 2018 aluco. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "dataProtocol.h"

@protocol PaymentProtocol

- (void)retrieveData:(void (^)(NSArray* list))success failure:(void (^)(NSError* error))failure;
- (void)setupData: (id<DataProtocol>)data;
- (NSString*)cellIdentifier;

@end

//@interface PaymentProtocol : NSObject
//
//@end
