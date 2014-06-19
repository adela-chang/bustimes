//
//  DisplayBusLinesViewController.h
//  bustimes
//
//  Created by Adela Chang on 2014/06/19.
//  Copyright (c) 2014年 Adela Chang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DisplayBusLinesViewController : UIViewController

@property (nonatomic, weak) IBOutlet UITextView *info;
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;

@property (nonatomic, strong) NSArray *busids;
@property (nonatomic, strong) NSString *busGrpTitle;

/**
 * Indicates whether these bus lines are leaving adela's apt or going towards adela's apt
 * @return true if leaving, false if going home
 */
@property (nonatomic) bool leaving;


- (IBAction) back;
- (IBAction) home;

@end
