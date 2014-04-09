//
//  IJTSkillsViewController.m
//  IsaiahJTurner
//
//  Created by App Requests on 4/8/14.
//  Copyright (c) 2014 Isaiah J Turner. All rights reserved.
//

#import "IJTSkillsViewController.h"

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
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Secutity Enthusiast" message:@"I love voiding the hell out of my Apple Care Plus warenty and love to jailbreak my device! But I don't want to be a jailbreak n00b that pirates things. I hate pirates! Instead, I focus on encryption as well as security research and implementation in iOS." delegate:self cancelButtonTitle:@"goto fail;" otherButtonTitles:nil];
    // optional - add more buttons:
    [alert addButtonWithTitle:@"View Research"];

    [alert show];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
#warning WARNING WARNING - This code may make you laugh. Spongbob would like to inform you to protect your laugh box.
    BOOL appleMadeAnOopsie = true;
        if (buttonIndex == 1) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://isaiahjturner.com/category/security-research/"]];
        } else {
            fail:
                if (!appleMadeAnOopsie) goto fail;
            }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
