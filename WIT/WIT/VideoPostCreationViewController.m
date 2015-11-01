//
//  VideoPostCreationViewController.m
//  WIT
//
//  Created by Varindra Hart on 10/31/15.
//  Copyright © 2015 Varindra Hart. All rights reserved.
//

#import "VideoPostCreationViewController.h"

@interface VideoPostCreationViewController () <UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (nonatomic) UIImagePickerController *imagePicker;

@end

@implementation VideoPostCreationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.videoEntry = [Media new];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupCamera{
    self.imagePicker = [[UIImagePickerController alloc]init];
    self.imagePicker.delegate = self;
    self.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:self.imagePicker animated:YES completion:NULL];
    
}

- (IBAction)startRecording{
    [self setupCamera];
    
    
}

@end
