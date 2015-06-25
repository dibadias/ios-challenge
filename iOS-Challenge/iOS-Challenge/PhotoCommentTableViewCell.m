//
//  PhotoCommentTableViewCell.m
//  iOS-Challenge
//
//  Created by Diego Batista Dias Leite on 6/25/15.
//  Copyright (c) 2015 HElabs. All rights reserved.
//

#import "PhotoCommentTableViewCell.h"
#import <UIImageView+AFNetworking.h>
#import <QuartzCore/QuartzCore.h>

@implementation PhotoCommentTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    self.imageViewCommentUser.layer.masksToBounds = YES;
    self.imageViewCommentUser.layer.cornerRadius =  self.imageViewCommentUser.frame.size.width/2;

}

-(void)bind:(FlickrPhotoComment *)flickrPhotoComment{
    
    [self.labelCommentDateTime setText:[self convertDate:flickrPhotoComment.dateCreate]];
    
    [self.labelCommentUserName setText:flickrPhotoComment.authorName];
    [self.labelCommentText setText:flickrPhotoComment.content];
    
    UIImage *placeholderImage = [UIImage imageNamed:@"user-noPhoto"];
    NSURL *urlThumb = [NSURL URLWithString:flickrPhotoComment.photoUserComment];
    
    [self.imageViewCommentUser setImageWithURL:urlThumb placeholderImage:placeholderImage];
    
}

-(NSString *)convertDate:(NSString *)dateToConvert{

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
    NSInteger inte = [dateToConvert integerValue];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:inte];
    
    NSCalendar *currentCalendar = [NSCalendar currentCalendar];
    NSDate *now = [NSDate date];
    NSDateComponents *components = [currentCalendar components:NSCalendarUnitHour|NSCalendarUnitDay fromDate:date toDate:now options:0];
    NSInteger diff = components.day;
    
    return [NSString stringWithFormat:@"%ld days ago",(long)diff];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
