//
//  ViewController.h
//  MapKitDemo
//
//  Created by DOUGLAS STARNES on 8/26/12.
//  Copyright (c) 2012 Douglas Starnes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

#define CHATTANOOGA_LAT 35.04562
#define CHATTANOOGA_LONG -85.30978
#define MEMPHIS_LAT 35.1494
#define MEMPHIS_LONG -90.0490
#define NASHVILLE_LAT 36.1665
#define NASHVILLE_LONG -86.7832

@interface ViewController : UIViewController

@property (nonatomic, weak) IBOutlet MKMapView *mapView;

@property (nonatomic, weak) IBOutlet UIBarButtonItem *mapMap;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *mapSatellite;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *mapHybrid;

@property (nonatomic, weak) IBOutlet UIBarButtonItem *findChattanooga;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *findMemphis;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *findNashville;

@end
