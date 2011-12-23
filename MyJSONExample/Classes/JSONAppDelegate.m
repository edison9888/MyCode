//
//  JSONAppDelegate.m
//  JSON
//
//  Created by Lawrence on 27/08/2010.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "JSONAppDelegate.h"

@implementation JSONAppDelegate

@synthesize window;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    //由本機讀取JSON資料
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];
    NSString *jsonStr = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    
    
    /*
     //從網路讀去JSON資料
     NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://pro.ctlok.com/data.json"]];  
     NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];  
     NSString *jsonStr = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
     */
    
    SBJsonParser *parser = [[SBJsonParser alloc] init];
    NSDictionary *json = [parser objectWithString:jsonStr error:nil];
    //Laevl1
    NSDictionary *glossary = [json objectForKey:@"glossary"];
    NSString *glossaryTitle = [glossary objectForKey:@"title"];
    //Laevl2
    NSDictionary *glossDiv = [glossary objectForKey:@"GlossDiv"];
    NSString *glossDivTitle = [glossDiv objectForKey:@"title"];
    //Laevl3
    NSDictionary *glossList = [glossDiv objectForKey:@"GlossList"];
    //Laevl4
    NSDictionary *glossEntry = [glossList objectForKey:@"GlossEntry"];
    NSString *glossEntryAbbrev = [glossEntry objectForKey:@"Abbrev"];
    NSString *glossEntryAcronym = [glossEntry objectForKey:@"Acronym"];
    NSString *glossEntryGlossSee = [glossEntry objectForKey:@"GlossSee"];
    NSString *glossEntryID = [glossEntry objectForKey:@"ID"];
    
    NSArray *glossSeeAlso = [[[[glossDiv objectForKey:@"GlossList"] 
                               objectForKey: @"GlossEntry"] 
                                    objectForKey: @"GlossDef"] 
                                        objectForKey: @"GlossSeeAlso"];
    
    NSLog(@"Glossary Title: %@", glossaryTitle);
    NSLog(@"GlossDiv Title : %@", glossDivTitle);
    
    NSLog(@"GlossSeeAlso item 1: %@", [glossSeeAlso objectAtIndex:0]);
    NSLog(@"GlossSeeAlso item 2: %@", [glossSeeAlso objectAtIndex:1]);
    
    NSLog(@"Test %@",glossEntryAbbrev);
    NSLog(@"Test %@",glossEntryAcronym);
    NSLog(@"Test %@",glossEntryGlossSee);
    NSLog(@"Test %@",glossEntryID);
    
    [parser release];
	
    [window makeKeyAndVisible];
	
	return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
