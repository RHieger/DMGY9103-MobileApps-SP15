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

- (void) setContainerName: (NSString *) containerName {
    
    _containerName = containerName;
    
}   // end containerName setter

- (NSString *) containerName {
    
    return _containerName;
    
}   // end containerName getter

- (float) totalValue {
    
    return _totalValue;
    
}

@end