//
//  GalleryTableViewController.m
//  iOS-Challenge
//
//  Created by Diego Batista Dias Leite on 6/24/15.
//  Copyright (c) 2015 HElabs. All rights reserved.
//

#import "GalleryTableViewController.h"
#import "GalleryTableViewCell.h"
#import "FlickrManager.h"
#import "SVProgressHUD.h"
#import "PhotoDetailViewController.h"

@interface GalleryTableViewController ()

@end

static NSString * const reuseIdentifier = @"GalleryCellIdentifier";


@implementation GalleryTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.title = NSLocalizedString(@"Place's Gallery", @"");

    [SVProgressHUD showWithStatus:NSLocalizedString(@"Loading...", @"")];
    [SVProgressHUD setBackgroundColor:[UIColor lightGrayColor]];
    [self updateList];
    
}
             
- (void)updateList{
    
    [FlickrManager getRecentPhotosList:^(NSArray *recentPhotos) {

        self.photoArray = recentPhotos;
        [self.tableView reloadData];
       
        [SVProgressHUD dismiss];

    } failure:^(NSString *failureDesciption) {
        [SVProgressHUD dismiss];

    }];

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
    return [self.photoArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    GalleryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    FlickrPhoto *flickrPhoto = self.photoArray[indexPath.row];

    [cell bind:flickrPhoto];
    
    return cell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"PhotoDetailSegueIdentifier"])
    {
        PhotoDetailViewController *photoDetailViewController = (PhotoDetailViewController*) segue.destinationViewController;
        
        photoDetailViewController.flickrPhoto = [self.photos objectAtIndex:self.tableView.indexPathForSelectedRow.row];
    }
}
@end
