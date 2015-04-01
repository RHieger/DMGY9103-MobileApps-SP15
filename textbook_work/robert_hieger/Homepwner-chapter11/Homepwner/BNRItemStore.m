//
//  BNRItemStore.m
//  Homepwner
//
//  Created by Robert Hieger on 2/24/15.
//  Copyright (c) 2015 Robert Hieger. All rights reserved.
//

#import "BNRItemStore.h"
#import "BNRItem.h"

// BNRItemStore class extension:

@interface BNRItemStore ()

@property (nonatomic) NSMutableArray *privateItems;

@end

@implementation BNRItemStore

+ (instancetype) sharedStore {
    
    // Declare BNRItemStore object as a static object.
    
    static BNRItemStore *sharedStore;
    
    // Do I need to create a sharedStore?
    
    if (!sharedStore) {
        
        sharedStore = [ [self alloc] initPrivate ];
        
    }   // end if
    
    return sharedStore;
    
}   // end + (instancetype) sharedStore

// If a programmer calls [ [BNRItemStore alloc] init ], let
// her know the error of her ways.

- (instancetype) init {
    
    [NSException raise: @"Singleton"
                format: @"Use + [BNRItemStore sharedStore]"];
    
    return nil;     // Returns empty object pointer.
    
}   // end - (instancetype) init

// Here is the real (secret) initializer

- (instancetype) initPrivate {
    
    // Return instance of super class init.
    
    self = [super init];
    
    // Immediately instantiate privateItems.
    
    if (self) {
        
        _privateItems = [ [NSMutableArray alloc] init ];
        
    }   // end if
    
    return self;
    
}   // end - (instanceype) initPrivate

// Instantiate immutable NSArray to return copy of privateItems.

- (NSArray *) allItems {
    
    return [self.privateItems copy];
    
}   // end - (NSArray *) allItems

- (BNRItem *) createItem {
    
    BNRItem *item = [BNRItem randomItem];
    
    // Add BNRItem item to privateItems.
    
    [self.privateItems addObject: item];
    
    return item;
    
}   // end - (BNRItem *) createItem

- (void) removeItem: (BNRItem *) item {
    
    // Remove BNRItem from tableView.
    
    [self.privateItems removeObjectIdenticalTo: item];
    
}   // end - (void) removeItem: (BNRItem *) item

- (void) moveItemAtIndex: (NSUInteger) fromIndex
                 toIndex:(NSUInteger)toIndex {
    
    if (fromIndex == toIndex) {
        
        return;
        
    }   // end if
    
    // Get pointer to object being moved so you can re-insert it.
    
    BNRItem *item = self.privateItems[fromIndex];
    
    // Remove item from privateItems NSMutableArray.
    
    [self.privateItems removeObjectAtIndex: fromIndex];
    
    // Insert item in NSMutableArray at new location.
    
    [self.privateItems insertObject: item atIndex: toIndex];
    
}   // end - (void) moveItemAtIndex: (NSUInteger) fromIndex
    //                      toIndex: (NSUInteger) toIndex


@end
