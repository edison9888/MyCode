//
//  RSSContentViewController.m
//  RSSReader
//
//  Created by  on 2012/1/9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "RSSContentViewController.h"

@implementation RSSContentViewController

- (void) setText:(NSString *) text{
    UITextView *view = (UITextView *)[self view];
    [view setText:text];
}

@end
