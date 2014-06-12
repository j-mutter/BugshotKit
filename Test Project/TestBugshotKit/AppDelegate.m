//
//  AppDelegate.m
//  TestBugshotKit
//
//  Created by Marco Arment on 1/20/14.
//  Copyright (c) 2014 Marco Arment. All rights reserved.
//

#import "AppDelegate.h"
#import "BugshotKit.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [BugshotKit enableWithNumberOfTouches:2 performingGestures:(BSKInvocationGestureSwipeFromRightEdge | BSKInvocationGestureSwipeUp) feedbackEmailAddress:@"test@invalid.org"];
	
	BSKEmailReporter *emailReporter = [[BSKEmailReporter alloc] init];
	emailReporter.recipentEmailAddresses = @[@"justin@shopify.com"];
	
	[[BugshotKit sharedManager] addReporter:emailReporter];
	
    return YES;
}

@end
