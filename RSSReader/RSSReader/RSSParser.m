//
//  RSSParser.m
//  RSSReader
//
//  Created by  on 2012/1/9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "RSSParser.h"
#import "RSSObject.h"

@implementation RSSParser

- (id) initWithData:(NSData *) data{
    self = [self init];
    NSXMLParser *parser = [[[NSXMLParser alloc]initWithData:data]autorelease];
    rssItems = [[NSMutableArray alloc]init];
    parser.delegate = self;
    [parser parse];
    titleFound = NO;
    descFound = NO;
    linkFound = NO;
    return self;
}
- (void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    
    if (itemFound) {
        if ([elementName isEqualToString:@"title"]) {
            titleFound = YES;
        } else if ([elementName isEqualToString:@"description"]){
            descFound = YES;
        } else if ([elementName isEqualToString:@"link"]){
            linkFound = YES;
        }      
    }
      
    if ([elementName isEqualToString:@"item"]) {
        itemFound = YES;
    }
}

- (void) parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    
    if ([elementName isEqualToString:@"item"]) {
        itemFound = NO;
    }
    
    if (itemFound) {
        if ([elementName isEqualToString:@"title"]) {
            titleFound = NO;
        } else if ([elementName isEqualToString:@"description"]){
            descFound = NO;
        } else if ([elementName isEqualToString:@"link"]){
            linkFound = NO;
        }
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    
    if (itemFound) {
        string = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
        if ([string length] == 0) {
            return;
        }
        if (titleFound) {
            title = string;
            NSLog(@"title = %@",title);
        }
        if (linkFound) {
            link = string;
            NSLog(@"link = %@",link);
        }
        if (descFound) {
            RSSObject *rss = [[RSSObject alloc] init];
            rss.title = title;
            rss.link = link;
            rss.desc = string;
            [rssItems addObject:rss];
            [rss release];
        }
    }
}

- (NSMutableArray *) result{
    return rssItems;
}

- (void)dealloc{
    
    [rssItems release];
    [super release];
}
@end
