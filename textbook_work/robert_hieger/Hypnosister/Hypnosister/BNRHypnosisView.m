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
    
    // The largest circle will circumscribe the view.
    
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    
    // Instantiate UIBezierPath object to be used in the creation
    // of a circle.
    
    UIBezierPath *path = [ [UIBezierPath alloc] init ];
    
    // Create concentric circles.
    
    for (float currentRadius = maxRadius; currentRadius > 0;
         currentRadius -= 20) {
        
        // Make certain to advance path to beginning of each
        // concentric circle so that one continuous line does
        // not intersect all circles.
        
        [path moveToPoint: CGPointMake(center.x + currentRadius,
                                       center.y)]; 
        
        [path addArcWithCenter: center
                        // Note this is currentRadius!
                        radius: currentRadius
                    startAngle: 0.0
                      endAngle: M_PI * 2.0
                     clockwise: YES];
        
    }   // end for
    
    
    // Configure line width to 10 points.
    
    path.lineWidth = 10.0;
    
    // Configure the drawing color to light gray.
    
    [ [UIColor lightGrayColor] setStroke ];
    
    // Draw the concentric circles.
    
    [path stroke];
    
    // Instantiate a UIImage to contain the logo.png.
    
    UIImage *logoImage = [UIImage imageNamed: @"logo.png"];
    
    // Declare a CGRect for the logo to be superimposed over
    // the CGRect bounds. The parameters below set the
    
    CGRect logoRectangle = CGRectMake(bounds.size.width / 4,
                                      bounds.size.height / 4,
                                      bounds.size.width /2,
                                      bounds.size.height /2);
    
    // Draw the logo within the rectangle defined above.
    
    [logoImage drawInRect: logoRectangle];
    
    
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
