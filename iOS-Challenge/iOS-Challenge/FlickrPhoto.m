//
//  FlickrPhoto.m
//  iOS-Challenge
//
//  Created by Diego Batista Dias Leite on 6/24/15.
//  Copyright (c) 2015 HElabs. All rights reserved.
//

#import "FlickrPhoto.h"

@implementation FlickrPhoto

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"photoId": @"id",
             @"ownerId": @"owner",
             @"secret": @"secret",
             @"server": @"server",
             @"farm": @"farm",
             @"title": @"title",
             @"ownerName":@"ownername",
             @"numberOfViews":@"views"
             };
}

@end
