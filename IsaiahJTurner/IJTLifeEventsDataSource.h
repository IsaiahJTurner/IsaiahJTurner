//
//  IJTLifeEventsDataSource.h
//  IsaiahJTurner
//
//  Created by App Requests on 4/3/14.
//  Copyright (c) 2014 Isaiah J Turner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IJTLifeEventObject.h"

@interface IJTLifeEventsDataSource : NSObject

- (IJTLifeEventObject *)retrieveEvent:(int)index;
- (NSArray *)allEvents;

@end
