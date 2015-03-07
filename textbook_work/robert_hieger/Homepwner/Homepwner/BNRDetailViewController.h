//
//  BNRDetailViewController.h
//  Homepwner
//
//  Created by Robert Hieger on 3/4/15.
//  Copyright (c) 2015 Robert Hieger. All rights reserved.
//

#import <UIKit/UIKit.h>

// Forward declare BNRItem class

@class BNRItem;

@interface BNRDetailViewController : UIViewController

@property (nonatomic, strong) BNRItem *item;

@end
