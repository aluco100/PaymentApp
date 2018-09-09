//
//  AmountViewController.h
//  PaymentApp
//
//  Created by Alfredo Luco on 08-09-18.
//  Copyright © 2018 aluco. All rights reserved.
//

#import "ViewController.h"
#import <UIKit/UIKit.h>

@interface AmountViewController : ViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *amountTextField;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;

@end
