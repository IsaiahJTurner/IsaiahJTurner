//
//  IJTBottom.m
//  IsaiahJTurner
//
//  Created by App Requests on 4/3/14.
//  Copyright (c) 2014 Isaiah J Turner. All rights reserved.
//

#import "IJTBottomView.h"

@implementation IJTBottomView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *vc = [mainStoryboard instantiateViewControllerWithIdentifier:@"infoView"];
        self.contentView = vc.view;
        [self addSubview:self.contentView];
        [self bringSubviewToFront:handleView];

    }
    return self;
}

- (void)enableGestures {
    [self bringSubviewToFront:handleView];
}

- (void)disableGestures {
    [self bringSubviewToFront:self.contentView];
}

@end
