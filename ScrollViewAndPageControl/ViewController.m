//
//  ViewController.m
//  ScrollViewAndPageControl
//
//  Created by DOUGLAS STARNES on 8/26/12.
//  Copyright (c) 2012 Douglas Starnes. All rights reserved.
//
// @"string"
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSArray *colors = @[
        [UIColor greenColor],
        [UIColor blueColor],
        [UIColor yellowColor],
        [UIColor whiteColor],
        [UIColor blueColor]
    ];
    
    for (int n = 0; n < [colors count]; n++) {
        CGRect bounds;
        
        // left boundary of page n
        bounds.origin.x = self.scrollView.frame.size.width * n;
        // we only scroll left to right so y is always 0
        bounds.origin.y = 0;
        bounds.size = self.scrollView.frame.size;
        
        UIView *currentPage = [[UIView alloc] initWithFrame:bounds];
        [currentPage setBackgroundColor:[colors objectAtIndex:n]];
        [self.scrollView addSubview:currentPage];
    }
    
    [self.scrollView setContentSize:CGSizeMake(self.scrollView.frame.size.width * [colors count], self.scrollView.frame.size.height)];
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

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat width = self.scrollView.frame.size.width;
    // left boundary of the next page
    CGFloat scrollPosition = self.scrollView.contentOffset.x;
    // is more than half of the next page visible?
    scrollPosition -= (width / 2);
    // what page are we on now?
    int pageNumber = floor(scrollPosition / width);
    // set the current page
    self.pageControl.currentPage = pageNumber + 1;
}

@end
