//
//  BNRItem.h
//  RandomItems
//
//  Created by Robert Hieger on 1/31/15.
//  Copyright (c) 2015 Robert Hieger. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject {

    // Instance variables (ivars) for BNRItem:
    
    NSString *_itemName;
    NSString *_serialNumber;
    int _valueInDollars;
    NSDate *_dateCreated;
    
}

// Instance methods for BNRItem:

- (void) setItemName: (NSString *) str;         // setter
- (NSString *) itemName;                        // getter

- (void) setSerialNumber: (NSString *) str;     // setter
- (NSString *) serialNumber;                    // getter

- (void) setValueInDollars: (int) v;            // setter
- (int) valueInDollars;                         // getter

// As _dateCreated should be a read only variable,
// only the getter method is necessary.

- (NSDate *) dateCreated;

// Class method for BNRItem:

+ (instancetype) randomItem;

// Designated initializer for BNRItem:

- (instancetype) initWithItemName: (NSString *) name
                   valueInDollars: (int) value
                     serialNumber: (NSString *) value;

- (instancetype) initWithItemName:(NSString *) name;


@end