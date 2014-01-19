//
//  CRDCardView.h
//  Sample Application
//
//  Created by Joe Kennedy on 1/18/14.
//  Copyright (c) 2014 Joe Kennedy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CRDCardView : UIView

- (id)initWithFrame:(CGRect)frame andName:(NSString *)name andTagline:(NSString *)tagline andLocation:(NSString*)location andPhoneNumber:(NSString *)phoneNumber;

@property (nonatomic, strong) UIImage *avatar;
@property (nonatomic, strong) UIImageView *avatarView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *taglineLabel;
@property (nonatomic, strong) UILabel *locationLabel;
@property (nonatomic, strong) UILabel *phoneNumberLabel;

@end
