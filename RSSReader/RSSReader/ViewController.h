//
//  ViewController.h
//  RSSReader
//
//  Created by  on 2012/1/9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RSSParser.h"
#import "RSSObject.h"
#import "RSSContentViewController.h"

@interface ViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>{
    
    NSMutableArray *rssContent;
	RSSParser *parser;
    UITableView *rssTableView;
}

@property (nonatomic, retain) IBOutlet UITableView *rssTableView;

@end
