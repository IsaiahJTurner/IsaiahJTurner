//
//  IJTUnlockViewController.m
//  IsaiahJTurner
//
//  Created by App Requests on 4/4/14.
//  Copyright (c) 2014 Isaiah J Turner. All rights reserved.
//

#import "IJTUnlockViewController.h"
#import <QuartzCore/QuartzCore.h>
#define DEGREES_TO_RADIANS(angle) (angle/180.0*M_PI)

@interface IJTUnlockViewController ()

@end

@implementation IJTUnlockViewController

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
    self.big = false;
    self.navigationController.navigationBar.hidden = NO;
    self.allButtons = [[NSArray alloc] initWithObjects:self.awardsButton, self.timelineButton, self.aboutButton, self.educationButton, self.interestsButton, self.skillsButton, nil];
    for (UIButton *button in self.allButtons) {
        button.layer.cornerRadius = button.frame.size.width / 2;
        button.clipsToBounds = YES;
        button.layer.borderColor=[UIColor colorWithRed:104.0/255.0 green:204.0/255.0 blue:92.0/255.0 alpha:1].CGColor;
        button.layer.borderWidth=1.0f;
    }
    self.myFace.layer.borderColor=[UIColor colorWithRed:102.0/255.0 green:102.0/255.0 blue:102./255.0 alpha:1].CGColor;
    self.myFace.layer.borderWidth=1.0f;
    self.myFace.layer.cornerRadius =  self.myFace.frame.size.width / 2;
    self.myFace.clipsToBounds = YES;
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(randomFact)];
    [tapGestureRecognizer setDelegate:self];
    [self.myFace addGestureRecognizer:tapGestureRecognizer];
    
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:104.0/255.0 green:204.0/255.0 blue:92.0/255.0 alpha:1];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor colorWithRed:102.0/255.0 green:102.0/255.0 blue:102./255.0 alpha:1]};
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackOpaque;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated {
    for (UIButton *button in self.allButtons) {
        [button.layer removeAllAnimations];
    }
    self.myFace.frame = CGRectMake(160, 364, 60, 60);
    self.myFace.center = CGPointMake(160, 364);
    self.blurView.blurRadius = 0;
}

- (void)randomFact {
    PXAlertView *alert;
    int r = rand() % 5;
    switch (r) {
        case 1:
            alert = [PXAlertView showAlertWithTitle:@"rand() % 5 Fact"
                                                         message:@"I don't actually know how to code. I just bang my head on the keyboard until it works."
                                                     cancelTitle:@"Oh damn."
                                                      completion:^(BOOL cancelled, NSInteger buttonIndex) {
                                                      }];
            break;
        case 2:
            alert = [PXAlertView showAlertWithTitle:@"rand() % 5 Fact"
                                            message:@"I got 99 problems and Xcode ain't 1."
                                        cancelTitle:@"Thanks!"
                                         completion:^(BOOL cancelled, NSInteger buttonIndex) {
                                         }];
            break;
        case 3:
            alert = [PXAlertView showAlertWithTitle:@"rand() % 5 Fact"
                                            message:@"PGP Enryption is the future! Check out Keybase, I am building an iOS client for it."
                                        cancelTitle:@"Naaa..."
                                        otherTitle:@"Fo sure!"
                                         completion:^(BOOL cancelled, NSInteger buttonIndex) {
                                             if (!cancelled) {
                                                 [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://keybase.io/it"]];
                                             }
                                         }];
            break;
        case 4:
            alert = [PXAlertView showAlertWithTitle:@"rand() % 5 Fact"
                                            message:@"My awesome portfolio can be found on my website. Check it out!"
                                        cancelTitle:@"Swirve."
                                         otherTitle:@"Let me see!"
                                         completion:^(BOOL cancelled, NSInteger buttonIndex) {
                                             if (cancelled) {
                                                #warning comedic code
                                                 NSLog(@"Apple reviewer swirved me :(");
                                             } else {
                                                 [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://isaiahjturner.com/portfolio"]];
                                             }
                                         }];
            break;
        default:
            alert = [PXAlertView showAlertWithTitle:@"rand() % 5 Fact"
                                            message:@"I have a pretty chillaxing website. Check it out!"
                                        cancelTitle:@"NO!"
                                         otherTitle:@"Oh, Cool!"
                                         completion:^(BOOL cancelled, NSInteger buttonIndex) {
                                             if (cancelled) {
                                                #warning comedic code
                                                 NSLog(@"Apple reviewer hates me :(");
                                             } else {
                                                 [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://isaiahjturner.com/"]];
                                             }
                                         }];
            break;
    }
    [alert setCancelButtonBackgroundColor:[UIColor colorWithRed:104.0/255.0 green:204.0/255.0 blue:92.0/255.0 alpha:1]];
    [alert setOtherButtonBackgroundColor:[UIColor colorWithRed:104.0/255.0 green:204.0/255.0 blue:92.0/255.0 alpha:1]];

}

-(void)viewDidAppear:(BOOL)animated {
    if (!self.big) {
  [self bounceMyFace];
  [self performSelector:@selector(moveButtonsIntoPlace) withObject:nil afterDelay:0.6];
        self.big = TRUE;
    }
}


- (void) bounceMyFace {
	NSString *keyPath = @"transform";
	CATransform3D transform = self.myFace.layer.transform;
    id finalValue;
    finalValue = [NSValue valueWithCATransform3D:
                     CATransform3DScale(transform, 2.0, 2.0, 2.0)
                     ];
    
	
	SKBounceAnimation *bounceAnimation = [SKBounceAnimation animationWithKeyPath:keyPath];
	bounceAnimation.fromValue = [NSValue valueWithCATransform3D:transform];
	bounceAnimation.toValue = finalValue;
	bounceAnimation.duration = 1.0f;
	bounceAnimation.numberOfBounces = 4;
	bounceAnimation.shouldOvershoot = YES;
	
	[self.myFace.layer addAnimation:bounceAnimation forKey:@"bounceUp"];
	
	[self.myFace.layer setValue:finalValue forKeyPath:keyPath];
}

- (void)moveButtonsIntoPlace {
        NSString *keyPath = @"transform";
        CATransform3D transform = self.buttonsView.layer.transform;
        id finalValue;
        finalValue = [NSValue valueWithCATransform3D:
                      CATransform3DScale(transform, 2.0, 2.0, 2.0)
                      ];
        
        
        SKBounceAnimation *bounceAnimation = [SKBounceAnimation animationWithKeyPath:keyPath];
        bounceAnimation.fromValue = [NSValue valueWithCATransform3D:transform];
        bounceAnimation.toValue = finalValue;
        bounceAnimation.duration = 0.5f;
        bounceAnimation.numberOfBounces = 4;
        bounceAnimation.shouldOvershoot = YES;
        
        [self.buttonsView.layer addAnimation:bounceAnimation forKey:@"bounceUp"];
        
        [self.buttonsView.layer setValue:finalValue forKeyPath:keyPath];
    
}

- (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    //UIGraphicsBeginImageContext(newSize);
    // In next line, pass 0.0 to use the current device's pixel scaling factor (and thus account for Retina resolution).
    // Pass 1.0 to force exact pixel size.
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end
