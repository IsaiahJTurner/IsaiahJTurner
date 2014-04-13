//
//  IJTInterestsViewController.m
//  IsaiahJTurner
//
//  Created by App Requests on 4/8/14.
//  Copyright (c) 2014 Isaiah J Turner. All rights reserved.
//

#import "IJTInterestsViewController.h"

@interface IJTInterestsViewController ()

@end

@implementation IJTInterestsViewController

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
    UIImage *socialImage = [UIImage imageNamed:@"me_icon"];
    [self.meView setMaskingImage:socialImage];
    [self.meView setFrontColor:[UIColor greenColor]];
    self.currentValue = 0.0f;
    self.navigationController.navigationBar.hidden = NO;
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(updateProgress)];
    [self.view addGestureRecognizer:gestureRecognizer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateProgress {
    NSLog(@"%f",self.currentValue);
    [self.currentText setSelectable:YES];
    self.currentValue = self.currentValue + 0.1f;
    int curVal = (int)(self.currentValue * 10);
    if (curVal == 0) {
        self.currentText.text = @"So... what makes me, me?";
    } else if (curVal == 1) {
        self.instructionsLabel.hidden = YES;
        self.currentText.text = @"My absoulute favorite thing to do, outside of programming, is sailing!";
    } else if (curVal == 2) {
        self.currentText.text = @"I also love helping people and am CPR ceritified.";
    } else if (curVal == 3) {
        self.currentText.text = @"Hackathons? Love them! It's so fun to meet new people.";
    } else if (curVal == 4) {
        self.currentText.text = @"Writing code... well duh. But I specifically love to come up with the great ideas behind the code!";
    } else if (curVal == 5) {
        self.currentText.text = @"Eating... mmmm food. <3";
    } else if (curVal == 6) {
        self.currentText.text = @"Travelling! I hope to someday live in California and my dream job is the iOS development team at Apple!";
    } else if (curVal == 7) {
        self.currentText.text = @"Some people even call me the perfect combination because I love developing, marketing, designing, and have great social skills.";
    } else if (curVal == 8) {
        self.currentText.text = @"Videography is also a passion of mine. I love using Motion to make animated promototional videos for my projects.";
    } else if (curVal == 9) {
        self.currentText.text = @"I bet you a dollar that the winning apps have blur, skeuomorphism, and parallax. :p I love to create beautiful designs!";
    } else {
        self.currentText.text = @"That's me!";
    }
    [self.meView setProgress:self.currentValue animated:YES];
    [self.currentText setSelectable:NO];
}

@end
