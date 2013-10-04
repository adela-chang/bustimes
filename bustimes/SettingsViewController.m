//
//  SettingsViewController.m
//  bustimes
//
//  Created by Adela Chang on 2013/09/25.
//  Copyright (c) 2013年 Adela Chang. All rights reserved.
//

#import "SettingsViewController.h"
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


@interface SettingsViewController ()

@end

@implementation SettingsViewController
@synthesize pickerView, save;

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
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults boolForKey:@"hasInput"] == NO) {
        [self tutorialMessage];
    }
    /*CGSize pickerSize = [pickerView sizeThatFits:CGSizeZero];
    
    UIView *pickerTransformView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, pickerSize.width, pickerSize.height)];
    pickerTransformView.transform = CGAffineTransformMakeScale(1.0f, 0.2f);
    
    [pickerTransformView addSubview:pickerView];
    [self.view addSubview:pickerTransformView];*/
}

- (void)tutorialMessage
{
    UILabel *ohno = [[UILabel alloc] initWithFrame:CGRectMake(((self.view.bounds.size.width-200.0)/2.0), 70.0, 200.0, 50.0)];
    ohno.textAlignment =  NSTextAlignmentCenter;
    ohno.lineBreakMode = NSLineBreakByWordWrapping;
    ohno.numberOfLines = 0;
    ohno.textColor = UIColorFromRGB(0xFF0000);
    //empty.backgroundColor = [UIColor blackColor];
    ohno.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:(22.0)];
    [self.view addSubview:ohno];
    ohno.text = [NSString stringWithFormat: @"OH NO!!"];

    UILabel *empty = [[UILabel alloc] initWithFrame:CGRectMake(((self.view.bounds.size.width-200.0)/2.0), 120.0, 200.0, 150.0)];
    empty.textAlignment =  NSTextAlignmentCenter;
    empty.lineBreakMode = NSLineBreakByWordWrapping;
    empty.numberOfLines = 0;
    empty.textColor = [UIColor blackColor];
    //empty.backgroundColor = [UIColor blackColor];
    empty.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:(18.0)];
    [self.view addSubview:empty];
    empty.text = [NSString stringWithFormat: @"You have not input any custom bus stops yet!\n\nCreate new stop entries with the plus (+) button below."];
    [save setHidden:YES];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
