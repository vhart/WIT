//
//  TextPostCreationViewController.m
//  WIT
//
//  Created by Chris David on 10/31/15.
//  Copyright © 2015 Varindra Hart. All rights reserved.
//

#import "TextPostCreationViewController.h"
#import "Post.h"
#import "FeedData.h"

@interface TextPostCreationViewController () <UITextViewDelegate>


@property (nonatomic, weak) IBOutlet UITextField *titleTextField;
@property (nonatomic, weak) IBOutlet UITextView *inputTextView;
@property (nonatomic, weak) IBOutlet UITextField *tagTextField;
@property (weak, nonatomic) IBOutlet UIButton *saveButtonTapped;
@property (weak, nonatomic) IBOutlet UIView *saveButtonView;



@end


@implementation TextPostCreationViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titleTextField.layer.cornerRadius = 14;
    self.inputTextView.layer.cornerRadius = 14;
    self.tagTextField.layer.cornerRadius = 14;
    self.saveButtonView.layer.cornerRadius = 25;
    self.saveButtonTapped.layer.cornerRadius = 20;
    
    self.post = [Post new];
    self.post.tags = [NSMutableArray new];
    
    self.post.mediaType = @"text";
    
     self.inputTextView.text = self.post.textPost;
    self.titleTextField.text = self.post.title;
    
//   self.tagTextField.text = [self.post.tags objectAtIndex:1];
    
    NSLog(@"[self.post.tags ] %@",self.post.tags);
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    if (self.post.textPost.length == 0) {
    [self.inputTextView becomeFirstResponder];
    }
}

- (void) viewWillDisappear:(BOOL)animated {
        [super viewDidAppear:YES];
        
        [self savePostText];
    }

    
- (void)textViewDidBeginEditing:(UITextView *)textView {
        UIBarButtonItem *doneButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(saveButtonTapped:)];
        [self.navigationItem setRightBarButtonItem:doneButtonItem animated:YES];
    }
    
- (void)textViewDidEndEditing:(UITextView *)textView {
        [self.navigationItem setRightBarButtonItem:nil animated:YES];
    }
    
#pragma mark -
#pragma mark Interface actions
    
- (IBAction)saveButtonTapped:(id)sender {
        [self.view endEditing:YES];
        
        [self savePostText];
     [[FeedData sharedModel]. feedData addObject:self.post];
    }
    
#pragma mark -
#pragma mark Helpers
    
- (void)savePostText {
    
    self.post.textPost = self.inputTextView.text;
    self.post.title = self.titleTextField.text;
    [self.post.tags addObject:self.tagTextField.text];

      [self dismissViewControllerAnimated:YES completion:nil];
    }


@end
