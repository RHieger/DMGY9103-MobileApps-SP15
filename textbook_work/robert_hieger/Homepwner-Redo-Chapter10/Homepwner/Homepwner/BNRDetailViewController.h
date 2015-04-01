//
//  BNRDetailViewController.h
//  Homepwner
//
//  Created by Robert Hieger on 3/31/15.
//  Copyright (c) 2015 Robert Hieger. All rights reserved.
//

#import <UIKit/UIKit.h>

// Forward declare BNRItem.

@class BNRItem;

@interface BNRDetailViewController : UIViewController

// Creating the property below gives the detailViewController
// object access to the data contained within the currently
// tapped UITableView row.

@property (nonatomic, strong) BNRItem *item;

@end
