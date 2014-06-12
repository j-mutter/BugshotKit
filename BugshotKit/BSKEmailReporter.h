//
//  BSKEmailReporter.h
//  BugshotKit
//
//  Created by Justin Mutter on 2014-04-30.
//  Copyright (c) 2014 Marco Arment. All rights reserved.
//

#import "BSKReporter.h"
#import "BSKMainViewController.h"
@import MessageUI;

@interface BSKEmailReporter : BSKReporter

@property (nonatomic, copy) NSArray *recipentEmailAddresses;
@property (nonatomic) BSKMainViewController *controller;

@end
