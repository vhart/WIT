//
//  VideoDetailViewController.h
//  WIT
//
//  Created by Varindra Hart on 10/31/15.
//  Copyright © 2015 Varindra Hart. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"

@interface VideoDetailViewController : UIViewController

@property (nonatomic) Post *post;
@property (nonatomic) NSMutableArray <Post *> *entries;
@end
