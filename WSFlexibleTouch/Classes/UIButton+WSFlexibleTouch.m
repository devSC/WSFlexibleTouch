//
//  UIButton+WSFlexibleTouch.m
//  WSFlexibleTouch_Example
//
//  Created by Wilson on 2018/7/23.
//  Copyright © 2018 devSC. All rights reserved.
//

#import "UIButton+WSFlexibleTouch.h"
#import <objc/runtime.h>

@implementation UIButton (WSFlexibleTouch)

void swizz_method(Class class, SEL original, SEL new) {
    Method originalMethod = class_getInstanceMethod(class, original);
    Method newMethod = class_getInstanceMethod(class, new);
    BOOL success = class_addMethod(class, original, class_getMethodImplementation(class, new), method_getTypeEncoding(originalMethod));
    if (!success) {
        method_exchangeImplementations(originalMethod, newMethod);
    }
}

+ (void)load {
    Class class = [self class];
    swizz_method(class, @selector(setHighlighted:), @selector(swizz_setHighlighted:));
    swizz_method(class, @selector(setEnabled:), @selector(swizz_setEnabled:));
    swizz_method(class, @selector(setSelected:), @selector(swizz_setSelected:));
}

- (void)swizz_setHighlighted:(BOOL)highlighted {
    
    if (self.isHighlighted == highlighted) {
        return;
    }
    
    if (self.ws_disableFlexibleTouch) {
        [self swizz_setHighlighted:highlighted];
        return;
    }
    
    [UIView transitionWithView:self
                      duration:self.ws_flexibleTouchAnimationDuration
                       options:UIViewAnimationOptionTransitionCrossDissolve | UIViewAnimationOptionBeginFromCurrentState
                    animations:^{
                        
                        [self swizz_setHighlighted:highlighted];
                        
                    } completion:^(BOOL finished) {
                        
                    }];
    
}

- (void)swizz_setEnabled:(BOOL)enabled {
    
    if (self.isEnabled == enabled) {
        return;
    }
    
    if (self.ws_disableFlexibleTouch) {
        [self swizz_setEnabled:enabled];
        return;
    }
    
    [UIView transitionWithView:self
                      duration:self.ws_flexibleTouchAnimationDuration
                       options:UIViewAnimationOptionTransitionCrossDissolve | UIViewAnimationOptionBeginFromCurrentState
                    animations:^{
                        
                        [self swizz_setEnabled:enabled];
                        
                    } completion:^(BOOL finished) {
                        
                    }];
}

- (void)swizz_setSelected:(BOOL)selected {
    
    if (self.isSelected == selected) {
        return;
    }
    
    if (self.ws_disableFlexibleTouch) {
        [self swizz_setSelected:selected];
        return;
    }
    
    [UIView transitionWithView:self
                      duration:self.ws_flexibleTouchAnimationDuration
                       options:UIViewAnimationOptionTransitionCrossDissolve | UIViewAnimationOptionBeginFromCurrentState
                    animations:^{
                        
                        [self swizz_setSelected:selected];
                        
                    } completion:^(BOOL finished) {
                        
                    }];
}

- (void)setWs_disableFlexibleTouch:(BOOL)ws_disableFlexibleTouch {
    objc_setAssociatedObject(self, @selector(ws_disableFlexibleTouch), @(ws_disableFlexibleTouch), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)ws_disableFlexibleTouch {
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setWs_flexibleTouchAnimationDuration:(NSTimeInterval)ws_flexibleTouchAnimationDuration {
    objc_setAssociatedObject(self, @selector(ws_flexibleTouchAnimationDuration), @(ws_flexibleTouchAnimationDuration), OBJC_ASSOCIATION_ASSIGN);
}

- (NSTimeInterval)ws_flexibleTouchAnimationDuration {
    NSTimeInterval duration = [objc_getAssociatedObject(self, _cmd) doubleValue];
    if (duration <= 0) {
        duration = 0.25;
    }
    return duration;
}
@end
