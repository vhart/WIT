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

@interface FeedsViewController ()
<
UITableViewDataSource,
UITableViewDelegate
> 
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) NSMutableArray <Post *> *displayingFeedData;

@end

@implementation FeedsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    
    
    
    
    
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
    


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


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
    
    
    
    
    cell.usernameCell.text = postObject.username;
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



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
    return 350.0;
}


//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//    return 50.0;
//}





/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
