//
//  BNRDetailViewController.m
//  Homepwner
//
//  Created by Robert Hieger on 3/31/15.
//  Copyright (c) 2015 Robert Hieger. All rights reserved.
//

#import "BNRDetailViewController.h"
#import "BNRItem.h"                     // Enables access to the
                                        // instantiated BNRItem
                                        // object at current row.

@interface BNRDetailViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameField;

@property (weak, nonatomic) IBOutlet UITextField *serialNumberField;

@property (weak, nonatomic) IBOutlet UITextField *valueField;

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end

@implementation BNRDetailViewController

// Override viewWillAppear method to pass each instance
// variable to the corresponding UITextFields in the
// detailView object.

- (void) viewWillAppear: (BOOL) animated {
    
    // Call superclass.
    
    [super viewWillAppear: animated];
    
    // Instantiate BNRItem to contain selected row.
    
    BNRItem *item = self.item;
    
    // Populate text fields using dot syntax:
    
    self.nameField.text = item.itemName;
    
    self.serialNumberField.text = item.serialNumber;
    
    self.valueField.text =
    [NSString stringWithFormat: @"%d", item.valueInDollars];
    
    // NSDateFormatter that will turn current date into
    // a simple date string.
    
    // First instantiate the date formatter:
    
    static NSDateFormatter *dateFormatter;
    
    // Check to see that dateFormatter instantiated correctly,
    // then proceed accordingly:
    
    if (!dateFormatter) {
        
        // Instantiate and initialize dateFormatter.
        
        dateFormatter = [ [NSDateFormatter alloc] init ];
        
        // Set the date style for the string.
        
        dateFormatter.dateStyle = NSDateFormatterMediumStyle;
        
        // Set the time style to no style so no time is displayed.
        
        dateFormatter.timeStyle = NSDateFormatterNoStyle;
        
        // Use filtered NSDate object to set the contents of
        // dateLabel.
        
        self.dateLabel.text =
        [dateFormatter stringFromDate: item.dateCreated];
        
    }   // end if
    
}   // end - (void) viewWillAppear: (BOOL) animated

// Implement viewWillDisappear to enable saving edits made
// in the detail view so they appear updated in the table view.

- (void) viewWillDisappear: (BOOL) animated {
    
    // Call superclass to allow it to do any preliminary tasks.
    
    [super viewWillDisappear: animated];
    
    // Tell firstResponder to resign.
    
    [self.view endEditing: YES];
    
    // Save changes.
    
    // First set pointer to self.item.
    
    BNRItem *item = self.item;
    
    // Set text fields to contain the newly edited values.
    
    item.itemName = self.nameField.text;
    
    item.serialNumber = self.serialNumberField.text;
    
    item.valueInDollars = [self.valueField.text intValue];
    
}   // end - (void) viewWillDisappear (BOOL) animated

// Implement setItem so that the detail view will set its
// title according to the itemName being viewed.

- (void) setItem: (BNRItem *) item  {
    
    // Set instance variable to the value of the item
    // within the selected cell.
    
    _item = item;
    
    // Set navigationItem.name equal to the itemName of _item.
    
    self.navigationItem.title = _item.itemName;
    
}   // end - (void) setItem: (BNRItem *) item

@end
