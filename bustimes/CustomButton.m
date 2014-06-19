//
//  CustomButton.m
//  bustimes
//
//  Created by Adela Chang on 2013/10/03.
//  Copyright (c) 2013年 Adela Chang. All rights reserved.
//

#import "CustomButton.h"

@implementation CustomButton

#pragma mark Settings

- (void)setNormalColor:(UIColor *)normalColor {
    [self setBackgroundColor:normalColor];
    _normalColor = normalColor;
}

- (void)setHighlightedColor:(UIColor *)highlightedColor {
    _highlightedColor = highlightedColor;
}
#pragma mark Actions

- (void)didTapButtonForHighlight:(UIButton *)sender {
    [self setTintColor:[UIColor whiteColor]];
    [self setBackgroundColor:_highlightedColor];
}

- (void)didUnTapButtonForHighlight:(UIButton *)sender {
    [self setBackgroundColor:_normalColor];
    [self setTintColor:[UIColor blueColor]];
}

#pragma mark Initialization

- (void)setupButton {
    [self addTarget:self action:@selector(didTapButtonForHighlight:) forControlEvents:UIControlEventTouchDown];
    [self addTarget:self action:@selector(didUnTapButtonForHighlight:) forControlEvents:UIControlEventTouchUpInside];
    [self addTarget:self action:@selector(didUnTapButtonForHighlight:) forControlEvents:UIControlEventTouchUpOutside];
    CALayer *btnLayer = [self layer];
    [btnLayer setMasksToBounds:YES];
    [btnLayer setCornerRadius:5.0f];
    btnLayer.borderWidth = 1;
    btnLayer.borderColor = [UIColor lightGrayColor].CGColor;
    [self setNormalColor:[UIColor whiteColor]];
    [self setHighlightedColor:[UIColor blueColor]];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [self setTitleShadowColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    
}

- (id)init {
    self = [super init];
    if (self) {
        [self setupButton];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setupButton];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupButton];
    }
    return self;
}


@end
