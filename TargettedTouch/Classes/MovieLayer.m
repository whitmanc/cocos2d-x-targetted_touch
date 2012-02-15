




#import "MovieLayer.h"

@implementation MovieLayer

#pragma mark -
#pragma mark Init and Dealloc

+ (id)layerWithMovieName:(NSString*)name type:(NSString*)movieType target:(id)target selector:(SEL)selector
{
    return [[[self alloc] initWithMovieName:name type:movieType target:target selector:selector] autorelease];
}

+ (id)layerWithPath:(NSString*)path target:(id)target selector:(SEL)selector
{
    //return [[[self alloc] initWithMovieName:name type:movieType target:target selector:selector] autorelease];
    
    return [[[self alloc] initWithMoviePath:path target:target selector:selector] autorelease];
}

- (id)initWithMovieName:(NSString*)name type:(NSString*)movieType target:(id)target selector:(SEL)selector
{
    if ((self = [super init]) != nil)
    {  
        NSBundle *bundle = [NSBundle mainBundle];
        NSString *moviePath = [bundle pathForResource:name ofType:movieType];
        if (moviePath)
        {
            NSURL *moviePathURL = [NSURL fileURLWithPath:moviePath];
            [self loadMovieAtURL:moviePathURL target:target selector:selector];
            
            // Notification
           // [[NSNotificationCenter defaultCenter] 
            // addObserver:target 
            // selector:selector
            // name:MPMoviePlayerPlaybackDidFinishNotification
            // object:nil];
        }  
    }
    return self;
}

- (id)initWithMoviePath:(NSString*)path target:(id)target selector:(SEL)selector
{
    if ((self = [super init]) != nil)
    {  

        
            NSURL *moviePathURL = [NSURL fileURLWithPath:path];
            [self loadMovieAtURL:[NSURL URLWithString:path] target:target selector:selector];
            
            // Notification
            //[[NSNotificationCenter defaultCenter] 
            // addObserver:target 
            // selector:selector
            // name:MPMoviePlayerPlaybackDidFinishNotification
            // object:nil];
        
    }
    return self;
}

- (void)onExit
{
    NSLog(@"CRY");
    if(theMovie.playbackState==MPMoviePlaybackStatePlaying) [theMovie stop];
    [theMovie.view removeFromSuperview]; 
    [theMovie release];
    [super onExit];
}

#pragma mark -
#pragma mark Class functions

- (void)loadMovieAtURL:(NSURL*)theURL target:(id)target selector:(SEL)selector
{
    CGSize size = [[CCDirector sharedDirector] winSize];
    
    theMovie = [[MPMoviePlayerController alloc] initWithContentURL:theURL];
    
    theMovie.scalingMode = MPMovieScalingModeAspectFit;
    [theMovie setFullscreen:FALSE animated:TRUE];
    theMovie.movieControlMode = MPMovieControlStyleDefault;
    
    theMovie.shouldAutoplay=NO;
    
    theMovie.view.frame = CGRectMake(0, 0, 604,336); 
    //theMovie.view.transform = CGAffineTransformMakeTranslation(0, -75);
    theMovie.view.backgroundColor = [UIColor clearColor];
    
    // Transform
    //theMovie.view.transform = CGAffineTransformMakeRotation(-270.0f * (M_PI/180.0f));
    theMovie.view.center = [[CCDirector sharedDirector] openGLView].center;
    
    
    [[[CCDirector sharedDirector] openGLView] addSubview:theMovie.view]; 
    
    if(theMovie.playbackState==MPMoviePlaybackStatePlaying) [theMovie pause];
}

- (void)play
{
    [theMovie play];
}

-(MPMoviePlayerController*) getPlayer{
    return theMovie;
}

@end