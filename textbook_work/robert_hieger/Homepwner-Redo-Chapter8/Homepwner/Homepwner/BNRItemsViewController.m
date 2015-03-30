//
//  BNRItemsViewController.m
//  Homepwner
//
//  Created by Robert Hieger on 3/28/15.
//  Copyright (c) 2015 Robert Hieger. All rights reserved.
//

#import "BNRItemsViewController.h"
#import "BNRItemStore.h"                // Enables access to sharedStore.
#import "BNRItem.h"                     // Enables access to BNRItem class.

@implementation BNRItemsViewController

- (instancetype) init {
    
    // Call the superclass's designated initializer.
    
    self =[super initWithStyle: UITableViewStylePlain];
    
    // If BNRItemsViewController object is correctly initailized,
    // instantiate five BNRItem objects using the createItem
    // method. These BNRItem objects will populate rows of
    // the UITableView.
    
    if (self) {
        
        for (int i = 0; i < 5; i++) {
            
            // Instantiate BNRItemStore if not already
            // done, and then send the sharedStore
            // object instance the createItem method.
            
            [ [BNRItemStore sharedStore] createItem ];
            
        }   // end for

    }   // end if
    
    // Return pointer to BNRItemsViewController object instance.
    
    return self;
    
}   // end - (instancetype) init

- (instancetype) initWithStyle: (UITableViewStyle) style    {
    
    return [self init];
    
}   // end - (instancetype) initWithStyle: (UITableViewStyle) style

/* Required methods for UITableViewDataSource protocol:
 *
 * tableView: numberOfRowsInSection:
 * tableView: cellForRowAtIndexPath:
 *
*/

// Implement tableView: numberOfRowsInSection:

- (NSInteger) tableView: (UITableView *) tableView
  numberOfRowsInSection: (NSInteger) section            {
    
    // Return the count of allItems static NSArray.
    // This number will be equal to the number of rows
    // required for the section.
    
    return [ [ [BNRItemStore sharedStore] allItems ] count ];
    
}   // end tableView: numberOfRowsInSection:

// Implement tableView: cellForRowAtIndexPath:

- (UITableViewCell *) tableView: (UITableView *) tableView
        cellForRowAtIndexPath: (NSIndexPath *) indexPath            {
    
    // Instantiate UITableViewCell object with default appearance.
    // For purposes of memory optimization, we will be looking for
    // a new available table row or reuse of one whose data has
    // scrolled off the screen.
    
    UITableViewCell *cell =
    [tableView dequeueReusableCellWithIdentifier: @"UITableViewCell"
                                    forIndexPath: indexPath];
    
    
    // Set the text on the cell with the description of the item
    // that is at the nth index of items where n = the row of the
    // UITableView in which the item will appear.
    
    // First create an object pointer to the allItems NSArray
    // returned by the allItems accessor method of the
    // BNRItemStore class.
    
    NSArray *items = [ [BNRItemStore sharedStore] allItems ];
    
    // Next set the index position of the row in which the cell
    // will appear.
    
    BNRItem *item = items[indexPath.row];
    
    // Set the text appearing in the cell to that of the BNRItem
    // at the current index.
    
    cell.textLabel.text = [item description];
    
    // Return the pointer for UITableViewCell object cell.
    
    return cell;
    
}   // end tableView: cellForRowAtIndexPath:

// Because a tableViewCell might be of a type different from that
// which is required by a BNRItem, we need our app to have more
// control over what type of row within which a table cell is
// instantiated. To do this, we will override the viewDidLoad method
// as follows:

- (void) viewDidLoad {
    
    // First call the viewDidLoad of the superclass.
    
    [super viewDidLoad];
    
    // Now specify which kind of cell class is needed for
    // the new table cell row.
    
    [ self.tableView registerClass: [UITableViewCell class]
             forCellReuseIdentifier: @"UITableViewCell" ];
    
}   // end - (void) viewDidLoad

@end
