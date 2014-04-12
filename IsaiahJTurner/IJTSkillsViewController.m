//
//  IJTSkillsViewController.m
//  IsaiahJTurner
//
//  Created by App Requests on 4/8/14.
//  Copyright (c) 2014 Isaiah J Turner. All rights reserved.
//

#import "IJTSkillsViewController.h"
#import "PXAlertView.h"
#import "PXAlertView+Customization.h"

@interface IJTSkillsViewController ()

@end

@implementation IJTSkillsViewController

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
}

-(void)viewWillAppear:(BOOL)animated {
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resourc
}
- (IBAction)securityResearch:(id)sender {
    
    PXAlertView *alert = [PXAlertView showAlertWithTitle:@"Security Enthusiest"
                                                 message:@"I love voiding the hell out of my Apple Care Plus warranty and love to jailbreak my device! But I don't want to be a jailbreak n00b that pirates things. I hate pirates! Instead, I focus on encryption as well as security research and implementation in iOS."
                                             cancelTitle:@"goto fail;"
                                              otherTitle:@"View Research"
                                              completion:^(BOOL cancelled, NSInteger buttonIndex) {
                                                  fail:
                                                  if (cancelled) {
                                                        #warning WARNING WARNING - This code may make you laugh. Spongbob would like to inform you to protect your laugh box.
                                                      BOOL appleMadeAnOopsie = true;
                                                      if (!appleMadeAnOopsie)
                                                          goto fail;
                                                  } else {
                                                      [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://isaiahjturner.com/category/security-research/"]];
                                                  }
                                              }];
    [alert setCancelButtonBackgroundColor:[UIColor blackColor]];
    [alert setOtherButtonBackgroundColor:[UIColor colorWithRed:104.0/255.0 green:204.0/255.0 blue:92.0/255.0 alpha:1]];
}

@end
