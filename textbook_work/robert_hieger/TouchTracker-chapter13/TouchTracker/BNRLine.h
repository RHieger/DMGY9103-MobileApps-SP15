//
//  BNRLine.h
//  TouchTracker
//
//  Created by Robert Hieger on 3/17/15.
//  Copyright (c) 2015 Robert Hieger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>   // So considerately left out
                                        // by book. (Very annoying.)

@interface BNRLine : NSObject

// Note that these two properties are structs, not objects.

@property (nonatomic) CGPoint begin;
@property (nonatomic) CGPoint end;

@end
