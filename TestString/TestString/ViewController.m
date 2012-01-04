//
//  ViewController.m
//  TestString
//
//  Created by  on 2012/1/4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
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
	// Do any additional setup after loading the view, typically from a nib.
    
    //http://www.idev101.com/code/Objective-C/Strings/split.html
    //example_1
    NSString *myString1 = @"This is a test";
    NSArray *myWords1 = [myString1 componentsSeparatedByString:@" "];
    
    // myWords is now: [@"This", @"is", @"a", @"test"]
    NSLog(@"%@",myWords1);
    
    //example_2
    NSString *myString2 = @"Foo-bar/blee";
    NSArray *myWords2 = [myString2 componentsSeparatedByCharactersInSet:
                        [NSCharacterSet characterSetWithCharactersInString:@"-/"]
                        ];
    // myWords is now: [@"Foo", @"bar", @"blee"]
    NSLog(@"%@",myWords2);
    
    //example_3
    NSMutableArray *characters = [[NSMutableArray alloc] initWithCapacity:[myString1 length]];
    for (int i=0; i < [myString1 length]; i++) {
        NSString *ichar  = [NSString stringWithFormat:@"%c", [myString1 characterAtIndex:i]];
        [characters addObject:ichar];
    }
    NSLog(@"%@",characters);
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
