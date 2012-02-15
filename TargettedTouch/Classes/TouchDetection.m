//
//  TouchDetection.m
//  TargettedTouch
//
//  Created by Chris Whitman on 11-08-15.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TouchDetection.h"
#import "TouchObject.h"

@implementation TouchDetection

@synthesize isDebugDrawing;

- (id)init
{
    self = [super init];
    if (self) {
        touchZones = [[NSMutableArray alloc] init];
        touchedObject=nil;
    }
    
    return self;
}

-(void) onEnter{
    //
    // Register to touch dispatcher with priority 50
    // Dont have anything with a priority over this
    // Swollows touches = wont affect the scolling of pages
    //
    [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:50 swallowsTouches:YES];
    
    [super onEnter];
}

-(TouchObject*) addZoneWithPosition:(CGPoint)p radius:(float)r target:(id)t selector:(SEL)s{
    
    // Create the zone
    TouchObject *obj = [TouchObject objectWithPosition:p radius:r target:t selector:s];
    
    // Add zone to the array of zones
    [touchZones addObject:obj];

    CCLOG(@"NEW ZONE ADDED");
    
    // return the zone, you can ignore this if your logic doesnt need it
    return obj;
}

-(void) emptyZones{
    [touchZones removeAllObjects];
}

-(void) draw{
    
    if(isDebugDrawing){
        for(TouchObject *o in touchZones){
            glLineWidth(6);
            glColor4ub(0, 255, 0, 255);
            ccDrawCircle(o.position, o.radius, 0, 20, NO);
        }
    }
    
    [super draw];
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
	
	CGPoint touchPoint = [touch locationInView:[touch view]];
	touchPoint = [[CCDirector sharedDirector] convertToGL:touchPoint];
	
    // Check if a touch is in the zones, will confirm it still is there 
    // in touch ended
	for(TouchObject *o in touchZones){
        
        if(ccpDistance(touchPoint, o.position)<=o.radius){
            
            touchedObject = o;
            
            return YES;
            
        }
        
    }
    
	return NO;
}

- (void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
	CGPoint touchPoint = [touch locationInView:[touch view]];
	touchPoint = [[CCDirector sharedDirector] convertToGL:touchPoint];
}

- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
	CGPoint touchPoint = [touch locationInView:[touch view]];
	touchPoint = [[CCDirector sharedDirector] convertToGL:touchPoint];
    
    if(ccpDistance(touchPoint, touchedObject.position)<=touchedObject.radius){
        [touchedObject.target performSelector:touchedObject.selector];
    }
    
    touchedObject=nil;
}

-(void) onExit{
    
    [touchZones removeAllObjects];
    
    [[CCTouchDispatcher sharedDispatcher] removeDelegate:self];
    
    [super onExit];
}

-(void) dealloc{
    
    [touchZones release];
    
    [super dealloc];
}

@end
