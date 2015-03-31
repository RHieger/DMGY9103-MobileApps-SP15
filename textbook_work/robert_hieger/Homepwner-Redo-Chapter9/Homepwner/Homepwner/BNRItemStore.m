//
//  BNRItemStore.m
//  Homepwner
//
//  Created by Robert Hieger on 3/30/15.
//  Copyright (c) 2015 Robert Hieger. All rights reserved.
//

#import "BNRItemStore.h"
#import "BNRItem.h"             // Enables sending messages to
                                // BNRItem, as will be needed.

// Class extension adding property of NSMutableArray, privateItems,
// which will be used to copy BNRItems into static immutable
// NSArray *allItems.

@interface BNRItemStore ()

@property (nonatomic) NSMutableArray *privateItems;

@end

@implementation BNRItemStore

+ (instancetype) sharedStore {
    
    // Instantiate static SharedStore object.
    
    static BNRItemStore *sharedStore;
    
    // Does SharedStore exist?
    
    if (!sharedStore) {
        
        // Note the use of initPrivate method to be defined
        // later in this implementation.
        
        sharedStore = [ [self alloc] initPrivate ];
        
    }   // end if
    
    return sharedStore;
    
}   // end + (instancetype) BNRItemStore

// Override init method so that it throws an NSException
// warning programmer not to use init, but custom initializer
// initPrivate. As we will see later on, initPrivate calls the
// init method of the superclass NSObject.

- (instancetype) init {
    
    [NSException raise: @"Singleton"
                format: @"Use + [BNRItemStore sharedStore];"];
    
    // Return nil object pointer.
    
    return nil;
    
}   // end - (instancetype) init

// Here is the real (and secret) initializer:

- (instancetype) initPrivate {
    
    // Call init method of superclass.
    
    self = [super init];
    
    // If initialization is successful, instantiate the
    // privateItems NSMutableArray object.
    
    if (self) {
        
        _privateItems = [ [NSMutableArray alloc] init ];
        
    }   // end if
    
    // Return pointer to init.
    
    return self;
    
}   // end - (instancetype) initPrivate

// Override allItems getter method to return a copy of
// the privateItems NSMutableArray.

// This static NSArray object will contain the array of
// BNRItems used for the table view.

- (NSArray *) allItems {
    
    return [self.privateItems copy];
    
}   // end - (NSArray *) allItems

// Implement createItem:

- (BNRItem *) createItem {
    
    // Instantiate a BNRItem object by sending it
    // the randomItem message (initializer method).
    
    BNRItem *item = [BNRItem randomItem];
    
    // Add item object to privateItems NSMutableArray.
    
    [self.privateItems addObject: item];
    
    // Return pointer to new BNRItem object.
    
    return item;
    
}   // end - (BNRItem *) createItem

// Implement method to remove BNRItem from sharedStore.

- (void) removeItem: (BNRItem *) item {
    
    [self.privateItems removeObjectIdenticalTo: item];
    
}   // end - (void) removeItem (BNRItem *) item

@end
