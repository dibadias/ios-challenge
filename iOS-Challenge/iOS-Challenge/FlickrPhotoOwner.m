//
//  FlickrPhotoOwner.m
//  iOS-Challenge
//
//  Created by Diego Batista Dias Leite on 6/25/15.
//  Copyright (c) 2015 HElabs. All rights reserved.
//

#import "FlickrPhotoOwner.h"

@implementation FlickrPhotoOwner

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"idOwner": @"id",
             @"nsId": @"nsid",
             @"isPro": @"ispro",
             @"canBuyPro": @"can_buy_pro",
             @"iconServer": @"iconserver",
             @"iconFarm": @"iconfarm",
             @"pathAlias":@"path_alias",
             @"hasStats":@"has_stats",
             @"userName":@"username",
             };
}

@end
