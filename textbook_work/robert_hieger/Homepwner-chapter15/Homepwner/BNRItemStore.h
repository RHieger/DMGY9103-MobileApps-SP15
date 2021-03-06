//
//  BNRItemStore.h
//  Homepwner
//
//  Created by Robert Hieger on 2/24/15.
//  Copyright (c) 2015 Robert Hieger. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BNRItem;

@interface BNRItemStore : NSObject

@property (nonatomic, readonly, copy) NSArray *allItems;

// Notice that this is a class method and prefixed by a +
// instead of a -.

+ (instancetype) sharedStore;

// Methods to edit contents of sharedStore

- (BNRItem *) createItem;

- (void) removeItem: (BNRItem *) item;

- (void) moveItemAtIndex: (NSUInteger) fromIndex
                 toIndex: (NSUInteger) toIndex;

@end
