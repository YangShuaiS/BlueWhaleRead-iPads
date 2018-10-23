//
//  HomeCkassifcationCollectionViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/7.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HomeCkassifcationCollectionViewCell.h"

@implementation HomeCkassifcationCollectionViewCell{
    FLAnimatedImageView * imageView;
    BaseLabel * name;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    WS(ws);
    imageView = [FLAnimatedImageView new];
    imageView.image =UIIMAGE(@"icon_类别1");
//    imageView.layer.cornerRadius = LENGTH(25);
//    imageView.layer.masksToBounds = YES;
    [self.contentView addSubview:imageView];
    
    name = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:ChangYongTitLe LabelFont:TextFont(21) TextAlignment:NSTextAlignmentCenter Text:@"首页"];
    [self.contentView addSubview:name];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(ws);
        make.top.equalTo(ws).with.offset(LENGTH(33));
        make.height.mas_offset(LENGTH(55));
        make.width.mas_offset(LENGTH(55));
    }];
    
    [name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(ws);
        make.top.equalTo(self->imageView.mas_bottom).with.offset(LENGTH(20));
        make.width.mas_offset(100);
        //        make.bottom.equalTo(ws).with.offset(-20);
        
    }];
}
- (void)setModel:(TagModel *)model{
    _model = model;
    name.text = model.iconName;
    [imageView sd_setImageWithURL:URLIMAGE(model.iconImg) placeholderImage:UIIMAGE(@"icon_类别1")];

}
@end
