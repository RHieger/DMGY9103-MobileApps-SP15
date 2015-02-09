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
        
        // Create BNRItems for nested BNRContainer:
        
        BNRItem *service0 = [ [BNRItem alloc]
                             initWithItemName: @"WHOOSH! Screen Shine Duo - Screen/Device Cleaner"
                             valueInDollars: 20
                             serialNumber: @"4X7U5P" ];
        
        BNRItem *service1 = [ [BNRItem alloc]
                             initWithItemName: @"Moshi TeraGlove Ultimate Cleaning Kit"
                             valueInDollars: 20
                             serialNumber: @"4Y4C2Q" ];
        
        BNRItem *service2 = [ [BNRItem alloc]
                             initWithItemName: @"Sanus Elements ELM102 Screen Cleaning Gel"
                             valueInDollars: 15
                             serialNumber: @"4S5T2W" ];
        
        // Instantiate array of service items for BNRContainer serviceItems
        
        NSArray *itemsForService = @[service0, service1, service2];
        
        // Sum values of service0, service1 and service 2 to be added to total below:
        
        int serviceValue = service0.valueInDollars;
        serviceValue += service1.valueInDollars;
        serviceValue += service2.valueInDollars;
        
        // Instantiate BNRContainer serviceItems
        
        BNRContainer *serviceItems = [ [BNRContainer alloc]
                                      initWithItemBox: itemsForService
                                      nameOfContainer:@"Cleaning Kits"
                                      andTotalValue: serviceValue ];

        // Instantiate array of BNRItems for use in BNRContainer.
        
        NSArray *inventoryItems = @[item0, item1,
                                    item2, item3,
                                    item4, item5,
                                    item6, item7,
                                    item8, item9,
                                    serviceItems];
        
        // Brute force inefficient approach to summing valueInDollars
        // to get value for totalValue in BNRContainer object.
        // Attempted both for and for-in loops to no avail.
        // Could not figure out how to iterate through BNRItem
        // object valueInDollars instance variable within
        // BNRContainer and add them to sum for totalValue.
        
        int valueForTotal = item0.valueInDollars;
        valueForTotal += item1.valueInDollars;
        valueForTotal += item2.valueInDollars;
        valueForTotal += item3.valueInDollars;
        valueForTotal += item4.valueInDollars;
        valueForTotal += item5.valueInDollars;
        valueForTotal += item6.valueInDollars;
        valueForTotal += item7.valueInDollars;
        valueForTotal += item8.valueInDollars;
        valueForTotal += item9.valueInDollars;
        valueForTotal += serviceValue;
        
        // Instantiate BNRContainer object to hold above BNRItems and one BNRContainer.
        
        BNRContainer *inventory = [ [BNRContainer alloc]
                                   initWithItemBox: inventoryItems
                                   nameOfContainer: @"Inventory Items"
                                   andTotalValue: valueForTotal ];
        
        NSLog(@"%@", inventory);
        
        
    }   // end @autoreleasepool
    
    return 0;
    
}   // end main