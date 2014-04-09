//
//  IJTMyLocationViewController.h
//  IsaiahJTurner
//
//  Created by App Requests on 4/8/14.
//  Copyright (c) 2014 Isaiah J Turner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface IJTMyLocationViewController : UIViewController <MKMapViewDelegate> {
	MKMapView *mapView;
}
@property (nonatomic, retain) IBOutlet MKMapView *mapView;

@end
