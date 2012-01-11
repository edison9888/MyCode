//
//  ViewController.h
//  TextZXingQRCode
//
//  Created by  on 2012/1/10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZXingWidgetController.h"

@interface ViewController : UIViewController <ZXingDelegate>{

    UITextView *resultView;
    NSString *resultText;
    
}
@property (nonatomic, retain) IBOutlet UITextView *resultView;
@property (nonatomic, retain) IBOutlet NSString *resultText;

- (IBAction)scanPressed:(id)sender;

@end
