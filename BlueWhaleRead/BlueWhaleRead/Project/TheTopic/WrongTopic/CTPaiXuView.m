//
//  CTPaiXuView.m
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/5/25.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "CTPaiXuView.h"
#import "CTPaiXuSmallView.h"

@implementation CTPaiXuView{
    UIScrollView * scrollView;
    DTDownLasOrNextView * downViews;
    
    CTPaiXuSmallView * topView;
    CTPaiXuSmallView * downView;
}
-(instancetype)init{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    WS(ws);
    scrollView = [UIScrollView new];
    scrollView.backgroundColor = [UIColor clearColor];
    scrollView.delegate = self;
    scrollView.userInteractionEnabled = YES;
    [self addSubview:scrollView];
    
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(0);
        make.left.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(0);
    }];
    
    topView = [CTPaiXuSmallView new];
    topView.style = DTPaiXuStyle;
    topView.bookname = @"《书名》";
    [scrollView addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->scrollView.mas_top).with.offset(0);
        make.left.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);
    }];
    
    downView = [CTPaiXuSmallView new];
    downView.style = CTPaiXuStyle;
    downView.tImu = @"正确排序如下：";
    [scrollView addSubview:downView];
    [downView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->topView.mas_bottom).with.offset(-StatusBar-44);
        make.left.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);
    }];
    
    downViews = [DTDownLasOrNextView new];
    downViews.delegate = self;
    [scrollView addSubview:downViews];
    [downViews mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->downView.mas_bottom).with.offset(LENGTH(85));
        make.left.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);
        make.bottom.equalTo(self->scrollView.mas_bottom).with.offset(-LENGTH(50));
    }];
}
- (void)setDtdownstyle:(DtLastOrNext)dtdownstyle{
    if (downViews.dtdownstyle==0) {
        _dtdownstyle = dtdownstyle;
        downViews.dtdownstyle = dtdownstyle;
    }
    
}

- (void)DtDownClick:(PushModel *)model{
    [self.delegate PushFriendViewCOntroller:model];
}
- (void)setTiModel:(TiStyleModel *)tiModel{
    _tiModel = tiModel;
    topView.tImu = tiModel.timu;
    topView.tiModel = tiModel;
    downView.tiModel = tiModel;
    
}
- (void)setBoname:(NSString *)boname{
    _boname = boname;
    topView.bookname = [NSString stringWithFormat:@"《%@》",boname];

}
@end
