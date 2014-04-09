//
//  IJTAboutMeViewController.m
//  IsaiahJTurner
//
//  Created by App Requests on 4/7/14.
//  Copyright (c) 2014 Isaiah J Turner. All rights reserved.
//

#import "IJTAboutMeViewController.h"
#import "IJTMyWebsiteViewController.h"

@interface IJTAboutMeViewController ()

@end

@implementation IJTAboutMeViewController

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
    self.navigationController.navigationBar.hidden = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)volunteerAction:(id)sender {
    [self presentURL:@"http://sailingcenterchesapeake.org/"];
}
- (IBAction)sailAction:(id)sender {
    [self presentURL:@"http://www.smrhs.org/page.cfm?p=4354"];
}
- (IBAction)olympicAction:(id)sender {
    [self presentURL:@"http://www.specialolympics.org/sailing.aspx"];
}

- (void)presentURL:(NSString *)url {
    IJTMyWebsiteViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"websiteVC"];
    vc.fullURL = url;
    [self.navigationController pushViewController:vc animated:YES];
}
@end
