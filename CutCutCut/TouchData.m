//
//  NSObject+TouchData.m
//  CollectTouchData
//
//  Created by Hursh Prasad on 2/28/16.
//  Copyright © 2016 DenisBrogniart. All rights reserved.
//

#import "TouchData.h"

@implementation TouchData

-(id) init {
    if(self = [super init]){
        m_fLength = 0;
        m_fArea =  0;
        m_fSpeed = 0;
        m_fAccelX = 0;
        m_fAccelY = 0;
        m_fAccelZ = 0;
        m_fRotateX = 0;
        m_fRotateY = 0;
        m_fRotateZ = 0;
        m_score = 0;
        m_life = 0;
        m_fPressure = 0;
    }
    return self;
}

@end
