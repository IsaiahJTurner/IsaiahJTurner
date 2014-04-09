//
//  IJTMyAgeViewController.m
//  IsaiahJTurner
//
//  Created by App Requests on 4/8/14.
//  Copyright (c) 2014 Isaiah J Turner. All rights reserved.
//

#import "IJTMyAgeViewController.h"

@interface IJTMyAgeViewController ()

@end

@implementation IJTMyAgeViewController

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
    [self updateDate];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateDate {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    NSDate *myBirthday = [[NSDate alloc] init];
    myBirthday = [dateFormatter dateFromString:@"07-08-1998"];
    
    NSTimeInterval timeElapsed = [[NSDate date] timeIntervalSinceDate:myBirthday];
    NSInteger ti = (NSInteger)timeElapsed;

    NSInteger seconds = ti % 60;
    NSInteger minutes = (ti / 60) % 60;
    NSInteger hours = (ti / 3600) % 24;
    NSInteger days = (ti / 86400) % 30;
    NSInteger months = (ti / 2592000) % 12;
    NSInteger years = (ti / 31104000);
    self.seconds.text = [NSString stringWithFormat:@"%ld seconds", (long)seconds];
    self.minutes.text = [NSString stringWithFormat:@"%ld miuntes", (long)minutes];
    self.hours.text = [NSString stringWithFormat:@"%ld hours", (long)hours];
    self.days.text = [NSString stringWithFormat:@"%ld days", (long)days];
    self.months.text = [NSString stringWithFormat:@"%ld months", (long)months];
    self.years.text = [NSString stringWithFormat:@"%ld years", (long)years];
    [self performSelector:@selector(updateDate) withObject:nil afterDelay:1.0];
}

@end
