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
    


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    FeedsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FeedsIdentifier" forIndexPath:indexPath];
    
    
    cell.textLabel.text = @"bla bla";
    
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
