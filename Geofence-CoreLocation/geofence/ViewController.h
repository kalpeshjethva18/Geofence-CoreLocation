//
//  ViewController.h
//  geofence
//
//  Created by macpc on 14/06/16.
//  Copyright (c) 2016 macpc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController<CLLocationManagerDelegate>

@property (strong, nonatomic) CLLocationManager *locationManager;
@property (weak, nonatomic) IBOutlet UILabel *workLabel;


@end

