//
//  ViewController.m
//  PICO 8 iOS Wrapper
//
//  Created by Camilo Castro on 27-07-19.
//  Copyright © 2019 Ninjas.cl. All rights reserved.
//

#import "ViewController.h"
@import WebKit;

@interface ViewController ()
    @property (strong, nonatomic) IBOutlet UIView * placeholder;
    @end

@implementation ViewController
    
#pragma mark - Lifecycle
- (void) viewDidLoad {
    
    [super viewDidLoad];
    
    NSLog(@"\nWelcome to Pico-8 iOS Wrapper 1.0");
    
    WKWebViewConfiguration * config = [WKWebViewConfiguration new];
    
    if(@available(iOS 8, *)) {
        config.allowsInlineMediaPlayback = YES;
        
        // This method is deprecated so we test if is available
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        if([config
            respondsToSelector:NSSelectorFromString(@"setMediaPlaybackRequiresUserAction:")]) {
            config.mediaPlaybackRequiresUserAction = NO;
        }
#pragma clang diagnostic pop
    }
    
    if(@available(iOS 9, *)) {
        config.allowsAirPlayForMediaPlayback = YES;
        config.allowsPictureInPictureMediaPlayback = YES;
    }
    
    if(@available(iOS 10, *)) {
        config.mediaTypesRequiringUserActionForPlayback = WKAudiovisualMediaTypeNone;
    }
    
    WKWebView * web = [[WKWebView alloc]
                       initWithFrame:self.placeholder.frame
                       configuration:config];
    
    web.translatesAutoresizingMaskIntoConstraints = NO;
    web.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    
    NSString * path = [self localPath:@"file://index.html"];
    NSURL * url = [NSURL fileURLWithPath:path isDirectory:NO];
    
    if(@available(iOS 9, *)) {
        [web loadFileURL:url allowingReadAccessToURL:url];
    } else {
        // iOS 8 have troubles loading local files
        // try https://stackoverflow.com/a/30950280
        // NSAssert(@available(iOS 9, *), @"iOS 9 or newer needed");
        [web loadRequest:[NSURLRequest requestWithURL:url]];
    }
    
    [self.placeholder addSubview:web];
}
    
#pragma mark - Helpers
- (NSString *) localPath: (NSString *) url {
    NSString * resourcePath = [[NSBundle mainBundle] resourcePath];
    NSString * fullPath = [url
                           stringByReplacingOccurrencesOfString:@"file:/"
                           withString:resourcePath];
    return fullPath;
}
    @end
