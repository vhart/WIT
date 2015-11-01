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
#import "FeedData.h"


@interface VideoPostCreationViewController () <UIImagePickerControllerDelegate,UINavigationControllerDelegate, UITextFieldDelegate>
@property (nonatomic, weak) UITextField *titleLabel;
@property (nonatomic, weak) UITextField *tagsLabel;


@property (nonatomic) UIImagePickerController *imagePicker;
@property (nonatomic) NSURL *videoURL;
@property (nonatomic) Post *post;


@end

@implementation VideoPostCreationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.videoEntry = [Media new];
    self.post = [Post new];
    self.post.tags = [NSMutableArray new];
    // Do any additional setup after loading the view.
 

}



// camera setup
- (void)setupCamera{
    self.imagePicker = [[UIImagePickerController alloc]init];
    self.imagePicker.delegate = self;
    self.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
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

    
    // append a file name to it
    documentsURL = [documentsURL URLByAppendingPathComponent:fileName];
    
    return documentsURL;
}


- (IBAction)save:(id)sender{
    if (self.videoURL) {
        self.post.videoURL = self.videoURL;
        
        [[FeedData sharedModel]. feedData addObject:self.post]; 
        
        
        //Dont forget there is no error catching. So make it work!!
        [self.post.tags addObject:self.tagsLabel.text];
        
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.view endEditing:YES];
    return YES;
}



@end
