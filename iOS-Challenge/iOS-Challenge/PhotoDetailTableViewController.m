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
    UIImage *placeholderImage = [UIImage imageNamed:@"flickr-noImage"];
    NSURL *urlBigPhoto = [NSURL URLWithString:self.flickPhoto.photoBigSizeUrl];
    [self.imageViewPhotoBig setImageWithURL:urlBigPhoto placeholderImage:placeholderImage];

    
    [FlickrManager getUserInfo:^(FlickrPhotoOwner *photoOwnerInfo) {
        NSLog(@"photoOwner:%@",photoOwnerInfo);
        self.flickrOwner = photoOwnerInfo;
        [self fillOwner];

    } failure:^(NSString *failureDesciption) {
        
    } userId:self.flickPhoto.ownerId];
    // Do any additional setup after loading the view.
}

-(void)fillOwner{
    
    self.imageViewOwnerPhoto.layer.cornerRadius = self.imageViewOwnerPhoto.frame.size.width/2;
    self.imageViewOwnerPhoto.layer.masksToBounds = YES;

    UIImage *placeholderImage = [UIImage imageNamed:@"flickr-noImage"];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
