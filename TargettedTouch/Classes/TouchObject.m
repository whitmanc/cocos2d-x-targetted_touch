//
//  TouchObject.m
//  TargettedTouch
//
//  Created by Chris Whitman on 11-08-15.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TouchObject.h"

@implementation TouchObject

@synthesize radius, target, selector;


+(TouchObject*) objectWithPosition:(CGPoint)p radius:(float)r target:(id)t selector:(SEL)s{
    
    TouchObject *touch = [TouchObject node];
    touch.position=p;
    touch.radius=r;
    touch.target=t;
    touch.selector=s;
    
    return touch;
}

@end
