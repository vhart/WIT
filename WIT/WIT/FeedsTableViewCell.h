//
//  FeedsTableViewCell.h
//  WIT
//
//  Created by Diana Elezaj on 11/1/15.
//  Copyright © 2015 Varindra Hart. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeedsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *usernameCell;
@property (weak, nonatomic) IBOutlet UILabel *titleCell;
@property (weak, nonatomic) IBOutlet UILabel *tagsCell;
@property (weak, nonatomic) IBOutlet UIButton *hi5Button;
@property (weak, nonatomic) IBOutlet UIImageView *audioVideoThumbnail;
@property (weak, nonatomic) IBOutlet UITextView *textPostCell;
@property (weak, nonatomic) IBOutlet UIImageView *videoPlayingIcon;




@end




@property (nonatomic) NSString *mediaType;
@property (nonatomic) NSURL *videoURL;
@property (nonatomic) UIImage *videoThumbnail;
@property (nonatomic) NSURL *audioURL;
@property (nonatomic) NSString *textPost;
@property (nonatomic) NSString *title;
@property (nonatomic) NSMutableArray *tags;
@property (nonatomic) NSString *username;