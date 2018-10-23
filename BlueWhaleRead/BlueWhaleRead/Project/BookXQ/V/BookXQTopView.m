
//
//  BookXQTopView.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/9.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BookXQTopView.h"
#import "BookCityXunZhang.h"
#import "BookTopLabel.h"
#import "MedalListXQViewController.h"
@implementation BookXQTopView{
    FLAnimatedImageView * leftImageView;
    BaseLabel * Title;
    BaseLabel * subtitle;

    BaseLabel * dengji;
    BaseLabel * nengli;
    BookCityXunZhang * xunzhangone;

    
//    BaseLabel * longtext;
    BookTopLabel * longtext;
    BaseLabel * jd ;
    
    FLAnimatedImageView* sanjiao;
    FLAnimatedImageView * backImageView;
    
    UIScrollView * scrollView;
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
    backImageView = [FLAnimatedImageView new];
    backImageView.image = UIIMAGE(@"bg_书架_书籍详情");
    [self addSubview:backImageView];
    [backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws);
        make.left.mas_equalTo(ws);
        make.right.mas_equalTo(ws);
    }];

    backImageView.userInteractionEnabled = YES;
    self.userInteractionEnabled = YES;
    leftImageView = [FLAnimatedImageView new];
    leftImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:leftImageView];
    
    [leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(LENGTH(30));
        make.top.equalTo(ws).with.offset(30);
        make.width.mas_equalTo(LENGTH(140));
        make.height.mas_equalTo(LENGTH(196));
    }];
    
    Title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(4,51,50) LabelFont:TextFont(22) TextAlignment:NSTextAlignmentLeft Text:ZHANWEIZI];
    [self addSubview:Title];
    
    _jKStarDisplayView = [[JKStarDisplayView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    self.jKStarDisplayView.redValue = [@"0" floatValue];
    [self addSubview:self.jKStarDisplayView];

    
    subtitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(137,159,159) LabelFont:TextFont(18) TextAlignment:NSTextAlignmentLeft Text:ZHANWEIZI];
    [self addSubview:subtitle];
    
    BaseLabel * DJ = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(137,159,159) LabelFont:TextFont(18) TextAlignment:NSTextAlignmentLeft Text:@"阅读分级："];
    [self addSubview:DJ];
    
    dengji = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(4,51,50) LabelFont:TextFont(18) TextAlignment:NSTextAlignmentLeft Text:@"999"];
    [self addSubview:dengji];
    
    BaseLabel * NL = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(137,159,159) LabelFont:TextFont(18) TextAlignment:NSTextAlignmentLeft Text:@"分值："];
    [self addSubview:NL];
    
    nengli = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(4,51,50) LabelFont:TextFont(18) TextAlignment:NSTextAlignmentLeft Text:@""];
    [self addSubview:nengli];
    

    
    xunzhangone = [BookCityXunZhang new];
    [self addSubview:xunzhangone];
    
    
    
    [Title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->leftImageView.mas_right).with.offset(LENGTH(28));
        make.top.equalTo(self->leftImageView.mas_top).with.offset(LENGTH(8));
        make.right.equalTo(ws).with.offset(-LENGTH(60));
    }];

    [_jKStarDisplayView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->leftImageView.mas_right).with.offset(LENGTH(28));
        make.top.equalTo(self->Title.mas_bottom).with.offset(LENGTH(15));
        make.width.mas_equalTo(LENGTH(80));
        make.height.mas_equalTo(LENGTH(13));
    }];

    [subtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->leftImageView.mas_right).with.offset(LENGTH(28));
        make.top.equalTo(ws.jKStarDisplayView.mas_bottom).with.offset(LENGTH(13));
        make.right.equalTo(ws).with.offset(-LENGTH(60));
    }];

    [DJ mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->leftImageView.mas_right).with.offset(LENGTH(28));
        make.top.equalTo(self->subtitle.mas_bottom).with.offset(LENGTH(10));
    }];

    [dengji mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(DJ.mas_right).with.offset(0);
        make.top.equalTo(self->subtitle.mas_bottom).with.offset(LENGTH(10));
    }];

    [NL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->dengji.mas_right).with.offset(LENGTH(20));
        make.top.equalTo(self->subtitle.mas_bottom).with.offset(LENGTH(10));
    }];

    [nengli mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(NL.mas_right).with.offset(LENGTH(0));
        make.top.equalTo(self->subtitle.mas_bottom).with.offset(LENGTH(10));
    }];

    [xunzhangone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->leftImageView.mas_right).with.offset(LENGTH(26));
        make.bottom.mas_equalTo(self->leftImageView.mas_bottom).with.offset(-LENGTH(8));
//        make.width.mas_equalTo(LENGTH(128));
        make.height.mas_equalTo(LENGTH(35));
    }];

    scrollView = [UIScrollView new];
    scrollView.backgroundColor = [UIColor clearColor];
    scrollView.delegate = self;
    scrollView.userInteractionEnabled = YES;
    [self addSubview:scrollView];
    
//    longtext = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:subtitleColor LabelFont:TextFont(Font16) TextAlignment:NSTextAlignmentLeft Text:[NSString stringWithFormat:@""]];
//    longtext.numberOfLines = 4;
//    [scrollView addSubview:longtext];
    longtext = [BookTopLabel new];
    [scrollView addSubview:longtext];
    
    [longtext mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->leftImageView.mas_left).with.offset(0);
        make.top.equalTo(self->scrollView.mas_top).with.offset(0);
        make.right.equalTo(ws).with.offset(-LENGTH(60));
        make.bottom.equalTo(self->scrollView.mas_bottom).with.offset(0);
//        make.size.greaterThanOrEqualTo(self->longtext);
    }];
    
    
    
    
    BaseLabel * zhankai = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(85,117,117)  LabelFont:TextFont(15) TextAlignment:NSTextAlignmentCenter Text:@"全部展开"];
    [self addSubview:zhankai];
    [zhankai mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->scrollView.mas_bottom).with.offset(LENGTH(20));
        make.centerX.mas_equalTo(ws);
        make.bottom.equalTo(ws.mas_bottom).with.offset(-LENGTH(24));
        make.width.mas_equalTo(LENGTH(100));
//        make.height.mas_equalTo(LENGTH(30));
    }];
    
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->leftImageView.mas_bottom).with.offset(LENGTH(20));
        make.left.equalTo(self->leftImageView.mas_left).with.offset(0);
        make.right.equalTo(ws).with.offset(-LENGTH(60));
//        make.height.mas_equalTo(self->longtext.mas_height);
        make.height.mas_equalTo(LENGTH(90));

        //        make.bottom.equalTo(ws.view).with.offset(-TabBarHeight);
    }];
    
    
    zhankai.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture1)];
        //将手势添加到需要相应的view中去
    [zhankai addGestureRecognizer:tapGesture1];
    
    sanjiao = [FLAnimatedImageView new];
    sanjiao.image = UIIMAGE(@"icon_文章_下箭头收起");
    [self addSubview:sanjiao];
    
    [sanjiao mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(zhankai.mas_centerY);
        make.left.equalTo(zhankai.mas_right).with.offset(0);
        make.width.mas_equalTo(LENGTH(12));
        make.height.mas_equalTo(LENGTH(7));
    }];
    
    xunzhangone.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushmenu)];
    [xunzhangone addGestureRecognizer:tap];
#pragma mark ----------------------- 还有?
//    jd = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:subtitleColor LabelFont:TextFont(20) TextAlignment:NSTextAlignmentCenter Text:[NSString stringWithFormat:@"精读"]];
//    jd.backgroundColor = RANDOMCOLOR;
//    [self addSubview:jd];
//    [jd mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self->leftImageView.mas_top).with.offset(LENGTH(24));
//        make.width.mas_equalTo(LENGTH(100));
//        make.height.mas_equalTo(LENGTH(40));
//        make.right.mas_equalTo(ws).with.offset(-LENGTH(26));
//    }];
}

- (void)tapGesture1{
    sanjiao.image = longtext.longlabel.numberOfLines ==0?UIIMAGE(@"icon_文章_下箭头收起"):UIIMAGE(@"icon_文章_上箭头收起");

//    longtext.numberOfLines = longtext.numberOfLines>0?0:4;
    longtext.longlabel.numberOfLines = longtext.longlabel.numberOfLines>0?0:4;

    if (longtext.longlabel.numberOfLines == 4) {
        [scrollView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(LENGTH(90));
        }];
    }else{
        [scrollView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(LENGTH(200));
        }];
    }
}
- (void)setModel:(BookXQbookModel *)model{
    _model = model;
    [leftImageView sd_setImageWithURL:URLIMAGE(model.cover) placeholderImage:UIIMAGE(ZHANWEITUSHU)];
    Title.text = model.name;
    self.jKStarDisplayView.redValue = [model.mark floatValue];

    subtitle.text =[NSString stringWithFormat:@"%@",model.author];
    dengji.text = [NSString stringWithFormat:@"%@",model.levels];
    nengli.text = model.b_score;
    NSMutableArray * arr = model.badgeList;
    if (arr.count>0) {
        xunzhangone.hidden = NO;
        xunzhangone.model = arr[0];
    }else{
        xunzhangone.hidden = YES;
    }
    longtext.longlabel.text = model.info;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    WS(ws);
    [backImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(ws.frame.size.height);
    }];
//    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, LENGTH(600));
    
}
- (void)setCitymodel:(CityBadgeListModel *)citymodel{
    _citymodel = citymodel;
}
- (void)setStatus:(BookReadingStyle)status{
        switch (status) {
            case BookIntensiveReading:
                jd.hidden = NO;
                break;
            case BookExtensiveReading:
                jd.hidden = YES;
                break;
            default:
                break;
        }
}


- (void)pushmenu{
    NSMutableArray * arr = _model.badgeList;
    if (arr.count>0) {
        CityBadgeListModel * mo = arr[0];
        MedalListXQViewController * vc = [MedalListXQViewController new];
        vc.itemid = mo.ssid;
        [self.nav pushViewController:vc animated:YES];
    }

}
@end
