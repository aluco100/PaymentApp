//
//  AmountViewController.m
//  PaymentApp
//
//  Created by Alfredo Luco on 08-09-18.
//  Copyright © 2018 aluco. All rights reserved.
//

#import "AmountViewController.h"
#import "PaymentViewController.h"
#import <InputValidators/LKRequiredValidator.h>

@interface AmountViewController ()

@end

@implementation AmountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.submitButton addTarget:self action:@selector(addAmount) forControlEvents:UIControlEventTouchUpInside];
    [[self.amountTextField layer] setCornerRadius:16.0];
    [[self.amountTextField layer] setBorderWidth:1.0];
    [[self.amountTextField layer] setBorderColor:[[UIColor lightGrayColor] colorWithAlphaComponent:0.7].CGColor];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(recieveMessageNotification:)
                                                 name:@"MessageNotification"
                                               object:nil];
//    self.amountTextField.delegate = self;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addAmount{
    LKRequiredValidator* validator = [LKRequiredValidator validator];
    BOOL valid = [validator validate:self.amountTextField.text error:nil];
    if(!valid){
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"ERROR" message:@"Debes colocar un monto para iniciar." preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];
        return;
    }
    [[NSUserDefaults standardUserDefaults] setValue:self.amountTextField.text forKey:@"amount"];
    [self performSegueWithIdentifier:@"paymentSegue" sender:self];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"paymentSegue"]){
        PaymentViewController* destination = (PaymentViewController*)segue.destinationViewController;
        destination.amount = [self.amountTextField text];
        destination.step = 0;
    }
}

- (void) recieveMessageNotification:(NSNotification *) notification
{
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Resumen" message:[NSString stringWithFormat:@"Monto: %@\n Forma de Pago: %@\n Banco: %@\n Cuota: %@\n",[userDefaults valueForKey:@"amount"],[userDefaults valueForKey:@"method"],[userDefaults valueForKey:@"bank"],[userDefaults valueForKey:@"issuer"]] preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alert animated:YES completion:nil];
}


@end
