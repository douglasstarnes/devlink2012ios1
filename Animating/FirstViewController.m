//
//  FirstViewController.m
//  Animating
//
//  Created by DOUGLAS STARNES on 8/12/12.
//  Copyright (c) 2012 Douglas Starnes. All rights reserved.
//

#import "FirstViewController.h"
#import "CircleView.h"

@implementation FirstViewController

- (void)viewDidLoad
{    
    ptsQueue = [NSMutableArray array];
    timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(checkQueue:) userInfo:nil repeats:YES];
    isMoving = NO;
    current = CGPointMake(100, 20);
    count = 0;
    
    self.circleView = [[CircleView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    self.circleView.center = current;
    self.circleView.label = [NSString stringWithFormat:@"%d", ++count];
    [self.view addSubview:self.circleView];
    
    UITapGestureRecognizer *g = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(addPoint:)];
    [[self view] addGestureRecognizer:g];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.circleView = nil;
}

- (void)checkQueue:(NSTimer *)theTimer
{
    if (!isMoving) {
        if ([ptsQueue count] > 0) {
            isMoving = YES;
            NSValue *val = [ptsQueue objectAtIndex:0];
            CGPoint pt = [val CGPointValue];
            
            double duration = [self calculateDuration:pt];
            NSLog(@"%f", duration);
            self.circleView.label = [NSString stringWithFormat:@"%d", ++count];
            [self.circleView setNeedsDisplay];
            current = pt;
            
            [UIView animateWithDuration:(duration * 3) animations:^{
                self.circleView.center = pt;
            } completion:^(BOOL finished){
                [ptsQueue removeObjectAtIndex:0];
                isMoving = NO;
            }];
        }
    }
}

- (double)calculateDuration:(CGPoint)p
{
    return sqrt(pow(p.x - current.x, 2.0) + pow(p.y - current.y, 2.0)) / 560.0;
}

- (void)addPoint:(UITapGestureRecognizer *)recognizer
{
    NSValue *val = [NSValue valueWithCGPoint:[recognizer locationInView:self.view]];
    [ptsQueue addObject:val];
}

@end
