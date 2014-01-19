//
//  CardInputView.h
//  Sample Application
//
//  Created by Jonah Siegle on 1/19/2014.
//  Copyright (c) 2014 zuui.org (Philip Kluz). All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CardInputView : UIView

@property (weak, readwrite) id delegate;

@property (nonatomic, strong) UITextField *name;
@property (nonatomic, strong) UITextField *headline;
@property (nonatomic, strong) UITextField *local;
@property (nonatomic, strong) UITextField *phone;
@property (nonatomic, strong) UITextField *email;
@property (nonatomic, strong) UITextField *website;
@property (nonatomic, strong) UITextField *twitter;

@end

@protocol CardInputViewDelegate <NSObject>

- (void)didFinishInputtingCard:(CardInputView *)view;

@end
