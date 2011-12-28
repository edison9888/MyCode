//
//  ViewController.m
//  iOSUIBaseClass
//
//  Created by  on 2011/12/26.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

@synthesize deviceNameLabel,deviceSyatemNameLabel,deviceSystemVersionLabel,deviceModelLabel,deviceLocalizedModelLabel;
@synthesize batterStatusLabel,batterLevelLabel;
@synthesize proximityLabel,orientationLabel;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIDevice *device = [UIDevice currentDevice];
    
    //NSLog(@"%@",device.uniqueIdentifier);//iOS5過期
    
    deviceNameLabel.text = device.name;
    deviceSyatemNameLabel.text = device.systemName;
    deviceSystemVersionLabel.text = device.systemVersion;
    deviceModelLabel.text = device.model;
    deviceLocalizedModelLabel.text = device.localizedModel;
    
    //設備方向
    if (device.orientation == UIDeviceOrientationPortrait) {
        orientationLabel.text = @"UIDeviceOrientationPortrait";
    } else if (device.orientation == UIDeviceOrientationPortraitUpsideDown){
        orientationLabel.text = @"UIDeviceOrientationPortraitUpsideDown";
    }else if (device.orientation == UIDeviceOrientationLandscapeLeft){
        orientationLabel.text = @"UIDeviceOrientationLandscapeLeft";
    }else if (device.orientation == UIDeviceOrientationLandscapeRight){
        orientationLabel.text = @"UIDeviceOrientationLandscapeRight";
    }else if (device.orientation == UIDeviceOrientationUnknown){
        orientationLabel.text = @"UnKnown";
    }
    
    //啓動電池監測
    [device setBatteryMonitoringEnabled:YES];
    NSString *batterLevel = [[NSString alloc]initWithFormat:@"%lf",device.batteryLevel];
    batterLevelLabel.text = batterLevel;
    
    if (device.batteryState == UIDeviceBatteryStateUnknown) {
        batterStatusLabel.text = @"Unknown";
    }else if (device.batteryState == UIDeviceBatteryStateUnplugged){
        batterStatusLabel.text = @"Unplugged";
    }else if (device.batteryState == UIDeviceBatteryStateCharging){
        batterStatusLabel.text = @"Charging";
    }else if (device.batteryState == UIDeviceBatteryStateFull){
        batterStatusLabel.text = @"Full";
    }
    
    //啓動距離監測器
    device.proximityMonitoringEnabled = YES;
    proximityLabel.text = [NSString stringWithFormat:@"%@", UIDeviceProximityStateDidChangeNotification];

//    NSLog(@"設備名稱：%@", device.name);
//    NSLog(@"作業系統名稱：%@",device.systemName);
//    NSLog(@"作業系統版本：%@",device.systemVersion);
//    NSLog(@"設備的型號：%@",device.model);
//    NSLog(@"設備的型號(以本土化訊息顯示)：%@",device.localizedModel);
//    NSLog(@"設備的方向：%@",device.orientation);
    
    [deviceNameLabel release];
    [deviceSyatemNameLabel release];
    [deviceSystemVersionLabel release];
    [deviceModelLabel release];
    [deviceLocalizedModelLabel release];
    
    [batterLevel release];
    [batterStatusLabel release];
    [batterLevelLabel release];
    
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
