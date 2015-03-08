//
//  BNRChangeDateViewController.m
//  Homepwner
//
//  Created by Robert Hieger on 3/7/15.
//  Copyright (c) 2015 Robert Hieger. All rights reserved.
//

#import "BNRChangeDateViewController.h"
#import "BNRItem.h"
#import "BNRDetailViewController.h"

@interface BNRChangeDateViewController ()

@property (weak, nonatomic) IBOutlet UIDatePicker *changeDate;

@property (weak, nonatomic) IBOutlet UIButton *submitNewDate;

@end

@implementation BNRChangeDateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (IBAction) changeDate: (UIDatePicker *) sender {
    
    
    
}   // end - (IBAction) changeDate (UIDate Picker *) sender

- (IBAction)submitNewDate:(UIButton *)sender {
    
    [self resignFirstResponder];
    
}


@end
