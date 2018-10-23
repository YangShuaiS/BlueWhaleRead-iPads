//
//  PopUpViewStyleAnswerView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/13.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "PopUpViewStyleAnswerView.h"

@implementation PopUpViewStyleAnswerView{
    BaseLabel * title;
    BaseLabel * subTitle;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addView];
    }
    return self;
}
- (void)addView{
    WS(ws);
    FLAnimatedImageView * clickImage = [FLAnimatedImageView new];
    clickImage.image = UIIMAGE(@"icon_弹窗_关闭");
    [self addSubview:clickImage];
    [clickImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(ws).with.offset(-LENGTH(27));
        make.top.mas_equalTo(ws).with.offset(StatusBar+44+LENGTH(71));
        make.width.mas_equalTo(LENGTH(30));
        make.height.mas_equalTo(LENGTH(30));
    }];
    
    BaseButton * clickButton = [BaseButton buttonWithType:UIButtonTypeCustom];
    [clickButton addTarget:self action:@selector(quxiao) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:clickButton];
    [clickButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(ws).with.offset(-LENGTH(27-15));
        make.top.mas_equalTo(ws).with.offset(StatusBar+44+LENGTH(71-15));
        make.width.mas_equalTo(LENGTH(60));
        make.height.mas_equalTo(LENGTH(60));
    }];
    
    BaseView * backView = [BaseView new];
    backView.backgroundColor =RGB(189,225,223);
    backView.layer.masksToBounds = YES;
    backView.layer.cornerRadius = LENGTH(20);
    [self addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws).with.offset(LENGTH(120));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(120));
        make.top.mas_equalTo(ws).with.offset(LENGTH(195));
    }];
    
    title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(35,100,96) LabelFont:TextFont(25) TextAlignment:NSTextAlignmentCenter Text:@""];
    title.backgroundColor = RGBA(255, 255, 255, 0.7);
    [backView addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(backView);
        make.top.mas_equalTo(backView);
        make.right.mas_equalTo(backView);
        make.height.mas_equalTo(LENGTH(70));
    }];
    
    subTitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(35,100,96) LabelFont:TextFont(22) TextAlignment:NSTextAlignmentCenter Text:@""];
    subTitle.numberOfLines = 0;
    [backView addSubview:subTitle];
    [subTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(backView);
        make.top.mas_equalTo(self->title.mas_bottom).with.offset(LENGTH(34));
        make.right.mas_equalTo(backView);
    }];
    
    FLAnimatedImageView * KS = [FLAnimatedImageView new];
    KS.image = [UIImage imageNamed:@"bt_弹窗"];
    [backView addSubview:KS];
    [KS mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(backView);
        make.top.mas_equalTo(self->subTitle.mas_bottom).with.offset(LENGTH(40));
        make.bottom.mas_equalTo(backView.mas_bottom).with.offset(-LENGTH(50));
        make.width.mas_equalTo(LENGTH(200));
        make.height.mas_equalTo(LENGTH(54));
    }];
    
    BaseLabel * KSLabel = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(57,54,57) LabelFont:TextFont(20) TextAlignment:NSTextAlignmentCenter Text:@"开始"];
    [KS addSubview:KSLabel];
    [KSLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(KS);
    }];
    KS.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    [KS addGestureRecognizer:tap];
}
- (void)setModel:(GenPopViewModel *)model{
    _model = model;
    title.text = model.title;
    subTitle.text = model.subtitle;

}
- (void)tap{
    self.block(PopUpViewClickStylePush);
}
- (void)quxiao{
    self.block(PopUpViewClickStyleRemo);
}
@end
