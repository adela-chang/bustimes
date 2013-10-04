//
//  TimesViewController.h
//  bustimes
//
//  Created by Adela Chang on 2013/09/13.
//  Copyright (c) 2013年 Adela Chang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Utilities.h"

@interface LSViewController : UIViewController {
    IBOutlet UITextView *info;
    IBOutlet UIBarButtonItem *refresh;
}
@property (nonatomic, retain) IBOutlet UITextView *info;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *refresh;

@end
