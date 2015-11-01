//
//  FeedData.h
//  WIT
//
//  Created by Varindra Hart on 11/1/15.
//  Copyright © 2015 Varindra Hart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Post.h"

@interface FeedData : NSObject

+(instancetype)sharedModel;

@property (nonatomic) NSMutableArray <Post *> *feedData;

@end
