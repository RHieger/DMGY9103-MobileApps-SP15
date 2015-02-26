//
//  BNRItemsViewController.m
//  Homepwner
//
//  Created by Robert Hieger on 2/24/15.
//  Copyright (c) 2015 Robert Hieger. All rights reserved.
//

#import "BNRItemsViewController.h"
#import "BNRItemStore.h"
#import "BNRItem.h"

@implementation BNRItemsViewController

/* OVERRIDE UITableViewController's designated initializer.
 * To do this, do the following:
 *
 * 1) Call UITableViewController's designated initializer
 *    from within my instancetype of init.
 *
 * 2) Override UITableViewController's designated initializer
 *    so that it calls my instancetype of init.
 *
*/

- (instancetype) init {
    
    // First let's create the instancetype init to call the
    // designated initializer of the super class.
    
    self = [super initWithStyle: UITableViewStylePlain];
    
    // Here I call the designated initializer and specify
    // the UITableViewStylePlain.
    
    // Now add five randomItems.
    
    if (self) {
        
        for (int i = 0; i < 5; i++) {
            
            [ [BNRItemStore sharedStore] createItem ];

        }   // end for
        
    }   // end if
    
    return self;
    
}   // end - (instancetype) init

- (instancetype) initWithStyle: (UITableViewStyle) style {
    
    // Now let's override initWithStyle to call my
    // instancetype init.
    
    return [self init];
    
}   // end - (instancetype) initWithStyle: (UITableViewStyle) style

// Required methods for UITableView protocol

- (NSInteger) tableView: (UITableView *) tableView
  numberOfRowsInSection:(NSInteger)section

{
    
    return [ [ [BNRItemStore sharedStore] allItems ] count  ];
    
}   // end - (NSInteger) tableView: (UITableView *) tableView
    //       numberOfRowsInSection: (NSInteger) section

- (UITableViewCell *) tableView: (UITableView *)
tableView cellForRowAtIndexPath:(NSIndexPath *) indexPath {
    
    // Create an instance of UITableViewCell, with
    // default appearance.
    
    UITableViewCell *cell = [ [UITableViewCell alloc]
                             initWithStyle:  UITableViewCellStyleDefault
                             reuseIdentifier: @"UITableViewCell"];
    
    // Set the text on the cell with the description of the item
    // that is at the nth index of items, where n = row this cell.
    
    NSArray *items = [ [BNRItemStore sharedStore] allItems ];
    
    BNRItem *item = items[indexPath.row];
    
    cell.textLabel.text = [item description];
    
    return cell;
    
}  // end - (UITableViewCell *) tableView (UITableView *)
   //

@end
