//
//  IJTInterestsViewController.h
//  IsaiahJTurner
//
//  Created by App Requests on 4/8/14.
//  Copyright (c) 2014 Isaiah J Turner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TWRProgressView.h"

@interface IJTInterestsViewController : UIViewController
@property (weak, nonatomic) IBOutlet TWRProgressView *meView;
@property (strong, nonatomic) IBOutlet UITextView *currentText;
@property (nonatomic) float currentValue;
@property (strong, nonatomic) IBOutlet UILabel *instructionsLabel;

@end
