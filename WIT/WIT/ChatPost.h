//
//  ChatPost.h
//  WIT
//
//  Created by Varindra Hart on 10/31/15.
//  Copyright © 2015 Varindra Hart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ChatResponse.h"
#import <UIKit/UIKit.h>

@interface ChatPost : NSObject

@property (nonatomic) NSString *username;
@property (nonatomic) NSString *title;
@property (nonatomic) NSString *story;
@property (nonatomic) NSDate *datePosted;
@property (nonatomic) NSInteger *votes;
@property (nonatomic) NSMutableArray <ChatResponse *> *chatResponseArray;

@end
