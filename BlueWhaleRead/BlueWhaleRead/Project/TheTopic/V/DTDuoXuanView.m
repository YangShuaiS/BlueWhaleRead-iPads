


//
//  DTDuoXuan.m
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/5/23.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "DTDuoXuanView.h"
#import "DTTableViewCell.h"
#import "DTTiMuView.h"
#import "DTDownLasOrNextView.h"

@interface DTDuoXuanView ()<UITableViewDelegate,UITableViewDataSource,DtDownDelegate>
@property (strong, nonatomic) BaseTableView *tableView;

@end
@implementation DTDuoXuanView{
    UIScrollView * scrollView;

    DTTableViewCell * lastCell;
    NSArray * cellarray;
    DTTiMuView * tiMu;
    BaseLabel *Confirm;
    NSMutableArray * itemarray;

    DTDownLasOrNextView * downView;
    BaseLabel *LongAn;
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
    _xzdaarray = [NSMutableArray array];
    _zqdaarray = [NSMutableArray array];
    
    scrollView = [UIScrollView new];
    scrollView.backgroundColor = [UIColor clearColor];
    scrollView.delegate = self;
    scrollView.userInteractionEnabled = YES;
    [self addSubview:scrollView];
    
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(LENGTH(87)+StatusBar+44);
        make.left.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(0);
        
    }];
    
    tiMu = [DTTiMuView new];
    tiMu.style = DTDuoXuanStyle;
    tiMu.TiMuText = @"我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题";
    [scrollView addSubview:tiMu];
    [tiMu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->scrollView.mas_top).with.offset(0);
        make.left.equalTo(ws).with.offset(LENGTH(52));
        make.right.equalTo(ws).with.offset(-LENGTH(52));
    }];
    
    LongAn = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGBA(255,255,255,0.9) LabelFont:TextFont(22) TextAlignment:NSTextAlignmentCenter Text:@"（2个正确答案）"];
    //    LongAn.backgroundColor = RGB(96, 198, 194);
    [scrollView addSubview:LongAn];
    
    [LongAn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->tiMu.mas_bottom).with.offset(LENGTH(26));
        make.centerX.mas_equalTo(self);
    }];
    
    
    [scrollView addSubview:self.tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->LongAn.mas_bottom).with.offset(LENGTH(30));
        make.left.equalTo(ws).with.offset(LENGTH(134));
        make.right.equalTo(ws).with.offset(-LENGTH(134));
        make.height.mas_equalTo(HEIGHT*6);

    }];
    
    downView = [DTDownLasOrNextView new];
    downView.delegate = self;
    [scrollView addSubview:downView];
    [downView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.tableView.mas_bottom).with.offset(LENGTH(80));
        make.left.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);
        make.bottom.equalTo(self->scrollView.mas_bottom).with.offset(-LENGTH(50));
    }];

    
}
- (void)uptableview{
    cellarray = [self cellsForTableView:_tableView];
    CGFloat itemHeight = 0;
    for (DTTableViewCell * cell in cellarray) {
        itemHeight = itemHeight + cell.frame.size.height;
    }
    if (itemHeight < HEIGHT-LENGTH(87)-StatusBar-44-LENGTH(50)-downView.frame.size.height) {
        WS(ws);
        [_tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self->LongAn.mas_bottom).with.offset(LENGTH(30));
            make.left.equalTo(ws).with.offset(LENGTH(134));
            make.right.equalTo(ws).with.offset(-LENGTH(134));
            make.height.mas_equalTo(itemHeight);
            make.bottom.equalTo(self->scrollView.mas_bottom).with.offset(-LENGTH(50));
        }];
        
        [downView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(ws).with.offset(0);
            make.right.equalTo(ws).with.offset(0);
            make.bottom.equalTo(ws.mas_bottom).with.offset(-LENGTH(50));
        }];
        
    }else{
        WS(ws);
        [_tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self->LongAn.mas_bottom).with.offset(LENGTH(30));
            make.left.equalTo(ws).with.offset(LENGTH(134));
            make.right.equalTo(ws).with.offset(-LENGTH(134));
            make.height.mas_equalTo(itemHeight);
        }];
        [downView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(ws.tableView.mas_bottom).with.offset(LENGTH(80));
            make.left.equalTo(ws).with.offset(0);
            make.right.equalTo(ws).with.offset(0);
            make.bottom.equalTo(self->scrollView.mas_bottom).with.offset(-LENGTH(50));
        }];
    }
}
-(NSArray *)cellsForTableView:(UITableView *)tableView
{
    NSInteger sections = tableView.numberOfSections;
    NSMutableArray *cells = [[NSMutableArray alloc]  init];
    for (int section = 0; section < sections; section++) {
        NSInteger rows =  [tableView numberOfRowsInSection:section];
        for (int row = 0; row < rows; row++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:section];
            [cells addObject:[tableView cellForRowAtIndexPath:indexPath]];
        }
    }
    return cells;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[BaseTableView alloc] init];
        _tableView.separatorStyle = UITableViewStylePlain;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor clearColor];
        //使tableview无数据时候无下划线
        _tableView.tableFooterView = [[UIView alloc]init];
        _tableView.estimatedRowHeight = 300;//估算高度
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.scrollEnabled =NO;
        
    }
    return _tableView;
}

#pragma mark  - tableViewDelegate代理方法

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return itemarray.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * rid = @"cell";
    DTTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:rid];
    if(cell==nil){
        cell=[[DTTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
    }
    cell.style = 1;
    cell.model = itemarray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * v = [UIView new];
    v.backgroundColor = RGB(0xf8, 0xf8, 0xf8);
    return v;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    lastCell = cellarray[indexPath.row];
    if (lastCell.style ==1) {
        lastCell.style = 0;
        [_xzdaarray addObject:lastCell.model];

    }else{
        lastCell.style = 1;
        [_xzdaarray removeObject:lastCell.model];
    }
}
//确认答案点击事件
- (void)DtDownClick:(PushModel *)model{
    [self.delegate PushFriendViewCOntroller:model];
}

-(void)setDtdownstyle:(DtLastOrNext)dtdownstyle{
    if (downView.dtdownstyle==0) {
        _dtdownstyle = dtdownstyle;
        downView.dtdownstyle = dtdownstyle;
    }
}

- (void)setModel:(BookProblemsModel *)model{
    if (itemarray.count == 0) {
        _model = model;
        tiMu.TiMuText = model.question;
        LongAn.text = [NSString stringWithFormat:@"（%ld个正确答案）",model.correct_num];
        itemarray = [NSMutableArray array];
        
        if (![model.option1 isEqualToString:@""]) {
            TiMuModel * models = [TiMuModel new];
            models.TiMu = @"option1";
            models.DaAn = model.option1;
            [itemarray addObject:models];
        }
        if (![model.option2 isEqualToString:@""]){
            TiMuModel * models = [TiMuModel new];
            models.TiMu = @"option2";
            models.DaAn = model.option2;
            [itemarray addObject:models];        }
        if (![model.option3 isEqualToString:@""]){
            TiMuModel * models = [TiMuModel new];
            models.TiMu = @"option3";
            models.DaAn = model.option3;
            [itemarray addObject:models];        }
        if (![model.option4 isEqualToString:@""]){
            TiMuModel * models = [TiMuModel new];
            models.TiMu = @"option4";
            models.DaAn = model.option4;
            [itemarray addObject:models];        }
        if (![model.option5 isEqualToString:@""]){
            TiMuModel * models = [TiMuModel new];
            models.TiMu = @"option5";
            models.DaAn = model.option5;
            [itemarray addObject:models];        }
        if (![model.option6 isEqualToString:@""]){
            TiMuModel * models = [TiMuModel new];
            models.TiMu = @"option6";
            models.DaAn = model.option6;
            [itemarray addObject:models];        }
        if (![model.option7 isEqualToString:@""]){
            TiMuModel * models = [TiMuModel new];
            models.TiMu = @"option7";
            models.DaAn = model.option7;
            [itemarray addObject:models];        }
        if (![model.option8 isEqualToString:@""]){
            TiMuModel * models = [TiMuModel new];
            models.TiMu = @"option8";
            models.DaAn = model.option8;
            [itemarray addObject:models];        }
        if (![model.option9 isEqualToString:@""]){
            TiMuModel * models = [TiMuModel new];
            models.TiMu = @"option9";
            models.DaAn = model.option9;
            [itemarray addObject:models];        }
        if (![model.optionx isEqualToString:@""]){
            TiMuModel * models = [TiMuModel new];
            models.TiMu = @"optionx";
            models.DaAn = model.optionx;
            [itemarray addObject:models];
        }
        
        for (int i = 0; i < model.correct_num; i++) {
            TiMuModel * models = itemarray[i];
            [_zqdaarray addObject:models];
        }
        
        itemarray = (NSMutableArray *)[itemarray sortedArrayUsingComparator:(NSComparator)^(id obj1, id obj2) {
            return (arc4random() % 3) - 1;
        }];
        _timuarray = itemarray;
        
        [_tableView reloadData];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self uptableview];
        });
    }
}
@end
