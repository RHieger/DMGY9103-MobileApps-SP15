//
//  main.m
//  RandomItems
//
//  Created by Robert Hieger on 1/30/15.
//  Copyright (c) 2015 Robert Hieger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"

int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
        
        // Create a mutable array object, store its address
        // in items variable.
        
        NSMutableArray *items = [ [NSMutableArray alloc] init ];
        
        for (int i = 0; i < 10; i++) {
            
            // Create an array of BNRItem objects.
            
            BNRItem *item = [BNRItem randomItem];
            
            // Add BNRItem object to items NSMutableArray.
            
            [items addObject: item];
            
        }   // end for
        
        // Introduce an object of type BNRItem, then send
        // it a message that only NSArray would understand,
        // thereby causing a runtime exception error
        
        id lastObj = [items lastObject];
        
        [lastObj count];
        
        // Perform fast enumeration of items NSMutableArray.
        
        for (BNRItem *item in items) {
            
            // Log item objects to console.
            
            NSLog(@"%@", item);
            
        }   // end for (BNRItem *item in items)
        
        // Destroy the mutable array object.
        
        items = nil;
        
    }   // end @autoreleasepool
    
    return 0;
    
}   // end main