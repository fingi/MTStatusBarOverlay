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
@property (strong, nonatomic) MTStatusBarOverlay *overlay;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.overlay = [MTStatusBarOverlay sharedInstance];
    self.overlay.animation = MTStatusBarOverlayAnimationFallDown;  // MTStatusBarOverlayAnimationShrink
    self.overlay.detailViewMode = MTDetailViewModeHistory;         // enable automatic history-tracking and show in detail-view
}

- (IBAction)noInternet:(id)sender {
    self.overlay.customTextColor = [UIColor whiteColor];
    self.overlay.customBackgroundColor = [UIColor colorWithRed:0.62 green:0.08 blue:0 alpha:1]; // dark red
    [self.overlay postImmediateErrorMessage:@"No Internet Connection" duration:2 animated:YES];
}

- (IBAction)internetConnected:(id)sender {
    self.overlay.customTextColor = [UIColor whiteColor];
    self.overlay.customBackgroundColor = [UIColor colorWithRed:0.07 green:0.4 blue:0.25 alpha:1]; // dark green
    [self.overlay postFinishMessage:@"Internet Connected" duration:2 animated:YES];
}

- (IBAction)reconnecting:(id)sender {
    self.overlay.customTextColor = [UIColor blackColor];
    self.overlay.customBackgroundColor = [UIColor whiteColor];
    [self.overlay postImmediateMessage:@"Reconnecting..." animated:YES];
}

- (IBAction)hideToast:(id)sender {
    [self.overlay hide];
}

@end
