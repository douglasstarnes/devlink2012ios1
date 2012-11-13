//
//  CoreTextView.m
//  CoreTextDemo2
//
//  Created by DOUGLAS STARNES on 8/22/12.
//  Copyright (c) 2012 Douglas Starnes. All rights reserved.
//

#import "CoreTextView.h"
#import <CoreText/CoreText.h>

@implementation CoreTextView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // attributes for the string
    NSMutableDictionary *attrDict = [[NSMutableDictionary alloc] init];
    
    // font Arial size 20
    CTFontRef fontRef = CTFontCreateWithName((__bridge CFStringRef)@"Arial", 20.0, NULL);
    [attrDict setObject:(__bridge id)fontRef forKey:(__bridge NSString*)kCTFontAttributeName];
    CFRelease(fontRef);
    
    // color blue
    [attrDict setObject:(__bridge id)[UIColor blueColor].CGColor forKey:(__bridge NSString *)kCTForegroundColorAttributeName];
    // single underline
    [attrDict setObject:(id)[NSNumber numberWithInt:kCTUnderlineStyleSingle] forKey:(__bridge NSString *)kCTUnderlineStyleAttributeName];
    // purple underline
    [attrDict setObject:(__bridge id)[UIColor purpleColor].CGColor forKey:(__bridge NSString*)kCTUnderlineColorAttributeName];
    
    // the string to print
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:@"Hello DevLink" attributes:attrDict];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // these three lines flip the screen
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGContextTranslateCTM(context, 0, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    // create a path to show the text within
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, self.bounds);
    
    // the framesetter generates frames
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef)attrString);
    // the frame is a range of text to display
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, attrString.length), path, NULL);
    // draw the frame
    CTFrameDraw(frame, context);
    
    // release the resources
    CFRelease(frame);
    CFRelease(path);
    CFRelease(framesetter);
    
}


@end
