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
    NSString *_containerName;
    float _totalValue;
    
}

// Instance methods

// _itemBox setter

- (void) setItemBox: (NSArray *) itemBox;

// _itemBox getter

- (NSArray *) itemBox;

// _containerName setter

- (void) setContainerName: (NSString *) containerNname;

// _containerName getter

- (NSString *) containerName;

// Read Only getter

- (float) totalValue;

@end