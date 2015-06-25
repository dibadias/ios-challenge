//
//  PhotoCommentsTableViewController.m
//  iOS-Challenge
//
//  Created by Diego Batista Dias Leite on 6/24/15.
//  Copyright (c) 2015 HElabs. All rights reserved.
//

#import "PhotoCommentsTableViewController.h"
#import "FlickrManager.h"
#import "PhotoCommentTableViewCell.h"
#import "SVProgressHUD.h"

@interface PhotoCommentsTableViewController ()

@end
static NSString * const reuseIdentifier = @"PhotoCommentCellIdentifier";

@implementation PhotoCommentsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [FlickrManager getComments:^(NSArray *arrayComments) {
        self.commentsArray = arrayComments;
        [self.tableView reloadData];
        
    } failure:^(NSString *failureDesciption) {
        
        [SVProgressHUD showErrorWithStatus:NSLocalizedString(@"Connection Problem to load comments. :(", @"")];

    } photoId:self.flickrPhoto.photoId];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 37.f;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.commentsArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PhotoCommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    FlickrPhotoComment *flickrPhotoComment = self.commentsArray[indexPath.row];
    
    [cell bind:flickrPhotoComment];
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    //putting the Cell of Comments and TableView on Header.
    static NSString *CellIdentifier = @"CommentHeader";
    
    UITableViewCell *headerView = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    UILabel *labelNumberOfComments = (UILabel *)[headerView viewWithTag:1];
    UILabel *labelNumberOfViews = (UILabel *)[headerView viewWithTag:2];
    
    [labelNumberOfComments setText:[NSString stringWithFormat:@"%lu %@",(unsigned long)self.commentsArray.count, NSLocalizedString(@"Comments",@"")]];
    [labelNumberOfViews setText:[NSString stringWithFormat:@"%@ %@",self.flickrPhoto.numberOfViews, NSLocalizedString(@"Views",@"")]];
    
    return headerView;
}



@end
