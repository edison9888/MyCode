//
//  ViewController.h
//  LastLoginDate
//
//  Created by  on 2012/1/9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    
    UILabel *lastLoginLabel;
}
@property (nonatomic, retain) IBOutlet UILabel *lastLoginLabel;

- (NSString *) formatDate:(NSData *)date;
- (NSString *) logFile;
- (NSString *) loadLastTime;
- (void) saveLastTime;

@end
