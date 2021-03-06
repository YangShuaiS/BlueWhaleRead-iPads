//
//  HomeActivityTopView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/25.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HomeActivityTopView.h"

@implementation HomeActivityTopView{
    FLAnimatedImageView * imageview;
    BaseLabel * title;
    BaseLabel * zk;
    FLAnimatedImageView * sanjiao;

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
    imageview = [FLAnimatedImageView new];
//    imageview.image = UIIMAGE(@"bg_推荐书籍");
//    imageview.backgroundColor = [UIColor cyanColor]; 
    [self addSubview:imageview];
    [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws);
        make.right.mas_equalTo(ws);
        make.top.mas_equalTo(ws);
        make.height.mas_equalTo(LENGTH(200));
    }];
    
    NSString * str = @"端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来端午节的由来";
    title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:ChangYongTitLe LabelFont:TextFont(20) TextAlignment:NSTextAlignmentLeft Text:str];
    title.numberOfLines = 4;
    [self addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->imageview.mas_bottom).with.offset(LENGTH(22));
        make.right.equalTo(ws).with.offset(-LENGTH(22));
        make.left.equalTo(ws).with.offset(LENGTH(22));
    }];
    
    zk = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(85,117,117) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentCenter Text:@"全部展开"];
    [self addSubview:zk];
    [zk mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->title.mas_bottom).with.offset(LENGTH(22));
        make.centerX.mas_equalTo(ws);
        make.height.mas_equalTo(LENGTH(30));
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(20));
    }];
    
    sanjiao = [FLAnimatedImageView new];
    sanjiao.image = UIIMAGE(@"icon_文章_下箭头收起");
    [self addSubview:sanjiao];
    [sanjiao mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->zk.mas_right).with.offset(LENGTH(5));
        make.centerY.mas_equalTo(self->zk.mas_centerY);
        make.width.mas_equalTo(LENGTH(12));
        make.height.mas_equalTo(LENGTH(7));

    }];
    
    zk.userInteractionEnabled = YES;
    //添加手势
    UITapGestureRecognizer * tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture)];
    //将手势添加到需要相应的view中去
    [zk addGestureRecognizer:tapGesture1];
    
}
- (void)tapGesture{
    if (title.numberOfLines == 4) {
        sanjiao.image = UIIMAGE(@"icon_文章_下箭头收起");
    }else{
        sanjiao.image = UIIMAGE(@"icon_文章_上箭头收起");

    }
    title.numberOfLines = title.numberOfLines>0?0:4;
    zk.text = [zk.text isEqualToString:@"全部展开"]?@"收回":@"全部展开";
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationAcitivity object:nil];

}
- (void)setHidden:(BOOL)hidden{
    _hiden = hidden;
    if (hidden == YES) {
        WS(ws);
        [zk removeFromSuperview];
        [sanjiao removeFromSuperview];
        [title mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self->imageview.mas_bottom).with.offset(LENGTH(22));
            make.right.equalTo(ws).with.offset(-LENGTH(22));
            make.left.equalTo(ws).with.offset(LENGTH(22));
            make.bottom.mas_equalTo(ws).with.offset(-LENGTH(20));
        }];
    }
}

- (void)setModel:(ZhuTiTagModel *)model{
    [imageview sd_setImageWithURL:URLIMAGE(model.theme_img) placeholderImage:UIIMAGE(@"")];
    title.text = model.descriptions;
}
@end
