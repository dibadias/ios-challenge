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
#import "PhotoDetailTableViewController.h"

@interface GalleryTableViewController ()

@end

static NSString * const reuseIdentifierGalleryCell = @"GalleryCellIdentifier";
static NSString * const reuseIdentifierLoadMore = @"LoadMorePhotosIdentifier";

@implementation GalleryTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.title = NSLocalizedString(@"Place's Gallery", @"");

    [SVProgressHUD showWithStatus:NSLocalizedString(@"Loading...", @"")];
    [SVProgressHUD setBackgroundColor:[UIColor lightGrayColor]];
    
    self.currentPageNumber = 1;
    
    [self updateList:self.currentPageNumber];

}

- (void)updateList:(int)page{
    
    [FlickrManager getRecentPhotosList:^(NSArray *recentPhotos) {

        // If page number are current, just update array
        if(page == self.currentPageNumber){
        
            self.photoArray = recentPhotos;
            self.currentPageNumber = page;
        
        }else{
            // Add new items on array
            
            NSMutableArray * mutableArray = [NSMutableArray arrayWithArray:self.photoArray];
            [mutableArray addObjectsFromArray:recentPhotos];
            self.photoArray = mutableArray;
        
        }
        
        [self.tableView reloadData];
        [SVProgressHUD dismiss];

    } failure:^(NSString *failureDesciption) {
        
        [SVProgressHUD showErrorWithStatus:NSLocalizedString(@"Connection problem :(", @"")];
        
    } pageNumber:page];
    
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
    
    //+ 1 for LoadMore
    return [self.photoArray count]+1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSUInteger row = [indexPath row];
    NSUInteger count = [self.photoArray count];
    
    //for the LoadMoreCell
    if (row == count){
        return 50.f;
    }

    return 85.f;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    NSUInteger row = [indexPath row];
    NSUInteger count = [self.photoArray count];
    
    //Testing if the cell is LoadMore
    if (row == count){
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifierLoadMore forIndexPath:indexPath];

        cell.textLabel.text = NSLocalizedString(@"Load More Photos...", @"");
        [cell.textLabel setTextAlignment:NSTextAlignmentCenter];
        cell.textLabel.textColor = [UIColor grayColor];
        cell.textLabel.font = [UIFont boldSystemFontOfSize:14];

        return cell;

    
    }else{
        
        GalleryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifierGalleryCell forIndexPath:indexPath];
        FlickrPhoto *flickrPhoto = self.photoArray[indexPath.row];
        
        [cell bind:flickrPhoto];

        return cell;

    }
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSUInteger row = [indexPath row];
    NSUInteger count = [self.photoArray count];
    
    //if LoadMoreCell take new photos
    if (row == count){
        [self updateList:self.currentPageNumber+1];
        [SVProgressHUD showWithStatus:NSLocalizedString(@"Loading...", @"")];

    }
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"PhotoDetailSegueIdentifier"])
    {
        PhotoDetailTableViewController *photoDetailViewController = (PhotoDetailTableViewController*) segue.destinationViewController;
        
        photoDetailViewController.flickPhoto = [self.photoArray objectAtIndex:self.tableView.indexPathForSelectedRow.row];
    }
}
@end
