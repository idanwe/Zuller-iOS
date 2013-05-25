//
//  ImageChooserViewController.h
//  Zuller
//
//  Created by Idan Wender on 5/25/13.
//  Copyright (c) 2013 Idan Wender. All rights reserved.
//

#import "BDDynamicGridViewController.h"
#import "GSBorderLabel.h"
#import <QuartzCore/QuartzCore.h>

@protocol ImageChooserDelegate;

@interface ImageChooserViewController : BDDynamicGridViewController <BDDynamicGridViewDelegate>{
    NSArray * _items;
    BOOL shouldSendUpdateToServer;
}
@property (nonatomic,retain) NSString * viewCategoryName;
@property (nonatomic,retain) NSMutableArray * chosenItems;
@property (nonatomic,retain) NSDictionary * numberToTitleDictionary;
@property (nonatomic,retain) id<ImageChooserDelegate> imageChooserDelegate;
@property int numberOfItems;

-(id)initWithCategoryName:(NSString *)category andNumberToTitleDictionary:(NSDictionary *)dictionary;
-(void)handleImageClicked:(UIView *)view withIndex:(NSInteger *)index;
-(void)updateServerWithChosenData;

@end

@protocol ImageChooserDelegate<NSObject>

@required

-(void)imageChooserClickedLastButton:(ImageChooserViewController *)viewController;

@end
