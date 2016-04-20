//
//  CustomMenuItem.m
//  CollectTouchDataWithFruitNinja
//
//  Created by Hursh Prasad on 29/02/2016.
//
//

#import <Foundation/Foundation.h>
#import "CustomMenuItem.h"

@implementation CustomMenuItem

-(void) selected{
    NSLog(@"Selected: %@", self.label.string);
    [super selected];
    [self activate];
}

-(void) unselected{
    NSLog(@"UnSelected");
    [super unselected];
}

@end