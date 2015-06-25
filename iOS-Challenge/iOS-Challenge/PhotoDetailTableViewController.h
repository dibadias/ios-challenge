//
//  PhotoDetailViewController.h
//  iOS-Challenge
//
//  Created by Diego Batista Dias Leite on 6/24/15.
//  Copyright (c) 2015 HElabs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlickrPhoto.h"
#import "FlickrManager.h"
@interface PhotoDetailTableViewController : UITableViewController

@property (strong) FlickrPhoto *flickPhoto;
@property (strong) FlickrPhotoOwner *flickrOwner;

//Row 1
@property (strong) IBOutlet UIImageView *imageViewOwnerPhoto;
@property (strong) IBOutlet UILabel *labelPhotoTitle;
@property (strong) IBOutlet UILabel *labelOwnerName;

//Row 2
@property (strong) IBOutlet UIImageView *imageViewPhotoBig;


@end
