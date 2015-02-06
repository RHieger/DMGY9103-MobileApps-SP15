//
//  main.m
//  Test
//
//  Created by Robert Hieger on 2/3/15.
//  Copyright (c) 2015 Robert Hieger. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
        
        // Instantiate NSArray comprised of disparate object types.
        
        NSArray *myTestArray = @[@"Car", @"Boat", @"Truck",
                                 @1, @7.56, @"Van",
                                 @"That's all, folks!"];
        
        // Log a header message to console:
        
        NSLog(@"These are my objects:\n");
        
        // To fast enumerate myTestArray, because there are
        // different object types, we use the generic id type
        // which will successfully return the contents of
        // each object.
        
        for (id testObject in myTestArray) {
            
            NSLog(@"%@", testObject);
            
        }   // end for
        
        // Show the difference between an int and NSInteger
        // This code borrows from an online tutorial located
        // at http://rypress.com/tutorials/objective-c/data-types/primitives
        
        // NOTE: The values returned by the following NSLog
        // statements are size in bytes.
        
        NSLog( @"Size of int: %zu bytes", sizeof(int) );
        
        NSLog( @"Size of NSInteger: %zu bytes", sizeof(NSInteger) );
        
    }   // end @autoreleasepool
    
    return 0;
    
}   // end main