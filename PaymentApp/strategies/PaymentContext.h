//
//  PaymentContext.h
//  PaymentApp
//
//  Created by Alfredo Luco on 09-09-18.
//  Copyright © 2018 aluco. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PaymentProtocol.h"

@interface PaymentContext : NSObject
-(id<PaymentProtocol>)strategy: (NSInteger)step;

@end
