//
//  MapViewController.m
//  CatsOnMap
//
//  Created by Юрий Куприянов on 24.10.15.
//  Copyright © 2015 YMK Soft. All rights reserved.
//

#import "MapViewController.h"
#import "AFNetworking.h"

@import MapKit;

@interface MapViewController ()

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (strong, nonatomic) NSArray *fotosInfoes;


@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)findCats:(id)sender {
    
    NSMutableDictionary *parameters = [NSMutableDictionary new];
    
    parameters[@"tags"] = @"cats";
    
    parameters[@"bbox"] = @"bbox";
    
    parameters[@"lat"]  = @35;
    
    parameters[@"lon"]  = @55;
    
    parameters[@"radius"] = @10;
    
    parameters[@"extras"] = @"url_l";
    
    parameters[@"format"] = @"json";
    
    
    
    parameters[@"content_type"] = @1;
    
    parameters[@"nojsoncallback"] = @1;
    
    
    
    parameters[@"method"] = @"flickr.photos.search";
    
    
    
    parameters[@"api_key"] = @"2b2c9f8abc28afe8d7749aee246d951c";
    
    
    
    
    
    
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:@"https://api.flickr.com/services/rest/"]];
    
    manager.responseSerializer = [AFJSONResponseSerializer new];
    
    AFHTTPRequestOperation *op = [manager GET:@""
                                  
                                   parameters:parameters
                                  
                                      success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
                                          
                                          NSLog(@"recieved data: %@",responseObject);
                                          
                                      }
                                  
                                      failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
                                          
                                          NSLog(@"error: %@",error);
                                          
                                      }];
    
}


@end
