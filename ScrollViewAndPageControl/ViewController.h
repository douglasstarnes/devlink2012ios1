//
//  ViewController.h
//  ScrollViewAndPageControl
//
//  Created by DOUGLAS STARNES on 8/26/12.
//  Copyright (c) 2012 Douglas Starnes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIScrollViewDelegate>

@property (nonatomic, weak) IBOutlet UIScrollView *scrollView;
@property (nonatomic, weak) IBOutlet UIPageControl *pageControl;

@end
