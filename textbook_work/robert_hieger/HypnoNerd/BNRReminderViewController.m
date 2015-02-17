//
//  BNRReminderViewController.m
//  HypnoNerd
//
//  Created by Robert Hieger on 2/16/15.
//  Copyright (c) 2015 Robert Hieger. All rights reserved.
//

#import "BNRReminderViewController.h"

@interface BNRReminderViewController ()

@property (nonatomic, weak) IBOutlet UIDatePicker *datePicker;

@end

@implementation BNRReminderViewController

- (IBAction) addReminder:(id) sender {
    
    NSDate *date = self.datePicker.date;
    
    NSLog(@"Setting a reminder for %@", date);
    
    // Instantiate UILocalNotification object to give reminder.
    
    UILocalNotification *note = [ [UILocalNotification alloc] init ];
    
    // Set note properties.
    
    note.alertBody = @"Hypnotize me!";
    note.fireDate = date;
    
    // Send the alert to the shared application.
    
    [ [UIApplication sharedApplication] scheduleLocalNotification: note ];
    
}

// Override - (instancetype) initWithNibName: (NSString *) nibNameOrNil
//                           bundle: (NSBundle *) bundleOrNil

- (instancetype) initWithNibName:(NSString *)nibNameOrNil
                          bundle:(NSBundle *)nibBundleOrNil {
    
    // Refer back to superclass for override.
    
    self = [super initWithNibName: nibNameOrNil
                           bundle: nibBundleOrNil];
    
    // Check if instntiation was successful.
    
    if (self)   {
        
        // Set the tabBarItem's title.
        
        self.tabBarItem.title = @"Reminder";
        
        // Create a UIImage from a file.
        // This will use Time@2x.ping on retina display device.
        
        UIImage *image = [UIImage imageNamed: @"Time.png"];
        
        // Put the image on the tabBarItem.
        
        self.tabBarItem.image = image;
        
    }   // end if
    
    return self;
    
}   // end initWithNibName: (NSString *) nibNameOrNil
    //              bundle: (NSBundle *) bundleOrNil

// Override viewDidLoad.

- (void) viewDidLoad {
    
    [super viewDidLoad];
    
    // Log load to console.
    
    NSLog(@"BNRReminderViewController loaded its view.\n");
    
}   // end loadView

// Override viewWillAppear.

- (void) viewWillAppear:(BOOL)animated {
    
    // Call the super class to override it.
    
    [super viewWillAppear: animated];
    
    // Constrain datePicker to allow times a minimum of 60 seconds
    // into the future.
    
    self.datePicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow: 60];
    
}   // end viewWillAppear: (BOOL) animated

@end
