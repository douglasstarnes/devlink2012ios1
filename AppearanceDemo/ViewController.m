//
//  ViewController.m
//  AppearanceDemo
//
//  Created by DOUGLAS STARNES on 8/29/12.
//  Copyright (c) 2012 Douglas Starnes. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [[UIButton appearance] setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [[UIButton appearance] setTitleColor:[UIColor yellowColor] forState:UIControlStateHighlighted];
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

@end
