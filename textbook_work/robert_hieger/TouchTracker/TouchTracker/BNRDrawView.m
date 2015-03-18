//
//  BNRDrawView.m
//  TouchTracker
//
//  Created by Robert Hieger on 3/17/15.
//  Copyright (c) 2015 Robert Hieger. All rights reserved.
//

#import "BNRDrawView.h"
#import "BNRLine.h"             // Needed because lines are
                                // what will be drawn in
                                // BNRDrawView.

// Extend BNRDrawView Class:

@interface BNRDrawView ()

// Line's beginning state:

@property (nonatomic, strong) BNRLine *currentLine;

// Line's or Lines' ending state:

@property (nonatomic, strong) NSMutableArray *finishedLines;


@end


@implementation BNRDrawView

// Override initWithFrame method.

- (instancetype) initWithFrame: (CGRect) r {
    
    // Reference superclass for implementation:
    
    self = [super initWithFrame: r];
    
    // Check state of object initialization:
    
    if (self)   {
        
        // Instantiate NSMutableArray to hold line objects.
        
        self.finishedLines = [ [NSMutableArray alloc] init ];
        
        // Set backgroundColor.
        
        self.backgroundColor = [UIColor grayColor];
        
    }   // end if
    
    return self;
    
}   // end - (instancetype) initWithFrame: (CGRect)frame

//  Why is this strokeLine method implemented here rather
//  than in BNRLine.m?

- (void) strokeLine: (BNRLine *) line {
    
    // Instantiate bezier path object.
    
    UIBezierPath *bp = [UIBezierPath bezierPath];
    
    // Set its properties.
    
    bp.lineWidth = 10;                      // 10 points, I assume.
    bp.lineCapStyle = kCGLineCapRound;      // Rounded line endpoints.
    
    // Set beginning point of line:
    
    [bp moveToPoint: line.begin];
    
    // Set ending point of line:
    
    [bp addLineToPoint: line.end];
    
    // Complete the line between begin and end.
    
    [bp stroke];
    
}   // end strokeLine: (BNRLine *) line

// Implement drawing of lines within CGRect object.

- (void) drawRect: (CGRect) rect {
    
    // Draw finished lines in black.
    
    [ [UIColor blackColor] set ];
    
    // Loop through array of line objects.
    
    for (BNRLine *line in self.finishedLines) {
        
        // Draw line.
        
        [self strokeLine: line];
        
    }   // end for
    
    if (self.currentLine) {
        
        // If there is a line currently being drawn,
        // do it in red.
        
        [ [UIColor redColor] set ];
        
        // Define line in progress.
        
        [self strokeLine: self.currentLine];
        
    }   // end if
    
}   // end - (void) drawRect: (CGRect) rect

// Implement method to actually draw the lines.

- (void) touchesBegan: (NSSet *) touches
            withEvent: (UIEvent *) event    {
    
    // Instantiate UITouch object.
    
    UITouch *t = [touches anyObject];
    
    // Locate X-Y coordinates of where screen has
    // been touched--accomplished by instantiating
    // a BNRLine object and setting its beginning
    // end endpoints for the line.
    
    CGPoint location = [t locationInView: self];
    
    self.currentLine = [ [BNRLine alloc] init ];
    
    self.currentLine.begin = location;
    
    self.currentLine.end = location;
    
    // Signal event for display.
    
    [self setNeedsDisplay];
    
    
}   // end - (void) touchesBegan: (NSSet *) touches
    //                 withEvent: (UIEvent *) event

// Implement method to record the end of the present line.

- (void) touchesMoved: (NSSet *) touches
            withEvent: (UIEvent *) event    {
    
    UITouch *t = [touches anyObject];
    
    // Get X-Y coordinates for end of line.
    
    CGPoint location = [t locationInView: self];
    
    // Set location of line's ending.
    
    self.currentLine.end = location;
    
    // Signal event for display.
    
    [self setNeedsDisplay];
    
}   // end - (void) touchesMoved: (NSSet *) touches
    //                 withEvent: (UIEvent *) event

// Implement method to add line to finishedLines
// NSMutableArray defined in 

- (void) touchesEnded: (NSSet *) touches
            withEvent: (UIEvent *) event    {
    
    [self.finishedLines addObject: self.currentLine];
    
    // Destroy currentLine BNRLine object.
    
    self.currentLine = nil;
    
    // Signal event for display.
    
    [self setNeedsDisplay];
    
    
}   // end - (void) touchesEnded: (NSSet *) touches
    //                 withEvent: (UIEvent *) event

@end
