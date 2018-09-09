//
//  PaymentContext.m
//  PaymentApp
//
//  Created by Alfredo Luco on 09-09-18.
//  Copyright © 2018 aluco. All rights reserved.
//

#import "PaymentContext.h"
#import "PaymentProtocol.h"
#import "BankStrategy.h"
#import "IssuerStrategy.h"
#import "PaymentMethodStrategy.h"

@implementation PaymentContext

-(id)strategy:(NSInteger)step{
    
    if(step == 1){
        return [BankStrategy alloc];
    }else if(step == 2){
        return [IssuerStrategy alloc];
    }
    
    return [PaymentMethodStrategy alloc];
    
}

@end
