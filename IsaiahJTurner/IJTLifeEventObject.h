//
//  IJTLifeEventObject.h
//  IsaiahJTurner
//
//  Created by App Requests on 4/3/14.
//  Copyright (c) 2014 Isaiah J Turner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IJTLifeEventObject : NSObject {
    NSString *dateString;
    NSString *eventDetails;
    NSString *imageURL;
}

-(id) initWithDate:(NSString *)eventDate description:(NSString *)eventDescription imageURL:(NSString *)eventImageURL;
-(BOOL)doesHaveImage;
-(UIImage *)getImage;
-(NSString *)getDate;
-(NSString *)getDetails;
-(NSString *)getURL;

@end
