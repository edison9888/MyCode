//
//  RSSObject.h
//  RSSReader
//
//  Created by  on 2012/1/9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSSObject : NSObject{
    
    NSString *title;
    NSString *desc;
    NSString *link;
}

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *desc;
@property (nonatomic, retain) NSString *link;

@end
