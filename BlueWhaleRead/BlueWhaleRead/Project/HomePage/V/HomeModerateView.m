//
//  HomeModerateView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/7.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HomeModerateView.h"
#import "HomeModerateCollectView.h"
#import "NavigationMenuView.h"

#import "HomeActivityViewController.h"
#define itemWidth LENGTH(115)
#define itemHeight LENGTH(204)
@implementation HomeModerateView{
    HomeModerateCollectView * collectView;
    NavigationMenuView * navMenu;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addView];

    }
    return self;
}
- (void)addView{
    WS(ws);

    navMenu = [NavigationMenuView new];
    navMenu.style = NavMenuStyleAll;
    navMenu.leftTitle = @"";
    navMenu.rightTitle = @"查看全部";
    [navMenu setBlock:^{
        [ws LookAll];
    }];
    [self addSubview:navMenu];

    [navMenu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(0);
        make.top.equalTo(ws).with.offset(LENGTH(0));
        make.right.equalTo(ws).with.offset(0);
    }];

    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(itemWidth,itemHeight);
    //定义每个UICollectionView 横向的间距
    flowLayout.minimumLineSpacing = LENGTH(26);
    //定义每个UICollectionView 纵向的间距
    flowLayout.minimumInteritemSpacing = LENGTH(26);
    //定义每个UICollectionView 的边距距
    flowLayout.sectionInset = UIEdgeInsetsMake(0, LENGTH(36), 0, LENGTH(36));//上左下右
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    collectView = [[HomeModerateCollectView alloc] initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayout];
    [self addSubview:collectView];
    [collectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(0);
        make.top.equalTo(self->navMenu.mas_bottom).with.offset(LENGTH(30));
        make.right.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(-LENGTH(31));
        
    }];
}

- (void)setModel:(TypeListModel *)model{
    _model = model;
    navMenu.leftTitle = model.name;
    collectView.nav = self.nav;
    collectView.itemarray = model.bookList;
}

#pragma mark ------------------ 查看更多
- (void)LookAll{
    HomeActivityViewController * vc = [HomeActivityViewController new];
    vc.hiden = YES;
    vc.itemid = _model.ssid;
    [self.nav pushViewController:vc animated:YES];
}
@end
