//
//  HelloWorldLayer.m
//  TargettedTouch
//
//  Created by Chris Whitman on 11-08-15.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"
#import "TouchDetection.h"
#import "CCVideoPlayer.h"

// HelloWorldLayer implementation
@implementation HelloWorldLayer

+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	HelloWorldLayer *layer = [HelloWorldLayer node];
	[scene addChild: layer];
	return scene;
}


-(id) init
{
	if( (self=[super init])) {
		
        CCSprite *bg = [CCSprite spriteWithFile:@"bg.png"];
        bg.anchorPoint=CGPointZero;
        [self addChild:bg];
        
        touchDetector = [TouchDetection node];
        [self addChild:touchDetector];
        
        [touchDetector addZoneWithPosition:ccp(661,432) radius:9 target:self selector:@selector(playMovie1:)];
        
        [touchDetector addZoneWithPosition:ccp(697,430) radius:10 target:self selector:@selector(playMovie1:)];
        
        [touchDetector addZoneWithPosition:ccp(546,394) radius:30 target:self selector:@selector(playMovie1:)];
        
        [touchDetector addZoneWithPosition:ccp(590,392) radius:30 target:self selector:@selector(playMovie1:)];
        
        [touchDetector addZoneWithPosition:ccp(632,398) radius:24 target:self selector:@selector(playMovie1:)];
        
        [touchDetector addZoneWithPosition:ccp(676,389) radius:33 target:self selector:@selector(playMovie1:)];
        
        [touchDetector addZoneWithPosition:ccp(537,356) radius:11 target:self selector:@selector(playMovie1:)];
        
        [touchDetector addZoneWithPosition:ccp(618,347) radius:15 target:self selector:@selector(playMovie1:)];
        
		
        touchDetector.isDebugDrawing=YES;
        
        [CCVideoPlayer setNoSkip: YES];
        
	}
	return self;
}

-(void) playMovie1:(id)sender{
    [CCVideoPlayer playMovieWithFile: @"bait.m4v"];
}


- (void) dealloc
{
	[super dealloc];
}
@end
