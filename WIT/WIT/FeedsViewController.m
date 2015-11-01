//
//  FeedsViewController.m
//  WIT
//
//  Created by Diana Elezaj on 11/1/15.
//  Copyright © 2015 Varindra Hart. All rights reserved.
//

#import "FeedsViewController.h"
#import "FeedsTableViewCell.h"
#import "FeedData.h"
#import "Post.h"
#import "FeedsHeaderView.h"
#import <MediaPlayer/MediaPlayer.h>

@interface FeedsViewController ()
<
UITableViewDataSource,
UITableViewDelegate
>
@property (nonatomic) MPMoviePlayerController *myPlayer;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) NSMutableArray <Post *> *displayingFeedData;

@end

@implementation FeedsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    
    
    
    

    //Video in Background
    NSURL *videoURL = [[NSBundle mainBundle] URLForResource:@"she++" withExtension:@"mp4"];
    self.myPlayer = [[MPMoviePlayerController alloc] initWithContentURL:videoURL];
//    self.myPlayer.controlStyle = MPMovieControlStyleNone;
    //[self.myPlayer prepareToPlay];
    [self.myPlayer.view setFrame: CGRectMake(0, 0, 500, 600)];
    [self.view addSubview:self.myPlayer.view];
    //[self.view sendSubviewToBack:self.myPlayer.view];
    
    
    self.myPlayer.view.hidden = YES;
    //Play Video    [self.myPlayer play];
    //Pause Video  [self.myPlayer pause];
    //Stop Video    [self.myPlayer stop];
    
    
    
//    self.imageIcon.frame = CGRectMake(0.0f, 0.0f, 1024.0f, 768.0f);
//    [UIView beginAnimations:@"Zoom" context:NULL];
//    [UIView setAnimationDuration:2.0];
//    
//    self.imageIcon.frame = CGRectMake(0.0f, 0.0f, 10.0f, 10.0f);
//    [UIView commitAnimations];
 
    
    
    
    
    
    
//     tell the table view to auto adjust the height of each cell
//    self.tableView.rowHeight = UITableViewAutomaticDimension;
//    self.tableView.estimatedRowHeight = 19.0;
    
    
    
    FeedData* sharedSingleton = [FeedData sharedModel];
    self.displayingFeedData = [sharedSingleton feedData];
    
    NSLog(@"displayingFeedData %@", self.displayingFeedData );
    

    
    
    
    
    
    
    // grab the nib from the main bundle
    UINib *nib = [UINib nibWithNibName:@"FeedsCell" bundle:nil];
    
    // register the nib for the cell identifer
    [self.tableView registerNib:nib forCellReuseIdentifier:@"FeedsCellIdentifier"];
    


    // grab the header nib from the main bundle
    UINib *headerNib = [UINib nibWithNibName:@"FeedsHeaderView" bundle:nil];
    
    // register the header nib for the header identifier
    [self.tableView registerNib:headerNib forHeaderFooterViewReuseIdentifier:@"FeedsHeaderViewIdentifier"];
    
    
    
    
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.myPlayer.view.hidden = NO;
       [self.myPlayer play];
    
    [self performSelector:@selector(hideAndStop) withObject:nil afterDelay:10.0];
    //Pause Video  [self.myPlayer pause];
    //Stop Video    [self.myPlayer stop];
    
}

- (void)hideAndStop {
    [self.myPlayer stop];
    self.myPlayer.view.hidden = YES;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    
    
    
    
    // dequeue the header view from the table view with InstagramHeaderIdentifier
    FeedsHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"FeedsHeaderViewIdentifier"];
    
    
    
    headerView.backgroundView = [[UIView alloc] initWithFrame:headerView.bounds];
    headerView.backgroundView.backgroundColor = [UIColor whiteColor];
    Post *postObject = self.displayingFeedData[section];
    
    headerView.usernameLabelCell.text = postObject.username;
    
         return headerView;

    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
  //  return 50.0;
//}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSLog(@" count %lu", (unsigned long)[self.displayingFeedData count] );
    return [self.displayingFeedData count] ;
}




-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    FeedsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FeedsCellIdentifier" forIndexPath:indexPath];
    
    
    Post *postObject = [self.displayingFeedData objectAtIndex:indexPath.section];
    
    
    
    
//    cell.usernameCell.text = postObject.username;
    cell.titleCell.text = postObject.title;
    cell.tagsCell.text = [NSString stringWithFormat:@"%@ ",[postObject.tags objectAtIndex:0]];
    
    //if video
    if ([postObject.mediaType isEqualToString:@"video"]) {
        NSLog(@"That's a video");
        
    cell.audioVideoThumbnail.image = postObject.videoThumbnail;
    cell.videoPlayingIcon.image = [UIImage imageNamed:@"videoIcon"];
    cell.textPostCell.hidden = YES;
        
    }
    if ([postObject.mediaType isEqualToString:@"audio"]) {
        NSLog(@"That's an audio");
        
        cell.audioVideoThumbnail.image = [UIImage imageNamed:@"blackBackground"];
        cell.videoPlayingIcon.image = [UIImage imageNamed:@"videoIcon"];
        cell.textPostCell.hidden = YES;
    }
    
    if ([postObject.mediaType isEqualToString:@"text"]) {
        NSLog(@"That's a text");
        cell.textPostCell.text = postObject.textPost;
        cell.audioVideoThumbnail.hidden = YES;
        cell.videoPlayingIcon.hidden = YES;
        
    }
    
    
    
    return cell;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGRect rect = self.tableView.tableHeaderView.frame;
    rect.origin.y = MIN(0, self.tableView.contentOffset.y);
    self.tableView.tableHeaderView.frame = rect;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
    return 350.0;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 60.0;
}





/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    if (self.myPlayer.view.hidden) {
        self.myPlayer.view.hidden = NO;
        [self.myPlayer.view removeFromSuperview];
        self.myPlayer = nil;
    }
    //[self.view sendSubviewToBack:self.myPlayer.view];
    
//    
//    self.myPlayer.view.hidden = YES;
}
@end
