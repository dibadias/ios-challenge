//
//  PhotoCommentTableViewCell.h
//  iOS-Challenge
//
//  Created by Diego Batista Dias Leite on 6/25/15.
//  Copyright (c) 2015 HElabs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlickrPhotoComment.h"
@interface PhotoCommentTableViewCell : UITableViewCell

@property IBOutlet UIImageView *imageViewCommentUser;

@property IBOutlet UILabel *labelCommentUserName;
@property IBOutlet UILabel *labelCommentText;
@property IBOutlet UILabel *labelCommentDateTime;

@property (strong) NSDictionary *fontDetails;

-(void)bind:(FlickrPhotoComment *)flickrPhotoComment;


@end
