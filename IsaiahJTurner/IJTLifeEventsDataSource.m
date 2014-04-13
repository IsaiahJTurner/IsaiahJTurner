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
                  [[IJTLifeEventObject alloc] initWithDate:@"August 7, 1998" description:@"I was born in Annapolis, Maryland. I grew up in Passadena, Maryland until my parents divorced. In fourth grade, I moved to Southern Maryland with my mom. Last year I moved again but luckily I was still able to go to the same High School, St. Mary's Ryken! Many may say that these events were a negative impact on my life but I think quite the opposite. With every stuggle, I learn more." imageURL:nil],
                  [[IJTLifeEventObject alloc] initWithDate:@"June 12, 2013" description:@"Finally! I purchased my first domain. This may seem like a silly achievement but this began many months of learning about web development and building the API for my first app." imageURL:nil],
                  [[IJTLifeEventObject alloc] initWithDate:@"August 28, 2013" description:@"I released my first App Store app! A huge achievement for me and spiked my interest in iOS development even more. The app was not that interesting but it was my first! You can learn more about it on http://apprequestsapp.com" imageURL:nil],
                  
        
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
