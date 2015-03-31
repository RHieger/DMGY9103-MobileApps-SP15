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

// Extend BNRItemsViewController class to include a header view.

@interface BNRItemsViewController ()

@property (nonatomic, strong) IBOutlet UIView *headerView;

@end

@implementation BNRItemsViewController

- (instancetype) init {
    
    // Call the superclass's designated initializer.
    
    self =[super initWithStyle: UITableViewStylePlain];
    
    // If BNRItemsViewController object is correctly initailized,
    // instantiate five BNRItem objects using the createItem
    // method. These BNRItem objects will populate rows of
    // the UITableView.
    
    if (self) {
        
        
        
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
    
    // Instantiate the header view for the table.
    
    UIView *header = self.headerView;
    
    // Add header to the tableView hierarchy.
    
    [self.tableView setTableHeaderView: header];
    
}   // end - (void) viewDidLoad

// Implement method to add a BNRItem to the table view:

- (IBAction) addNewItem:(id) sender {
    
    // Instantiate a new BNRItem object and add it to sharedStore.
    
    BNRItem *newItem = [ [BNRItemStore sharedStore] createItem ];
    
    // Figure out where the BNRItem newItem is in the array.
    
    NSInteger lastRow = [ [ [BNRItemStore sharedStore] allItems]
                         indexOfObject: newItem];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow: lastRow
                                                inSection: 0];
    
    // Insert this new row into the table view.
    
    [self.tableView
     insertRowsAtIndexPaths: @[indexPath]
           withRowAnimation: UITableViewRowAnimationTop];
    
}   // end - (IBAction) addNewItem: (id) sender

// Implement method to activate/deactive editing mode for table view.

- (IBAction) toggleEditingMode: (id) sender {
    
    // If you are currently in editing mode...
    
    if (self.isEditing) {
        
        // Change the text on Edit button to inform user of
        // the change of state.
        
        [sender setTitle: @"Edit" forState: UIControlStateNormal];
        
        // ... turn off editing mode.
        
        [self setEditing: NO animated: YES];
        
    }   else {
        
        // Change text of button to inform user of state.
        
        [sender setTitle: @"Done" forState: UIControlStateNormal];
        
        // Enter editing mode while header button reads "Done."
        
        [self setEditing: YES animated: YES];
        
    }   // end if-else
    
}   // end - (IBAction) toggleEditingMode: (id) sender

// Implement headerView class:

- (UIView *) headerView {
    
    // If you have not loaded the header view yet...
    
    if (!_headerView)   {
        
        // Load HeaderView.xib.
        
        [ [NSBundle mainBundle] loadNibNamed: @"HeaderView"
                                       owner: self
                                     options: nil ];
        
    }   // end if
    
    return _headerView;
    
}   // end - (UIView *) headerView

@end
