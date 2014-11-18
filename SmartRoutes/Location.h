//
//  Location.h
//  SmartRoutes
//
//  Created by Marcelo Sampaio on 11/18/14.
//  Copyright (c) 2014 Marcelo Sampaio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Location : NSObject

@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *subTitle;
@property (nonatomic,strong) NSNumber *latitude;
@property (nonatomic,strong) NSNumber *longitude;
@property (nonatomic,strong) NSMutableArray *array;

- (id)initWithLatitude:(NSNumber *)p_Latitude longitude:(NSNumber *)p_Longitude title:(NSString *)p_Title subTitle:(NSString *)p_SubTitle array:(NSMutableArray *)p_array;

@end
