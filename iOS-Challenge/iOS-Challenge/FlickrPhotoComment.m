//
//  FlickrPhotoComment.m
//  iOS-Challenge
//
//  Created by Diego Batista Dias Leite on 6/25/15.
//  Copyright (c) 2015 HElabs. All rights reserved.
//

#import "FlickrPhotoComment.h"
#import "NSValueTransformer+MTLPredefinedTransformerAdditions.h"
#import "MTLValueTransformer.h"

@implementation FlickrPhotoComment

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"idComment": @"id",
             @"authorId": @"author",
             @"authorName": @"authorname",
             @"iconServer": @"iconserver",
             @"iconFarm": @"iconfarm",
             @"dateCreate": @"datecreate",
             @"permaLink":@"permalink",
             @"pathAlias":@"path_alias",
             @"realName":@"realname",
             @"content":@"_content",
             };
}

@end
