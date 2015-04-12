//
//  BNRItemStore.m
//  HomePwner
//
//  Created by Robert Hieger on 4/6/15.
//  Copyright (c) 2015 Robert Hieger. All rights reserved.
//

#import "BNRItemStore.h"
#import "BNRItem.h"

@interface BNRItemStore ()

@property (nonatomic) NSMutableArray *privateItems;

@end

@implementation BNRItemStore

// Implement sharedStore method:

+ (instancetype) sharedStore    {
    
    // First create a static BNRItem object called sharedStore.
    // This singleton init method is available to the entire
    // application and is initialized only once.
    
    static BNRItemStore *sharedStore;
    
    // Has sharedStore already been instantiated?
    
    if (!sharedStore) {
        
        // Instantiate sharedStore using secret designated
        // initializer initPrivate.
        
        sharedStore = [ [self alloc] initPrivate ];
        
    }   // end if (!sharedStore)
    
    // Return pointer to sharedStore.
    
    return sharedStore;
    
}   // end + (instancetype) sharedStore

// Override init method so that it throws an exception
// when a programmer attempts to use it instead of
// sharedStore which is sent the message of initPrivate.

- (instancetype) init {
    
    [NSException raise: @"Singleton"
                format: @"Use + [BNRItem sharedStore]" ];
    
    // Return nil pointer for object.
    
    return nil;
    
}   // end - (instancetype) init

// And here is the real private designated initializer.

- (instancetype) initPrivate {
    
    // First call the superclass.
    
    self = [super init];
    
    // If initialization is successful...
    
    if (self) {
        
        // ... instantiate privateItems NSMutableArray to
        // contain instantiated BNRItems.
        
        _privateItems = [ [NSMutableArray alloc] init ];
        
    }   // end if
    
    // Return pointer to self.
    
    return self;
    
}   // end - (instancetype) initPrivate

// Override allItems getter so that it returns a
// copy of _privateItems.

- (NSArray *) allItems {
    
    return [self.privateItems copy];
    
}   // end - (NSArray *) allItems

// Implement createItem method to provide functionality
// for the creation of BNRItems.

- (BNRItem *) createItem    {
    
    // Instantiate BNRItem object using randomItem method.
    
    BNRItem *item = [BNRItem randomItem];
    
    // Add item to privateItems NSMutableArray.
    
    [self.privateItems addObject: item];
    
    // Return pointer to new BNRItem object.
    
    return item;
    
}   // end - (BNRItem *) createItem

// Implement removeItem method to provide the functionality
// to delete a BNRItem object.

- (void) removeItem: (BNRItem *) item {
    
    [self.privateItems removeObjectIdenticalTo: item];
    
}   // end - (void) removeItem: (BNRItem *) item

@end
