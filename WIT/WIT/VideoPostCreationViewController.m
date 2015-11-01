//
//  VideoPostCreationViewController.m
//  WIT
//
//  Created by Varindra Hart on 10/31/15.
//  Copyright © 2015 Varindra Hart. All rights reserved.
//

#import "VideoPostCreationViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import "NSURL+ImageGenerator.h"

<<<<<<< HEAD
@interface VideoPostCreationViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
=======
@interface VideoPostCreationViewController () <UIImagePickerControllerDelegate,UINavigationControllerDelegate, UITextFieldDelegate>
@property (nonatomic, weak) UITextField *titleLabel;
@property (nonatomic, weak) UITextField *tagsLabel;
>>>>>>> 252979d7f15200c165909d152cf0ac08d5589c31

@property (nonatomic) UIImagePickerController *imagePicker;
@property (nonatomic) NSURL *videoURL;
@property (nonatomic) Post *post;

<<<<<<< HEAD
=======

>>>>>>> 252979d7f15200c165909d152cf0ac08d5589c31
@end

@implementation VideoPostCreationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.videoEntry = [Media new];
    self.post = [Post new];
    self.post.tags = [NSMutableArray new];
    // Do any additional setup after loading the view.
 
<<<<<<< HEAD
}

=======
 }
>>>>>>> 252979d7f15200c165909d152cf0ac08d5589c31

// camera setup
- (void)setupCamera{
    self.imagePicker = [[UIImagePickerController alloc]init];
    self.imagePicker.delegate = self;
    self.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
<<<<<<< HEAD
    
    [self presentViewController:self.imagePicker animated:YES completion:NULL];
    
}

// camera setup
- (IBAction)startRecording{
    [self setupCamera];
=======
    self.imagePicker.mediaTypes = [[NSArray alloc]initWithObjects:(NSString *)kUTTypeMovie, nil];
    self.imagePicker.videoMaximumDuration = 10.0f;
    self.imagePicker.videoQuality = UIImagePickerControllerQualityTypeHigh;
    [self presentViewController:self.imagePicker animated:YES completion:NULL];
    
}

#pragma mark - IBActions

// camera setup
- (IBAction)startRecording{
    
    [self setupCamera];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    /*
     type = info[UIImagePickerControllerMediaType]
     if type == "public.movie" {
     if let file = info[UIImagePickerControllerMediaURL] as? NSURL {
     if let videoData = NSData(contentsOfURL: file) {
     if let image = file.thumbnailImagePreview() {
     entry.posterImage = PFFile(data: UIImageJPEGRepresentation(image, 0.8)!)
     entry.media = PFFile(data: videoData)
     entry.typeMapped = .Video
     */
    NSString *type = info[UIImagePickerControllerMediaType];
    self.post.mediaType = @"video";
    
    NSURL *mediaURL = [[NSURL alloc]initWithString:info[UIImagePickerControllerMediaURL]];
    
    
    NSURL *fileURL = [self grabFileURL:@"video.mov"];
    self.videoURL = fileURL;
    NSData *videoData = [[NSData alloc] initWithContentsOfURL:mediaURL];
  
    [videoData writeToURL:fileURL atomically:YES];
    
    
    UIImage *image = [mediaURL thumbnailImagePreview];
    
    self.post.videoThumbnail = image;
    
    
//    self.videoEntry.videoThumbnail = [PFFile fileWithData:UIImageJPEGRepresentation(image, .8f)];
//    self.videoEntry.mediaFile = [PFFile fileWithData:videoData];
//    self.videoEntry.fileType = @"public.movie";
    
}

- (NSURL*)grabFileURL:(NSString *)fileName {
    
    // find Documents directory
    NSURL *documentsURL = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
>>>>>>> 252979d7f15200c165909d152cf0ac08d5589c31
    
    // append a file name to it
    documentsURL = [documentsURL URLByAppendingPathComponent:fileName];
    
    return documentsURL;
}

<<<<<<< HEAD


=======
- (IBAction)save:(id)sender{
    if (self.videoURL) {
        self.post.videoURL = self.videoURL;
        [self.entries addObject:self.post];
        
        
        //Dont forget there is no error catching. So make it work!!
        [self.post.tags addObject:self.tagsLabel.text];
        
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.view endEditing:YES];
    return YES;
}
>>>>>>> 252979d7f15200c165909d152cf0ac08d5589c31


@end
