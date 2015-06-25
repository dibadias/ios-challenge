//
//  PhotoCommentTableViewCell.m
//  iOS-Challenge
//
//  Created by Diego Batista Dias Leite on 6/25/15.
//  Copyright (c) 2015 HElabs. All rights reserved.
//

#import "PhotoCommentTableViewCell.h"
#import <UIImageView+AFNetworking.h>
#import <QuartzCore/QuartzCore.h>

@implementation PhotoCommentTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    self.imageViewCommentUser.layer.masksToBounds = YES;
    self.imageViewCommentUser.layer.cornerRadius =  self.imageViewCommentUser.frame.size.width/2;
;
    
}

-(void)bind:(FlickrPhotoComment *)flickrPhotoComment{
    
    
    [self.labelCommentUserName setText:flickrPhotoComment.authorName];
    [self.labelCommentText setText:@"ASDASD DSAS DSA UASHD IUAHSUDI HASUID IUASDIU ASHDUIS AH"];
    
    UIImage *placeholderImage = [UIImage imageNamed:@"user-noPhoto"];
    NSURL *urlThumb = [NSURL URLWithString:flickrPhotoComment.photoUserComment];
    
    [self.imageViewCommentUser setImageWithURL:urlThumb placeholderImage:placeholderImage];
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
