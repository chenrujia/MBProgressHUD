//
//  CircleAnimationLayer.m
//  HudDemo
//
//  Created by rujia chen on 17/1/14.
//  Copyright © 2017年 Matej Bukovinski. All rights reserved.
//

#import "CircleAnimationLayer.h"

@implementation CircleAnimationLayer

@dynamic progress;
@dynamic color;
@dynamic lineWidth;
@dynamic circleBgColor;

+ (BOOL)needsDisplayForKey:(NSString *)key {
    if ([key isEqualToString:@"progress"]) {
        return YES;
    } else if ([key isEqualToString:@"color"]) {
        return YES;
    } else if ([key isEqualToString:@"lineWidth"]) {
        return YES;
    }
    
    return [super needsDisplayForKey:key];
}

- (void)drawInContext:(CGContextRef)ctx {
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    CGFloat radius = MIN(CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds)) / 2 - self.lineWidth / 2;
    CGPoint center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    
    CGFloat originStart = -M_PI_2;
    CGFloat originEnd = -M_PI_2 + 2 * M_PI;
    CGFloat currentOrigin = 0;
    
    CGFloat destStart = -M_PI_2;
    CGFloat destEnd = -M_PI_2 + 2 * M_PI;
    CGFloat currentDest = 0;
    
    if (self.progress<.5) {
        currentOrigin = -M_PI_2;
        currentDest = destStart - (destStart - destEnd) * self.progress * 2;
    }else {
        currentOrigin = originStart - (originStart - originEnd) * self.progress * 2;
        currentDest = -M_PI_2 + 2 * M_PI;
    }
    
    UIBezierPath *path2 = [UIBezierPath bezierPath];
    [path2 addArcWithCenter:center radius:radius startAngle:originStart endAngle:originEnd clockwise:YES];
    CGContextAddPath(ctx, path2.CGPath);
    CGContextSetLineWidth(ctx, self.lineWidth);
    CGContextSetStrokeColorWithColor(ctx, self.circleBgColor.CGColor);
    CGContextStrokePath(ctx);
    
    [path addArcWithCenter:center radius:radius startAngle:currentOrigin endAngle:currentDest clockwise:YES];
    
    CGContextAddPath(ctx, path.CGPath);
    CGContextSetLineWidth(ctx, self.lineWidth);
    CGContextSetStrokeColorWithColor(ctx, self.color.CGColor);
    CGContextSetLineCap(ctx, kCGLineCapRound);
    CGContextStrokePath(ctx);
}

@end
