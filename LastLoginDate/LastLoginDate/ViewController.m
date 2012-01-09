//
//  ViewController.m
//  LastLoginDate
//
//  Created by  on 2012/1/9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize lastLoginLabel;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    lastLoginLabel.text = [self loadLastTime];
}

- (void)viewDidUnload
{
    [self saveLastTime];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}
- (NSString *) formatDate:(NSData *)date{
    NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc]init]autorelease];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    return [dateFormatter stringFromDate:date];
}
- (NSString *) logFile{
    NSString *docPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    return [docPath stringByAppendingPathComponent:@"logfile.plist"];
}
- (NSString *) loadLastTime{
    NSString *filename = [self logFile];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:filename];
    if (dict == nil) {
        NSString *defaultValue = [self formatDate:[NSDate date]];
        return defaultValue;
    } else {
        return [dict objectForKey:@"last login time"];
    }
}
- (void) saveLastTime{
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:[self formatDate:[NSDate date]],@"last login time", nil];
    [dict writeToFile:[self logFile] atomically:YES];
}

@end
