//
//  BNRItem.h
//  RandomItems2
//
//  Created by Robert Hieger on 2/6/15.
//  Copyright (c) 2015 Robert Hieger. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject

// Instance variables:

{
    
    NSString *_itemName;
    NSString *_serialNumber;
    int _valueInDollars;
    NSDate *_dateCreated;
    
}

/**************************************************************
 *                                                            *
 * CLASS METHODS:                                             *
 *                                                            *
 * There is only one class method associaed with BNRItem. It  *
 * is called randomItem and its purpose is to assemble random *
 * NSString objects to be passed to BNRItem instance          *  
 * variables.                                                 *
 *                                                            *
 **************************************************************
*/

+ (instancetype) randomItem;

/**************************************************************
 *                                                            *
 * INSTANCE METHODS:                                          *
 *                                                            *
 * These instance methods include custome initializers, one   *
 * of which is the designated initializer. Additionally, they *
 * include all necessary setter and getter methods.           *
 *                                                            *
 **************************************************************
*/

// Initializers:

// Designated Initializer for BNRItem.
// NOTE: init method will be overriden to call this method.

- (instancetype) initWithItemName: (NSString *) name
                   valueInDollars: (int) value
                     serialNumber: (NSString *) sNumber;

- (instancetype) initWithItemName: (NSString *) name;

// Instance methods:

- (void) setItemName: (NSString *) str;         // Setter

- (NSString *) itemName;                        // Getter

- (void) setSerialNumber: (NSString *) str;     // Setter

- (NSString *) serialNumber;                    // Getter

- (void) setValueInDollars: (int) v;            // Setter

- (int) valueInDollars;                         // Getter

// Note that _dateCreated is read-only and therefore
// only has a getter instance method.

- (NSDate *) dateCreated;                       // Getter

@end