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
    
    // Instantiate a UITableViewCell object with default
    // appearance.
    
    UITableViewCell *cell =
    [ [UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault
                            reuseIdentifier: @"UITableViewCell" ];
    
    // Set the text on the cell with the description of the
    // item that is at the nth index of items, where n = the
    // row on which this cell will appear in tableView.
    
    // First return a copy of the allItems array for use
    // in UITableView.
    
    NSArray *items = [ [BNRItemStore sharedStore] allItems];
    
    // Now return the item at the indexRow.
    
    BNRItem *item = items[indexPath.row];
    
    // Set the textLabel with the item description.
    
    cell.textLabel.text = [item description];
    
    // Now return the complete cell.
    
    return cell;
    
}   // end tableView: cellForRowAtIndexPath:

@end
