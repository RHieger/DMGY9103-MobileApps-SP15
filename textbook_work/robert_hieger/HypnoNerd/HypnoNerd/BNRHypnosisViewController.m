//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by Robert Hieger on 2/16/15.
//  Copyright (c) 2015 Robert Hieger. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"

@interface BNRHypnosisViewController () <UITextFieldDelegate>

@end

@implementation BNRHypnosisViewController

// Override loadView method

- (void) loadView {
    
    // Create a view.
    
    CGRect frame = [UIScreen mainScreen].bounds;
    
    BNRHypnosisView *backgroundView = [ [BNRHypnosisView alloc]
                                        initWithFrame: frame ];
    
    // Add UITextField to view. First We need a rectangle
    // to contain it.
    
    CGRect textFieldRect = CGRectMake(40, 270, 240, 30);
    
    // Set the context of *textField to textFieldRect.
    
    UITextField *textField = [ [UITextField alloc]
                              initWithFrame: textFieldRect];
    
    // Setting the border on the UITextField will allow us to
    // see it more easily. The style here is a rounded
    // rectangle format.
    
    textField.borderStyle = UITextBorderStyleRoundedRect;
    
    // Add placeholder text to textField.
    
    textField.placeholder = @"Hypnotize me";
    
    // Change default Return Key to Done Key.
    
    textField.returnKeyType = UIReturnKeyDone;
    
    // Uses UITextFieldDelegate Protocol.
    
    textField.delegate = self;
    
    // Add textField as subView to backgroundView.
    
    [backgroundView addSubview: textField];
    
    // Set it as *the* view of this view controller.
    
    self.view = backgroundView;
    
}   // end loadView

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    
    NSLog(@"BNRHypnosisViewController loaded its view.\n");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL) textFieldShouldReturn: (UITextField *) textField {
    
    [self drawHypnoticMessage: textField.text];
    
    textField.text = @"";
    
    [textField resignFirstResponder];
    
    return YES;
    
}   // end textFieldShouldReturn: (UITextfield *) textfield

- (void) drawHypnoticMessage: (NSString *) message {
    
    for (int i = 0; i < 20; i++) {
        
        // Instantiate a UILabel.
        
        UILabel *messageLabel = [ [UILabel alloc] init ];
        
        // Configure the label's colors and text.
        
        messageLabel.backgroundColor = [UIColor clearColor];
        messageLabel.textColor = [UIColor whiteColor];
        messageLabel.text = message;
        
        // This method resizes the label, which will be
        // relative to the text that it is displaying.
        
        [messageLabel sizeToFit];
        
        // Get a random x-Coordinate value that fits within
        // backgroundView's width.
        
        int width = self.view.bounds.size.width -
                    messageLabel.bounds.size.width;
        
        int x = arc4random() % width;
        
        // Get a random y-Coordinate value that fits within
        // backgroundView's height.
        
        int height = self.view.bounds.size.height -
                     messageLabel.bounds.size.height;
        
        int y = arc4random() % height;
        
        // Update the label's frame.
        
        CGRect frame = messageLabel.frame;
        frame.origin = CGPointMake(x, y);
        messageLabel.frame = frame;
        
        // Add the label to the heirarchy.
        
        [self.view addSubview: messageLabel];
        
        // Create horizontal and vertical parallex
        // effect that will respond as 25 points
        // plus or minus tilt of the horizontal
        // and vertical axes of messageLabel.
        
        // NOTE: These effects will be visible only
        // on an iPad or iPhone, not on Mac OS X.
        
        UIInterpolatingMotionEffect *motionEffect;
        
        motionEffect = [ [UIInterpolatingMotionEffect alloc]
        initWithKeyPath: @"center.x"
        type: UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis ];
        
        motionEffect.minimumRelativeValue = @-0.25;
        motionEffect.maximumRelativeValue = @0.25;
        
        // Add horizontal motion effect to messageLabel.
        
        [messageLabel addMotionEffect: motionEffect];
        
        motionEffect= [ [UIInterpolatingMotionEffect alloc]
        initWithKeyPath: @"center.y"
        type: UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis ];
        
        motionEffect.minimumRelativeValue = @-0.25;
        motionEffect.maximumRelativeValue = @0.25;
        
        // Add vertical motion effect to messageLabel.
        
        [messageLabel addMotionEffect: motionEffect];
        
    }   // end for
    
}   // end - (void) drawHypnoticMessage: (NSString *) message

//  Override - (instancetype) initWithNibName: (NSString *) nibNameOrNil
//                           bundle: (NSBundle *) bundleOrNil

- (instancetype) initWithNibName:(NSString *)nibNameOrNil
                          bundle:(NSBundle *)nibBundleOrNil {
    
    self = [super initWithNibName:nibNameOrNil
                           bundle:nibBundleOrNil ];
    
    if (self) {
        
        // Set the tabBarItem's title.
        
        self.tabBarItem.title = @"Hypnotize";
        
        // Create a UIImage from a file. This will use
        // Hypno@2x.png on retina display devices.
        
        // First instantiate UIImage object.
        
        UIImage *image = [UIImage imageNamed: @"Hypno.png"];
        
        // Now put the image on the tabBarItem.
        
        self.tabBarItem.image = image;
        
    }   // end if
    
    return self;
    
}   // end initWithNibName: (NSString *) nibNameOrNil
    //              bundle: (NSBundle *) nibBundleOrNil

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
