//
//  BNRDrawViewController.m
//  TouchTracker
//
//  Created by Robert Hieger on 3/17/15.
//  Copyright (c) 2015 Robert Hieger. All rights reserved.
//

#import "BNRDrawViewController.h"
#import "BNRDrawView.h"             // Needed reference in order
                                    // to set BNRDrawView object
                                    // as view object for
                                    // BNRDrawViewController.

                                    // For once the authors were
                                    // not careless, and mentioned
                                    // the necessity to import the
                                    // header. Will wonders never
                                    // cease?

@implementation BNRDrawViewController

// Override loadView to specify a BNRDrawView as the
// controller's view object.

- (void) loadView {
    
    self.view = [[BNRDrawView alloc]
                 initWithFrame: CGRectZero];
    
}   // end - (void) loadView

@end
