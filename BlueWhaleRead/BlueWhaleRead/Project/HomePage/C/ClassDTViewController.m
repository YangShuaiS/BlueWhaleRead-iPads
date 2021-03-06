//
//  ClassDTViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/6.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ClassDTViewController.h"
#import "ClassDTTableView.h"
@interface ClassDTViewController ()<NavDelegate>{
    ClassDTTableView *tableView;

}

@end

@implementation ClassDTViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self AddNavtion];
    self.view.backgroundColor = BEIJINGCOLOR;
    WS(ws);
    tableView = [ClassDTTableView new];
    tableView.nav = self.navigationController;
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.navtive.mas_bottom);
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.bottom.equalTo(ws.view).with.offset(0);
    }];
    [self LoadData];
}

- (void)LoadData{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_BANJIDONGTAI];
    NSDictionary * dic = @{@"studentid":Me.ssid};

    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            ClassBJDTModel * model = [ClassBJDTModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                [self UpData:model];
            }
        }else{
        }
    }];
    
}
- (void)UpData:(ClassBJDTModel *)model{
    tableView.itemarray = model.classDynamic;
}
#pragma mark --------------------  导航栏以及代理
- (void)AddNavtion{
    [super AddNavtion];
    WS(ws);
    self.navtive = [[NativeView alloc] initWithLeftImage:@"icon_返回_粗" Title:@"班级动态" RightTitle:@"" NativeStyle:NavStyleGeneral];
    self.navtive.delegate = self;
    [self.view addSubview:self.navtive];
    [ws.navtive mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(ws.view).with.offset(0);
        make.height.mas_equalTo(NavHeight);
    }];
}
- (void)NavLeftClick{
    
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
