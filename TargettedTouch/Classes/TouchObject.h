//
//  TouchObject.h
//  TargettedTouch
//
//  Created by Chris Whitman on 11-08-15.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"

@interface TouchObject : CCNode{
    float radius;
    id target;
    SEL selector;
}

@property float radius;
@property (assign) id target;
@property (assign) SEL selector;

+(TouchObject*) objectWithPosition:(CGPoint)p radius:(float)r target:(id)t selector:(SEL)s;

@end
