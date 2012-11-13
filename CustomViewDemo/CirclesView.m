//
//  CirclesView.m
//  CustomViewDemo
//
//  Created by DOUGLAS STARNES on 8/27/12.
//  Copyright (c) 2012 Douglas Starnes. All rights reserved.
//

#import "CirclesView.h"

@interface CirclesView ()
{
    NSArray *colors;
}
@end

@implementation CirclesView

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
        int side = random() % 100;
        int x = random() % (int)self.bounds.size.width;
        int y = random() % (int)self.bounds.size.height;
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextFillEllipseInRect(context, CGRectMake(x, y, side, side));
    }
}


@end
