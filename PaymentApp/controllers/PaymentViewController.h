//
//  PaymentViewController.h
//  PaymentApp
//
//  Created by Alfredo Luco on 08-09-18.
//  Copyright © 2018 aluco. All rights reserved.
//

#import "ViewController.h"

@interface PaymentViewController : ViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;
@property (readwrite,nonatomic) NSString* amount;
@property NSInteger step;
@end
