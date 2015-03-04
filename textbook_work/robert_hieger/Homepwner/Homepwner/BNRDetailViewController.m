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

- (void) viewWillDisappear: (BOOL) animated {
    
    // Reference super class.
    
    [super viewWillDisappear: animated];
    
    // Clear first responder.
    
    [self.view endEditing: YES];
    
    // "Save" changes to item (presumably all item objects
    // are destroyed upon exiting the app).
    
    BNRItem *item = self.item;
    
    // Specify property values:
    
    item.itemName = self.nameField.text;
    item.serialNumber = self.serialNumberField.text;
    item.valueInDollars = [self.valueField.text intValue];
    
}   // end - (void) viewWillDisappear: (BOOL) animated

- (void) setItem: (BNRItem *) item {
    
    _item = item;
    self.navigationItem.title = _item.itemName;
    
}   // end - (void setItem: (BNRItem *) item

@end
