//
//  BNRDetailViewController.m
//  Homepwner
//
//  Created by Robert Hieger on 3/4/15.
//  Copyright (c) 2015 Robert Hieger. All rights reserved.
//

#import "BNRDetailViewController.h"
#import "BNRItem.h"

@interface BNRDetailViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameField;

@property (weak, nonatomic) IBOutlet UITextField *serialNumberField;

@property (weak, nonatomic) IBOutlet UITextField *valueField;

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end

@implementation BNRDetailViewController

// Override viewWillAppear (BOOL) animated method so that
// it transfers BNRItem's properties to the UITextFields
// of BNRDetailViewController.

- (void) viewWillAppear: (BOOL) animated {
    
    // First refer to the superclass we wish to override.
    
    [super viewWillAppear: animated];
    
    // Link item defined in BNRItem.h.
    
    BNRItem *item = self.item;
    
    // Populate detail view.
    
    self.nameField.text = item.itemName;
    self.serialNumberField.text = item.serialNumber;
    self.valueField.text = [NSString
                            stringWithFormat:@"%d", item.valueInDollars];
    
    // You need an NSDateFormatter that will turn a date into
    // a simple date string.
    
    static NSDateFormatter *dateFormatter;
    
    if (!dateFormatter) {
        
        // Instantiate dateFormatter.
        
        dateFormatter = [ [NSDateFormatter alloc] init ];
        
        // Set the style of the date string.
        
        dateFormatter.dateStyle = NSDateFormatterMediumStyle;
        dateFormatter.timeStyle = NSDateFormatterNoStyle;
        
    }   // end if
    
    // Use filtered NSDate object to set date label contents.
    
    self.dateLabel.text = [dateFormatter
                           stringFromDate: item.dateCreated];
    
}   // end - (void) viewWillAppear: (BOOL) animated

@end
