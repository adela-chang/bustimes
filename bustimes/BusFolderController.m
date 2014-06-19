//
//  BusController.m
//  bustimes
//
//  Created by Adela Chang on 2013/10/07.
//  Copyright (c) 2013年 Adela Chang. All rights reserved.
//

#import "BusFolderController.h"
#import "CustomButton.h"
#import "BusGroupController.h"

@interface BusFolderController ()

@end

@implementation BusFolderController

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

    
    // TEST CODE ///
    _currentFolder = @"main";
    NSArray *testArray = [[NSArray alloc] initWithObjects:@"button1", @"button2", @"button3", nil];
    [defaults setObject:testArray forKey:_currentFolder];
    [defaults setBool:NO forKey:@"main.containsFolders"];
    NSDictionary *testDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"55551", @"bart",
                              nil];
    [defaults setObject:testDict forKey:@"button1"];
    // END ///

    // check if this folder contains links to more folders or links to actual bus groups
    _containsFolders = [defaults boolForKey:[NSString stringWithFormat:@"%@.containsFolders", _currentFolder]];
    
    // iterate thru an array which contains the names ot(/links to) the next pages
    float width = self.view.frame.size.width;
    float height = 50.0;
    NSArray *arr = [defaults objectForKey:_currentFolder];
    for (id folder in arr) {
        height = height + 50.0;
        NSLog(@"%@", folder);
        CustomButton *button = [[CustomButton alloc] initWithFrame: CGRectMake((width/2)-75.0, height, 150.0 , 30.0)];
        [button setTitle:(NSString *)folder forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        // load either a page w/more links on it or a page with the actual bus times
        if (_containsFolders) {
            [button addTarget:self action:@selector(nextFolderView:) forControlEvents:UIControlEventTouchUpInside];
        } else {
            [button addTarget:self action:@selector(nextGroupView:) forControlEvents:UIControlEventTouchUpInside];
        }
        [self.view addSubview:button];
    }
    
}

- (void)nextFolderView: (id) sender
{
    NSString *viewName = ((UIButton*)sender).titleLabel.text;
    BusFolderController *next = [[BusFolderController alloc] init];
    next.currentFolder = viewName;
    [self presentViewController:next animated:YES completion:NULL];
}

- (void)nextGroupView: (id) sender
{
    NSString *grpName = ((UIButton*)sender).titleLabel.text;
    BusGroupController *next = [[BusGroupController alloc] init];
    next.groupName = grpName;
    [self presentViewController:next animated:YES completion:NULL];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
