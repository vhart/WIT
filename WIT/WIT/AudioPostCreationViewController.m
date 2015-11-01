//
//  AudioPostCreationViewController.m
//  WIT
//
//  Created by Eric Sze on 10/31/15.
//  Copyright © 2015 Varindra Hart. All rights reserved.
//

#import "AudioPostCreationViewController.h"

@interface AudioPostCreationViewController () <AVAudioRecorderDelegate, AVAudioPlayerDelegate>

@property (strong, nonatomic) AVAudioRecorder *audioRecorder;
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
@property (strong, nonatomic) IBOutlet UIButton *recordButton;
@property (strong, nonatomic) IBOutlet UIButton *playButton;
@property (strong, nonatomic) IBOutlet UIButton *stopButton;

@end

@implementation AudioPostCreationViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.playButton.enabled = NO;
    self.stopButton.enabled = NO;
    
    [self audioActions];
    
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
- (void)setupCamera{
    self.imagePicker = [[UIImagePickerController alloc]init];
    self.imagePicker.delegate = self;
    self.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:self.imagePicker animated:YES completion:NULL];
    
}

#pragma mark - IBActions

// camera setup
- (IBAction)startRecording{
    [self setupCamera];
    
    
}







- (IBAction)recordAudio:(UIButton *)sender {
    if (!_audioRecorder.recording)
    {
        _playButton.enabled = NO;
        _stopButton.enabled = YES;
        [_audioRecorder record];
        
        [self imageSetup];
        //        self.recordButton.imageView.image = [UIImage imageNamed:@"micpurple"];
        
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
