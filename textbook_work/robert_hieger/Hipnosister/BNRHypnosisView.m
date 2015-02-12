//
//  BNRHypnosisView.m
//  Hipnosister
//
//  Created by Robert Hieger on 2/11/15.
//  Copyright (c) 2015 Robert Hieger. All rights reserved.
//

#import "BNRHypnosisView.h"

@implementation BNRHypnosisView

// Override default CGRect Object.

- (void) drawRect: (CGRect) rect {
    
    // Establish the bounds of the window.
    
    CGRect bounds = self.bounds;
    
    // Figure out the center of the bounds rectangle.
    
    CGPoint center;     // This variable stores the center point.
    
    // Determine centered X-coordinate.
    
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    
    // Determine centered Y-coordinate.
    
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    // The circle will be the largest that will fit in the view
    // (portrait or landscape).
    
    float radius = MIN(bounds.size.width, bounds.size.height) / 2.0;
    
    // Instantiate UIBezierPath Object in order to draw circle.
    
    UIBezierPath *path = [ [UIBezierPath alloc] init ];
    
    // Add an arc to the path at center, with radius of radius,
    // with 0 to 2 * PI radians (a circle).
    
    [path addArcWithCenter: center
                    radius: radius
                startAngle: 0.0
                  endAngle: M_PI * 2.0
                 clockwise: YES];
    
    // Configure lineWidth to 10 points.
    
    path.lineWidth = 10;
    
    // Draw the circumference of the circle.
    
    [path stroke];
    
}   // end - (void) drawRect: (CGRect) rect

@end