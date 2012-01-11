//
//  Event.h
//  CoreDataDemo
//
//  Created by  on 2012/1/9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class User;

@interface Event : NSManagedObject

@property (nonatomic, retain) NSString * desc;
@property (nonatomic, retain) NSDate * timeStamp;
@property (nonatomic, retain) NSSet *users;
@end

@interface Event (CoreDataGeneratedAccessors)

- (void)addUsersObject:(User *)value;
- (void)removeUsersObject:(User *)value;
- (void)addUsers:(NSSet *)values;
- (void)removeUsers:(NSSet *)values;
@end
