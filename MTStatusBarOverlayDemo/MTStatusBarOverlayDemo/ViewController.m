//
//  ViewController.m
//  MTStatusBarOverlayDemo
//
//  Created by Hlung on 19/3/15.
//  Copyright (c) 2015 Hlung. All rights reserved.
//

#import "ViewController.h"
#import "MTStatusBarOverlay.h"
#import "UIColor+TG.h"

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
    self.overlay.customBackgroundColor = [UIColor tg_statusBarDarkRed];
    [self.overlay postImmediateErrorMessage:@"No Internet Connection" duration:2 animated:YES];
}

- (IBAction)internetConnected:(id)sender {
    self.overlay.customTextColor = [UIColor whiteColor];
    self.overlay.customBackgroundColor = [UIColor tg_statusBarDarkGreen];
    [self.overlay postFinishMessage:@"Internet Connected" duration:2 animated:YES];
}

- (IBAction)reconnecting:(id)sender {
    self.overlay.customTextColor = [UIColor blackColor];
    self.overlay.customBackgroundColor = [UIColor tg_statusBarLightYellow];
    [self.overlay postImmediateMessage:@"Reconnecting..." animated:YES];
}

- (IBAction)hideToast:(id)sender {
    [self.overlay hide];
}

@end
