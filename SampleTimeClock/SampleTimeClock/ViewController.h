//
//  ViewController.h
//  SampleTimeClock
//
//  Created by  on 2011/12/21.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    IBOutlet UILabel *lblclockdate;
    IBOutlet UILabel *lblclocktime;
    IBOutlet UILabel *lblclockweek;
}

@property (nonatomic,retain) UILabel *lblclockdate;
@property (nonatomic,retain) UILabel *lblclocktime;
@property (nonatomic,retain) UILabel *lblclockweek;

- (void)showTime;

@end
