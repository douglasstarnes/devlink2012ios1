//
//  ViewController.h
//  TransitionsDemo
//
//  Created by DOUGLAS STARNES on 8/27/12.
//  Copyright (c) 2012 Douglas Starnes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIView *view2;
@property (nonatomic, strong) IBOutlet UISlider *durationSlider;
@property (nonatomic, strong) IBOutlet UISegmentedControl *segmentedControl;

- (IBAction)none:(id)sender;
- (IBAction)flipLeft:(id)sender;
- (IBAction)flipRight:(id)sender;
- (IBAction)flipTop:(id)sender;
- (IBAction)flipBottom:(id)sender;
- (IBAction)curlUp:(id)sender;
- (IBAction)curlDown:(id)sender;
- (IBAction)dissolve:(id)sender;

- (IBAction)sliderChanged:(UISlider *)sender;
- (IBAction)segmentedControlChanged:(UISegmentedControl *)sender;

@end
