//
//  ViewController.m
//  TestGradientImage2
//
//  Created by  on 2011/12/27.
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    //http://furnacedigital.blogspot.com/2011/07/gradient_14.html
    //使用RGB顏色模型
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    
    //漸層中所包含的關鍵顏色 RGBA
    CGFloat components[] = {1.0, 0.0, 0.0, 1.0, //紅色 不透明
        0.0, 1.0, 0.0, 1.0, //綠色 不透明
        0.0, 0.0, 1.0, 1.0, //藍色 不透明
        1.0, 0.0, 0.0, 1.0};//紅色 不透明
    
    //關鍵顏色所出現的位置
    CGFloat locations[] = {0.0, 0.33, 0.66, 1.0};
    
    //關鍵顏色的個數
    size_t count = 4;
    
    //製作漸層顏色模型
    CGGradientRef gradient = CGGradientCreateWithColorComponents(rgb, components, locations, count);
    CGColorSpaceRelease(rgb);
    
    //製作ImageView
    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(10.0, 100.0, 30.0, 300.0)];
    //UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)]; 
    
    //開始繪圖
    UIGraphicsBeginImageContext(imageView1.frame.size);
    //UIGraphicsBeginImageContext(imageView2.frame.size);
    
    //指定畫布
    CGContextRef context1 = UIGraphicsGetCurrentContext();
    //CGContextRef context2 = UIGraphicsGetCurrentContext();
    
    //繪製漸層線條並儲存畫布
    //(畫布，漸層模型，起點，終點)
    CGContextDrawLinearGradient(context1, gradient, CGPointMake(0.0, 0.0), CGPointMake(0., 100.0), 0);
    CGContextSaveGState(context1);
    //
    //CGContextDrawRadialGradient(context2, gradient, CGPointMake(150, 150), 0, CGPointMake(150, 150), 10, 0);
    //CGContextSaveGState(context2);
    
    //將畫布指定給ImageView
    imageView1.image = UIGraphicsGetImageFromCurrentImageContext();
    //imageView2.image = UIGraphicsGetImageFromCurrentImageContext();
    
    //結束繪圖
    UIGraphicsEndImageContext();
    
    //將ImageView顯示於畫面
    [self.view addSubview:imageView1];
    //[self.view addSubview:imageView2];
    [imageView1 release];
    //[imageView2 release];
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
