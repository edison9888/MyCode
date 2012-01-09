//
//  RSSParser.h
//  RSSReader
//
//  Created by  on 2012/1/9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSSParser : NSObject <NSXMLParserDelegate>{
    
    BOOL itemFound;
    BOOL titleFound;
    BOOL descFound;
    BOOL linkFound;
    NSString *title;
    NSString *link;
    NSMutableArray *rssItems;
}
- (NSMutableArray *) result;

@end
