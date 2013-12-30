//
//  ViewController.h
//  CustomisedVideoPlayer
//
//  Created by Shuvo on 12/29/13.
//  Copyright (c) 2013 Masud Shuvo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
@interface ViewController : UIViewController
{
    MPMoviePlayerController *moviePlayer;
    UIButton *playButton;
    UIButton *pauseButton;
    UIProgressView *progressView;
}
@end
