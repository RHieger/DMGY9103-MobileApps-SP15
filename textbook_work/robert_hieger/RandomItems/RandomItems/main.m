//
//  main.m
//  RandomItems
//
//  Created by Robert Hieger on 1/30/15.
//  Copyright (c) 2015 Robert Hieger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"
#import "BNRContainer.h"

int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
        
        // Create a mutable array object, store its address
        // in items variable.
        
        NSMutableArray *items = [ [NSMutableArray alloc] init ];
        
        BNRItem *backpack = [ [BNRItem alloc]
                             initWithItemName: @"Backpack" ];
        
        [items addObject: backpack];
        
        BNRItem *calculator = [ [BNRItem alloc]
                               initWithItemName: @"Calculator" ];
        
        [items addObject: calculator];
        
        // Point objects to one another creating strong reference cycle.
        
        backpack.containedItem = calculator;
        
        // Deallocate both BNRItems now contained within
        // NSMutableArray items:
        
        backpack = nil;
        calculator = nil;
        
        // Perform fast enumeration of items NSMutableArray.
        
        for (BNRItem *item in items) {
            
            // Log item objects to console.
            
            NSLog(@"%@", item);
            
            NSLog(@"Setting items to nil...");
            
            
        }   // end for (BNRItem *item in items)
        
        items = nil;
        
    }   // end @autoreleasepool
    
    return 0;
    
}   // end main