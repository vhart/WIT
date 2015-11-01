//
//  TextPostCreationViewController.m
//  WIT
//
//  Created by Chris David on 10/31/15.
//  Copyright © 2015 Varindra Hart. All rights reserved.
//

#import "TextPostCreationViewController.h"

@interface TextPostCreationViewController () <UITextViewDelegate>


@property (nonatomic, weak) IBOutlet UITextField *titleTextField;
@property (nonatomic, weak) IBOutlet UITextView *inputTextView;
@property (nonatomic, weak) IBOutlet UITextField *tagTextField;
@property (weak, nonatomic) IBOutlet UIButton *saveButtonTapped;
@property (weak, nonatomic) IBOutlet UIView *saveButtonView;
@end


@implementation TextPostCreationViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.titleTextField.layer.cornerRadius = 10;
    self.inputTextView.layer.cornerRadius = 10;
    self.tagTextField.layer.cornerRadius = 10;


    
    self.saveButtonView.layer.cornerRadius = 25;
    self.saveButtonTapped.layer.cornerRadius = 20;
    
    
//    self.inputTextView.text = self.note.text;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
   
}

@end
