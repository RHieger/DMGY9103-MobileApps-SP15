//
//  BNRItem.m
//  RandomItems2
//
//  Created by Robert Hieger on 2/6/15.
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
    // NOTE: The % operator, called the modulo operator, gives
    // you the remainder. So the adjectiveIndex is a random number
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
    
    NSString *randomSerialNumber = [ [NSString alloc]
                                    initWithFormat:@"%c%c%c%c%c",
                                    '0' + arc4random() % 10,
                                    'A' + arc4random() % 26,
                                    '0' + arc4random() % 10,
                                    'A' + arc4random() % 26,
                                    '0' + arc4random() % 10 ];
    
    BNRItem *newItem = [ [self alloc]
                        initWithItemName: randomName
                          valueInDollars: randomValue
                            serialNumber: randomSerialNumber ];
    
    return newItem;
    
}   // end + (instancetype) randomItem

// Designated initializer implementation:

- (instancetype) initWithItemName: (NSString *)name
                   valueInDollars:(int)value
                     serialNumber:(NSString *)sNumber {
    
    // Call the designated initializer of the root class, NSObject.
    
    self = [super init];
    
    // If the superclass designated initializer succeeded,
    // initialize all required instance variables.
    
    if (self) {
    
        _itemName = name;
        _valueInDollars = value;
        _serialNumber = sNumber;
        
        // set dateCreated instance pointer variable to current date:
        
        _dateCreated = [ [NSDate alloc] init ];
        
    }   // end if (self)
    
    // Return the address of the newly initialized object
    
    return self;
    
}   // end initWithItemName: valueInDollars: serialNumber:

// initWithItemName: Initializer

- (instancetype) initWithItemName: (NSString *) name {
    
    return [self initWithItemName: name
                   valueInDollars: 0
                     serialNumber: @""];
    
}   // end initWithItemName

// Override instance method init

- (instancetype) init {
    
    return [self initWithItemName: @"Item"];
    
}

- (void) setItemName: (NSString *) str {
    
    _itemName = str;
    
}   // end setter for _itemName

- (NSString *) itemName {
    
    return _itemName;
    
}   // end getter for _itemName

- (void) setSerialNumber: (NSString *) str {
    
    _serialNumber = str;
    
}   // end setter for _serialNumber

- (NSString *) serialNumber {
    
    return _serialNumber;
    
}   // end getter for _serialNumber

- (void) setValueInDollars: (int) v {
    
    _valueInDollars = v;
    
}   // end setter for _valueInDollars

- (int) valueInDollars {
    
    return _valueInDollars;
    
}

// Getter for read only instance variable dateCreated

- (NSDate *) dateCreated {
    
    return _dateCreated;
    
}   // end getter for _dateCreated

// Override superclass description method:

- (NSString *) description {
    
    NSString *descriptionString =
    [ [NSString alloc] initWithFormat:
      @"%@ (%@): Worth $%d, recorded on %@.",
                            self.itemName, self.serialNumber,
                            self.valueInDollars, self.dateCreated];
    
    // Return description to receiving object.
    
    return descriptionString;
    
}

@end
