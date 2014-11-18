//
//  Location.m
//  SmartRoutes
//
//  Created by Marcelo Sampaio on 11/18/14.
//  Copyright (c) 2014 Marcelo Sampaio. All rights reserved.
//

#import "Location.h"

@implementation Location

@synthesize title,subTitle,latitude,longitude,array;

- (id)initWithLatitude:(NSNumber *)p_Latitude longitude:(NSNumber *)p_Longitude title:(NSString *)p_Title subTitle:(NSString *)p_SubTitle array:(NSMutableArray *)p_array
{
    self = [super init];
    if (self) {
        title=p_Title;
        subTitle=p_SubTitle;
        latitude=p_Latitude;
        longitude=p_Longitude;
        array=p_array;
    }
    return self;
}


@end
