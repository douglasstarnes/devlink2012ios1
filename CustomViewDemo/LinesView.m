//
//  LinesView.m
//  CustomViewDemo
//
//  Created by DOUGLAS STARNES on 8/27/12.
//  Copyright (c) 2012 Douglas Starnes. All rights reserved.
//

#import "LinesView.h"

@interface LinesView ()
{
    NSArray *colors;
}

@end

@implementation LinesView

- (void)initialize
{
    colors = @[
    [UIColor blackColor],
    [UIColor grayColor],
    [UIColor redColor],
    [UIColor blueColor],
    [UIColor greenColor],
    [UIColor orangeColor],
    [UIColor purpleColor],
    [UIColor brownColor],
    [UIColor yellowColor],
    [UIColor magentaColor]
    ];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initialize];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    for (int i = 0; i < 25; i++) {
        NSLog(@"%d", [colors count]);
        UIColor *currentColor = [colors objectAtIndex:(random() % [colors count])];
        [currentColor set];
        int x1 = random() % (int)self.bounds.size.width;
        int x2 = random() % (int)self.bounds.size.width;
        int y1 = random() % (int)self.bounds.size.height;
        int y2 = random() % (int)self.bounds.size.height;
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextBeginPath(context);
        CGContextSetLineWidth(context, (random() % 9) + 1);
        CGContextMoveToPoint(context, x1, y1);
        CGContextAddLineToPoint(context, x2, y2);
        CGContextStrokePath(context);
    }
}


@end
