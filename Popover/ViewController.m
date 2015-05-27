//
//  ViewController.m
//  Popover
//
//  Created by Yaroslav Arsenkin on 27.05.15.
//  Copyright (c) 2015 Iaroslav Arsenkin. All rights reserved.
//

#import "ViewController.h"
#import "ARSPopover.h"



@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *button;

@end



@implementation ViewController

- (IBAction)showPopover:(id)sender {
    ARSPopover *popoverController = [[ARSPopover alloc] init];
    popoverController.sourceView = self.button;
    popoverController.sourceRect = CGRectMake(CGRectGetMidX(self.button.bounds), CGRectGetMaxY(self.button.bounds), 0, 0);
    popoverController.contentSize = CGSizeMake(100, 50);
    popoverController.arrowDirection = UIPopoverArrowDirectionUp;
    
    [self presentViewController:popoverController animated:YES completion:nil];
}

@end
