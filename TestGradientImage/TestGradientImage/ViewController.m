//
//  ViewController.m
//  TestGradientImage
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
    //影響漸層遮色片範圍
    CGSize size=CGSizeMake(300, 100);
    //漸層位置
    CGRect rect=CGRectMake(0, 100, 320,100);
    UIGraphicsBeginImageContext(size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGColorSpaceRef myColorspace=CGColorSpaceCreateDeviceRGB();
    
    //顏色的分配，值在0跟1之間
    //RGBA
    CGFloat locations[4] = { 0, 0, 0, 1 };
    
    //顏色的陣列，四個一組分別為R,G,B,A
    CGFloat components[16] = { 
        1,1,1,1.000,
        1,1,1,1.000,
        1,1,1,1.000,
        0,0,0,1.000
    };
    
    //建立一個漸層的物件，最後“4"是代表顏色數量。
    CGGradientRef myGradient = CGGradientCreateWithColorComponents(myColorspace, components, locations,4);
    
    CGContextDrawLinearGradient(context, myGradient, CGPointMake(0,0), CGPointMake(0,rect.size.height), 0); 
    
    CGContextSaveGState(context);
    CGContextRestoreGState(context);
    
    CGImageRef theCGImage=CGBitmapContextCreateImage(context);
    
    //UIImage 漸層遮色片
    UIImage *image=[UIImage imageWithCGImage:theCGImage];
    //ImageView位置
    UIImageView *imageView=[[UIImageView alloc] initWithFrame:rect];
    [imageView setImage:image];
    
    [self.view addSubview:imageView];
    
    UIGraphicsEndImageContext();
    
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
