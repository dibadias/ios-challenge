//
//  FlickrManager.m
//  iOS-Challenge
//
//  Created by Diego Batista Dias Leite on 6/24/15.
//  Copyright (c) 2015 HElabs. All rights reserved.
//

#import "FlickrManager.h"
@implementation FlickrManager



+(FlickrManager *)sharedFlickrManager{
    
    static FlickrManager *flickrManager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        flickrManager = [[self alloc] init];
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"FlickrSettings" ofType:@"plist"];
        NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
        
        flickrManager.baseUrl = [dict objectForKey:@"baseUrl"];
        flickrManager.flickrKey = [dict objectForKey:@"flickrKey"];
        flickrManager.flickrSecret = [dict objectForKey:@"flickrSecret"];
        
        
    });
    
    return flickrManager;

    
}


+(void)getRecentPhotosList:(void (^)(NSArray *recentPhotos))successBlock failure:(void (^)(NSString *failureDesciption))failureBlock{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSDictionary *parameters = @{@"method":@"flickr.photos.getRecent",
                                 @"api_key":[[self sharedFlickrManager]flickrKey],
                                 @"format":@"json",
                                 @"nojsoncallback":@"1",
                                 @"page":@"5",
                                 @"extras":@"views,owner_name"};
    
    [manager GET:[[self sharedFlickrManager]baseUrl] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSArray *flickrPhotos = [[responseObject objectForKey:@"photos"] objectForKey:@"photo"];
        
        NSMutableArray *photos = [NSMutableArray array];
        
        for (NSDictionary *photoDict in flickrPhotos){
            
            FlickrPhoto *flickrPhoto = [MTLJSONAdapter modelOfClass:[FlickrPhoto class] fromJSONDictionary:photoDict error:nil];
            [flickrPhoto setPhotoThumbUrl:[self photoThumbUrl:flickrPhoto]];
            [flickrPhoto setPhotoBigSizeUrl:[self photoBigSizeUrl:flickrPhoto]];
            [photos addObject:flickrPhoto];

        }
        
        if (successBlock) successBlock(photos);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        if (failureBlock) failureBlock([error description]);
    }];
}

+(void)getUserInfo:(void (^)(FlickrPhotoOwner *photoOwnerInfo))successBlock failure:(void (^)(NSString *failureDesciption))failureBlock userId:(NSString *)UserId{
    

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSDictionary *parameters = @{@"method":@"flickr.people.getInfo",
                                 @"api_key":[[self sharedFlickrManager]flickrKey],
                                 @"format":@"json",
                                 @"nojsoncallback":@"1",
                                 @"user_id":UserId,
                                 };
    
    [manager GET:[[self sharedFlickrManager]baseUrl] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *photoOwnerDict = (NSDictionary *)[responseObject objectForKey:@"person"];
        
        NSError *error;
        FlickrPhotoOwner *flickrPhotoOwner = [MTLJSONAdapter modelOfClass:[FlickrPhotoOwner class] fromJSONDictionary:photoOwnerDict error:&error];
        [flickrPhotoOwner setPhotoOwnerUrl:[self photoOwnerUrl:flickrPhotoOwner]];
        
        if (!error){
            if (successBlock) successBlock(flickrPhotoOwner);
        }
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        if (failureBlock) failureBlock([error description]);
    }];

}




#pragma mark
#pragma mark Utils
+ (NSString *)photoThumbUrl:(FlickrPhoto *)flickrPhoto{
    //https://farm{farm-id}.staticflickr.com/{server-id}/{id}_{secret}.jpg
    NSString *photoThumbUrl = [NSString stringWithFormat:@"https://farm%@.staticflickr.com/%@/%@_%@_t.jpg", flickrPhoto.farm, flickrPhoto.server, flickrPhoto.photoId, flickrPhoto.secret];
    return photoThumbUrl;
    
}

+ (NSString*)photoBigSizeUrl:(FlickrPhoto *)flickrPhoto {
    //http://farm{icon-farm}.staticflickr.com/{icon-server}/buddyicons/{nsid}.jpg
    NSString *photoBigSizeUrl = [NSString stringWithFormat:@"https://farm%@.staticflickr.com/%@/%@_%@_b.jpg",
                                 flickrPhoto.farm, flickrPhoto.server, flickrPhoto.photoId, flickrPhoto.secret];
    
    return photoBigSizeUrl;
}

+ (NSString*)photoOwnerUrl:(FlickrPhotoOwner *)flickPhotoOwner {
    //http://farm{icon-farm}.staticflickr.com/{icon-server}/buddyicons/{nsid}.jpg
    NSString *photoOwnerUrl = [NSString stringWithFormat:@"https://farm%@.staticflickr.com/%@/buddyicons/%@.jpg",
                               flickPhotoOwner.iconFarm, flickPhotoOwner.iconServer, flickPhotoOwner.idOwner];
    return photoOwnerUrl;
}




@end
