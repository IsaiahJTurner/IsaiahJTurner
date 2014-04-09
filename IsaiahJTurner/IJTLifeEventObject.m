//
//  IJTLifeEventObject.m
//  IsaiahJTurner
//
//  Created by App Requests on 4/3/14.
//  Copyright (c) 2014 Isaiah J Turner. All rights reserved.
//

#import "IJTLifeEventObject.h"

@implementation IJTLifeEventObject

-(id) initWithDate:(NSString *)eventDate description:(NSString *)eventDescription imageURL:(NSString *)eventImageURL {
    self = [super init];
    if(self){//always use this pattern in a constructor.
        dateString = eventDate;
        eventDetails = eventDescription;
        imageURL = eventImageURL;
        }
    return self;
}

- (UIImage *)getImage {
    if ([self doesHaveImage]) {
        return NULL;
    } else {
        return nil;
    }
}

- (BOOL)doesHaveImage {
    if (imageURL) return TRUE; else return FALSE;
}

- (NSString *)getDate {
  return dateString;
}

- (NSString *)getDetails {
    return eventDetails;
}

- (NSString *)getURL {
    return imageURL;
}

@end
