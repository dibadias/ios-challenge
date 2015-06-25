//
//  FlickrManager.h
//  iOS-Challenge
//
//  Created by Diego Batista Dias Leite on 6/24/15.
//  Copyright (c) 2015 HElabs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FlickrPhoto.h"

@interface FlickrManager : NSObject


@property (strong) NSString *baseUrl;
@property (strong) NSString *flickrKey;
@property (strong) NSString *flickrSecret;

+(void)getRecentPhotosList:(void (^)(NSArray *recentPhotos))successBlock failure:(void (^)(NSString *failureDesciption))failureBlock;

@end