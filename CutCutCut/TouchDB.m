//
//  AlarmDB.m
//  teeptrak
//
//  Created by jackson on 2/10/16.
//  Copyright © 2016 steve. All rights reserved.
//

#import <UIKit/UIAlertView.h>
#import "ABSQLiteDB.h"
#import "ABRecordset.h"
#import "TouchDB.h"
#import "TouchData.h"

static TouchDB * _dbInstance;


@implementation TouchDB{
    id <ABDatabase> m_db;
}

- (id) init{
    return [self initWithFile: nil];
}

- (id) initWithFile:(NSString *)fileName{
    if (!(self = [super init])) return nil;
    
    _dbInstance = self;
    
    NSString *dbFilePath;
    NSArray *searchPaths = NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentFolderPath = searchPaths[0];
    dbFilePath = [documentFolderPath stringByAppendingPathComponent: fileName];
    
    BOOL myPathIsDir;
    BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath: dbFilePath isDirectory: &myPathIsDir];
	
    // backupDbPath allows for a pre-made database to be in the app. Good for testing
    NSString *backupDbPath = [[NSBundle mainBundle] pathForResource:@"TouchDB" ofType:@"db"];
    BOOL copiedBackupDb = NO;
    if (backupDbPath != nil) {
        copiedBackupDb = [[NSFileManager defaultManager] copyItemAtPath:backupDbPath toPath:dbFilePath error:nil];
    }
    
    // open SQLite db file
    m_db = [[ABSQLiteDB alloc] init];
    
    if(![m_db connect:dbFilePath]) {
        return nil;
    }
    
    if(!fileExists) {
        if(!backupDbPath || !copiedBackupDb)
            [self makeDB];
    }
    return self;
    
}


+ (TouchDB *) dbInstance {
    if (!_dbInstance) {
        return NULL;        
    }
    
    return _dbInstance;
}


- (void) close {
    [m_db close];
    _dbInstance = NULL;
}

//save login information
- (void) saveTouchData:(NSMutableArray *) arrTouchData{
    for(TouchData *td in arrTouchData){
        NSString *sql = [NSString stringWithFormat:@"insert into touchData(length, area, speed, pressure, accelX, accelY, accelZ, rotateX, rotateY, rotateZ, life, score) values(%f, %f, %f, %f, %f, %f, %f, %f, %f, %f, %f, %f);",
                         td->m_fLength, td->m_fArea, td->m_fSpeed, td->m_fPressure, td->m_fAccelX, td->m_fAccelY, td->m_fAccelZ, td->m_fRotateX, td->m_fRotateY, td->m_fRotateZ, td->m_life, td->m_score];
        [m_db sqlExecute:sql];
    }
}

#pragma mark - Utilities

- (void) makeDB {
    //login information table
    [m_db sqlExecute:@"create table touchData(dataID INTEGER PRIMARY KEY AUTOINCREMENT, length REAL, area REAL, speed REAL, pressure REAL, accelX REAL, accelY REAL, accelZ REAL, rotateX REAL, rotateY REAL, rotateZ REAL, life REAL,score REAL, Timestamp DATETIME DEFAULT CURRENT_TIMESTAMP);"];
    
}

- (NSString*)escapeText:(NSString*)text {
    NSString* newValue = [text stringByReplacingOccurrencesOfString:@"'" withString:@"''"];
    return newValue;
}




@end
