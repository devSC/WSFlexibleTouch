//
//  WSViewController.m
//  WSFlexibleTouch
//
//  Created by devSC on 07/23/2018.
//  Copyright (c) 2018 devSC. All rights reserved.
//

#import "WSViewController.h"
#import <WSFlexibleTouch/UIButton+WSFlexibleTouch.h>

@interface WSViewController ()

@property (weak, nonatomic) IBOutlet UIButton *greenDisableButton;
@property (weak, nonatomic) IBOutlet UIButton *blueDisableButton;

@end

@implementation WSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.greenDisableButton.ws_disableFlexibleTouch = YES;
    self.blueDisableButton.ws_disableFlexibleTouch = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
