//
//  BSKReporter.m
//  BugshotKit
//
//  Created by Justin Mutter on 2014-04-30.
//  Copyright (c) 2014 Marco Arment. All rights reserved.
//

#import "BSKReporter.h"

@implementation BSKReporter

- (BOOL)submitReport:(BSKBugReport *)report error:(NSError **)error;
{
	// Override in subclasses
	return NO;
}

@end
