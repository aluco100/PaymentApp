//
//  ItemCell.m
//  PaymentApp
//
//  Created by Alfredo Luco on 08-09-18.
//  Copyright © 2018 aluco. All rights reserved.
//

#import "ItemCell.h"
#import <Haneke/Haneke.h>

@implementation ItemCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)bindData:(id<DataProtocol>)item{
    self.itemTitleLabel.text = [item itemName];
    [self.image hnk_setImageFromURL:[NSURL URLWithString:[item itemThumbnail]]];
}

//-(void)setup:(id<DataProtocol>)method{
//    self.itemTitleLabel.text = [method itemName];
//    [self.image hnk_setImageFromURL:[NSURL URLWithString:[method itemThumbnail]]];
//}




@end
