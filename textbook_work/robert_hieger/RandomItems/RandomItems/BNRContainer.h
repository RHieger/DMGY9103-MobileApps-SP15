//
//  BNRContainer.h
//  RandomItems
//
//  Created by Robert Hieger on 2/8/15.
//  Copyright (c) 2015 Robert Hieger. All rights reserved.
//

#import "BNRItem.h"

@interface BNRContainer : BNRItem

// Instance Variables (ivars) for BNRContainer:

{
    
    NSArray *_itemBox;
    NSString *_nameOfContainer;
    int _totalValue;
    
}

// Instance methods

// _itemBox setter

- (void) setItemBox: (NSArray *) itemBox;

// _itemBox getter

- (NSArray *) itemBox;

// _nameOfContainer setter

- (void) setNameOfContainer: (NSString *) nameOfContainer;

// _nameOfContainer getter

- (NSString *) nameOfContainer;

// Read Only getter

- (int) totalValue;

// Custom initializer for BNRContainer:

- (instancetype) initWithItemBox: (NSArray *) itemBox
                 nameOfContainer: (NSString *) nameOfContainer
                   andTotalValue: (int) totalValue;


@end