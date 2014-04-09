//
//  IJTBottom.h
//  IsaiahJTurner
//
//  Created by App Requests on 4/3/14.
//  Copyright (c) 2014 Isaiah J Turner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PullableView.h"

@interface IJTBottomView : PullableView
@property (nonatomic, strong) UIView *contentView;
- (void)enableGestures;
- (void)disableGestures;
@end
