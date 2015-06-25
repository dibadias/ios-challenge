//
//  GalleryTableViewCell.m
//  iOS-Challenge
//
//  Created by Diego Batista Dias Leite on 6/24/15.
//  Copyright (c) 2015 HElabs. All rights reserved.
//

#import "GalleryTableViewCell.h"
#import <UIImageView+AFNetworking.h>
#import <QuartzCore/QuartzCore.h>


@implementation GalleryTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.imageViewPhoto.layer.masksToBounds = YES;
    self.imageViewPhoto.layer.cornerRadius = 6.0f;
    
}

-(void)bind:(FlickrPhoto *)flickrPhoto{
    
    
    [self.labelPhotoTitle setText:flickrPhoto.title];
    [self.labelPhotoOwner setText:flickrPhoto.ownerName];

    UIImage *placeholderImage = [UIImage imageNamed:@"flickr-noImage"];
    NSURL *urlThumb = [NSURL URLWithString:flickrPhoto.photoThumbUrl];
    
    [self.imageViewPhoto setImageWithURL:urlThumb placeholderImage:placeholderImage];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
