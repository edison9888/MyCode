//
//  ViewController.m
//  TestConnectNetwork
//
//  Created by  on 2011/12/21.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize netConnection;

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
}

- (void)viewDidUnload
{
    [self.netConnection release];
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

- (void)startConnection {
    // Connection Request
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.google.com"]];
    
    self.netConnection = [[[NSURLConnection alloc] initWithRequest:request delegate:self] autorelease];
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

// -------------
//	handleError:error
// -------------
- (void)handleError:(NSError *)error
{
    NSString *errorMessage = [error localizedDescription];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Connect Test"
                                                        message:errorMessage
                                                       delegate:self
                                              cancelButtonTitle:@"Cancel"
                                              otherButtonTitles:@"Retry", nil];
    [alertView show];
    [alertView release];
}


// -------------
//	connection:didReceiveResponse:response
// -------------
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSLog(@"%@", @"didReceiveResponse");
}


// -------------
//	connection:didReceiveData:data
// -------------
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSLog(@"%@", @"didReceiveData");
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"%@", @"didFailWithError");
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
    if ([error code] == kCFURLErrorNotConnectedToInternet) {
        // if we can identify the error, we can present a more precise message to the user.
        NSDictionary *userInfo = [NSDictionary dictionaryWithObject:@"Connection Failed"
                                                             forKey:NSLocalizedDescriptionKey];
        
        NSError *noConnectionError = [NSError errorWithDomain:NSCocoaErrorDomain
                                                         code:kCFURLErrorNotConnectedToInternet
                                                     userInfo:userInfo];
        [self handleError:noConnectionError];
        
    } else {
        
        // otherwise handle the error generically
        [self handleError:error];
        
    }
    
    self.netConnection = nil;   // release connection
}


// -------------
//	connectionDidFinishLoading:connection
// -------------
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    self.netConnection = nil;   // release connection
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
	// show successful
	UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Connect Test"
                                                        message:@"Connection Successful"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
    [alertView show];
    [alertView release];
    
    NSLog(@"%@", @"connectionDidFinishLoading");
}


// -----
// alertView:alertView clickedButtonAtIndex:buttonIndex
// -----
- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
	switch (buttonIndex) {
		case 0:
			NSLog(@"Button Cancel Pressed");
			break;
		case 1:
			NSLog(@"Button Retry Pressed");
			[self startConnection];
			break;
            
		default:
			break;
	}
}
@end
