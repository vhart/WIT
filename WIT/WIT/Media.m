//
//  Media.m
//  WIT
//
//  Created by Varindra Hart on 10/31/15.
//  Copyright © 2015 Varindra Hart. All rights reserved.
//

#import "Media.h"

@implementation Media

@dynamic username;
@dynamic textPost;
@dynamic fileType;
@dynamic fileExtension;
@dynamic title;
@dynamic dateCreated;
@dynamic upVotes;
@dynamic upVoted;
@dynamic mediaFile;
@dynamic mediaReplies;

+(NSString *)parseClassName{
    
    return @"Media";
}





@end
