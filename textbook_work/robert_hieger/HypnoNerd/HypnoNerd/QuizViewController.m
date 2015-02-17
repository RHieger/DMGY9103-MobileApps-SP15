//
//  QuizViewController.m
//  Quiz
//
//  Created by Robert Hieger on 1/29/15.
//  Copyright (c) 2015 Robert Hieger. All rights reserved.
//

#import "QuizViewController.h"

@interface QuizViewController ()

// Properties for current question, questions, and answers:

@property (nonatomic) int currentQuestionIndex;

@property (nonatomic, copy) NSArray *questions;

@property (nonatomic, copy) NSArray *answers;

// Outlet properties for necessary labels:

@property (nonatomic, weak) IBOutlet UILabel *questionLabel;

@property (nonatomic, weak) IBOutlet UILabel *answerLabel;

@end

@implementation QuizViewController

-(instancetype) initWithNibName:(NSString *)nibNameOrNil
                         bundle: (NSBundle *)nibBundleOrNil {
    
    // Call the init method implemented by the superclass.
    
    self = [super initWithNibName: nibNameOrNil bundle: nibBundleOrNil];
    
    if (self) {
        
        // Create a UIImage from a file.
        // This will use Quiz@2x.ping on retina display device.
        
        UIImage *image = [UIImage imageNamed: @"Quiz.png"];
        
        // Put the image on tabBarItem.
        
        self.tabBarItem.image = image;
        
        // Create two arrays filled with questions and answers
        // and make the pointers point to them.
        
        self.questions = @[@"From what is cognac made?",
                           @"What is 7 + 7?",
                           @"What is the capital of Vermont?"];
        
        self.answers = @[@"Grapes",
                         @"14",
                         @"Montpelier"];
        
        self.tabBarItem.title = @"Take a Quiz!";
        
    }   // end if
    
    // Return the address of the new object.
    
    return self;
    
}   // end -(instancetype) initWithNibName: (NSString *) nibNameOrNil
    //                              bundle: (NSBundle *) nibBundleOrNil

// QuizViewController methods:

- (IBAction)showQuestion:(id)sender {
    
    // Step to the next question.
    
    self.currentQuestionIndex++;
    
    // Am I past the last question?
    
    if ( self.currentQuestionIndex == [self.questions count] ) {
        
        self.currentQuestionIndex = 0;
        
    }   // end if
    
    // Get the string at that index in the questions array.
    
    NSString *question = self.questions[self.currentQuestionIndex];
    
    // Display the string in the question label.
    
    self.questionLabel.text = question;
    
    // Reset the answer label.
    
    self.answerLabel.text = @"???";
    
}   // end -(IBAction) showQuestion: (id) sender

- (IBAction)showAnswer:(id)sender {
    
    // What is the answer to the current question?
    
    NSString *answer = self.answers[self.currentQuestionIndex];
    
    // Display it in the answer label.
    
    self.answerLabel.text = answer;
    
}   // end - (IBAction) showAnsewr: (id) sender

@end
