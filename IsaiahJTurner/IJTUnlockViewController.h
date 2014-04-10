//
//  IJTUnlockViewController.h
//  IsaiahJTurner
//
//  Created by App Requests on 4/4/14.
//  Copyright (c) 2014 Isaiah J Turner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FXBlurView.h"
#import "ScaleBounceController.h"
#import "PXAlertView.h"
#import "PXAlertView+Customization.h"

@interface IJTUnlockViewController : UIViewController <UIGestureRecognizerDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (nonatomic, weak) IBOutlet FXBlurView *blurView;
@property (strong, nonatomic) IBOutlet UIImageView *myFace;
@property (strong, nonatomic) IBOutlet UIButton *aboutButton;
@property (strong, nonatomic) IBOutlet UIButton *awardsButton;
@property (strong, nonatomic) IBOutlet UIButton *timelineButton;
@property (strong, nonatomic) IBOutlet UIButton *educationButton;
@property (strong, nonatomic) IBOutlet UIButton *interestsButton;
@property (strong, nonatomic) IBOutlet UIButton *skillsButton;
@property (strong, nonatomic) NSArray *allButtons;
@property (nonatomic) BOOL big;
@property (strong, nonatomic) IBOutlet UIView *buttonsView;

@end
