//
//  ViewController.h
//  TestConnectNetwork
//
//  Created by  on 2011/12/21.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    
    NSURLConnection *netConnection;
}
@property (nonatomic, retain) NSURLConnection *netConnection;

- (IBAction)startConnection;

@end

/*
參考網址
http://whhnote.blogspot.com/2011/02/ios-dev-simple-internet-connection-test.html
 */
