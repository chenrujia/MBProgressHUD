//
//  MyCustomView.m
//  HudDemo
//
//  Created by rujia chen on 17/1/14.
//  Copyright © 2017年 Matej Bukovinski. All rights reserved.
//

#import "MyCustomView.h"
#import "CircleAnimationLayer.h"

@interface MyCustomView()

@property (nonatomic, strong) CircleAnimationLayer *animationLayer;

@end

@implementation MyCustomView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self.layer addSublayer:self.animationLayer];
    }
    
    return self;
}

- (CGSize)intrinsicContentSize {
    return CGSizeMake(50, 50);
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];
    [self play];
}

- (void)play {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"progress"];
    animation.duration = 1.5;
    animation.repeatCount = FLT_MAX;
    animation.fromValue = @0.0;
    animation.toValue = @1.0;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.animationLayer addAnimation:animation forKey:nil];
}

#pragma mark - getter

- (CircleAnimationLayer *)animationLayer {
    if (!_animationLayer) {
        _animationLayer = [CircleAnimationLayer layer];
        _animationLayer.contentsScale = [UIScreen mainScreen].scale;
        _animationLayer.progress = 1;
        _animationLayer.lineWidth = 6;
        _animationLayer.bounds = CGRectMake(0, 0, self.intrinsicContentSize.width, self.intrinsicContentSize.height);
        _animationLayer.color = [UIColor colorWithRed:0.91f green:0.71f blue:0.49f alpha:1.00f];
        _animationLayer.circleBgColor = [UIColor colorWithRed:0.96f green:0.86f blue:0.73f alpha:1.00f];
        _animationLayer.position = CGPointMake(CGRectGetMidX(_animationLayer.bounds), CGRectGetMidY(_animationLayer.bounds));
    }
    
    return _animationLayer;
}

@end
