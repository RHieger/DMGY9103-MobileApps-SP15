//
//  BNRContainer.m
//  RandomItems
//
//  Created by Robert Hieger on 2/8/15.
//  Copyright (c) 2015 Robert Hieger. All rights reserved.
//

#import "BNRContainer.h"

@implementation BNRContainer

- (void) setItemBox: (NSArray *) itemBox {
    
    _itemBox = itemBox;
    
}   // end itemBox setter

- (NSArray *) itemBox {
    
    return _itemBox;
    
}   // end itemBox getter

- (void) setNameOfContainer:(NSString *) nameOfContainer {
    
    _nameOfContainer = nameOfContainer;
    
}   // end containerName setter

- (NSString *) nameOfContainer {
    
    return _nameOfContainer;
    
}   // end containerName getter

- (int) totalValue {
    
    return _totalValue;
    
}

// Custom initializer for BNRContainer:

- (instancetype) initWithItemBox: (NSArray *) itemBox
                 nameOfContainer:(NSString *)nameOfContainer
                 andTotalValue:(int)totalValue {
    
    // Call the superclass's designated initializer.
    
    self = [super init];
    
    // Check if superclass initialized.
    
    if (self) {
        
        // If superclass initialized, initialize instance variables.
        
        _itemBox = itemBox;
        _nameOfContainer = nameOfContainer;
        _totalValue = totalValue;
        
    }   // end if
    
    return self;
    
}   // end customized initializer.

// Override description method:

- (instancetype) description {
    
    NSString *descriptionString =
    [ [NSString alloc] initWithFormat:
       @"%@:\n",
       self.nameOfContainer ];
    
    return descriptionString;
    
}

@end