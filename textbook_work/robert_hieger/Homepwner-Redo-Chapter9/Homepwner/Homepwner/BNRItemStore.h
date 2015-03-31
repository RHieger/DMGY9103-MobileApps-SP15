//
//  BNRItemStore.h
//  Homepwner
//
//  Created by Robert Hieger on 3/30/15.
//  Copyright (c) 2015 Robert Hieger. All rights reserved.
//

#import <Foundation/Foundation.h>

// Forward declare BNRItem class.

@class BNRItem;

@interface BNRItemStore : NSObject

@property (nonatomic, readonly, copy) NSArray *allItems;

- (BNRItem *) createItem;       // Method to create random item
                                // for inclusion in *privateItems
                                // NSMutableArray object.

- (void) removeItem: (BNRItem *) item;  // Method to remove item
                                        // from table view and
                                        // delete its object from
                                        // the sharedStore
                                        // dataStore.

// Notice that this is a class method and prefixed with +
// instead of -.

+ (instancetype) sharedStore;       // Singleton method to be
                                    // used by any class that
                                    // is part of the app.

@end
