//
//  RectanglesView.m
//  CustomViewDemo
//
//  Created by DOUGLAS STARNES on 8/27/12.
//  Copyright (c) 2012 Douglas Starnes. All rights reserved.
//

#import "RectanglesView.h"

@interface RectanglesView ()
{
    NSArray *colors;
}
@end


@implementation RectanglesView

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
        int sideX = random() % 80;
        int sideY = random() % 80;
        int x = random() % (int)self.bounds.size.width;
        int y = random() % (int)self.bounds.size.height;
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextFillRect(context, CGRectMake(x, y, sideX + 20, sideY + 20));
    }
}

@end
