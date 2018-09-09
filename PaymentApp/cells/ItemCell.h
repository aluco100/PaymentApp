//
//  ItemCell.h
//  PaymentApp
//
//  Created by Alfredo Luco on 08-09-18.
//  Copyright © 2018 aluco. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PaymentMethod.h"
#import "dataProtocol.h"
#import "CellProtocol.h"

@interface ItemCell : UITableViewCell<CellProtocol>
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *itemTitleLabel;

//-(void)setup: (id<DataProtocol>)method;

@end
