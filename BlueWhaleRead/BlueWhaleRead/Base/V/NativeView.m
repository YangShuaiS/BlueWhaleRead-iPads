//
//  NativeView.m
//  BoVolumes
//
//  Created by 杨帅 on 2018/4/9.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "NativeView.h"

@implementation NativeView{
    NSString * _image;
    NSString * _title;
    NSString * _rightTitle;
    BaseLabel * titleLable;
}
- (instancetype)init{
    self = [super init];
    [self addview];
    return self;
}
- (void)addview{
    self.backgroundColor = MAINCOLOR;
}
- (instancetype)initWithLeftImage:(NSString *)image Title:(NSString *)title RightTitle:(NSString *)rightTitle NativeStyle:(NavStyle)nativeStyle{
    _image = image;
    _title = title;
    _rightTitle = rightTitle;
    self = [super init];
    if (self) {
        self.nativeStyle = nativeStyle;
    }
    self.backgroundColor = MAINCOLOR;

    return self;
}
- (void)setTitle:(NSString *)title{
    titleLable.text = title;
}
- (void)setNativeStyle:(NavStyle)nativeStyle{
    switch (nativeStyle) {
        case NavStyleGeneral:
            [self AddBackImage:_image];
            [self AddCenterTitle:_title];
            break;
        case NavStyleHome:
            [self AddCenterTitle:_title];

            break;
        case NacStyleFound:
            [self AddBackImage:_image];
            [self AddCenterTitle:_title];
//            [self AddRightImage:_rightTitle];
            break;
        case NacStyleBookCity:
//            [self AddBackImage:_image];
            [self AddCenterSearch:_title];

            break;
        case NacStyleBookCitySJ:
            [self AddBackImage:_image];
            [self AddCenterSearch:_title];
            [self AddRightImage:_rightTitle];

            break;
        case nacStyleCengterAndRight:
            [self AddCenterTitle:_title];
            [self AddRightImage:_rightTitle];
            break;
        case NacStyleLeftCenterSearch:
            [self AddBackImage:_image];
            [self AddCenterSearch:_title];
            break;
        case NavStyleLeftImageAndRightImageAndCenter:
            [self AddBackImage:_image];
            [self AddCenterTitle:_title];
            [self AddRightImage:_rightTitle];
            
            break;
        default:
            break;
    }
}
#pragma mark ----------------- 返回按钮
- (void)AddBackImage:(NSString *)image{
    WS(ws);
    UIImage * backImage = UIIMAGE(image);
    
    FLAnimatedImageView * right = [FLAnimatedImageView new];
    right.image = backImage;
    [self addSubview:right];
    [right mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(LENGTH(26));
        make.bottom.equalTo(ws).with.offset(-(NavHeight-StatusBar-backImage.size.height)/2);
        make.height.mas_equalTo(backImage.size.height);
        make.width.mas_equalTo(backImage.size.width);
    }];
    
    
    BaseButton * LeftBigButton = [BaseButton buttonWithType:UIButtonTypeCustom];
    [LeftBigButton addTarget:self action:@selector(left) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:LeftBigButton];
    
    [LeftBigButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(0);
        make.height.mas_equalTo(@44);
        make.width.mas_equalTo(@75);
    }];
}
#pragma mark ----------------- 中间title
- (void)AddCenterTitle:(NSString *)title{
    WS(ws);
    
    titleLable = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0xff, 0xfe, 0xfe) LabelFont:TextFont(24) TextAlignment:NSTextAlignmentCenter Text:title];
    [self addSubview:titleLable];
    [titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(0);
        make.height.mas_equalTo(@44);
        make.width.mas_equalTo(@200);
    }];
}
#pragma mark ----------------- 中间搜索框
- (void)AddCenterSearch:(NSString *)title{
    WS(ws);
    BaseView * view = [BaseView new];
    view.backgroundColor = RGBA(255, 255, 255, 0.3);
    view.layer.masksToBounds = YES;
    view.layer.cornerRadius = 17;
    [self addSubview:view];
    FLAnimatedImageView * searchImage = [FLAnimatedImageView new];
    searchImage.image = UIIMAGE(@"icon_搜索");
    [view addSubview:searchImage];
    
    BaseLabel * titleLable = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFont(16) TextAlignment:NSTextAlignmentLeft Text:title];
    [view addSubview:titleLable];
    
    BaseButton * button = [BaseButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(centerBt) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws).with.offset(-LENGTH(136));
        make.left.equalTo(ws).with.offset(LENGTH(136));
        make.bottom.equalTo(ws).with.offset(-6);
        make.height.mas_equalTo(@33);
    }];
    [searchImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view.mas_left).with.offset(LENGTH(25));
        make.centerY.mas_equalTo(view.mas_centerY);
        make.height.mas_equalTo(@20);
        make.width.mas_equalTo(@20);
    }];
    
    [titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(searchImage.mas_right).with.offset(LENGTH(12));
        make.centerY.mas_equalTo(view.mas_centerY);
        make.right.mas_equalTo(view.mas_right);
    }];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(view);
    }];
}

#pragma mark ----------------- 右图
- (void)AddRightImage:(NSString *)image{
    WS(ws);
    FLAnimatedImageView * right = [FLAnimatedImageView new];
    right.image = UIIMAGE(image);
    [self addSubview:right];
    
    [right mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws).with.offset(-LENGTH(25));
//        make.bottom.equalTo(ws).with.offset(-LENGTH(2));
        make.centerY.mas_equalTo(ws).with.offset(StatusBar/2);
        make.height.mas_equalTo(23);
        make.width.mas_equalTo(23);
    }];
    
    BaseButton * LeftBigButton = [BaseButton buttonWithType:UIButtonTypeCustom];
    [LeftBigButton addTarget:self action:@selector(right) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:LeftBigButton];
    
    [LeftBigButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(0);
        make.height.mas_equalTo(@44);
        make.width.mas_equalTo(@75);
    }];
}

#pragma mark ----------------- 点击处理时间
- (void)left{
    [self.delegate NavLeftClick];
}
- (void)right{
    [self.delegate NavRightClick];

}
- (void)centerBt{
    [self.delegate NavCenterClick];
}

- (void)jianbian:(NSString *)text
           Color:(NSArray *)colorarray{
    titleLable.text = text;
    titleLable.font = [UIFont fontWithName:@"Baoli SC" size:FontSize(LENGTH(30))];
    [self.superview layoutIfNeeded];
    
    // 创建渐变层
    CAGradientLayer* gradientLayer = [CAGradientLayer layer];
    titleLable.layer.shadowOpacity = 1;
    titleLable.layer.shadowColor = RGBA(73, 58, 18,0.6).CGColor;
    titleLable.layer.shadowRadius = 1.0f;
    titleLable.layer.shadowOffset = CGSizeMake(0,0);
    
    gradientLayer.frame = titleLable.frame;
    gradientLayer.colors = colorarray;
    gradientLayer.locations = @[@0.0, @0.38, @1];
    //    gradientLayer.startPoint = CGPointMake(0, 1);
    //    gradientLayer.endPoint = CGPointMake(1, 1);
    [self.layer addSublayer:gradientLayer];
    
    gradientLayer.mask = titleLable.layer;
    titleLable.frame = gradientLayer.bounds;
    
    //    gradientLayer.mask = testLabel.layer;
    //    testLabel.frame = gradientLayer.bounds;
    
    
    
    
    //    CAGradientLayer *gradient = [CAGradientLayer layer];
    //    [self.layer addSublayer:gradient];
    //    [titleLable layoutIfNeeded];
    //    gradient.frame = titleLable.frame;
    //    gradient.colors = colorarray;
    //
}

- (void)setTitcolor:(UIColor *)titcolor{
    _titcolor = titcolor;
    titleLable.textColor = titcolor;
}
@end
