//
//  SettingsViewController.h
//  bustimes
//
//  Created by Adela Chang on 2013/09/25.
//  Copyright (c) 2013年 Adela Chang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController {
    IBOutlet UIPickerView * pickerView;
    IBOutlet UIButton *save;
    IBOutlet UIImageView *arrow;
}


@property (nonatomic, retain) IBOutlet UIPickerView *pickerView;
@property (nonatomic, retain) IBOutlet UIButton *save;
@property (nonatomic, retain) IBOutlet UIImageView *arrow;

@end
