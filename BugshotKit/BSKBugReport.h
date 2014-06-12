//
//  BSKBugReport.h
//  BugshotKit
//
//  Created by Justin Mutter on 2014-04-30.
//  Copyright (c) 2014 Marco Arment. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BSKBugReport : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *description;
@property (nonatomic) UIImage *screenshot;
@property (nonatomic, copy) NSString *log;
@property (nonatomic, copy) NSData *userInfo;

@end
