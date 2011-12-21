//
//  ViewController.m
//  NSTimerSample
//
//  Created by  on 2011/12/21.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle
- (void) handleTimer: (NSTimer *) timer
{
    //在这里进行处理
    NSLog(@"*");
}
- (void)viewDidLoad
{
    [super viewDidLoad];
//----------------------------------------
//每隔一秒執行一次 handleTimer
    NSTimer *timer;
    timer = [NSTimer scheduledTimerWithTimeInterval: 1.0
                                             target: self
                                           selector: @selector(handleTimer:)
                                           userInfo: nil
                                            repeats: YES];
//----------------------------------------
    //Interval區間
    NSTimeInterval time = [[NSDate date] timeIntervalSince1970];
    NSLog(@"顯示由1970至當前的秒數為：%f", time);
//----------------------------------------
    //轉換時間格式
    // The time interval
    NSTimeInterval theTimeInterval = time;
    
    // Get the system calendar
    NSCalendar *sysCalendar = [NSCalendar currentCalendar];
    
    // Create the NSDates
    NSDate *date1 = [[NSDate alloc] init];
    NSDate *date2 = [[NSDate alloc] initWithTimeInterval:theTimeInterval sinceDate:date1];
    
    // Get conversion to months, days, hours, minutes, seconds
    unsigned int unitFlags = NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSDayCalendarUnit | NSMonthCalendarUnit;
    NSDateComponents *conversionInfo = [sysCalendar components:unitFlags fromDate:date1  toDate:date2  options:0];
    
    NSLog(@"Conversion: %dsec %dmin %dhours %ddays %dmoths", [conversionInfo second], [conversionInfo minute], [conversionInfo hour], [conversionInfo day], [conversionInfo month]);
    
    [date1 release];
    [date2 release];

    
//----------------------------------------
    
    
//    //倒數計時
//    myTimer= [NSTimer scheduledTimerWithTimeInterval:5.0f
//                                              target:self
//                                            selector:@selector(playSound)
//                                            userInfo:nil
//                                             repeats:YES];
//    //顯示導數計時時間
//    NSLog(@"myTimer.fireDate is %@",myTimer.fireDate);
//    NSLog(@"[NSDate date] is %@",[NSDate date]);
//    
//    //方法一 timeIntervalSinceDate
//    NSTimeInterval interval01 = [myTimer.fireDate timeIntervalSinceDate:[NSDate date]];
//    float interval01bySec=((float)interval01);
//    NSLog(@"interval01bySec is %f sec",interval01bySec);
//    
//    //方法二 timeIntervalSinceNow
//    NSTimeInterval interval02 = [myTimer.fireDate timeIntervalSinceNow];
//    float interval02bySec=((float)interval02);
//    NSLog(@"interval02bySec is %f sec",interval02bySec);
    
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
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

@end
