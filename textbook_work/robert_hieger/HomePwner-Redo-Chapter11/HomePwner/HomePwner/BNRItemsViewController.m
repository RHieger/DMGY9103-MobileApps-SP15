//
//  BNRItemsViewController.m
//  HomePwner
//
//  Created by Robert Hieger on 4/5/15.
//  Copyright (c) 2015 Robert Hieger. All rights reserved.
//

#import "BNRItemsViewController.h"
#import "BNRItemStore.h"
#import "BNRItem.h"

@implementation BNRItemsViewController

// Call superclass' designated initializer from within init.

- (instancetype) init {
    
    self = [super initWithStyle: UITableViewStylePlain];
    
    // If initialization was successful ...
    
    if (self) {
        
        for (int i = 0; i < 5; i++) {
            
            // Instantiate BNRItem and initialize.
            
            [ [BNRItemStore sharedStore] createItem ];
            
        }   // end for
        
    }   // end if
    
    // return pointer to init method
    
    return self;
    
}   // end - (instancetype) init

// Override initWithStyle: (UITableViewStyle) style
// to call init.

- (instancetype) initWithStyle: (UITableViewStyle) style {
    
    // Call the superclass' designated initializer.
    
    self = [super initWithStyle: UITableViewStylePlain];
    
    for (int i = 0; i < 5; i++) {
        
        // Instantiate BNRItem for use in table row.
        
        [ [BNRItemStore sharedStore] createItem ];
        
    }   // end for
    
    return self;
    
}   // end - (instancetype) initWithStyle: (UITableViewStyle) style

/**************************************************************
 *
 * REQUIRED METHODS FOR UITableViewDataSource Protocol:
 *
 * tableView: numberOfRowsInSection: (Returns the number
 *                                    of rows)
 *
 * tableView: cellForRowAtIndexPath: (Returns UITableViewCell
 *                                    type object for the row
 *                                    at the current index)
 *
 **************************************************************
*/

- (NSInteger) tableView: (UITableView *) tableView
  numberOfRowsInSection: (NSInteger) section        {
    
    return [ [ [BNRItemStore sharedStore] allItems] count ];
    
}   // end tableView: numberOfRowsInSection

- (UITableViewCell *) tableView: (UITableView *) tableView
          cellForRowAtIndexPath: (NSIndexPath *) indexPath  {
    
    // Get a new or recycled cell in which to place table
    // row data.
    
    UITableViewCell *cell = [tableView
                         dequeueReusableCellWithIdentifier:
                         @"UITableViewCell"
                         forIndexPath: indexPath];
    
    NSArray *items = [ [BNRItemStore sharedStore] allItems];
    
    // Now return the item at the indexRow.
    
    BNRItem *item = items[indexPath.row];
    
    // Set the textLabel with the item description.
    
    cell.textLabel.text = [item description];
    
    // Now return the complete cell.
    
    return cell;
    
}   // end tableView: cellForRowAtIndexPath:

// Override viewDidLoad: so that UITableViewCell is registered
// as the cell type for reuse.

- (void) viewDidLoad    {
    
    // Call the superclass for viewDidLoad.
    
    [super viewDidLoad];
    
    // Register cell type for reuse.
    
    [self.tableView registerClass: [UITableViewCell class]
           forCellReuseIdentifier: @"UITableViewCell"];
    
}   // end - (void) viewDidLoad

@end
