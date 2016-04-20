//
//  NSObject+TouchData.h
//  CollectTouchData
//
//  Created by Hursh Prasad on 2/28/16.
//  Copyright © 2016 DenisBrogniart. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TouchData: NSObject {
@public
    float   m_fLength;
    float   m_fArea;
    float   m_fSpeed;
    float   m_fAccelX;
    float   m_fAccelY;
    float   m_fAccelZ;
    float   m_fRotateX;
    float   m_fRotateY;
    float   m_fRotateZ;
    float   m_fPressure;
    float   m_life;
    float   m_score;
}

@end
