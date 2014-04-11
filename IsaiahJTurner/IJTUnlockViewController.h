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
@property (nonatomic) BOOL big;
@property (strong, nonatomic) IBOutlet UIView *buttonsView;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *buttonLabels;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *allButtons;

@end
