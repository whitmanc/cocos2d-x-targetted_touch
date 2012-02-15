//
//  HelloWorldLayer.h
//  TargettedTouch
//
//  Created by Chris Whitman on 11-08-15.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//
#import "cocos2d.h"

@class TouchDetection;
@class CCVideoPlayer;

@interface HelloWorldLayer : CCLayer
{
    TouchDetection *touchDetector;
}


+(CCScene *) scene;

@end
