//
//  AlarmDB.h
//  teeptrak
//
//  Created by jackson on 2/10/16.
//  Copyright © 2016 steve. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TouchDB : NSObject

+ (TouchDB *) dbInstance;

- (id) initWithFile: (NSString *) fileName;
-(void) close;

#pragma mark - Notification message

- (void) saveTouchData:(NSMutableArray *) arrTouchData;
@end
