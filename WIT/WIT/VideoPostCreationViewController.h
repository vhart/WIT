//
//  VideoPostCreationViewController.h
//  WIT
//
//  Created by Varindra Hart on 10/31/15.
//  Copyright © 2015 Varindra Hart. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Media.h"
#import "Post.h"

@interface VideoPostCreationViewController : UIViewController

@property (nonatomic) Media *videoEntry;
@property (nonatomic) NSMutableArray <Post *> *entries;

@end
