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
        
        for (int i = 0; i < 10; i++) {
            
            // Create an array of BNRItem objects.
            
            BNRItem *item = [BNRItem randomItem];
            
            // Add BNRItem object to items NSMutableArray.
            
            [items addObject: item];
            
        }   // end for
        
        // Perform fast enumeration of items NSMutableArray.
        
        for (BNRItem *item in items) {
            
            // Log item objects to console.
            
            NSLog(@"%@", item);
            
        }   // end for (BNRItem *item in items)
        
        // Instantiate a new BNRItem with initWithNameAndSerialNumber
        
        BNRItem *nameAndSerialNumber =
        [ [BNRItem alloc] initWithName: @"Ultra HD Monitor"
                       AndSerialNumber: @"B1C3R2" ];
        
        // Log nameAndSerialNumber to console:
        
        NSLog(@"%@", nameAndSerialNumber);
        
        // Destroy the mutable array object.
        
        items = nil;
        
        // Instantiate 10 BNRItems for use of BNRContainer.
        
        BNRItem *item0 = [ [BNRItem alloc]
                           initWithItemName: @"11\" MacBook Air: 128GB"
                             valueInDollars: 899
                               serialNumber: @"0F3Q4C"];
        
        BNRItem *item1 = [ [BNRItem alloc]
                          initWithItemName: @"11\" MacBook Air: 256GB"
                          valueInDollars: 1099
                          serialNumber: @"0C4X3M"];
        
        BNRItem *item2 = [ [BNRItem alloc]
                          initWithItemName: @"13\" MacBook Air: 128GB"
                          valueInDollars: 999
                          serialNumber: @"0F9T4Q"];
        
        BNRItem *item3 = [ [BNRItem alloc]
                          initWithItemName: @"13\" MacBook Air: 256GB"
                          valueInDollars: 1199
                          serialNumber: @"0F9T4Q"];
        
        BNRItem *item4 = [ [BNRItem alloc]
                          initWithItemName: @"13\" MacBook Pro: 2.5GHz 4GB"
                          valueInDollars: 1099
                          serialNumber: @"1X5U2P"];
        
        BNRItem *item5 = [ [BNRItem alloc]
                          initWithItemName: @"13\" MacBook Pro: 2.5GHz 4GB"
                          valueInDollars: 1099
                          serialNumber: @"1X5U2P"];
        
        BNRItem *item6 = [ [BNRItem alloc]
                          initWithItemName: @"13\" MacBook Pro Retina: 2.6GHz 8GB"
                          valueInDollars: 1299
                          serialNumber: @"2M7C8R"];
        
        BNRItem *item7 = [ [BNRItem alloc]
                          initWithItemName: @"15\" MacBook Pro Retina: 2.5GHz 16GB"
                          valueInDollars: 2499
                          serialNumber: @"2S9D4V"];
        
        BNRItem *item8 = [ [BNRItem alloc]
                          initWithItemName: @"27\" iMac Retina 5K: 3.5GHz 8GB"
                          valueInDollars: 2499
                          serialNumber: @"2S9D4V"];
        
        BNRItem *item9 = [ [BNRItem alloc]
                          initWithItemName: @"Mac Pro 6 Core Dual GPU: 3.5GHz 16GB"
                          valueInDollars: 3999
                          serialNumber: @"3W2V3Y"];
        
        // Instantiate BNRContainer object to hold above BNRItems.
        
        BNRContainer *inventory = [ [BNRContainer alloc] init ];
        
        NSLog(@"%@", inventory);
        
        
    }   // end @autoreleasepool
    
    return 0;
    
}   // end main