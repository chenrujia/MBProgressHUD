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
    return CGSizeMake(75, 75);
}

- (void)play {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"progress"];
    animation.duration = 1;
    animation.repeatCount = FLT_MAX;
    animation.fromValue = @0.0;
    animation.toValue = @1.0;
//    animation.delegate = self;
//    [animation setValue:@"step1" forKey:kName];
    [self.animationLayer addAnimation:animation forKey:nil];
}

#pragma mark - getter

- (CircleAnimationLayer *)animationLayer {
    if (!_animationLayer) {
        _animationLayer = [CircleAnimationLayer layer];
        _animationLayer.progress = 1;
        _animationLayer.lineWidth = 2;
        _animationLayer.bounds = CGRectMake(0, 0, self.intrinsicContentSize.width, self.intrinsicContentSize.height);
        _animationLayer.color = [UIColor blueColor];
        _animationLayer.position = CGPointMake(CGRectGetMidX(_animationLayer.bounds), CGRectGetMidY(_animationLayer.bounds));
    }
    
    return _animationLayer;
}

@end
