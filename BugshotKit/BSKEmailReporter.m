//
//  BSKEmailReporter.m
//  BugshotKit
//
//  Created by Justin Mutter on 2014-04-30.
//  Copyright (c) 2014 Marco Arment. All rights reserved.
//

#import "BSKEmailReporter.h"

@implementation BSKEmailReporter

- (BOOL)submitReport:(BSKBugReport *)report error:(NSError **)error;
{
	if (_controller == nil) {
		NSLog(@"Email reporter requires a view controller to present the MailComposeViewController");
		return NO;
	}
	MFMailComposeViewController *mailComposeViewController = [MFMailComposeViewController canSendMail] ? [[MFMailComposeViewController alloc] init] : nil;
    if (mailComposeViewController == nil) {
        NSString *msg = [NSString stringWithFormat:@"Mail is not configured on your %@.", UIDevice.currentDevice.localizedModel];
        [[[UIAlertView alloc] initWithTitle:@"Cannot Send Mail" message:msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
        return NO;
    }
    
    [mailComposeViewController setToRecipients:_recipentEmailAddresses];
    [mailComposeViewController setSubject:report.title];
    [mailComposeViewController setMessageBody:report.description isHTML:NO];
	
	if (report.screenshot) {
		[mailComposeViewController addAttachmentData:UIImagePNGRepresentation(rotateIfNeeded(report.screenshot)) mimeType:@"image/png" fileName:@"screenshot.png"];
	}
	if (report.log) {
	    [mailComposeViewController addAttachmentData:[report.log dataUsingEncoding:NSUTF8StringEncoding] mimeType:@"text/plain" fileName:@"log.txt"];
	}
	if (report.userInfo) {
		[mailComposeViewController addAttachmentData:report.userInfo mimeType:@"application/json" fileName:@"info.json"];
	}
	
	// TODO: fix the modal presentation of the mailComposeViewController
    mailComposeViewController.mailComposeDelegate = _controller;
    [_controller presentViewController:mailComposeViewController animated:YES completion:NULL];
	
	return YES;
}


@end
