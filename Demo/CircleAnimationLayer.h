//
//  CircleAnimationLayer.h
//  HudDemo
//
//  Created by rujia chen on 17/1/14.
//  Copyright © 2017年 Matej Bukovinski. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CircleAnimationLayer : CALayer

@property (nonatomic, assign) CGFloat progress;

@property (nonatomic) UIColor *color;

@property (nonatomic) UIColor *circleBgColor;

@property (nonatomic) CGFloat lineWidth;

@end
