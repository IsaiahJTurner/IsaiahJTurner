//
//  IJTAppDelegate.h
//  IsaiahJTurner
//
//  Created by Isaiah Turner on 3/4/14.
//  Copyright (c) 2014 Isaiah Turner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IJTBottomView.h"

@interface IJTViewController : UIViewController <UICollisionBehaviorDelegate, PullableViewDelegate>
@property (strong, nonatomic) IBOutlet UIView *block;
@property (strong, nonatomic) IBOutlet UIView *ground;
@property (strong, nonatomic) IBOutlet UIView *sky;
@property (strong, nonatomic) IBOutlet UIView *outerSpace;
@property (nonatomic) int score;
@property (strong, nonatomic) IBOutlet UITextView *instructionsLabel;

@end
