//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by Robert Hieger on 2/16/15.
//  Copyright (c) 2015 Robert Hieger. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"

@interface BNRHypnosisViewController ()

@end

@implementation BNRHypnosisViewController

// Override loadView method

- (void) loadView {
    
    // Create a view.
    
    CGRect frame = [UIScreen mainScreen].bounds;
    
    BNRHypnosisView *backgroundView = [ [BNRHypnosisView alloc]
                                        initWithFrame: frame ];
    
    // Set it as *the* view of this view controller.
    
    self.view = backgroundView;
    
}   // end loadView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

@end
