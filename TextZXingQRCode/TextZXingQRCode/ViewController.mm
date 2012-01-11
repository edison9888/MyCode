//
//  ViewController.m
//  TextZXingQRCode
//
//  Created by  on 2012/1/10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "QRCodeReader.h"

@implementation ViewController
@synthesize resultText,resultView;

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
    self.title = @"Scan Result";
    //resultView.text = result;
    [resultView setText:resultText];
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

- (IBAction)scanPressed:(id)sender{
    
    ZXingWidgetController *scanController = [[ZXingWidgetController alloc]initWithDelegate:self showCancel:YES OneDMode:NO];
    QRCodeReader *qrcodeReader = [[QRCodeReader alloc]init];
    NSSet *reader = [[NSSet alloc]initWithObjects:qrcodeReader, nil];
    [qrcodeReader release];
    
    scanController.readers = reader;
    [reader release];
    
    NSBundle *mainBundle = [NSBundle mainBundle];
    scanController.soundToPlay = [NSURL fileURLWithPath:[mainBundle pathForResource:@"beep-beep" ofType:@"aiff"] isDirectory:NO];
    [self presentModalViewController:scanController animated:YES];
    [scanController release];
    
/*
 ZXingWidgetController *widController = [[ZXingWidgetController alloc] initWithDelegate:self showCancel:YES OneDMode:NO];
 QRCodeReader* qrcodeReader = [[QRCodeReader alloc] init];
 NSSet *readers = [[NSSet alloc ] initWithObjects:qrcodeReader,nil];
 [qrcodeReader release];
 widController.readers = readers;
 [readers release];
 NSBundle *mainBundle = [NSBundle mainBundle];
 widController.soundToPlay =
 [NSURL fileURLWithPath:[mainBundle pathForResource:@"beep-beep" ofType:@"aiff"] isDirectory:NO];
 [self presentModalViewController:widController animated:YES];
 [widController release];
 */
}
- (void)zxingController:(ZXingWidgetController *)controller didScanResult:(NSString *)result{
    self.resultText = result;
    if (self.isViewLoaded) {
        [resultView setText:result];
        [resultView setNeedsDisplay];
    }
    [self dismissModalViewControllerAnimated:NO];
}

- (void)zxingControllerDidCancel:(ZXingWidgetController *)controller{
    
    [self dismissModalViewControllerAnimated:YES];
}
/*
- (void)zxingController:(ZXingWidgetController*)controller didScanResult:(NSString *)result {
    self.resultsToDisplay = result;
    if (self.isViewLoaded) {
        [resultsView setText:resultsToDisplay];
        [resultsView setNeedsDisplay];
    }
    [self dismissModalViewControllerAnimated:NO];
}

- (void)zxingControllerDidCancel:(ZXingWidgetController*)controller {
    [self dismissModalViewControllerAnimated:YES];
}
 */
@end
