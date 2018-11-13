//
//  ZhiShiShuBookStyleView1All.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/10/15.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ZhiShiShuBookStyleView1All.h"
#import "ZhiShiShuBookStyleView1.h"

@implementation ZhiShiShuBookStyleView1All{
    CAGradientLayer *gradient;
    BaseView * backview;
    ZhiShiShuBookStyleView1 * style1;
    BaseLabel * nrtitle;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addview];
    }
    return self;
}
- (void)addview{
    WS(ws);
    backview = [BaseView new];
    backview.layer.masksToBounds = YES;
    backview.layer.cornerRadius = LENGTH(43);
    [self addSubview:backview];
    [backview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(ws);
        make.width.mas_equalTo(LENGTH(568));
        make.height.mas_equalTo(LENGTH(670));
    }];
    gradient = [CAGradientLayer layer];
    [backview.layer addSublayer:gradient];
    
    style1 = [ZhiShiShuBookStyleView1 new];
    [backview addSubview:style1];
    [style1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self->backview).with.insets(UIEdgeInsetsMake(LENGTH(10), LENGTH(10), LENGTH(10), LENGTH(10)));
    }];
    
    style1.backgroundColor = [UIColor whiteColor];
    style1.layer.masksToBounds = YES;
    style1.layer.cornerRadius = LENGTH(40);
    style1.layer.shadowOpacity = 1;
    style1.layer.shadowColor = RGB(1,149,151).CGColor;
    style1.layer.shadowRadius = 2.0f;
    style1.layer.shadowOffset = CGSizeMake(0,0);
    
    FLAnimatedImageView * titleview = [FLAnimatedImageView new];
    titleview.image = UIIMAGE(@"title");
    [self addSubview:titleview];
    [titleview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self->backview);
        make.top.mas_equalTo(self->backview.mas_top).with.offset(-LENGTH(30));
        make.width.mas_equalTo(LENGTH(220));
        make.height.mas_equalTo(LENGTH(60));
    }];
    
    nrtitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:[UIColor whiteColor] LabelFont:TextFont(41) TextAlignment:NSTextAlignmentCenter Text:@""];
    [titleview addSubview:nrtitle];
    [nrtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(titleview).with.insets(UIEdgeInsetsMake(LENGTH(3), LENGTH(3), LENGTH(3), LENGTH(3)));
    }];
}
- (void)setModel:(ZhiShiShuXqStyle1Model *)model{
    _model = model;
    style1.itemarray=model.books;
    nrtitle.text = model.name;
}
- (void)setNav:(UINavigationController *)nav{
    style1.nav = nav;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    gradient.frame = backview.bounds;
    gradient.colors = [NSArray arrayWithObjects:
                       (id)[BaseObject colorWithHexString:@"#6ce5cd"].CGColor,
                       (id)[BaseObject colorWithHexString:@"#41d4c6"].CGColor,nil];
    gradient.startPoint = CGPointMake(0, 0.5);
    gradient.endPoint = CGPointMake(1, 0.5);
    gradient.locations = @[@0.0, @1];
}
@end
