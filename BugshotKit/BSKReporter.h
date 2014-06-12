//
//  BSKReporter.h
//  BugshotKit
//
//  Created by Justin Mutter on 2014-04-30.
//  Copyright (c) 2014 Marco Arment. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BSKBugReport.h"

// By Matteo Gavagnin on 21/01/14.
static UIImage *rotateIfNeeded(UIImage *src)
{
    if (src.imageOrientation == UIImageOrientationDown && src.size.width < src.size.height) {
        UIGraphicsBeginImageContext(src.size);
        [src drawAtPoint:CGPointMake(0, 0)];
        return UIGraphicsGetImageFromCurrentImageContext();
    } else if ((src.imageOrientation == UIImageOrientationLeft || src.imageOrientation == UIImageOrientationRight) && src.size.width > src.size.height) {
        UIGraphicsBeginImageContext(src.size);
        [src drawAtPoint:CGPointMake(0, 0)];
        return UIGraphicsGetImageFromCurrentImageContext();
    } else {
        return src;
    }
}

@interface BSKReporter : NSObject

- (BOOL)submitReport:(BSKBugReport *)report error:(NSError **)error;

@end
