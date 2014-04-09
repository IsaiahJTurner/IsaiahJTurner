//
//  IJTMyLocationViewController.m
//  IsaiahJTurner
//
//  Created by App Requests on 4/8/14.
//  Copyright (c) 2014 Isaiah J Turner. All rights reserved.
//

#import "IJTMyLocationViewController.h"
#import "IJTMapViewAnnotation.h"

@interface IJTMyLocationViewController ()

@end

@implementation IJTMyLocationViewController
@synthesize mapView;

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
	CLLocationCoordinate2D location;
	location.latitude = (double) 38.170240;
	location.longitude = (double) -76.542043;
    
	// Add the annotation to our map view
	IJTMapViewAnnotation *newAnnotation = [[IJTMapViewAnnotation alloc] initWithTitle:@"Tall Timbers, Maryland" andCoordinate:location];
	[mapView addAnnotation:newAnnotation];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(location, 7000, 7000);
	[mapView setRegion:region animated:YES];
	[mapView selectAnnotation:newAnnotation animated:YES];

}


// Received memory warning
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

// If the view unloads, release the map view
- (void)viewDidUnload {
	[super viewDidUnload];
	mapView = nil;
}

@end
