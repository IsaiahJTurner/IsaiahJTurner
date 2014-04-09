//
//  IJTLifeEventsDataSource.m
//  IsaiahJTurner
//
//  Created by App Requests on 4/3/14.
//  Copyright (c) 2014 Isaiah J Turner. All rights reserved.
//

#import "IJTLifeEventsDataSource.h"

@implementation IJTLifeEventsDataSource {
    NSArray *events;
}
-(id) init{
    self = [super init];
    if(self){//always use this pattern in a constructor.
        events = [NSArray arrayWithObjects:[
                  [IJTLifeEventObject alloc] initWithDate:@"August 7, 1998" description:@"The beginning of it all. I was born August 7th." imageURL:nil],
                  [[IJTLifeEventObject alloc] initWithDate:@"August 8, 1998" description:@"Day two." imageURL:nil],
                  [[IJTLifeEventObject alloc] initWithDate:@"August 9, 1998" description:@"Day 3" imageURL:nil],
                  [[IJTLifeEventObject alloc] initWithDate:@"August 10, 1998" description:@"On the fourth day i died." imageURL:nil],
        
        nil];
    }
    return self;
}

-(IJTLifeEventObject *)retrieveEvent:(int)index {
    if ([events count] >= index)
        return [events objectAtIndex:index]; else return [[IJTLifeEventObject alloc] initWithDate:@"The Future" description:@"I'm 15 and have a long life ahead of me." imageURL:nil];
}

- (NSArray *)allEvents {
    return events;
}

@end
