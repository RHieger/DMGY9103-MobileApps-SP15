//
//  BNRHypnosisView.m
//  Hypnosister
//
//  Created by Robert Hieger on 2/12/15.
//  Copyright (c) 2015 Robert Hieger. All rights reserved.
//

#import "BNRHypnosisView.h"

@interface BNRHypnosisView ()

@property (strong, nonatomic) UIColor *circleColor;

@end

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
    
    [self.circleColor setStroke];
    
    // Draw the concentric circles.
    
    [path stroke];
    
    // Save the current graphic context state.
    
    CGContextRef shadow = UIGraphicsGetCurrentContext();
    
    CGContextSetShadow(shadow, CGSizeMake(10.0, 3.0), 1.0 );
    
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
    
    // Release Shadow
    
    // My Understanding is that after invoking the shadow,
    // the state of the context needs to be restored. However,
    // the following commented out line of code throws the runtime
    // error "Thread 1: signal SIGABRT." Not sure how to resolve
    // this problem or if indeed CGContextRestoreGState is the
    // right function, though it seems to be.
    
    //CGContextRestoreGState(shadow);
    
    
}   // end - (void) drawRect: (CGRect) rect

// Override InitWithFrame:

- (instancetype) initWithFrame: (CGRect) frame {
    
    self = [super initWithFrame: frame];
    
    if (self) {
        
        // All BNRHypnosisViews start with a clear background color.
        
        self.backgroundColor = [UIColor clearColor];
        
        // Default circle color
        
        self.circleColor = [UIColor lightGrayColor];
        
    }
    
    return self;
    
}   // end - (instancetype) initWithFrame (CGRect) frame

// When a finger touches the screen...

- (void) touchesBegan: (NSSet *) touches withEvent: (UIEvent *)event {
    
    // Log touch event to console.
    
    NSLog(@"%@ was touched.\n", self);
    
    // Get three random numbers between 0 and 1.
    
    float red = ( arc4random() % 100 / 100.0 );     // Red component of UIColor
    float green = ( arc4random() % 100 / 100.0 );   // Green component of UIColor
    float blue = ( arc4random() % 100 / 100.0 );    // Blue component of UIColor
    
    // Set pointer to the random color.
    
    UIColor *randomColor = [UIColor colorWithRed: red
                                           green: green
                                            blue: blue
                                           alpha: 1.0];
    
    // Set the random color.
    
    self.circleColor = randomColor;
    
}   // end - (void) touchesBegan: (NSNet *) touches withEvent (UIEvent *) event

@end
