//
//  ViewController.m
//  TestAddress
//
//  Created by  on 2012/1/9.
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
    //建立電話簿物件
    ABAddressBookRef addressBook = ABAddressBookCreate();
    
    //取出聯絡人資料
    NSArray *people = (NSArray *)ABAddressBookCopyArrayOfAllPeople(addressBook);
    for (int i = 0; i < [people count]; i++) {
        ABRecordRef record = [people objectAtIndex:i];
        NSLog(@"聯絡人：%@",record);
        
        //取得聯絡人的first name
        NSString *firstName = [(NSString *)ABRecordCopyValue(record, kABPersonFirstNameProperty)autorelease];
        NSLog(@"First Name：%@",firstName);
        NSString *lastName = [(NSString *)ABRecordCopyValue(record, kABPersonLastNameProperty)autorelease];
        NSLog(@"Last Name：%@",lastName);
        
    }
    
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
