//
//  ViewController.m
//  SampleTimeClock
//
//  Created by  on 2011/12/21.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize lblclockdate;
@synthesize lblclocktime;
@synthesize lblclockweek;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.showTime;
    
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(showTime) userInfo:nil repeats:YES];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [lblclockdate release];
    [lblclocktime release];
    [lblclockweek release];
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


- (void)showTime {
    
    NSDate *now = [NSDate date];        
    
    //取得日期與時間的各項整數型資料
    int nowyear=[[now dateWithCalendarFormat:nil timeZone:nil] yearOfCommonEra];        
    int nowmonth=[[now dateWithCalendarFormat:nil timeZone:nil] monthOfYear];
    int nowday=[[now dateWithCalendarFormat:nil timeZone:nil] dayOfMonth];
    int nowhour =  [[now dateWithCalendarFormat:nil timeZone:nil] hourOfDay];
    int nowmin =  [[now dateWithCalendarFormat:nil timeZone:nil] minuteOfHour];
    int nowsec =  [[now dateWithCalendarFormat:nil timeZone:nil] secondOfMinute];        
    int nowweek=[[now dateWithCalendarFormat:nil timeZone:nil] dayOfWeek];
    
    
    NSString *nowweekstr;
    
    //將星期的數字轉為字串
    switch (nowweek)
    {
        case 1:
            nowweekstr=@"星期一";
            break;
        case 2:
            nowweekstr=@"星期二";
            break;
        case 3:
            nowweekstr=@"星期三";
            break;
        case 4:
            nowweekstr=@"星期四";
            break;
        case 5:
            nowweekstr=@"星期五";
            break;
        case 6:
            nowweekstr=@"星期六";
            break;
        case 0:
            nowweekstr=@"星期日";
            break;
            
    }
    
    //指定給Label顯示
    lblclockdate.text = [NSString stringWithFormat:@"%04d/%02d/%02d",nowyear,nowmonth,nowday];
    lblclocktime.text = [NSString stringWithFormat:@"%02d:%02d:%02d",nowhour, nowmin,nowsec];
    lblclockweek.text = nowweekstr;
}

@end
