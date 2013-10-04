//
//  MsgViewController.m
//  bustimes
//
//  Created by Adela Chang on 2013/09/28.
//  Copyright (c) 2013年 Adela Chang. All rights reserved.
//

#import "MsgViewController.h"

@interface MsgViewController ()

@end

@implementation MsgViewController

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
    NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
    UILabel *empty = [[UILabel alloc] initWithFrame:CGRectMake(((self.view.bounds.size.width-200.0)/2.0), 120.0, 200.0, 150.0)];
    empty.textAlignment =  NSTextAlignmentCenter;
    empty.lineBreakMode = NSLineBreakByWordWrapping;
    empty.numberOfLines = 0;
    empty.textColor = [UIColor blackColor];
    //empty.backgroundColor = [UIColor blackColor];
    empty.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:(18.0)];
    [self.view addSubview:empty];
    empty.text = [standardDefaults stringForKey:_key];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
