//
//  PhotoDetailViewController.m
//  iOS-Challenge
//
//  Created by Diego Batista Dias Leite on 6/24/15.
//  Copyright (c) 2015 HElabs. All rights reserved.
//

#import "PhotoDetailTableViewController.h"
#import <UIImageView+AFNetworking.h>
#import <QuartzCore/QuartzCore.h>
#import "PhotoCommentsTableViewController.h"

@interface PhotoDetailTableViewController ()

@end

@implementation PhotoDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];

    self.title = NSLocalizedString(@"Photo Detail", @"");
    
    //Owner Basic Fields
    [self.labelOwnerName setText:self.flickPhoto.ownerName];
    [self.labelPhotoTitle setText:self.flickPhoto.title];
    
    //Big Photo Fill
    UIImage *placeholderImage = [UIImage imageNamed:@"flickr-noImage-grey"];
    NSURL *urlBigPhoto = [NSURL URLWithString:self.flickPhoto.photoBigSizeUrl];
    [self.imageViewPhotoBig setImageWithURL:urlBigPhoto placeholderImage:placeholderImage];

    
    [FlickrManager getUserInfo:^(FlickrPhotoOwner *photoOwnerInfo) {
        self.flickrOwner = photoOwnerInfo;
        [self fillOwner];

    } failure:^(NSString *failureDesciption) {
        
    } userId:self.flickPhoto.ownerId];
    // Do any additional setup after loading the view.
}

-(void)fillOwner{
    
    self.imageViewOwnerPhoto.layer.cornerRadius = self.imageViewOwnerPhoto.frame.size.width/2;
    self.imageViewOwnerPhoto.layer.masksToBounds = YES;

    UIImage *placeholderImage = [UIImage imageNamed:@"user-noPhoto"];
    NSURL *urlThumb = [NSURL URLWithString:self.flickrOwner.photoOwnerUrl];
    
    [self.imageViewOwnerPhoto setImageWithURL:urlThumb placeholderImage:placeholderImage];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"CommentSegueIdentifier"]) {
        
        PhotoCommentsTableViewController *photoCommentTableViewController = (PhotoCommentsTableViewController*) segue.destinationViewController;
        
        photoCommentTableViewController.flickrPhoto = self.flickPhoto;

        
        /*self.commentsViewController = (CommentsTableViewController*) segue.destinationViewController;
        
        
        self.commentsViewController.delegate = self;
        self.commentsViewController.flickrPhoto = self.flickrPhoto;
         */
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
