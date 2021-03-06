//
//  PersonCell.m
//  KBLive
//
//  Created by kangbing on 17/3/8.
//  Copyright © 2017年 kangbing. All rights reserved.
//

#import "PersonCell.h"
#import "LiveModel.h"


@implementation PersonCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.iconImage];
        [self addSubview:self.nameLabel];
        [self addSubview:self.address];
        [self addSubview:self.peopleNumber];
        [self addSubview:self.coverImage];
    }
    return self;
}

- (UIImageView *)iconImage
{
    if (!_iconImage) {
        self.iconImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 45, 45)];
        _iconImage.layer.cornerRadius = _iconImage.frame.size.width * 0.5;
        _iconImage.layer.masksToBounds = YES;
        _iconImage.layer.borderColor = [[UIColor purpleColor] CGColor];
        _iconImage.layer.borderWidth = 1.5f;
    }
    return _iconImage;
}

- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(_iconImage.frame.origin.x+_iconImage.frame.size.width+10, _iconImage.frame.origin.y, UIScreen_Width, _iconImage.frame.size.height/2)];
        _nameLabel.text = @"昵称";
        _nameLabel.textColor = [UIColor blackColor];
        _nameLabel.font = [UIFont systemFontOfSize:14];
    }
    return _nameLabel;
}

- (UIButton *)address
{
    if (!_address) {
        self.address = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _address.frame = CGRectMake(_nameLabel.frame.origin.x, _nameLabel.frame.origin.y+_nameLabel.frame.size.height, UIScreen_Width/2, _nameLabel.frame.size.height);
        [_address setImage:[UIImage imageNamed:@"address"] forState:(UIControlStateNormal)];
        [_address setTitle:@"中国" forState:(UIControlStateNormal)];
        [_address setTitleColor:[UIColor lightGrayColor] forState:(UIControlStateNormal)];
        _address.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _address.titleEdgeInsets = UIEdgeInsetsMake(0, 3, 0, 0);
        _address.titleLabel.font = [UIFont systemFontOfSize:12];
        
    }
    return _address;
}

- (UILabel *)peopleNumber
{
    if (!_peopleNumber) {
        self.peopleNumber = [[UILabel alloc] initWithFrame:CGRectMake(_address.frame.origin.x+_address.frame.size.width, _address.frame.origin.y, UIScreen_Width/3-40, _address.frame.size.height)];
        _peopleNumber.text = @"9999";
        _peopleNumber.textColor = [UIColor purpleColor];
        _peopleNumber.font = [UIFont systemFontOfSize:15];
        _peopleNumber.textAlignment = NSTextAlignmentRight;
        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(_peopleNumber.frame.origin.x+_peopleNumber.frame.size.width, _peopleNumber.frame.origin.y+1.5, 30, _peopleNumber.frame.size.height)];
        label.text = @" 在看";
        label.textColor = [UIColor lightGrayColor];
        label.font = [UIFont systemFontOfSize:11];
        label.textAlignment = NSTextAlignmentLeft;
        [self addSubview:label];
        
        
    }
    return _peopleNumber;
}

- (UIImageView *)coverImage
{
    if (!_coverImage) {
        self.coverImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, _iconImage.frame.origin.y+_iconImage.frame.size.height+10, UIScreen_Width, ([UIScreen mainScreen].bounds.size.width * 618/480) - _iconImage.frame.size.height-20)];
    }
    return _coverImage;
}

- (void)setLiveModel:(LiveModel *)liveModel{

    _liveModel = liveModel;
    
    _nameLabel.text = liveModel.creator.nick;
    // 用户所在城市
    if ([liveModel.city isEqualToString:@""]) {
        [_address setTitle:@"暂无位置" forState:(UIControlStateNormal)];
    }else{
        [_address setTitle:liveModel.city forState:(UIControlStateNormal)];
    }

    // 用户Image
    [_iconImage sd_setImageWithURL:[NSURL URLWithString:liveModel.creator.portrait]];
    // 封面Image
    [_coverImage sd_setImageWithURL:[NSURL URLWithString:liveModel.creator.portrait]];

    // 观看人数
    _peopleNumber.text = liveModel.online_users;
    
    
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
