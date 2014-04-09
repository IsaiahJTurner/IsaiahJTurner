//
//  IJTMyWebsiteViewController.m
//  IsaiahJTurner
//
//  Created by App Requests on 4/3/14.
//  Copyright (c) 2014 Isaiah J Turner. All rights reserved.
//

#import "IJTMyWebsiteViewController.h"

@interface IJTMyWebsiteViewController ()

@end

@implementation IJTMyWebsiteViewController

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
    [self loadHomepage];
}

-(void)viewWillDisappear:(BOOL)animated {
}

- (void)loadHomepage {
    NSString *fullURL = @"http://isaiahjturner.com?ref=WWDCApp";
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [self.websiteView loadRequest:requestObj];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)viewActions:(id)sender {
    NSString *actionSheetTitle = self.websiteView.request.URL.standardizedURL.absoluteString;
    NSString *destructiveTitle = @"Homepage"; //Action Sheet Button Titles
    NSString *other1 = @"Email Link";
    NSString *other2 = @"Refresh";
    NSString *other3 = @"Previos Page";
    NSString *cancelTitle = @"Cancel";
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:actionSheetTitle
                                  delegate:self
                                  cancelButtonTitle:cancelTitle
                                  destructiveButtonTitle:destructiveTitle
                                  otherButtonTitles:other1, other2, other3, nil];
    [actionSheet showInView:self.view];
}

#pragma mark - UIWebView Delegate

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    self.navigationItem.title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
}

#pragma mark - UIActionSheet Delegate

- (void)actionSheet:(UIActionSheet *)popup clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSLog(@"%ld", (long)buttonIndex);
            switch (buttonIndex) {
                case 0:
                    [self loadHomepage];
                    break;
                case 1:
                    if([MFMailComposeViewController canSendMail]) {
                        MFMailComposeViewController *mailCont = [[MFMailComposeViewController alloc] init];
                        mailCont.mailComposeDelegate = self;
                        [mailCont setSubject:@"Check out this high school student's website!"];
                        [mailCont setBccRecipients:[NSArray arrayWithObjects: @"wwdc@isaiahjturner.com", nil]];
                        [mailCont setMessageBody:@"Isaiah Turner, a WWDC 2014 Student Scholarship Applicant, has his own website at <a href=\"http://isaiahjturner.com\">isaiahjturner.com</a>. Check it out!" isHTML:YES];
                        
                        [self presentViewController:mailCont animated:YES completion:nil];
                    }
                    break;
                case 2:
                    [self.websiteView reload];
                    break;
                case 3:
                    [self.websiteView goBack];
                    break;
                default:
                    break;
            }
}

#pragma mark - MFMailComposeViewController Delegate

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [controller dismissViewControllerAnimated:YES completion:nil];
}

@end
