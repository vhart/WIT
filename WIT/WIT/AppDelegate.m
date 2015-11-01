//
//  AppDelegate.m
//  WIT
//
//  Created by Varindra Hart on 10/31/15.
//  Copyright © 2015 Varindra Hart. All rights reserved.
//

#import "AppDelegate.h"
#import "Media.h"
#import <Parse/Parse.h>
#import "YALTabBarItem.h"
#import "YALFoldingTabBarController.h"
#import "YALAnimatingTabBarConstants.h"
#import "Post.h"
#import "FeedData.h"



@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [Parse setApplicationId:@"yJyQMarbdeE9NXa5bMQ69yjJdA4UsEZzhuGux2n2" clientKey:@"h3sfHEMcx5bwF2ddsnt64d0NS03URQRhhpLviA8E"];
    
    
    [Media registerSubclass];
    //[self setupYALTabBarController];
    
    Post *post9 = [Post new];
    post9.mediaType = @"text";
    post9.title = @"Control the media. Use the media. Inspire";
    post9.textPost = @"The media has a role to play – how many techy girls do we see on children's TV and in papers and magazines? Girls who aren't already in the industry or don't know anyone in the industry have nothing to look to, or to aspire to.";
    post9.username = @"Anne-Marie Imafidon heads up the Stemettes project";
    post9.tags = [[NSMutableArray alloc]initWithObjects:@"#media #inspire", nil];
    /*
     ericysze [3:41 AM]
     Anne-Marie Imafidon heads up the Stemettes project: "The media has a role to play – how many techy girls do we see on children's TV and in papers and magazines? Girls who aren't already in the industry or don't know anyone in the industry have nothing to look to, or to aspire to."
     */
    
    Post *post1 = [Post new];
    post1.mediaType = @"text";
    post1.title = @"You have to be tough for the uphill battle";
    post1.textPost = @"Do the brave thing, do the thing that scares you a little, and amazing things happen. Play it safe or start from fear, things just end up average or worse. Now, I try to be brave as often as I can. It doesn’t always happen, old habits die hard, but when it does it’s wonderful.";
    post1.username = @"Joanna Bloor, VP of Sales at Pandora";
    post1.tags = [[NSMutableArray alloc]initWithObjects:@"#fearNot", nil];
    
    /*
     You have to be tough for the uphill battle.
     “Do the brave thing, do the thing that scares you a little, and amazing things happen. Play it safe or start from fear, things just end up average or worse. Now, I try to be brave as often as I can. It doesn’t always happen, old habits die hard, but when it does it’s wonderful.”
     
      — Joanna Bloor, VP of Sales at Pandora
     */
    Post *post2 = [Post new];
    post2.mediaType = @"text";
    post2.title = @"Our 'Places'";
    post2.textPost = @"I was told I’d never make it to VP rank because I was too outspoken. Maybe so, but I think men will always find an excuse for keeping women in their ‘place.’ So, let’s make that place the executive suite and start more of our own companies.";
    post2.username = @"Jean Bartik (Deceased), Programmer, ENIAC";
    post2.tags = [[NSMutableArray alloc]initWithObjects:@"#aimHigh #WiT", nil];
    /*
     “I was told I’d never make it to VP rank because I was too outspoken. Maybe so, but I think men will always find an excuse for keeping women in their ‘place.’ So, let’s make that place the executive suite and start more of our own companies.”
     
     — Jean Bartik (Deceased), Programmer, ENIAC
     
     “By learning to create technology, girls learn to speak up.”
     
      — Regina Agyare, Founder, Soronko Solutions
     */
    Post *post3 = [Post new];
    post3.mediaType = @"text";
    post3.title = @"Innovations of tomorrow";
    post3.textPost = @"There are many incredible women in tech building the products of tomorrow. Whether it’s Mary Lou Jepsen, who’s working to make phones, laptops and computers self-powered (no more charging!), Corinna ‘Elektra’ Aichele, who’s bringing WiFi to any location, Monica Lam, who leads the MobiSocial group at Stanford and is ‘[creating] a social internet, where users can share anything … while owning their data’ or Ruchi Sanghvi, who’s behind the algorithm that powers our Facebook newsfeeds, the innovations women have made in tech will only be outpaced by the innovations they have yet to make.";
    post3.username = @"Mic Branded Content Team";
    post3.tags = [[NSMutableArray alloc]initWithObjects:@"#innovate #inspire", nil];
    /*
     ericysze [3:32 AM]
     “There are many incredible women in tech building the products of tomorrow. Whether it’s Mary Lou Jepsen, who’s working to make phones, laptops and computers self-powered (no more charging!), Corinna ‘Elektra’ Aichele, who’s bringing WiFi to any location, Monica Lam, who leads the MobiSocial group at Stanford and is ‘[creating] a social internet, where users can share anything … while owning their data’ or Ruchi Sanghvi, who’s behind the algorithm that powers our Facebook newsfeeds, the innovations women have made in tech will only be outpaced by the innovations they have yet to make.”
     
     —  Mic Branded Content Team
     */
    Post *post4 = [Post new];
    post4.mediaType = @"text";
    post4.title = @"I deserve to be treated EQUALLY";
    post4.textPost = @"Being a female during this tech era is an incredible experience. It’s what all women have been waiting for because it has given us a chance to finally say ‘I deserve to be treated equally’ and actually be heard by people around the world. Tech and sales are no longer just a man’s sport, and it’s not just men who have kept us away from entering the arena. It has been us telling ourselves that we are not equal and that we are not meant to be aggressive; we are to act ‘lady like.’ Well it’s time for the ladies to step in and show the tech industry that we are women, and we can sell! The time to discuss is gone and the time to take action has come! It’s as SIMPLE as that.";
    post4.username = @"Masch-al Malek, Sales Development Representative, Kissmetrics";
    post4.tags = [[NSMutableArray alloc]initWithObjects:@"#equals #breakTheMold", nil];
    /*
     ericysze [3:32 AM]
     “Being a female during this tech era is an incredible experience. It’s what all women have been waiting for because it has given us a chance to finally say ‘I deserve to be treated equally’ and actually be heard by people around the world. Tech and sales are no longer just a man’s sport, and it’s not just men who have kept us away from entering the arena. It has been us telling ourselves that we are not equal and that we are not meant to be aggressive; we are to act ‘lady like.’ Well it’s time for the ladies to step in and show the tech industry that we are women, and we can sell! The time to discuss is gone and the time to take action has come! It’s as SIMPLE as that.”
     
     — Masch-al Malek, Sales Development Representative, Kissmetrics
     */
    Post *post5 = [Post new];
    post5.mediaType = @"text";
    post5.title = @"Fear";
    post5.textPost = @"Women shouldn’t be afraid to put themselves forward.";
    post5.username = @"Sarah Wood, Co-founder and COO, Unruly Media";
    post5.tags = [[NSMutableArray alloc]initWithObjects:@"#fearNot", nil];
    /*
     ericysze [3:36 AM]
     “Women shouldn’t be afraid to put themselves forward.” Sarah Wood, Co-founder and COO, Unruly Media
     */
    Post *post6 = [Post new];
    post6.mediaType = @"text";
    post6.title = @"Speak Up";
    post6.textPost = @"Women who are already in tech need to be vocally supportive of other women, and senior women need to help junior women learn to negotiate the network. And we need to encourage others to take that leap and get involved in an industry that's incredibly energetic, exciting and satisfying.";
    post6.username = @"Suw Charman-Anderson";
    post6.tags = [[NSMutableArray alloc]initWithObjects:@"#speak #takeTheLeap", nil];
    
    /*
     ericysze [3:39 AM]
     Speak up
     Suw Charman-Anderson: "Women who are already in tech need to be vocally supportive of other women, and senior women need to help junior women learn to negotiate the network. And we need to encourage others to take that leap and get involved in an industry that's incredibly energetic, exciting and satisfying."
     */
    
    Post *post7 = [Post new];
    post7.mediaType = @"text";
    post7.title = @"Research companies when you apply for jobs";
    post7.textPost = @"When you interview for a job, you're interviewing them as much as they are interviewing you. There are plenty of tech companies with supportive, healthy cultures, so and it's a matter of avoiding companies which are less welcoming to women. That may lengthen the job search a little, but it'll be worth it in the long run.";
    post7.username = @"Suw Charman-Anderson";
    post7.tags = [[NSMutableArray alloc]initWithObjects:@"#techCulture #landingTheJob", nil];
    
    /*
     ericysze [3:40 AM]
     Research companies when you apply for jobs
     Suw Charman-Anderson: "When you interview for a job, you're interviewing them as much as they are interviewing you. There are plenty of tech companies with supportive, healthy cultures, so and it's a matter of avoiding companies which are less welcoming to women. That may lengthen the job search a little, but it'll be worth it in the long run."
     */
    
    Post *post8 = [Post new];
    post8.mediaType = @"text";
    post8.title = @"Let's hear your voice";
    post8.textPost = @"It's a male-dominated environment, but it's not that scary and you can help to change it. If you perform your best then you'll excel whether you're female or not. There are women out there being highly successful and loving their tech careers. We need to hear from women at all points in their career and show that it's a great path to chose.";
    post8.username = @"Jenny Griffiths";
    post8.tags = [[NSMutableArray alloc]initWithObjects:@"#voiceYourself", nil];
    
    /*
     ericysze [3:40 AM]
     Jenny Griffiths: "It's a male-dominated environment, but it's not that scary and you can help to change it. If you perform your best then you'll excel whether you're female or not. There are women out there being highly successful and loving their tech careers. We need to hear from women at all points in their career and show that it's a great path to chose."
     */
    
    [[FeedData sharedModel].feedData addObjectsFromArray:@[post1, post2, post3, post4, post5, post6, post7, post8, post9]];
    
    
    return YES;
}





- (void)setupYALTabBarController {
    
    
    
    YALFoldingTabBarController *tabBarController = (YALFoldingTabBarController *) self.window.rootViewController;
    
    
    
    //prepare leftBarItems
    
    
    YALTabBarItem *item1 = [[YALTabBarItem alloc] initWithItemImage:[UIImage imageNamed:@"newsFeed"]
                                                      leftItemImage:[UIImage imageNamed:@"newsFeed"]
                                                     rightItemImage:nil];
    
    
    
    YALTabBarItem *item2 = [[YALTabBarItem alloc] initWithItemImage:[UIImage imageNamed:@"penIcon"]
                                                      leftItemImage:[UIImage imageNamed:@"penIcon"]
                                                     rightItemImage:nil];
    
    tabBarController.leftBarItems = @[item1, item2];
    
    //prepare rightBarItems
    YALTabBarItem *item3 = [[YALTabBarItem alloc] initWithItemImage:[UIImage imageNamed:@"audioIcon"]
                                                      leftItemImage:nil
                                                     rightItemImage:[UIImage imageNamed:@"audioIcon"]];
    YALTabBarItem *item4 = [[YALTabBarItem alloc] initWithItemImage:[UIImage imageNamed:@"videoIcon"]
                                                      leftItemImage:nil
                                                     rightItemImage:[UIImage imageNamed:@"videoIcon"]];
    
    
    
    tabBarController.rightBarItems = @[item3, item4];
    
    tabBarController.centerButtonImage = [UIImage imageNamed:@"plus_icon"];
    
    tabBarController.selectedIndex = 0;
    
    //customize tabBarView
    //#fd6080
    tabBarController.tabBarView.extraTabBarItemHeight = YALExtraTabBarItemsDefaultHeight;
    tabBarController.tabBarView.offsetForExtraTabBarItems = YALForExtraTabBarItemsDefaultOffset;
    tabBarController.tabBarView.backgroundColor = [UIColor clearColor];
    tabBarController.tabBarView.tabBarColor = [UIColor colorWithRed:0.714 green:0 blue:0.714 alpha:1];
    
    tabBarController.tabBarViewHeight = 55;
    
    tabBarController.tabBarView.tabBarViewEdgeInsets = YALTabBarViewHDefaultEdgeInsets;
    tabBarController.tabBarView.tabBarItemsEdgeInsets = YALTabBarViewItemsDefaultEdgeInsets;
    
}








- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;









- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "nyc.c4q.vhart.WIT" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}


- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"WIT" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"WIT.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
