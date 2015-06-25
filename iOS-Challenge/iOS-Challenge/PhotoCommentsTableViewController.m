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

@interface PhotoCommentsTableViewController ()

@end
static NSString * const reuseIdentifier = @"PhotoCommentCellIdentifier";

@implementation PhotoCommentsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [FlickrManager getComments:^(NSArray *arrayComments) {
        self.commentsArray = arrayComments;
        
        
        [self.tableView reloadData];
        
    } failure:^(NSString *failureDesciption) {
        
    } photoId:self.flickrPhoto.photoId];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.commentsArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PhotoCommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    FlickrPhotoComment *flickrPhotoComment = self.commentsArray[indexPath.row];
    
    [cell bind:flickrPhotoComment];
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    static NSString *CellIdentifier = @"CommentHeader";
    
    UITableViewCell *headerView = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (headerView == nil){
        [NSException raise:@"headerView == nil.." format:@"No cells with matching CellIdentifier loaded from your storyboard"];
    }
    
    UILabel *labelNumberOfComments = (UILabel *)[headerView viewWithTag:1];
    UILabel *labelNumberOfViews = (UILabel *)[headerView viewWithTag:2];
    
    [labelNumberOfComments setText:[NSString stringWithFormat:@"%lu %@",(unsigned long)self.commentsArray.count, NSLocalizedString(@"Comments",@"")]];
    [labelNumberOfViews setText:[NSString stringWithFormat:@"%@ %@",self.flickrPhoto.numberOfViews, NSLocalizedString(@"Views",@"")]];
    

    
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 37.f;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
