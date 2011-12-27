//
//  ViewController.h
//  iOSUIBaseClass
//
//  Created by  on 2011/12/26.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{

    UILabel *deviceNameLabel;
    UILabel *deviceSyatemNameLabel;
    UILabel *deviceSystemVersionLabel;
    UILabel *deviceModelLabel;
    UILabel *deviceLocalizedModelLabel;
    UILabel *batterStatusLabel;
    UILabel *batterLevelLabel;
    
    UILabel *proximityLabel;
}

@property (nonatomic, retain) IBOutlet UILabel *deviceNameLabel;
@property (nonatomic, retain) IBOutlet UILabel *deviceSyatemNameLabel;
@property (nonatomic, retain) IBOutlet UILabel *deviceSystemVersionLabel;
@property (nonatomic, retain) IBOutlet UILabel *deviceModelLabel;
@property (nonatomic, retain) IBOutlet UILabel *deviceLocalizedModelLabel;
@property (nonatomic, retain) IBOutlet UILabel *batterStatusLabel;
@property (nonatomic, retain) IBOutlet UILabel *batterLevelLabel;

@property (nonatomic, retain) IBOutlet UILabel *proximityLabel;

@end
