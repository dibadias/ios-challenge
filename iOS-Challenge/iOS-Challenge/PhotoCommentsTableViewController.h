//
//  PhotoCommentsTableViewController.h
//  iOS-Challenge
//
//  Created by Diego Batista Dias Leite on 6/24/15.
//  Copyright (c) 2015 HElabs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlickrPhoto.h"
@interface PhotoCommentsTableViewController : UITableViewController

@property (strong) NSArray *commentsArray;

@property (strong) FlickrPhoto *flickrPhoto;

@end
