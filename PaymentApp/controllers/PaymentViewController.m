//
//  PaymentViewController.m
//  PaymentApp
//
//  Created by Alfredo Luco on 08-09-18.
//  Copyright © 2018 aluco. All rights reserved.
//

#import "PaymentViewController.h"
#import "CreditCardManager.h"
#import "ItemCell.h"
#import "PaymentProtocol.h"
#import "PaymentContext.h"
#import "CellProtocol.h"

@interface PaymentViewController ()

@property (readwrite,nonatomic) NSArray* list;

@end

@implementation PaymentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    PaymentContext* context = [PaymentContext alloc];
    [[context strategy:self.step] retrieveData:^(NSArray* list){
        self.list = list;
        [self.tableview reloadData];
    } failure:^(NSError* error){
        NSLog(@"%@",error);
    }];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.list.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    PaymentContext* context = [[PaymentContext alloc] init];
    
    UITableViewCell<CellProtocol> *cell = [tableView dequeueReusableCellWithIdentifier: [[context strategy:self.step] cellIdentifier]];
    [cell bindData:self.list[indexPath.row]];
    return cell;
//    ItemCell* cell = [tableView dequeueReusableCellWithIdentifier:@"itemIdentifier" forIndexPath:indexPath];
//    [cell setup:self.list[indexPath.row]];
//    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    PaymentContext* context = [PaymentContext alloc];
    [[context strategy:self.step] setupData:self.list[indexPath.row]];

    if(self.step == 2){
        [self.navigationController popToRootViewControllerAnimated:YES];
        [[NSNotificationCenter defaultCenter]
         postNotificationName:@"MessageNotification"
         object:nil];
        return;
    }
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    PaymentViewController* vc = [storyboard instantiateViewControllerWithIdentifier:@"paymentID"];
    vc.step = self.step + 1;
    [self.navigationController pushViewController:vc animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
