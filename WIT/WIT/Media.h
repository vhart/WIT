//
//  Media.h
//  WIT
//
//  Created by Varindra Hart on 10/31/15.
//  Copyright © 2015 Varindra Hart. All rights reserved.
//

#import "PFObject.h"
#import <Parse/Parse.h>

@interface Media : PFObject <PFSubclassing>

@property (nonatomic) NSString *username;
@property (nonatomic) NSString *textPost;
@property (nonatomic) NSString *fileType;
@property (nonatomic) NSString *fileExtension;
@property (nonatomic) NSString *title;
@property (nonatomic) NSDate *dateCreated;
@property (nonatomic) NSInteger upVotes;
@property (nonatomic) BOOL      upVoted;
@property (nonatomic) PFFile *mediaFile;
@property (nonatomic) NSMutableArray <Media*> *mediaReplies;

+(NSString *)parseClassName;

@end
