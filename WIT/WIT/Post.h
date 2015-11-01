//
//  Post.h
//  WIT
//
//  Created by Varindra Hart on 10/31/15.
//  Copyright © 2015 Varindra Hart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Post : NSObject

@property (nonatomic) NSString *mediaType;
@property (nonatomic) NSURL *videoURL;
@property (nonatomic) UIImage *videoThumbnail;
@property (nonatomic) NSURL *audioURL;
@property (nonatomic) NSString *textPost;
@property (nonatomic) NSString *title;
@property (nonatomic) NSMutableArray *tags;
@property (nonatomic) NSString *username;


@end
