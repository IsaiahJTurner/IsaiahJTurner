//
//  IJTMyWebsiteViewController.h
//  IsaiahJTurner
//
//  Created by App Requests on 4/3/14.
//  Copyright (c) 2014 Isaiah J Turner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIKit/UIActionSheet.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface IJTMyWebsiteViewController : UIViewController <UIWebViewDelegate, UIActionSheetDelegate, MFMailComposeViewControllerDelegate>
@property (strong, nonatomic) IBOutlet UIWebView *websiteView;
@property (strong, nonatomic)  NSString *fullURL;

@end
