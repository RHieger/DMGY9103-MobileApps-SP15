//
//  main.m
//  RandomItems2
//
//  Created by Robert Hieger on 2/6/15.
//  Copyright (c) 2015 Robert Hieger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"

int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
        
        // Create a mutable array object, store its address
        // in items variable
        
        NSMutableArray *items = [ [NSMutableArray alloc] init ];
        
        // The following for loop instantiates 10 randomItem
        // objects and adds them to the items mutable array.
        // All of these randomItem objects contained within
        // items is then logged to the console.
        
        for (int i = 0; i < 10; i++) {
            
            BNRItem *item = [BNRItem randomItem];
            
            // Log to console the resulting item.
            
            NSLog(@"%@", item);
            
        }   // end for
        
        // Destroy items NSMutableArray object.
        
        items = nil;
        
    }   // end @autoreleasepool.
    
    return 0;
    
} // end main