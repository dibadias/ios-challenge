//
//  FlickrPhotoComment.h
//  iOS-Challenge
//
//  Created by Diego Batista Dias Leite on 6/25/15.
//  Copyright (c) 2015 HElabs. All rights reserved.
//

#import "MTLModel.h"
#import "MTLJsonAdapter.h"

@interface FlickrPhotoComment : MTLModel <MTLJSONSerializing>

@property (copy, nonatomic, readonly) NSString *idComment;
@property (copy, nonatomic, readonly) NSString *authorId;
@property (copy, nonatomic, readonly) NSString *authorName;
@property (copy, nonatomic, readonly) NSString *iconServer;
@property (copy, nonatomic, readonly) NSString *iconFarm;
@property (copy, nonatomic, readonly) NSString *dateCreate;
@property (copy, nonatomic, readonly) NSString *permaLink;
@property (copy, nonatomic, readonly) NSString *pathAlias;
@property (copy, nonatomic, readonly) NSString *realName;
@property (copy, nonatomic, readonly) NSString *content;

//Custom Properties
@property (strong) NSString *photoUserComment;

@end
