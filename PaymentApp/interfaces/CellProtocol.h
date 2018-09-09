//
//  CellProtocol.h
//  PaymentApp
//
//  Created by Alfredo Luco on 09-09-18.
//  Copyright © 2018 aluco. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "dataProtocol.h"

@protocol CellProtocol

- (void)bindData:(id<DataProtocol>)item;

@end

//@interface CellProtocol : NSObject
//
//@end
