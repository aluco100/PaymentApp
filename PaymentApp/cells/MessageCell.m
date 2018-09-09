//
//  MessageCell.m
//  PaymentApp
//
//  Created by Alfredo Luco on 08-09-18.
//  Copyright © 2018 aluco. All rights reserved.
//

#import "MessageCell.h"

@implementation MessageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)bindData:(id<DataProtocol>)item{
    NSLog(@"%@", item);
    self.messageLabel.text = [item itemName];
}
@end
