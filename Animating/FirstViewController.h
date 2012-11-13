//
//  FirstViewController.h
//  Animating
//
//  Created by DOUGLAS STARNES on 8/12/12.
//  Copyright (c) 2012 Douglas Starnes. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CircleView;

@interface FirstViewController : UIViewController
{
    NSMutableArray *ptsQueue;
    NSTimer *timer;
    bool isMoving;
    CGPoint current;
    NSUInteger count;
}

@property (nonatomic, strong) CircleView *circleView;

@end
