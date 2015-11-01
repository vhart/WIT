//
//  FeedTableViewController.m
//  WIT
//
//  Created by Diana Elezaj on 10/31/15.
//  Copyright © 2015 Varindra Hart. All rights reserved.
//

#import "FeedTableViewController.h"
#import <Parse/PFQuery.h>
#import <Parse/Parse.h>
#import "Media.h"


@interface FeedTableViewController ()

@end

@implementation FeedTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"yooooo");
    
//    Media *media = [[Media alloc] init];
//    
//    
////    [media saveInBackground];
    
    
    PFQuery *query = [PFQuery queryWithClassName:@"Media"];
    
    //excetute the query
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        NSLog(@"objects %@", objects);
        NSLog(@"shhh %@", [[objects objectAtIndex:0] objectForKey:@"dateCreated"]);
        
//        if (objects.count!=0) {
//        NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:@"dateCreated" ascending:NO];
//        [objects sortedArrayUsingDescriptors:@[descriptor]];
//        
////        self.outings = [NSMutableArray arrayWithArray:objects];
////        NSLog(@"self.outings: %@", self.outings);
//        
//        [self.tableView reloadData];
//        
//        }
        
    }];
}

//- (void)fetchOutings {
//    PFQuery *query = [PFQuery queryWithClassName:@"GJOutings"];
//    [query includeKey:@"entriesArray"];
//    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
//        if (objects.count!=0) {
//
//            NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:@"createdDate" ascending:NO];
//            [objects sortedArrayUsingDescriptors:@[descriptor]];
//
//            self.outings = [NSMutableArray arrayWithArray:objects];
//            NSLog(@"self.outings: %@", self.outings);
//
//            [self.tableView reloadData];
//        }
//    }];
//}












- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
