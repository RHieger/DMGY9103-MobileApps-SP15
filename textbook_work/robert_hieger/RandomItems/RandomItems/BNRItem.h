//
//  BNRItem.h
//  RandomItems
//
//  Created by Robert Hieger on 1/31/15.
//  Copyright (c) 2015 Robert Hieger. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject

@property (nonatomic, strong) BNRItem *containedItem;
@property (nonatomic, weak) BNRItem *container;

@property (nonatomic, copy) NSString *itemName;
@property (nonatomic, copy) NSString *serialNumber;
@property (nonatomic) int valueInDollars;
@property (nonatomic, readonly) NSDate *dateCreated;

// Class method for BNRItem:

+ (instancetype) randomItem;

// Designated initializer for BNRItem:

- (instancetype) initWithItemName: (NSString *) name
                   valueInDollars: (int) value
                     serialNumber: (NSString *) value;

- (instancetype) initWithItemName:(NSString *) name;

- (instancetype) initWithName: (NSString *) name
              AndSerialNumber: (NSString *) serialNumber;

@end