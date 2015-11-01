//
//  ShareViewController.m
//  WIT
//
//  Created by Eric Sze on 11/1/15.
//  Copyright © 2015 Varindra Hart. All rights reserved.
//

#import "ShareViewController.h"

@interface ShareViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIButton *textButton;
@property (weak, nonatomic) IBOutlet UIButton *videoButton;
@property (weak, nonatomic) IBOutlet UIButton *audioButton;

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;

@end

@implementation ShareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.microphoneTapped = false;
    NSLog(@"viewDidLoad microphoneTapped %d",self.microphoneTapped );

    
    self.nameTextField.delegate = self;
    self.emailTextField.delegate = self;
    
    self.textButton.layer.cornerRadius = self.textButton.frame.size.height / 2;
    self.videoButton.layer.cornerRadius = self.videoButton.frame.size.height / 2;
    self.audioButton.layer.cornerRadius = self.audioButton.frame.size.height / 2;
    
    self.textButton.layer.borderWidth = 1;
    self.videoButton.layer.borderWidth = 1;
    self.audioButton.layer.borderWidth = 1;
    
    
}

-(void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:YES];
    
    self.microphoneTapped = YES;
    
    
}

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
     
    NSLog(@"viewWillAppear microphoneTappedResponse %d",self.microphoneTappedResponse );
    
    if (self.microphoneTapped == YES) {
        [self.audioButton setBackgroundImage:[UIImage imageNamed:@"micwithcheck" ] forState:(UIControlStateNormal)];
    }
    
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.view endEditing:YES];
    return YES;
}

@end
