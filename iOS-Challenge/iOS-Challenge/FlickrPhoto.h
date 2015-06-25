//
//  FlickrPhoto.h
//  iOS-Challenge
//
//  Created by Diego Batista Dias Leite on 6/24/15.
//  Copyright (c) 2015 HElabs. All rights reserved.
//

#import "Mantle.h"

@interface FlickrPhoto : MTLModel <MTLJSONSerializing>

@property (copy, nonatomic, readonly) NSString *photoId;
@property (copy, nonatomic, readonly) NSString *ownerId;
@property (copy, nonatomic, readonly) NSString *secret;
@property (copy, nonatomic, readonly) NSString *server;
@property (copy, nonatomic, readonly) NSString *farm;
@property (copy, nonatomic, readonly) NSString *title;
//From Extras parameter
@property (copy, nonatomic, readonly) NSString *numberOfViews;
@property (copy, nonatomic, readonly) NSString *ownerName;

//Custom Properties
@property (strong) NSString *photoThumbUrl;

@end
