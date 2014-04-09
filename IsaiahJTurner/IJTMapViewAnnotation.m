//
//  IJTMapViewAnnotation.m
//  IsaiahJTurner
//
//  Created by App Requests on 4/8/14.
//  Copyright (c) 2014 Isaiah J Turner. All rights reserved.
//

#import "IJTMapViewAnnotation.h"

@implementation IJTMapViewAnnotation
@synthesize title, coordinate;

- (id)initWithTitle:(NSString *)ttl andCoordinate:(CLLocationCoordinate2D)c2d {
	title = ttl;
	coordinate = c2d;
	return self;
}

@end