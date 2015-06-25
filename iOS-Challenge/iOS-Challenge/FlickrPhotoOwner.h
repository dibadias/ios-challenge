//
//  FlickrPhotoOwner.h
//  iOS-Challenge
//
//  Created by Diego Batista Dias Leite on 6/25/15.
//  Copyright (c) 2015 HElabs. All rights reserved.
//

#import "MTLModel.h"
#import "MTLJsonAdapter.h"

@interface FlickrPhotoOwner : MTLModel <MTLJSONSerializing>

@property (copy, nonatomic, readonly) NSString *idOwner;
@property (copy, nonatomic, readonly) NSString *nsId;
@property (copy, nonatomic, readonly) NSString *isPro;
@property (copy, nonatomic, readonly) NSString *canBuyPro;
@property (copy, nonatomic, readonly) NSString *iconServer;
@property (copy, nonatomic, readonly) NSString *iconFarm;
@property (copy, nonatomic, readonly) NSString *pathAlias;
@property (copy, nonatomic, readonly) NSString *hasStats;
@property (copy, nonatomic, readonly) NSString *userName;


//Custom Properties
@property (strong) NSString *photoOwnerUrl;

@end
