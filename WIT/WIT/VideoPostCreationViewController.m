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

@interface VideoPostCreationViewController () <UIImagePickerControllerDelegate,UINavigationControllerDelegate, UITextFieldDelegate>
@property (nonatomic, weak) UITextField *titleLabel;
@property (nonatomic, weak) UITextField *tagsLabel;

@property (nonatomic) UIImagePickerController *imagePicker;
@property (nonatomic) NSURL *videoURL;
@property (nonatomic) Post *post;

// audio recording/playback properties
@property (strong, nonatomic) AVAudioRecorder *audioRecorder;
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
@property (strong, nonatomic) IBOutlet UIButton *recordButton;
@property (strong, nonatomic) IBOutlet UIButton *playButton;
@property (strong, nonatomic) IBOutlet UIButton *stopButton;

@end

@implementation VideoPostCreationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.videoEntry = [Media new];
    self.post = [Post new];
    self.post.tags = [NSMutableArray new];
    // Do any additional setup after loading the view.
 
 }


#pragma mark - Functions

- (void)audioActions {
    NSArray *dirPaths;
    NSString *docsDir;
    
    dirPaths = NSSearchPathForDirectoriesInDomains(
                                                   NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = dirPaths[0];
    
    NSString *soundFilePath = [docsDir
                               stringByAppendingPathComponent:@"sound.caf"];
    
    NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];
    
    NSDictionary *recordSettings = [NSDictionary
                                    dictionaryWithObjectsAndKeys:
                                    [NSNumber numberWithInt:AVAudioQualityMin],
                                    AVEncoderAudioQualityKey,
                                    [NSNumber numberWithInt:16],
                                    AVEncoderBitRateKey,
                                    [NSNumber numberWithInt: 2],
                                    AVNumberOfChannelsKey,
                                    [NSNumber numberWithFloat:44100.0],
                                    AVSampleRateKey,
                                    nil];
    
    NSError *error = nil;
    
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    [audioSession setCategory:AVAudioSessionCategoryPlayAndRecord
                        error:nil];
    
    _audioRecorder = [[AVAudioRecorder alloc]
                      initWithURL:soundFileURL
                      settings:recordSettings
                      error:&error];
    
    if (error)
    {
        NSLog(@"error: %@", [error localizedDescription]);
    } else {
        [_audioRecorder prepareToRecord];
    }
}

- (void)runningLabel {
    //
    //    [UIImage animatedImageWithImages:self.images duration:0.88 delay:0.5 options:UIViewAnimationOptionOverrideInheritedDuration | UIViewAnimationOptionRepeat animations:^{
    //        self.recordButton.imageView.image = [UIImage imageNamed:@"micpurple"];
    //    } completion:^(BOOL finished) {
    //        //titleLabel.minX = titleView.width; //this is the problem, you should not set minX again while  UIViewAnimationOptionRepeat also is animation option
    //        self.recordButton.imageView.image = [UIImage imageNamed:@"micwhite"];
    //        [self runningLabel];
    //    }];
    
    
    //     [self.micWhite setBackgroundImage:[UIImage animatedImageWithImages:self.images duration:2.0] forState:UIControlStateNormal];
    
}

- (void)imageSetup {
//    self.recordButton.imageView.image = [self loadingImage];
    self.recordButton.imageView.animationRepeatCount = 0;
    
    //when you want the animation to start
    [self animateImages];
    //then later at some appropriate time:
    [self stopAnimatingImages];
    
}

//- (UIImage *)loadingImage {
//    self.images = [NSArray arrayWithObjects:[UIImage imageNamed:@"micwhite"],
//                   [UIImage imageNamed:@"micpurple"], nil];
//    return [UIImage animatedImageWithImages:self.images duration:6.0f];
//}

- (void)animateImages {
    if (![self.recordButton.imageView isAnimating]) {
        [self.recordButton.imageView startAnimating];
    }
}

- (void)stopAnimatingImages {
    if ([self.recordButton.imageView isAnimating]) {
        [self.recordButton.imageView stopAnimating];
    }
}






// camera setup
- (void)setupCamera{
    self.imagePicker = [[UIImagePickerController alloc]init];
    self.imagePicker.delegate = self;
    self.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    self.imagePicker.mediaTypes = [[NSArray alloc]initWithObjects:(NSString *)kUTTypeMovie, nil];
    self.imagePicker.videoMaximumDuration = 10.0f;
    self.imagePicker.videoQuality = UIImagePickerControllerQualityTypeMedium;
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


@end
