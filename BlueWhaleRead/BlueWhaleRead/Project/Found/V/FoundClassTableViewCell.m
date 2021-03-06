//
//  FoundClassTableViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/8.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "FoundClassTableViewCell.h"
#import "HomeModerateCollectView.h"
#import "FiendOrMedalView.h"
#import "FriendViewController.h"

#define itemWidth LENGTH(96)
#define itemHeight LENGTH(164)
@implementation FoundClassTableViewCell{
    FLAnimatedImageView * UserImageView;
    BaseLabel * Name;
    BaseLabel * lV;
    BaseLabel * Jf;
//    HomeFriendReadingCollectionView * collectView;
    HomeModerateCollectView * collectView;
    FiendOrMedalView * touxiang;
    BaseLabel * weidu;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addview];
    }
    return self;
}
- (void)addview{
    
    UserImageView = [FLAnimatedImageView new];
    UserImageView.image = UIIMAGE(ZHANWEITUTX);
    UserImageView.layer.masksToBounds = YES;
    UserImageView.layer.cornerRadius = LENGTH(30);
    [self addSubview:UserImageView];
    
    Name = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(4,51,50) LabelFont:TextFont(24) TextAlignment:NSTextAlignmentLeft Text:@"名字"];
    [self addSubview:Name];
    
    lV = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,154,73) LabelFont:TextFont(17) TextAlignment:NSTextAlignmentLeft Text:@"Lv2"];
    [self  addSubview:lV];
    
    Jf = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(137,159,159) LabelFont:TextFont(18) TextAlignment:NSTextAlignmentLeft Text:@"9999积分"];
    [self addSubview:Jf];
    
    BaseLabel * ZJZD =  [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:ChangYongTitLe LabelFont:TextFont(19) TextAlignment:NSTextAlignmentLeft Text:@"最近在读的书"];
    
    [self addSubview:ZJZD];
    
    WS(ws);
    [UserImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(LENGTH(30));
        make.left.equalTo(ws).with.offset(LENGTH(25));
        make.width.mas_equalTo(LENGTH(60));
        make.height.mas_equalTo(LENGTH(60));
    }];
    
    [Name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->UserImageView.mas_top).with.offset(LENGTH(5));
        make.left.equalTo(self->UserImageView.mas_right).with.offset(LENGTH(20));
    }];
    
    [lV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self->Name.mas_centerY);
        make.left.equalTo(self->Name.mas_right).with.offset(LENGTH(10));
    }];
    
    [Jf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->UserImageView.mas_right).with.offset(LENGTH(20));
        make.bottom.equalTo(self->UserImageView.mas_bottom).with.offset(-LENGTH(2));
    }];
    
//    [view mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(self->UserImageView.mas_centerY);
//        make.left.equalTo(self->lV.mas_right).with.offset(LENGTH(40));
//        make.right.equalTo(ws).with.offset(-LENGTH(26));
//    }];
    
    [ZJZD mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->UserImageView.mas_bottom).with.offset(LENGTH(30));
        make.left.equalTo(ws).with.offset(LENGTH(25));
    }];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(itemWidth,itemHeight);
    //定义每个UICollectionView 横向的间距
    flowLayout.minimumLineSpacing = LENGTH(26);
    //定义每个UICollectionView 纵向的间距
    flowLayout.minimumInteritemSpacing = LENGTH(26);
    //定义每个UICollectionView 的边距距
    flowLayout.sectionInset = UIEdgeInsetsMake(0, LENGTH(30), 0, LENGTH(30));//上左下右
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
 
    
    collectView = [[HomeModerateCollectView alloc] initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayout];
    collectView.foundinter = 6;
    [self addSubview:collectView];
    [collectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(0);
        make.top.equalTo(ZJZD.mas_bottom).with.offset(LENGTH(15));
        make.right.equalTo(ws).with.offset(0);
//        make.bottom.equalTo(ws).with.offset(-LENGTH(31));
        make.height.mas_offset(itemHeight);
    }];
    
    
    UICollectionViewFlowLayout *flowLayouts = [[UICollectionViewFlowLayout alloc] init];
    flowLayouts.itemSize = CGSizeMake(LENGTH(58),LENGTH(58));
    //定义每个UICollectionView 横向的间距
    flowLayouts.minimumLineSpacing = LENGTH(13);
    //定义每个UICollectionView 纵向的间距
    flowLayouts.minimumInteritemSpacing = LENGTH(13);
    //定义每个UICollectionView 的边距距
    flowLayouts.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);//上左下右
    flowLayouts.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    touxiang = [[FiendOrMedalView alloc] initWithLayOut:flowLayouts];
    touxiang.foundinter = 6;
    [self addSubview:touxiang];
    [touxiang mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self->UserImageView.mas_centerY);
        make.left.equalTo(self->lV.mas_right).with.offset(LENGTH(30));
//        make.right.equalTo(ws).with.offset(-LENGTH(26));
        make.height.mas_equalTo(LENGTH(58));
    }];
    
    weidu = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(137,159,159) LabelFont:TextFont(19) TextAlignment:NSTextAlignmentCenter Text:@""];
    [self addSubview:weidu];
    [weidu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(0);
        make.top.equalTo(self->collectView.mas_bottom).with.offset(LENGTH(15));
        make.right.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(-LENGTH(31));
//        make.height.mas_offset(itemHeight);
    }];
    
    UserImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    [UserImageView addGestureRecognizer:tap];
}

- (void) setModel:(FoundFriendBooKModel *)model{
    _model = model;
    touxiang.nav = self.nav;
    collectView.nav = self.nav;
    UIImage * img;
    if (model.sex == 1) {
        img = UIIMAGE(ZHANWEITUTXN);
    }else{
        img = UIIMAGE(ZHANWEITUTXV);
    }
    [UserImageView sd_setImageWithURL:URLIMAGE(model.avatar) placeholderImage:img];
    Name.text = model.name;
    lV.text = [NSString stringWithFormat:@"Lv%@",model.level];
    Jf.text = [NSString stringWithFormat:@"%@积分",model.score];
//    touxiang.nav = self.nav;
    touxiang.itemarray = model.badgeList;
    if (model.studentBook.count == 0) {
        weidu.text = @"TA暂时还没读书哦~";
        collectView.itemarray = model.studentBook;
    }else{
        weidu.text = @"";
        collectView.itemarray = model.studentBook;
    }
}
//- (void)setItemarray:(NSMutableArray *)itemarray{
//    _itemarray = itemarray;
//    NSMutableArray * arr =[NSMutableArray array];
//    for (LINSHI * model in itemarray) {
//        [arr addObject:model];
//        
//    }
//    for (LINSHI * model in itemarray) {
//        [arr addObject:model];
//        
//    }
//    float f = arr.count/6.0;
//    int a;
//    a = ceil(f);
//    [collectView mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.height.mas_offset(itemHeight * a+LENGTH(31)*(a-1));
//
//    }];
//    collectView.itemarray = arr;
//    touxiang.itemarray = arr;
//}


- (void)tap{
    FriendViewController * vc = [FriendViewController new];
    vc.itemid = _model.ssid;
    [self.nav pushViewController:vc animated:YES];
    
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
