//
//  BNRItemsViewController.m
//  Homepwner
//
//  Created by Robert Hieger on 2/24/15.
//  Copyright (c) 2015 Robert Hieger. All rights reserved.
//

#import "BNRItemsViewController.h"
#import "BNRDetailViewController.h"     // Enables pushing view controllers.
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
    
    // Create a new BNRItem and add it to the store.
    
    BNRItem *newItem = [ [BNRItemStore sharedStore]
                          createItem ];
    
    // Figure out where that item is in the array and assign
    // its location to an NSInteger.
    
    NSInteger lastRow = [ [ [BNRItemStore sharedStore] allItems ]
                           indexOfObject: newItem ];
    
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

// tableView method to send message to BNRItemStore to
// confirm deletion of a row from the tableView.

- (void) tableView: (UITableView *) tableView
commitEditingStyle: (UITableViewCellEditingStyle) editingStyle
 forRowAtIndexPath: (NSIndexPath *)indexPath {
    
    // If tableView is asking to commit a delete command...
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        // Create read only NSArray version of allItems NSMutableArray.
        
        NSArray *items = [ [BNRItemStore sharedStore] allItems ];
        
        // Specify row to delete.
        
        BNRItem *item = items[indexPath.row];
        
        // Remove that item from the sharedStore.
        
        [ [BNRItemStore sharedStore] removeItem: item ];
        
        // Also remove that row from tableView (screen) with animation.
        
        [ tableView deleteRowsAtIndexPaths: @[indexPath]
                          withRowAnimation: UITableViewRowAnimationFade ];
        
    }   // end if
    
}   // end -(void) tableView: (UITableView *) tableView
    //    commitEditingStyle: (UITableViewCellEditingStyle) editingStyle
    //     forRowAtIndexPath: (NSIndexPath *) indexPath

// Change Default Delete Button Appearance.

- (NSString *) tableView: (UITableView *) tableView
titleForDeleteConfirmationButtonForRowAtIndexPath: (NSIndexPath *)indexPath {
                             
    return @"Remove";
                             
}

// Method to update dataStore for tableView.

- (void) tableView: (UITableView *) tableView
moveRowAtIndexPath: (NSIndexPath *) sourceIndexPath
       toIndexPath: (NSIndexPath *) destinationIndexPath {
    
    [ [BNRItemStore sharedStore] moveItemAtIndex: sourceIndexPath.row
                                         toIndex: destinationIndexPath.row ];
    
}   // end - (void) tableView: (UITableView *) tableView
    //     moveRowAtIndexPath: (NSIndexPath *) sourceIndexPath
    //            toIndexPath: (NSIndexPath *) indexPath

// Implement method to instantiate and push onto the stack
// a BNRDetailView Controller view.

- (void) tableView: (UITableView *) tableView
didSelectRowAtIndexPath: (NSIndexPath *) indexPath {
    
    // Instantiate BNRDetailViewController object.
    
    BNRDetailViewController *detailViewController =
    [ [BNRDetailViewController alloc] init ];
    
    // Push detailViewController onto the top of navController's stack.
    
    [self.navigationController pushViewController: detailViewController
                                         animated: YES];
    
    // Make sure BNRDetailViewController has its item beore viewWillAppear
    // is called.
    
    NSArray *items = [ [BNRItemStore sharedStore] allItems ];
    
    // Create pointer to the selected row item.
    
    BNRItem *selectedItem = items[indexPath.row];
    
    // Give detailViewController a pointer to the item object in row.
    
    detailViewController.item = selectedItem;
    
}   // end - (void) tableView: (UITableView *) tableView
    //     didSelectRowAtIndexPath: (NSIndexPath *) indexPath

// Implement viewWillAppear to assure that row updated in
// BNRDetailView reflects the updates in BNRItemsView.

- (void) viewWillAppear: (BOOL) animated {
    
    // Reference super class.
    
    [super viewWillAppear: animated];
    
    // Refresh the data on the selected table row.
    
    [self.tableView reloadData];
    
}   // end - (void) viewWillAppear: (BOOL) animated

@end
