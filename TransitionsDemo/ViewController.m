//
//  ViewController.m
//  TransitionsDemo
//
//  Created by DOUGLAS STARNES on 8/27/12.
//  Copyright (c) 2012 Douglas Starnes. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIViewAnimationOptions animationOptions;
    UIViewAnimationOptions easingCurve;
    float duration;
    NSArray *easingCurves;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    easingCurves = @[
        [NSNumber numberWithInt:UIViewAnimationOptionCurveLinear],
        [NSNumber numberWithInt:UIViewAnimationOptionCurveEaseIn],
        [NSNumber numberWithInt:UIViewAnimationOptionCurveEaseOut],
        [NSNumber numberWithInt:UIViewAnimationOptionCurveEaseInOut]
    ];
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

- (void)switchViews:(BOOL)reverse
{
    UIView *fromView = self.view;
    UIView *toView = self.view2;
    
    if (reverse) {
        fromView = self.view2;
        toView = self.view;
    }
    
    [UIView transitionFromView:fromView
                        toView:toView
                      duration:duration
                       options:animationOptions
                    completion:nil];
}

- (IBAction)none:(id)sender
{
    animationOptions = UIViewAnimationOptionTransitionNone | easingCurve;
    [self switchViews:NO];
}

- (IBAction)flipTop:(id)sender
{
    animationOptions = UIViewAnimationOptionTransitionFlipFromTop | easingCurve;
    [self switchViews:YES];
}

- (IBAction)flipBottom:(id)sender
{
    animationOptions = UIViewAnimationOptionTransitionFlipFromBottom | easingCurve;
    [self switchViews:YES];
}

- (IBAction)flipLeft:(id)sender
{
    animationOptions = UIViewAnimationOptionTransitionFlipFromLeft | easingCurve;
    [self switchViews:YES];
}

- (IBAction)flipRight:(id)sender
{
    animationOptions = UIViewAnimationOptionTransitionFlipFromRight | easingCurve;
    [self switchViews:YES];
}

- (IBAction)curlUp:(id)sender
{
    animationOptions = UIViewAnimationOptionTransitionCurlUp | easingCurve;
    [self switchViews:NO];
}

- (IBAction)curlDown:(id)sender
{
    animationOptions = UIViewAnimationOptionTransitionCurlDown | easingCurve;
    [self switchViews:NO];
}

- (IBAction)dissolve:(id)sender
{
    animationOptions = UIViewAnimationOptionTransitionCrossDissolve | easingCurve;
    [self switchViews:NO];
}

- (IBAction)sliderChanged:(UISlider *)sender
{
    duration = [sender value];
}

- (IBAction)segmentedControlChanged:(UISegmentedControl *)sender
{
    easingCurve = [[easingCurves objectAtIndex:sender.selectedSegmentIndex] integerValue];
}

@end
