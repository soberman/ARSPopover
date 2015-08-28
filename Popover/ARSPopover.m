//
//  ARSPopover.m
//  Popover
//
//  Created by Yaroslav Arsenkin on 27.05.15.
//  Copyright (c) 2015 Iaroslav Arsenkin. All rights reserved.
//

#import "ARSPopover.h"



@interface ARSPopover () <UIPopoverPresentationControllerDelegate>

@end



@implementation ARSPopover

#pragma mark Initialization

- (instancetype)init {
    if (self = [super init]) {
        self.modalPresentationStyle = UIModalPresentationPopover;
        self.popoverPresentationController.delegate = self;
    }
    
    return self;
}

#pragma mark - View Controller's Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
//     You can add content to popover here.
}

#pragma mark - Actions

- (void)closePopover {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)insertContentIntoPopover:(void (^)(ARSPopover *popover))content {
    content(self);
}

#pragma mark - Popover Presentation Controller Delegate

- (void)prepareForPopoverPresentation:(UIPopoverPresentationController *)popoverPresentationController {
    self.popoverPresentationController.sourceView = self.sourceView ? self.sourceView : self.view;
    self.popoverPresentationController.sourceRect = self.sourceRect;
    self.preferredContentSize = self.contentSize;
    
    popoverPresentationController.permittedArrowDirections = self.arrowDirection ? self.arrowDirection : UIPopoverArrowDirectionAny;
    popoverPresentationController.passthroughViews = self.passthroughViews;
    popoverPresentationController.backgroundColor = self.backgroundColor;
    popoverPresentationController.popoverLayoutMargins = self.popoverLayoutMargins;
}

#pragma mark - Adaptive Presentation Controller Delegate

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller {
    return UIModalPresentationNone;
}

@end
