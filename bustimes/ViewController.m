//
//  ViewController.m
//  bustimes
//
//  Created by Adela Chang on 2013/09/12.
//  Copyright (c) 2013年 Adela Chang. All rights reserved.
//

#import "ViewController.h"
#import "BusFolderController.h"

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

}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];
    
    /*BusFolderController *viewControllerB = [[BusFolderController alloc] init];
    [self presentViewController:viewControllerB animated:YES completion:NULL];*/

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
