//
//  main.m
//  BronzeBug
//
//  Created by Robert Hieger on 2/1/15.
//  Copyright (c) 2015 Robert Hieger. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
        
        // Instantiate NSArray of Integers.
        
        NSArray *things = @[@"Car", @"Rug",
                            @"Phone", @"Table",
                            @"Scissors", @"Book",
                            @"Index Card", @"Pillow",
                            @"iPhone", @"iPad Air"];
        
        // Attempt to log to console the eleventh element
        // of the array declared above. This will throw a
        // runtime exception error, effectively crashing
        // this demonstration program.
        
        NSLog(@"Item 11 is: %@.", things[10] );
        
        
    }   // end @autoreleasepool
    
    return 0;
    
}   // end main