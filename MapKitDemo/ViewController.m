//
//  ViewController.m
//  MapKitDemo
//
//  Created by DOUGLAS STARNES on 8/26/12.
//  Copyright (c) 2012 Douglas Starnes. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self.mapMap setAction:@selector(mapTypeMap:)];
    [self.mapHybrid setAction:@selector(mapTypeHybrid:)];
    [self.mapSatellite setAction:@selector(mapTypeSatellite:)];
    
    [self.findChattanooga setAction:@selector(zoomToChattanooga:)];
    [self.findMemphis setAction:@selector(zoomToMemphis:)];
    [self.findNashville setAction:@selector(zoomToNashville:)];
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(placeAnnotation:)];
    tapRecognizer.numberOfTapsRequired = 2;
    tapRecognizer.numberOfTouchesRequired = 1;
    [self.mapView addGestureRecognizer:tapRecognizer];
}

- (void)placeAnnotation:(UIGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.state != UIGestureRecognizerStateEnded)
        return;
    
    CGPoint touchPoint = [gestureRecognizer locationInView:self.mapView];
    CLLocationCoordinate2D touchMapCoordinate = [self.mapView convertPoint:touchPoint toCoordinateFromView:self.mapView];
    
    MKPointAnnotation *mkpa = [[MKPointAnnotation alloc] init];
    mkpa.coordinate = touchMapCoordinate;
    mkpa.title = @"You are here";
    [self.mapView addAnnotation:mkpa];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)zoomToChattanooga:(id)sender
{
    CLLocationCoordinate2D latLng;
    latLng.latitude = CHATTANOOGA_LAT;
    latLng.longitude = CHATTANOOGA_LONG;
    
    [self zoomToCoordinates:latLng withMessage:@"Chattanooga, TN"];
}

- (void)zoomToMemphis:(id)sender
{
    CLLocationCoordinate2D latLng;
    latLng.latitude = MEMPHIS_LAT;
    latLng.longitude = MEMPHIS_LONG;
    
    [self zoomToCoordinates:latLng withMessage:@"Memphis, TN"];
}

- (void)zoomToNashville:(id)sender
{
    CLLocationCoordinate2D latLng;
    latLng.latitude = NASHVILLE_LAT;
    latLng.longitude = NASHVILLE_LONG;
    
    [self zoomToCoordinates:latLng withMessage:@"Nashville, TN"];
}

- (void)zoomToCoordinates:(CLLocationCoordinate2D)coordinates withMessage:(NSString *)message
{
    // a mile is about 1600 meters so 800 meters is approximately 1/2 square mile
    MKCoordinateRegion visible = MKCoordinateRegionMakeWithDistance(coordinates, 800.0, 800.0);
    MKCoordinateRegion mapVisible = [self.mapView regionThatFits:visible];
    [self.mapView setRegion:mapVisible animated:YES];
    
    MKPointAnnotation *mkpa = [[MKPointAnnotation alloc] init];
    mkpa.coordinate = coordinates;
    mkpa.title = message;
    
    [self.mapView addAnnotation:mkpa];
}

- (void)mapTypeMap:(id)sender
{
    self.mapView.mapType = MKMapTypeStandard;
}

- (void)mapTypeHybrid:(id)sender
{
    self.mapView.mapType = MKMapTypeHybrid;
}

- (void)mapTypeSatellite:(id)sender
{
    self.mapView.mapType = MKMapTypeSatellite;
}

@end
