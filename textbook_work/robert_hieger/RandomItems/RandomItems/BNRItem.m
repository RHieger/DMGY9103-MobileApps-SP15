//
//  BNRItem.m
//  RandomItems
//
//  Created by Robert Hieger on 1/31/15.
//  Copyright (c) 2015 Robert Hieger. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem

+ (instancetype) randomItem {
    
    // Create an immutable array of three adjectives.
    
    NSArray *randomAdjectiveList = @[@"Fluffy", @"Rusty", @"Shiny"];
    
    // Create an immutable array of three nouns.
    
    NSArray *randomNounList = @[@"Bear", @"Spork", @"Mac"];
    
    // Get the index of a random adjective/noun from the lists.
    // Note: The % operator, called the modulo operator, gives
    // you the remainder. So adjectiveIndex is a random number
    // from 0 to 2 inclusive.
    
    NSInteger adjectiveIndex = arc4random() %
                                [randomAdjectiveList count];
    
    NSInteger nounIndex = arc4random() %
                                [randomNounList count];
    
    // Note that NSInteger is not an object, but a type definition
    // for "long."
    
    NSString *randomName = [ NSString stringWithFormat: @"%@ %@",
                            randomAdjectiveList[adjectiveIndex],
                            randomNounList[nounIndex] ];
                            
    int randomValue = arc4random() % 100;
    
    NSString *randomSerialNumber = [ NSString stringWithFormat:
                                    @"%c%c%c%c%c",
                                    '0' + arc4random() % 10,
                                    'A' + arc4random() % 26,
                                    '0' + arc4random() % 10,
                                    'A' + arc4random() % 26,
                                    '0' + arc4random() % 10 ];
    
    BNRItem *newItem = [ [self alloc] initWithItemName: randomName
                                        valueInDollars: randomValue
                                          serialNumber: randomSerialNumber ];
    
    return newItem;
    
}   // end randomItem

- (void) setContainedItem: (BNRItem *) containedItem {
    
    // Override containedItem setter method.
    
    // Point container to containedItem and vice versa.
    
    self.containedItem.container = self;
    
}   // end - (void) setContainedItem:

- (instancetype) initWithItemName: (NSString *) name
                   valueInDollars:(int) value
                     serialNumber:(NSString *) sNumber {
    
    // Call the superclass's designated initializer.
    
    self = [super init];
    
    // Did the superclass's designated initializer succeed?
    
    if (self) {
        
        // Give the instance variables initial values.
        
        _itemName = name;
        _serialNumber = sNumber;
        _valueInDollars = value;
        
        // Set _dateCreated to the current date and time.
        
        _dateCreated = [ [NSDate alloc] init ];
        
    }   // end if (self)
    
    // Return the address of the newly initialized object.
    
    return self;
    
}   // end - (instancetype) initWithItemName, first initializer.



- (instancetype) initWithItemName: (NSString *) name {
    
    return [self initWithItemName: name
                   valueInDollars: 0
                     serialNumber: @""];
    
}   // end - (instancetype) initWithItemName, second initializer.


- (instancetype) initWithName:(NSString *)name
              AndSerialNumber:(NSString *)serialNumber {
    
    return [self initWithItemName: name
                   valueInDollars: 500
                     serialNumber: serialNumber];
    
}   // end initWithName: AndSerialNumber:

// Override default initializer, inherited from NSObject.

- (instancetype) init {
    
    return [self initWithItemName: @"Item"];
    
}   // end init

// Override dealloc method.

- (void) dealloc {
    
    NSLog(@"Destroyed: %@", self);
    
}   // end dealloc

- (NSString *) description {
    
    NSString *descriptionString =
    [ [NSString alloc] initWithFormat:
     @"%@ (%@): Worth $%d, recorded on %@",
     self.itemName,
     self.serialNumber,
     self.valueInDollars,
     self.dateCreated];
    
    return descriptionString;
    
}   // end description (override of superclass method)

@end