//
//  GHViewController.m
//  bustimes
//
//  Created by Adela Chang on 2013/09/19.
//  Copyright (c) 2013年 Adela Chang. All rights reserved.
//

#import "GHViewController.h"

@interface GHViewController ()

@end

@implementation GHViewController
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
    [u setTextViewWithTags:info :2,53700,59555];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
