//
//  MessageCell.h
//  PaymentApp
//
//  Created by Alfredo Luco on 08-09-18.
//  Copyright © 2018 aluco. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellProtocol.h"

@interface MessageCell : UITableViewCell<CellProtocol>
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@end
