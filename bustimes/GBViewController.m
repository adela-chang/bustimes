//
//  GBViewController.m
//  bustimes
//
//  Created by Adela Chang on 2013/09/19.
//  Copyright (c) 2013年 Adela Chang. All rights reserved.
//

#import "GBViewController.h"

@interface GBViewController ()

@end

@implementation GBViewController
@synthesize info;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    Utilities *u = [[Utilities alloc] init];
    [u setTextViewWithTags:info :2,55551,55559];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
