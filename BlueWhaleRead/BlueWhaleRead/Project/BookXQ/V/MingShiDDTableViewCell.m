//
//  MingShiDDTableViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/12.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MingShiDDTableViewCell.h"
#import "MingShiDDView.h"
@implementation MingShiDDTableViewCell{
    MingShiDDView * msdd;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}
- (void)setupUI{
    WS(ws);
    msdd = [MingShiDDView new];
    [self addSubview:msdd];
    [msdd mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
    [msdd setBlock:^{
        ws.block();
    }];
}
- (void)setModel:(BookXQReadThoughtModel *)model{
    msdd.model = model;

}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
