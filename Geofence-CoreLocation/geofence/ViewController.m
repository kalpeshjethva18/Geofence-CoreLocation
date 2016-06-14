//
//  ViewController.m
//  geofence
//
//  Created by macpc on 14/06/16.
//  Copyright (c) 2016 macpc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize locationManager;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.pausesLocationUpdatesAutomatically = NO;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
    locationManager.distanceFilter = 500;
    [self.locationManager startUpdatingLocation];
    
    CLLocationCoordinate2D centre;
    centre.latitude = 23.01770900;
    centre.longitude = 72.56905700;
    CLCircularRegion *region = [[CLCircularRegion alloc] initWithCenter:centre
                                                                 radius:100.0
                                                             identifier:@"kalpesh"];
    [self.locationManager startUpdatingLocation];
    [self.locationManager startMonitoringForRegion:region];
}
-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    switch (status) {
        case kCLAuthorizationStatusNotDetermined:
        case kCLAuthorizationStatusRestricted:
        case kCLAuthorizationStatusDenied:
        {
            // do some error handling
        }
            break;
        default:{
            [locationManager startUpdatingLocation];
        }
            break;
    }
}
-(void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region {
    self.workLabel.text = @"You are Enter";
}
-(void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region {
    self.workLabel.text = @"You are Exit";
}
-(void)locationManager:(CLLocationManager *)manager didStartMonitoringForRegion:(CLRegion *)region {
    [self.locationManager requestStateForRegion:region];
    NSLog(@"Now monitoring for %@", region.identifier);
}
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
//    CLLocationCoordinate2D centre;
//    centre.latitude = 23.01770900;
//    centre.longitude = 72.56905700;
//    CLCircularRegion *region = [[CLCircularRegion alloc] initWithCenter:centre
//                                                                 radius:100.0
//                                                             identifier:@"kalpesh"];
//    [self.locationManager startMonitoringForRegion:(CLRegion *)region];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
