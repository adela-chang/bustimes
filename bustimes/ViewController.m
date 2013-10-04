//
//  ViewController.m
//  bustimes
//
//  Created by Adela Chang on 2013/09/12.
//  Copyright (c) 2013年 Adela Chang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    CALayer *btnLayer = [_leaving layer];
    [btnLayer setMasksToBounds:YES];
    [btnLayer setCornerRadius:5.0f];
    btnLayer.borderWidth = 1;
    btnLayer.borderColor = [UIColor lightGrayColor].CGColor;

    
    
    FUIButton *newButton = [[FUIButton alloc] initWithFrame:(CGRectMake(100,100,100,30))];
    newButton.buttonColor = [UIColor whiteColor];
    newButton.shadowColor = [UIColor lightGrayColor];
    newButton.shadowHeight = 1.0f;
    newButton.cornerRadius = 6.0f;
    newButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [newButton setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
    [newButton setTitleColor:[UIColor darkTextColor] forState:UIControlStateHighlighted];
    [self.view addSubview:newButton];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
