//
//  VideoDetailViewController.m
//  WIT
//
//  Created by Varindra Hart on 10/31/15.
//  Copyright © 2015 Varindra Hart. All rights reserved.
//

#import "VideoDetailViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
@interface VideoDetailViewController ()


@property (nonatomic) MPMoviePlayerController *myPlayer;
@property (nonatomic,weak) UIView *videoView;
@property (nonatomic) AVPlayer *avPlayer;
@property (nonatomic) UILabel *titleLabel;
@property (nonatomic, weak) UIButton *playOrPause;
@property (nonatomic) BOOL isPlaying;
@property (nonatomic) UILabel *tagLabel;

@end

@implementation VideoDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleLabel.text = self.post.title;
    self.tagLabel.text = (NSString*)self.post.tags.firstObject;
    self.avPlayer = [AVPlayer playerWithURL:self.post.videoURL];
    
    AVPlayerLayer *layer = [AVPlayerLayer playerLayerWithPlayer:self.avPlayer];
    self.avPlayer.actionAtItemEnd = AVPlayerActionAtItemEndNone;
    layer.frame = self.videoView.bounds;
    [self.videoView.layer addSublayer: layer];
    
    [self.avPlayer play];
    self.isPlaying = YES;
    // Do any additional setup after loading the view.
    
    //Video in Background
    NSURL *videoURL = [[NSBundle mainBundle] URLForResource:@"she++" withExtension:@"mp4"];
    self.myPlayer = [[MPMoviePlayerController alloc] initWithContentURL:videoURL];
    self.myPlayer.controlStyle = MPMovieControlStyleNone;
    //[self.myPlayer prepareToPlay];
    [self.myPlayer.view setFrame: CGRectMake(0, -500, 2000, 1600)];
    [self.view addSubview:self.myPlayer.view];
    [self.view sendSubviewToBack:self.myPlayer.view];
    
    //Play Video    [self.myPlayer play];
    //Pause Video  [self.myPlayer pause];
    //Stop Video    [self.myPlayer stop];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)playButtonTapped:(id)sender{
    
    if (self.isPlaying) {
        self.isPlaying = NO;
        [self.avPlayer pause];
    }
    else{
        self.isPlaying = YES;
        [self.avPlayer play];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
