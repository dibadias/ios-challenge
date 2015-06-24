//
//  GalleryTableViewCell.m
//  iOS-Challenge
//
//  Created by Diego Batista Dias Leite on 6/24/15.
//  Copyright (c) 2015 HElabs. All rights reserved.
//

#import "GalleryTableViewCell.h"

@implementation GalleryTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)bind:(id)FlickrPhoto{
    [self.labelPhotoTitle setText:@"Spetacular View"];
    [self.labelPhotoOwner setText:@"Diba Dias"];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
