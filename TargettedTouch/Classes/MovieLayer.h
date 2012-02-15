




#import "cocos2d.h"
#import <MediaPlayer/MediaPlayer.h>

@interface MovieLayer : CCLayer {
    MPMoviePlayerController* theMovie;
}

+ (id)layerWithMovieName:(NSString*)name type:(NSString*)movieType target:(id)target selector:(SEL)selector;

+ (id)layerWithPath:(NSString*)path target:(id)target selector:(SEL)selector;

- (id)initWithMovieName:(NSString*)name type:(NSString*)movieType target:(id)target selector:(SEL)selector;

- (id)initWithMoviePath:(NSString*)path target:(id)target selector:(SEL)selector;

// Load the movie at the given url
- (void)loadMovieAtURL:(NSURL*)theURL target:(id)target selector:(SEL)selector;
// Play the movie
- (void)play;

-(MPMoviePlayerController*) getPlayer;

@end
