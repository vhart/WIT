//
//  ChatResponse.h
//  WIT
//
//  Created by Varindra Hart on 10/31/15.
//  Copyright © 2015 Varindra Hart. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChatResponse : NSObject

@property (nonatomic) NSString *response;
@property (nonatomic) NSInteger rating;
@property (nonatomic) NSString *username;
@property (nonatomic) NSDate *dateCreated;


@end
