//
//  GalleryTableViewCell.h
//  iOS-Challenge
//
//  Created by Diego Batista Dias Leite on 6/24/15.
//  Copyright (c) 2015 HElabs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GalleryTableViewCell : UITableViewCell

@property IBOutlet UIImageView *imageViewPhoto;

@property IBOutlet UILabel *labelPhotoTitle;
@property IBOutlet UILabel *labelPhotoOwner;

-(void)bind:(id)FlickrPhoto;

@end