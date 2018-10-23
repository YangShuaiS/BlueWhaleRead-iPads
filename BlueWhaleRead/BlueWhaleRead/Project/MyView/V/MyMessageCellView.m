
//
//  MyMessageCellView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/7.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MyMessageCellView.h"

@implementation MyMessageCellView{
    BaseLabel * title;
    BaseLabel * subtitle;
    BaseLabel * timeTime;
    BaseLabel * downTime;
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
    self.backgroundColor = WhitColor;
    title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:ChangYongTitLe LabelFont:TextFont(22) TextAlignment:NSTextAlignmentLeft Text:@"任务"];
    [self addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws).with.offset(LENGTH(26));
        make.top.mas_equalTo(ws).with.offset(LENGTH(30));
    }];
    
    subtitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:ChangYongTitLe LabelFont:TextFont(20) TextAlignment:NSTextAlignmentLeft Text:@"老师留了什么什么作业"];
    [self addSubview:subtitle];
    [subtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws).with.offset(LENGTH(26));
        make.top.mas_equalTo(self->title.mas_bottom).with.offset(LENGTH(16));
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(30));
    }];
    
    timeTime = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(137,159,159) LabelFont:TextFont(18) TextAlignment:NSTextAlignmentRight Text:@"2018-05-07"];
    [self addSubview:timeTime];
    [timeTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(ws).with.offset(-LENGTH(26));
        make.top.mas_equalTo(ws).with.offset(LENGTH(30));
    }];
    
    downTime = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(137,159,159) LabelFont:TextFont(18) TextAlignment:NSTextAlignmentLeft Text:@"13:24"];
    [self addSubview:downTime];
    [downTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(ws).with.offset(-LENGTH(26));
        make.top.mas_equalTo(self->timeTime.mas_bottom).with.offset(LENGTH(16));
    }];
}

- (void)setModel:(MyMessageModel *)model{
    _model = model;
    title.text = model.title;
    subtitle.text = model.content;
//    NSArray * timearray =
    timeTime.text =[BaseObject TiemArray:model.create_time String:@" "][0];
    downTime.text = [BaseObject TiemArray:model.create_time String:@" "][1];
    if (model.is_read==1) {
        title.textColor = ChangYongTitLe;
        subtitle.textColor = ChangYongTitLe;
    }else{
        title.textColor = RGB(137,159,159);
        subtitle.textColor = RGB(137,159,159);
    }
}
@end

