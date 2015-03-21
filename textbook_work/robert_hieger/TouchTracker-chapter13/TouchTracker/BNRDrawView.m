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

// Selected line:

@property (nonatomic, weak) BNRLine *selectedLine;


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
        
        // Prevents touchesBegan: withEvent: from drawing
        // red point before doubleTapRecognizer is called.
        
        doubleTapRecognizer.delaysTouchesBegan = YES;
        
        [self addGestureRecognizer: doubleTapRecognizer];
        
        // Add single tap recognizer used to select lines
        // for deletion.
        
        UITapGestureRecognizer *tapRecognizer =
        [ [UITapGestureRecognizer alloc]
           initWithTarget: self
                   action: @selector(tap:) ];
        
        tapRecognizer.delaysTouchesBegan = YES;
        
        // Delay doubleTapRecognizer so that first tap
        // is not to be assumed the first of two taps.
        
        [tapRecognizer
         requireGestureRecognizerToFail: doubleTapRecognizer];
        
        [self addGestureRecognizer: tapRecognizer];
        
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

// Implement tap: (single tap) used to select a line for
// future deletion.

- (void) tap: (UIGestureRecognizer *) gr {
    
    // First log the single tap to the console.
    
    NSLog(@"Recognized tap");
    
    // Send locationInView message to gr specifying
    // the receiver as self.
    
    CGPoint point = [gr locationInView: self];
    
    // Specify the line at the selected point.
    
    self.selectedLine = [self lineAtPoint: point];
    
    // Signal event for display--set line to green selected.
    
    [self setNeedsDisplay];
    
}

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
    
    // Show lines selected for deletion in green.
    
    if (self.selectedLine) {
        
        [ [UIColor greenColor] set ];
        
        // Now draw selected line in green.
        
        [self strokeLine: self.selectedLine];
        
    }   // end if
    
    
}   // end - (void) drawRect: (CGRect) rect

// Implement lineAtPoint to localize a line near
// the given point (not sure why).

- (BNRLine *) lineAtPoint: (CGPoint) p {
    
    
    // Find a line close to CGPoint p, using fast enumeration.
    
    for (BNRLine *l in self.finishedLines) {
        
        // Fix starting and ending points of line l.
        
        CGPoint start = l.begin;
        CGPoint end = l.end;
        
        // Check a few points on the line.
        
        for (float t = 0.0; t <= 1.0; t+= 0.05) {
            
            // Determine X- and Y-coordinates of tap.
            
            float x = start.x + t * (end.x - start.x);
            float y = start.y + t * (end.y - start.y);
            
            // If the tapped point is within 20 points of
            // the line, let's return this line.
            
            if ( hypot(x - p.x, y - p.y) < 20.0) {
                
                return l;
                
            }   // end if
            
        }   // end inner for
        
    }   // end for
    
    // If nothing is close enough to the tapped point,
    // then we did not select a line.
    
    return nil;
    
}   // end - (BNRLine) lineAtPoint: (CGPoint *) p

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
