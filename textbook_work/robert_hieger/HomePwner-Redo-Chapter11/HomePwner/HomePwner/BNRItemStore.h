//
//  BNRItemStore.h
//  HomePwner
//
//  Created by Robert Hieger on 4/6/15.
//  Copyright (c) 2015 Robert Hieger. All rights reserved.
//

/**********************************************************
 *                                                        *
 * BNRItemStore will be a singleton. This means there     *
 * will be only one instance of this type in the          *
 * application; if you try to create another instance,    *
 * the class will quietly return the existing instance    *
 * instead. A singleton is useful when you have an object *
 * that many objects will talk to. Those objects can ask  *
 * the singleton class for its one instance.              *
 *                                                        *
 **********************************************************
*/

#import <Foundation/Foundation.h>

// Forward declare BNRItem class.

@class BNRItem;

@interface BNRItemStore : NSObject

// Instantiate NSArray to hold all BNRItem obects.

@property (nonatomic, readonly, copy) NSArray *allItems;

// Notice that this is a class method, not an instance
// method and is therefore prefixed with a +, not a -.

+ (instancetype) sharedStore;

// Instance method to create BNRItem objects.

- (BNRItem *) createItem;

// Instance method to delete a BNRItem object.

- (void) removeItem: (BNRItem *) item;

@end
