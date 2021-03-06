//
//  UnreadViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/19.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "UnreadViewController.h"
#import "UnreadBookListTableView.h"
@interface UnreadViewController ()
@property (strong, nonatomic) UnreadBookListTableView *tableView;

@end

@implementation UnreadViewController{
    NSMutableArray * itemarray;
    NSInteger page;
    GeneraNoDataView * wdView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BEIJINGCOLOR;
    WS(ws);
    _tableView = [UnreadBookListTableView new];
    _tableView.nav = self.navigationController;
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.view);
    }];
    [self chushihua];
    _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [ws loadRequestData:1 nsstring:@""];
    }];
    [_tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        // 进入刷新状态后会自动调用这个 block
        if (self->page == 1) {
            [ws loadRequestData:0 nsstring:@""];
        }else{
            [ws.tableView.mj_header endRefreshing];
            [ws.tableView.mj_footer endRefreshing];
//            if (fpModel.countpage<number) {
//                [ws.tableView.mj_footer endRefreshingWithNoMoreData];
//            }else{
//                [ws loadRequestData:0];
//            }
        }
    }];

}
- (void)chushihua{
    itemarray = [NSMutableArray array];
    page = 1;
}
- (void)loadRequestData:(NSInteger)chushihua nsstring:(NSString *)bookName{
    if (chushihua == 1) {
        page = 1;
    }
    WS(ws);
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_USERBOOKLIST];
    NSDictionary * dic = @{@"type":@"1",@"studentid":Me.ssid,@"bookName":bookName};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            UnreadBookListModel * model = [UnreadBookListModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                self->page ++;
                if (chushihua == 1) {
                    self->itemarray = [NSMutableArray array];
                }
                [ws UpData:model];
            }
        }else{
            [ws.tableView.mj_header endRefreshing];
            [ws.tableView.mj_footer endRefreshing];
        }
        
    }];
}
- (void)UpData:(UnreadBookListModel *)model{
    [itemarray addObjectsFromArray:model.bookList];
    [_tableView.mj_header endRefreshing];
    [_tableView.mj_footer endRefreshing];
    if (itemarray.count == 0) {
        if (wdView == nil) {
            [self addShaFa];
        }else{
            [wdView removeFromSuperview];
            [self addShaFa];
        }
    }else{
        if (wdView != nil) {
            [wdView removeFromSuperview];
        }
    }
    _tableView.itemarray = itemarray;

}

- (void)addShaFa{
    WS(ws);
    wdView = [GeneraNoDataView new];
    wdView.backgroundColor = WhitColor;
    wdView.image = @"icon_缺省页_书";
    wdView.titlename = @"你还没有把书加入书架哦，前去书城选书吧！";
    wdView.clickName = @"前去书城";
    wdView.style = NoDtaaViewStyleImageLabelClick;
    [self.view addSubview:wdView];
    [wdView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.view);
    }];
    
    [wdView setBlock:^{
        ws.tabBarController.selectedIndex = 2;
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)setBookName:(NSString *)bookName{
    _bookName= bookName;
    [self loadRequestData:1 nsstring:bookName];

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
