//
//  BNRHypnosisView.m
//  Hypnosister
//
//  Created by Robert Hieger on 2/12/15.
//  Copyright (c) 2015 Robert Hieger. All rights reserved.
//

#import "BNRHypnosisView.h"

@implementation BNRHypnosisView

// Override drawRect to implement customized drawing of
// concentric circles.

- (void)drawRect:(CGRect)rect {
    
    // Declare a CGRect struct named bounds and set its
    // bounds to itself.
    
    CGRect bounds = self.bounds;
    
    // Declare a GPoint called center to store X- and Y-
    // coordinate centers.
    
    CGPoint center;
    
    // Determine X-coordinate center.
    
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    
    // Determine Y-coordinate center.
    
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    // The circle will be the largest that can fit in the view.
    
    float radius = MIN(bounds.size.width, bounds.size.height) / 2.0;
    
    // Instantiate UIBezierPath object to be used in the creation
    // of a circle.
    
    UIBezierPath *path = [ [UIBezierPath alloc] init ];
    
    // Add an arc to the path at center, with radius of radius,
    // with 0 to 2 * PI radians (circle).
    
    [path addArcWithCenter: center
                    radius: radius
                startAngle: 0.0
                  endAngle: M_PI * 2.0
                 clockwise: YES];
    
    // Configure line width to 10 points.
    
    path.lineWidth = 10.0;
    
    // Configure the drawing color to light gray.
    
    [ [UIColor lightGrayColor] setStroke ];
    
    // Draw the circumference of the circle.
    
    [path stroke];
    
    
}   // end - (void) drawRect: (CGRect) rect

// Override InitWithFrame:

- (instancetype) initWithFrame: (CGRect) frame {
    
    self = [super initWithFrame: frame];
    
    if (self) {
        
        // All BNRHypnosisViews start with a clear background color.
        
        self.backgroundColor = [UIColor clearColor];
        
    }
    
    return self;
    
}   // end - (instancetype) initWithFrame (CGRect) frame

@end