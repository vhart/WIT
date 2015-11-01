//
//  AudioPostCreationViewController.m
//  WIT
//
//  Created by Eric Sze on 10/31/15.
//  Copyright © 2015 Varindra Hart. All rights reserved.
//

#import "AudioPostCreationViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "DGActivityIndicatorView/DGActivityIndicatorView.h"
#import "ShareViewController.h"

@interface AudioPostCreationViewController () <AVAudioRecorderDelegate, AVAudioPlayerDelegate>

@property (nonatomic) AVAudioPlayer *myMusic;


@property (strong, nonatomic) AVAudioRecorder *audioRecorder;
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
@property (strong, nonatomic) IBOutlet UIButton *recordButton;
@property (strong, nonatomic) IBOutlet UIButton *playButton;
@property (strong, nonatomic) IBOutlet UIButton *stopButton;
@property (weak, nonatomic) IBOutlet UIView *pauseButtonViewContainer;

@property (weak, nonatomic) NSArray *images;
@property (nonatomic) DGActivityIndicatorView *activityIndicatorView;
@property (weak, nonatomic) IBOutlet UIView *animationView;
 @end

@implementation AudioPostCreationViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.playButton.enabled = NO;
    self.stopButton.enabled = NO;
    
    self.recordButton.layer.cornerRadius = self.recordButton.frame.size.height / 2;
    self.playButton.layer.cornerRadius = self.playButton.frame.size.height / 2;
    self.pauseButtonViewContainer.layer.cornerRadius = self.pauseButtonViewContainer.frame.size.height / 2;
    
    self.recordButton.layer.borderWidth = 1;
    self.playButton.layer.borderWidth = 1;
    self.pauseButtonViewContainer.layer.borderWidth = 1;
    
    
    [self audioActions];
    // Music
    // Construct URL to sound file
    NSString *path = [NSString stringWithFormat:@"%@/women.mp4", [[NSBundle mainBundle] resourcePath]];
    NSURL *soundUrl = [NSURL fileURLWithPath:path];
    self.myMusic = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    
    
    //Play Music  [self.myMusic play];
    //Pause Music [self.myMusic pause];
    //Stop Music [self.myMusic stop];
    
    //self.activityIndicatorView = [[DGActivityIndicatorView alloc] initWithType:DGActivityIndicatorAnimationTypeBallScaleRippleMultiple tintColor:[UIColor whiteColor] size:70.0f];
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
    self.recordButton.imageView.image = [self loadingImage];
    self.recordButton.imageView.animationRepeatCount = 0;
    
    //when you want the animation to start
    [self animateImages];
    //then later at some appropriate time:
    [self stopAnimatingImages];
    
}

- (UIImage *)loadingImage {
    self.images = [NSArray arrayWithObjects:[UIImage imageNamed:@"micwhite"],
                   [UIImage imageNamed:@"micpurple"], nil];
    return [UIImage animatedImageWithImages:self.images duration:6.0f];
}

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
//- (void)setupCamera{
//    self.imagePicker = [[UIImagePickerController alloc]init];
//    self.imagePicker.delegate = self;
//    self.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
//    
//    [self presentViewController:self.imagePicker animated:YES completion:NULL];
//    
//}

- (void)setupActivityIndicator {
    self.activityIndicatorView = [[DGActivityIndicatorView alloc] initWithType:DGActivityIndicatorAnimationTypeBallScaleRippleMultiple tintColor:[UIColor whiteColor] size:60.0f];
    _activityIndicatorView.frame = CGRectMake(0.0f, 0.0f, 100.0f, 100.0f);
    _activityIndicatorView.bounds = self.animationView.bounds;
    [self.animationView addSubview:_activityIndicatorView];
    [_activityIndicatorView startAnimating];
}


- (void)playbackActivityIndicator {
    self.activityIndicatorView = [[DGActivityIndicatorView alloc] initWithType:DGActivityIndicatorAnimationTypeNineDots tintColor:[UIColor whiteColor] size:70.0f];
    _activityIndicatorView.frame = CGRectMake(0.0f, 0.0f, 100.0f, 100.0f);
    _activityIndicatorView.bounds = self.animationView.bounds;
    [self.animationView addSubview:_activityIndicatorView];
    [_activityIndicatorView startAnimating];
}



#pragma mark - IBActions

// camera setup
//- (IBAction)startRecording{
//    [self setupCamera];
//    
//    
//}

- (IBAction)recordAudio:(UIButton *)sender {
    if (!_audioRecorder.recording)
    {
        _playButton.enabled = NO;
        _stopButton.enabled = YES;
        [_audioRecorder record];
        
        [self imageSetup];
        //        self.recordButton.imageView.image = [UIImage imageNamed:@"micpurple"];
        [self setupActivityIndicator];
        
    }
}

- (IBAction)playAudio:(UIButton *)sender {
    if (!_audioRecorder.recording)
    {
        _stopButton.enabled = YES;
        _recordButton.enabled = NO;
        
        NSError *error;
        
        _audioPlayer = [[AVAudioPlayer alloc]
                        initWithContentsOfURL:_audioRecorder.url
                        error:&error];
        
        _audioPlayer.delegate = self;
        
        if (error)
            NSLog(@"Error: %@",
                  [error localizedDescription]);
        else
            [_audioPlayer play];
    }
//    [self playbackActivityIndicator];
//    [self.activityIndicatorView setHidden:YES];
}

- (IBAction)stopAudio:(UIButton *)sender {
    _stopButton.enabled = NO;
    _playButton.enabled = YES;
    _recordButton.enabled = YES;
    
    if (_audioRecorder.recording)
    {
        [_audioRecorder stop];
    } else if (_audioPlayer.playing) {
        [_audioPlayer stop];
    }
    [_activityIndicatorView stopAnimating];
    
}
   


- (IBAction)save:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}


#pragma mark - Audio Delegates

-(void)audioPlayerDidFinishPlaying:
(AVAudioPlayer *)player successfully:(BOOL)flag
{
    _recordButton.enabled = YES;
    _stopButton.enabled = NO;
}

-(void)audioPlayerDecodeErrorDidOccur:
(AVAudioPlayer *)player
                                error:(NSError *)error
{
    NSLog(@"Decode Error occurred");
}

-(void)audioRecorderDidFinishRecording:
(AVAudioRecorder *)recorder
                          successfully:(BOOL)flag
{
}

-(void)audioRecorderEncodeErrorDidOccur:
(AVAudioRecorder *)recorder
                                  error:(NSError *)error
{
    NSLog(@"Encode Error occurred");
}


@end
