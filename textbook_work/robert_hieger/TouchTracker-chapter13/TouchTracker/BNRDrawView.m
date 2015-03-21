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

@property (nonatomic, strong) NSMutableDictionary *linesInProgress;

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
        
        // Instantiate NSMutableDictionary object linesInProgress.
        
        self.linesInProgress =
        [ [NSMutableDictionary alloc] init ];
        
        // Instantiate NSMutableArray to hold line objects.
        
        self.finishedLines = [ [NSMutableArray alloc] init ];
        
        // Set backgroundColor.
        
        self.backgroundColor = [UIColor grayColor];
        
        // Enable multiple touches, i.e. multiple
        // simultaneous lines.
        
        self.multipleTouchEnabled = YES;
        
        UITapGestureRecognizer *doubleTapRecognizer =
        [ [UITapGestureRecognizer alloc]
           initWithTarget: self
                   action: @selector(doubleTap:) ];
        
        // Set number of required taps to 2.
        
        doubleTapRecognizer.numberOfTapsRequired = 2;
        
        [self addGestureRecognizer: doubleTapRecognizer];
        
    }   // end if
    
    return self;
    
}   // end - (instancetype) initWithFrame: (CGRect)frame

//  Implement doubleTap: detection and associated action,
//  which clears all lines from view.

- (void)doubleTap: (UIGestureRecognizer *) gr   {
    
    // First log recognition of doubleTap: to console.
    
    NSLog(@"Recognized Double Tap");
    
    // Now remove all finished lines and/or lines in progress.
    
    [self.linesInProgress removeAllObjects];
    [self.finishedLines removeAllObjects];
    
    // Signal event for display—reset view to blank gray view.
    
    [self setNeedsDisplay];
    
}   // end - (void) doubleTap: (UIGestureRecognizer *) gr

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
    
    // Set lines in progress to red color.
    
    [ [UIColor redColor] set ];
    
    for (NSValue *key in self.linesInProgress) {
        
        // Draw lines in progress.
        
        [ self strokeLine: self.linesInProgress[key] ];
        
    }   // end for
    
    
}   // end - (void) drawRect: (CGRect) rect

// Implement method to actually draw the lines.

- (void) touchesBegan: (NSSet *) touches
            withEvent: (UIEvent *) event    {
    
    // Let's put in a log statement to seee the order
    // of events.
    
    NSLog( @"%@", NSStringFromSelector(_cmd) );
    
    for (UITouch *t in touches) {
        
        // Instantiate line object and set its beginning
        // and ending points.
        
        BNRLine *line = [ [BNRLine alloc] init ];
        
        // Define point for beginning of line.
        
        CGPoint location = [t locationInView: self];
        
        
        line.begin = location;
        line.end = location;
        
        NSValue *key = [NSValue valueWithNonretainedObject: t ];
        
        self.linesInProgress[key] = line;
        
    }   // end for
    
    // Signal event for display.
    
    [self setNeedsDisplay];
    
    
}   // end - (void) touchesBegan: (NSSet *) touches
    //                 withEvent: (UIEvent *) event

// Implement method to record the end of the present line.

- (void) touchesMoved: (NSSet *) touches
            withEvent: (UIEvent *) event    {
    
    // Let's put in a log statement to see the order of events.
    
    NSLog( @"%@", NSStringFromSelector(_cmd) );
    
    // Fast enumerate where touches have moved.
    
    for (UITouch *t in touches) {

        NSValue *key = [NSValue valueWithNonretainedObject: t];
        
        // Create line.
        
        BNRLine *line = self.linesInProgress[key];
        
        line.end = [t locationInView: self];
        
    }   // end for
    
    // Signal event for display.
    
    [self setNeedsDisplay];
    
}   // end - (void) touchesMoved: (NSSet *) touches
    //                 withEvent: (UIEvent *) event

// Implement method to add line to finishedLines
// NSMutableArray defined in 

- (void) touchesEnded: (NSSet *) touches
            withEvent: (UIEvent *) event    {
    
    // Let's put in a log statement to see the order of events.
    
    NSLog( @"%@", NSStringFromSelector(_cmd) );
    
    for (UITouch *t in touches) {
        
        NSValue *key = [NSValue valueWithNonretainedObject: t];
        
        BNRLine *line = self.linesInProgress[key];
        
        // Add line to NSMutableArray.
        
        [self.finishedLines addObject: line];
        
        // Remove currentLine from linesInProgress after
        // it has been copied to finishedLines.
        
        [self.linesInProgress removeObjectForKey: key];
        
    }   // end for
    
    [self setNeedsDisplay];
    
    
}   // end - (void) touchesEnded: (NSSet *) touches
    //                 withEvent: (UIEvent *) event

// Implement method to handle interruptions from iOS, such as
// a phone call coming in on the iPhone.

- (void) touchesCancelled: (NSSet *) touches
                withEvent: (UIEvent *) event    {
    
    // Let's put in a log statement to see the order of events.
    
    NSLog( @"%@", NSStringFromSelector(_cmd) );
    
    // Remove unfinished lines from linesInProgress.
    
    for (UITouch *t in touches) {
        
        NSValue *key = [NSValue valueWithNonretainedObject: t];
        
        // Remove unfinished BNRLines from linesInProgress.
        
        [self.linesInProgress removeObjectForKey: key];
        
    }   // end for
    
    // Signal event for display, so view is updated.
    
    [self setNeedsDisplay];
    
    
}   // end - (void) touchesCancelled: (NSSet *) touches
    //                     withEvent: (UIEvent *) event

@end
