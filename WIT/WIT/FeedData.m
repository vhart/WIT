//
//  FeedData.m
//  WIT
//
//  Created by Varindra Hart on 11/1/15.
//  Copyright © 2015 Varindra Hart. All rights reserved.
//

#import "FeedData.h"

@implementation FeedData

+ (FeedData *)sharedModel {
    static FeedData *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
        sharedMyManager.feedData = [[NSMutableArray alloc] init];
    });
    return sharedMyManager;
}


@end
