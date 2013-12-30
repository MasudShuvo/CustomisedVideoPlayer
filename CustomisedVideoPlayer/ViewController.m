//
//  ViewController.m
//  CustomisedVideoPlayer
//
//  Created by Shuvo on 12/29/13.
//  Copyright (c) 2013 Masud Shuvo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"sample" ofType:@"m4v"]]];
    moviePlayer.view.frame = CGRectMake(0, 0, 320, 200);
    [self.view addSubview:moviePlayer.view];
    [self initiateControls];
    moviePlayer.controlStyle = MPMovieControlStyleNone;
    [moviePlayer play];
    
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(updateProgressView) userInfo:nil repeats:YES];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)initiateControls
{
    progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
    progressView.frame = CGRectMake(35, 180, 250, 2);
    [moviePlayer.view addSubview:progressView];
    
    playButton = [UIButton buttonWithType:UIButtonTypeCustom];
    playButton.frame = CGRectMake(0, 170, 30, 30);
    [playButton setBackgroundImage:[UIImage imageNamed:@"play.png"] forState:UIControlStateNormal];
    [playButton addTarget:self action:@selector(playButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [moviePlayer.view addSubview:playButton];
    
    pauseButton = [UIButton buttonWithType:UIButtonTypeCustom];
    pauseButton.frame = CGRectMake(290, 170, 30, 30);
    [pauseButton setBackgroundImage:[UIImage imageNamed:@"pause.png"] forState:UIControlStateNormal];
    [pauseButton addTarget:self action:@selector(pausedButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [moviePlayer.view addSubview:pauseButton];
}

- (void)playButtonPressed
{
    [moviePlayer play];
}

- (void)pausedButtonPressed
{
    [moviePlayer pause];
}

- (void)updateProgressView
{
    progressView.progress = moviePlayer.currentPlaybackTime / moviePlayer.duration;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
