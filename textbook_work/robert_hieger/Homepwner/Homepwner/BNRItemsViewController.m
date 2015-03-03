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

// Class extension for BNRItemsViewController:

@interface BNRItemsViewController ()

@property (nonatomic, strong) IBOutlet UIView *headerView;

@end

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

- (void) viewDidLoad {
    
    [super viewDidLoad];
    
    [self.tableView registerClass: [UITableViewCell class]
           forCellReuseIdentifier: @"UITableViewCell"];
    
    UIView *header = self.headerView;
    
    [self.tableView setTableHeaderView: header];
    
}   // end viewDidLoad

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
    
    // Get a new or recycled cell.
    
    UITableViewCell *cell =
    [tableView dequeueReusableCellWithIdentifier: @"UITableViewCell"
                                    forIndexPath: indexPath];
    
    // Set the text on the cell with the description of the item
    // that is at the nth index of items, where n = row this cell.
    
    NSArray *items = [ [BNRItemStore sharedStore] allItems ];
    
    BNRItem *item = items[indexPath.row];
    
    cell.textLabel.text = [item description];
    
    return cell;
    
}  // end - (UITableViewCell *) tableView (UITableView *)
   //

- (UIView *) headerView {
    
    // If you have not loaded headerView yet...
    
    if (! _headerView) {
        
        // Load headerView.xib
        
        [ [NSBundle mainBundle] loadNibNamed: @"HeaderView"
                                       owner: self
                                     options: nil ];
        
    }   // end if (! _headerView)
    
    return _headerView;
    
}   // end - (UIView *) headerView

// Instance methods to add editing capability:

- (IBAction) addNewItem: (id) sender {
    
    // Make a new indexPath for the 0th section, last row.
    
    NSInteger lastRow = [self.tableView numberOfRowsInSection: 0];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow: lastRow
                                                inSection: 0];
    
    // Insert this new row into the table.
    
    [self.tableView insertRowsAtIndexPaths: @[indexPath]
                          withRowAnimation: UITableViewRowAnimationTop];
    
}   // end - (IBAction) addNewItem: (id) sender

- (IBAction) toggleEditingMode: (id) sender {
    
    // If you are currently in editing mode...
    
    if (self.isEditing) {
        
        // Change text of button to inform user of state.
        
        [sender setTitle: @"Edit" forState: UIControlStateNormal];
        
        // Turn off editing mode.
        
        [self setEditing: NO animated: YES];
        
    }   else {
        
        // Change text of button to inform user of state.
        
        [sender setTitle: @"Done" forState: UIControlStateNormal];
        
        // Enter editing mode.
        
        [self setEditing: YES animated: YES];
        
    }   // end if-else (self.isEdting)
    
}   // end - (IBAction) toggleEditingMode (id) sender

@end
