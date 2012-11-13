//
//  CircleView.m
//  Animating
//
//  Created by DOUGLAS STARNES on 8/12/12.
//  Copyright (c) 2012 Douglas Starnes. All rights reserved.
//

#import "CircleView.h"

@implementation CircleView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
        self.opaque = NO;
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [[UIColor redColor] setFill];
    [[UIBezierPath bezierPathWithOvalInRect:self.bounds] fill];
    [[UIColor blackColor] set];
    [self.label drawInRect:rect withFont:[UIFont boldSystemFontOfSize:14.0f]];
}

@end
