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
    
}

@end
