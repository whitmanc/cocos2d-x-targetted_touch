//
//  TouchDetection.h
//  TargettedTouch
//
//  Created by Chris Whitman on 11-08-15.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"

@class TouchObject;
@interface TouchDetection : CCLayer{
    NSMutableArray *touchZones;
    BOOL isDebugDrawing;
    TouchObject *touchedObject;
}

@property BOOL isDebugDrawing;

-(TouchObject*) addZoneWithPosition:(CGPoint)p radius:(float)r target:(id)t selector:(SEL)s;
-(void) emptyZones;


@end
