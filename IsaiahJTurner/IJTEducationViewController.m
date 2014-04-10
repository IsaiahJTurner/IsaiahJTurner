//
//  IJTEducationViewController.m
//  IsaiahJTurner
//
//  Created by App Requests on 4/9/14.
//  Copyright (c) 2014 Isaiah J Turner. All rights reserved.
//

#import "IJTEducationViewController.h"

@interface IJTEducationViewController ()

@end

@implementation IJTEducationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.logoView.frame  = CGRectMake(self.logoView.frame.origin.x, self.logoView.frame.origin.y + self.logoView.frame.size.height, self.logoView.frame.size.width, self.logoView.frame.size.height);

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewDidAppear:(BOOL)animated {
    [UIView animateWithDuration:0.4 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.logoView.frame  = CGRectMake(self.logoView.frame.origin.x, self.logoView.frame.origin.y - self.logoView.frame.size.height, self.logoView.frame.size.width, self.logoView.frame.size.height);
            
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:0.4 delay:4.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.logoView.frame = CGRectMake(self.logoView.frame.origin.x, self.logoView.frame.origin.y + self.logoView.frame.size.height, self.logoView.frame.size.width, self.logoView.frame.size.height);
        
        } completion:^(BOOL finished) {
                
                }];
        
            }];
}
@end
