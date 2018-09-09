//
//  PaymentMethod.m
//  PaymentApp
//
//  Created by Alfredo Luco on 08-09-18.
//  Copyright © 2018 aluco. All rights reserved.
//

#import "PaymentMethod.h"


@implementation PaymentMethod

- (NSString *)itemID { 
    return self.id;
}

- (NSString *)itemName { 
    return self.name;
}

- (NSString *)itemThumbnail { 
    return self.thumbnail;
}

@end
