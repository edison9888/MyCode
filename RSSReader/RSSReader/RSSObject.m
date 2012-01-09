//
//  RSSObject.m
//  RSSReader
//
//  Created by  on 2012/1/9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "RSSObject.h"

@implementation RSSObject
@synthesize title,desc,link;

- (void)dealloc{
    
    [title release];
    [desc release];
    [link release];
    [super release];
    
}

@end
