//
//  CCGameChatCell.m
//  SmallGames
//
//  Created by hello on 2018/9/29.
//  Copyright © 2018年 hello. All rights reserved.
//

#import "CCGameChatCell.h"

@interface CCGameChatCell()
@property(nonatomic,strong)UIImageView *userHeaderImageView;
@property(nonatomic,strong)UILabel     *userNameLabel;
@property(nonatomic,strong)UIImageView *contentImageView;
@property(nonatomic,strong)UILabel *contentLabel;
@property(nonatomic,strong)UILabel *timeLabel;
@end

@implementation CCGameChatCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initView];
    }
    return self;
}

-(instancetype)init{
    if (self == [super init]) {
        [self initView];
    }
    return self;
}


-(void)setChatMessageModel:(CCChatMessageModel *)chatMessageModel{
    _chatMessageModel = chatMessageModel;

    if ([chatMessageModel.type isEqualToString:@"say"]||[chatMessageModel.type isEqualToString:@"bets"]) {
        for (UIView *view in self.subviews) {
            [view removeFromSuperview];
        }
        [self initView];
        
        if([chatMessageModel.from_show_id isEqualToString:[AppDelegate sharedApplicationDelegate].userInfoModel.showid]){
            self.contentImageView.image = [[UIImage imageNamed:@"ziji"] resizableImageWithCapInsets:UIEdgeInsetsMake(5,5,5,5)];
        }else{
            self.contentImageView.image = [[UIImage imageNamed:@"bieren"] resizableImageWithCapInsets:UIEdgeInsetsMake(5,5,5,5)];
        }
        
        [self.contentImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.userNameLabel.mas_bottom).offset(5);
            make.left.equalTo(self.userHeaderImageView.mas_right).offset(5);
            make.width.equalTo(@(([self->_chatMessageModel returnContentWidth])+20));
            make.height.equalTo(@(([self->_chatMessageModel returnContentHight])+10));
        }];
        
        [self.userHeaderImageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",chatMessageModel.from_client_headimg]] placeholder:[UIImage imageNamed:@"GameFootViewIcon_grzx"]];
    }else{
        for (UIView *view in self.subviews) {
            [view removeFromSuperview];
        }
        [self initView];
        
        self.contentImageView.image = [[UIImage imageNamed:@"guanliyuan"] resizableImageWithCapInsets:UIEdgeInsetsMake(5,5,5,5)];
        
        
        [self.userHeaderImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-10);
            make.top.equalTo(self).offset(5);
            make.width.height.equalTo(@40);
        }];
        
        [self.contentImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.userNameLabel.mas_bottom).offset(5);
            make.left.equalTo(self.userHeaderImageView.mas_right).offset(5);
            make.width.equalTo(@([chatMessageModel returnContentWidth]+20));
            make.height.equalTo(@([chatMessageModel returnContentHight]+10));
        }];
        
        [self.userNameLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.userHeaderImageView.mas_left).offset(-5);
            make.top.equalTo(self.userHeaderImageView);
            make.height.equalTo(@15);
        }];
        
        [self.timeLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(self.userNameLabel);
            make.right.equalTo(self.userNameLabel.mas_left).offset(-3);
            make.height.equalTo(@15);
        }];
        
        [self.contentImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.userNameLabel.mas_bottom).offset(5);
            make.right.equalTo(self.userHeaderImageView.mas_left).offset(-5);
            make.width.equalTo(@([chatMessageModel returnContentWidth]+20));
            make.height.equalTo(@([chatMessageModel returnContentHight]+10));
        }];
        
        [self.contentLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentImageView).offset(5);
            make.top.equalTo(self.contentImageView).offset(5);
            make.bottom.equalTo(self.contentImageView).offset(-5);
            make.right.equalTo(self.contentImageView).offset(-15);
        }];
        
        [self.userHeaderImageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",MAINIP,chatMessageModel.head_img_url]] placeholder:[UIImage imageNamed:@"GameFootViewIcon_grzx"]];
    }
    
    self.contentLabel.text = chatMessageModel.content;
    self.userNameLabel.text = chatMessageModel.from_client_name;
    self.timeLabel.text = chatMessageModel.time;
}

-(void)initView{
    self.backgroundColor = [UIColor clearColor];
    [self addSubview:self.userHeaderImageView];
    [self.userHeaderImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(5);
        make.top.equalTo(self).offset(5);
        make.width.height.equalTo(@40);
    }];
    
    [self addSubview:self.userNameLabel];
    [self.userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.userHeaderImageView.mas_right).offset(5);
        make.top.equalTo(self.userHeaderImageView);
        make.height.equalTo(@15);
    }];
    
    [self addSubview:self.timeLabel];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.userNameLabel);
        make.left.equalTo(self.userNameLabel.mas_right).offset(3);
        make.height.equalTo(@15);
    }];
    
    [self addSubview:self.contentImageView];
    [self.contentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.userNameLabel.mas_bottom).offset(5);
        make.left.equalTo(self.userHeaderImageView.mas_right).offset(5);
        make.width.equalTo(@50);
        make.height.equalTo(@30);
    }];
   
    [self.contentImageView addSubview:self.contentLabel];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentImageView).offset(15);
        make.top.equalTo(self.contentImageView).offset(5);
        make.bottom.equalTo(self.contentImageView).offset(-5);
        make.right.equalTo(self.contentImageView).offset(-5);
    }];
    
}



-(UIImageView *)userHeaderImageView{
    if (!_userHeaderImageView) {
        _userHeaderImageView = [[UIImageView alloc]init];
        _userHeaderImageView.image = [UIImage imageNamed:@"0"];
    }
    return _userHeaderImageView;
}

-(UIImageView *)contentImageView{
    if (!_contentImageView) {
        _contentImageView = [[UIImageView alloc]init];
//        UIImage *backgroundImage = [UIImage imageNamed:@"chat_bubble"];
//        backgroundImage= [backgroundImage resizableImageWithCapInsets:UIEdgeInsetsMake(15,15,15,15)];
//        _contentImageView.image = backgroundImage;
    }
    return _contentImageView;
}

-(UILabel *)userNameLabel{
    if (_userNameLabel == nil) {
        _userNameLabel = [[UILabel alloc]init];
        _userNameLabel.font = [UIFont boldSystemFontOfSize:13];
        _userNameLabel.textColor = [UIColor blackColor];
        _userNameLabel.textAlignment = NSTextAlignmentCenter;
        _userNameLabel.text = @"ID昵称 14:15:12";
    }
    return _userNameLabel;
}

-(UILabel *)timeLabel{
    if (_timeLabel == nil) {
        _timeLabel = [[UILabel alloc]init];
        _timeLabel.font = [UIFont systemFontOfSize:13];
        _timeLabel.textColor = MCUIColorFromRGB(0x666666);
        _timeLabel.textAlignment = NSTextAlignmentCenter;
        _timeLabel.text = @"14:15:12";
    }
    return _timeLabel;
}

-(UILabel *)contentLabel{
    if (_contentLabel == nil) {
        _contentLabel = [[UILabel alloc]init];
        _contentLabel.font = [UIFont systemFontOfSize:14];
        _contentLabel.numberOfLines = 0;
        _contentLabel.text = @"123/123/100";
    }
    return _contentLabel;
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
