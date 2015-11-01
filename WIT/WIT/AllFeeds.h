//
//  AllFeeds.h
//  WIT
//
//  Created by Diana Elezaj on 10/31/15.
//  Copyright © 2015 Varindra Hart. All rights reserved.
//

#import "PFObject.h"

@interface AllFeeds : PFObject <PFSubclassing>

@property (nonatomic) NSString *outingName;
@property (nonatomic) NSDate *createdDate;
//@property (nonatomic) NSMutableArray <Media *> *entriesArray;

+ (NSString *)parseClassName;
- (instancetype)initWithNewEntriesArray;



@end
