//
//  FeedsViewController.m
//  WIT
//
//  Created by Diana Elezaj on 11/1/15.
//  Copyright © 2015 Varindra Hart. All rights reserved.
//

#import "FeedsViewController.h"
#import "FeedsTableViewCell.h"

@interface FeedsViewController ()
<
UITableViewDataSource,
UITableViewDelegate
>
@property (weak, nonatomic) IBOutlet UIImageView *imageIcon;
@property (weak, nonatomic) IBOutlet UIImageView *textIcon;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation FeedsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    self.imageIcon.frame = CGRectMake(0.0f, 0.0f, 1024.0f, 768.0f);
    [UIView beginAnimations:@"Zoom" context:NULL];
    [UIView setAnimationDuration:2.0];
    
    self.imageIcon.frame = CGRectMake(0.0f, 0.0f, 10.0f, 10.0f);
    [UIView commitAnimations];
    
    
    
    // tell the table view to auto adjust the height of each cell
//    self.tableView.rowHeight = UITableViewAutomaticDimension;
//    self.tableView.estimatedRowHeight = 12.0;
    
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
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    FeedsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FeedsCellIdentifier" forIndexPath:indexPath];
    
    
    cell.titleCell.text = @"title";
    NSLog(@"cell.titleCell.text %@",cell.titleCell.text);
    
    cell.usernameCell.text = @"name";
    cell.tagsCell.text = @"tags";
    
    
//    @property (weak, nonatomic) IBOutlet UILabel *usernameCell;
//    @property (weak, nonatomic) IBOutlet UILabel *titleCell;
//    @property (weak, nonatomic) IBOutlet UILabel *tagsCell;
//    @property (weak, nonatomic) IBOutlet UIButton *hi5Button;
//    @property (weak, nonatomic) IBOutlet UIImageView *audioVideoThumbnail;
//    @property (weak, nonatomic) IBOutlet UITextView *textPostCell;
//    @property (weak, nonatomic) IBOutlet UIImageView *videoPlayingIcon;
//    cell.detailTextLabel.text = currentResult.title;
    
    return cell;
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
