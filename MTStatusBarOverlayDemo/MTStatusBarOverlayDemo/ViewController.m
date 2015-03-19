//
//  ViewController.m
//  MTStatusBarOverlayDemo
//
//  Created by Hlung on 19/3/15.
//  Copyright (c) 2015 Hlung. All rights reserved.
//

#import "ViewController.h"
#import "MTStatusBarOverlay.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MTStatusBarOverlay *overlay = [MTStatusBarOverlay sharedInstance];
    overlay.animation = MTStatusBarOverlayAnimationFallDown;  // MTStatusBarOverlayAnimationShrink
    overlay.detailViewMode = MTDetailViewModeHistory;         // enable automatic history-tracking and show in detail-view
    overlay.customTextColor = [UIColor blackColor];
    overlay.customBackgroundColor = [UIColor whiteColor];
}

- (IBAction)noInternet:(id)sender {
    MTStatusBarOverlay *overlay = [MTStatusBarOverlay sharedInstance];
    [overlay postImmediateErrorMessage:@"No Internet Connection" duration:2 animated:YES];
}

- (IBAction)internetConnected:(id)sender {
    MTStatusBarOverlay *overlay = [MTStatusBarOverlay sharedInstance];
    [overlay postFinishMessage:@"Internet Connected" duration:2 animated:YES];
}

- (IBAction)reconnecting:(id)sender {
    MTStatusBarOverlay *overlay = [MTStatusBarOverlay sharedInstance];
    [overlay postImmediateMessage:@"Reconnecting..." animated:YES];
}

- (IBAction)hideToast:(id)sender {
    MTStatusBarOverlay *overlay = [MTStatusBarOverlay sharedInstance];
    [overlay hide];
}

@end
