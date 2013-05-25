//
//  ImageChooserViewController.m
//  Zuller
//
//  Created by Idan Wender on 5/25/13.
//  Copyright (c) 2013 Idan Wender. All rights reserved.
//

#import "ImageChooserViewController.h"
#import "ImageChooserViewControllerPrivate.h"


@interface ImageChooserViewController ()

@end

@implementation ImageChooserViewController
@synthesize viewCategoryName, chosenItems,numberToTitleDictionary,imageChooserDelegate,numberOfItems;

-(id)initWithCategoryName:(NSString *)category andNumberToTitleDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self){
        viewCategoryName = category;
        chosenItems = [[NSMutableArray alloc]init];
        numberToTitleDictionary = dictionary;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.delegate = self;
    
    //for use inside blocks
    __weak typeof(self) weakSelf = self;
    
    self.onLongPress = ^(UIView* view, NSInteger viewIndex){
        NSLog(@"Long press on %@, at %d", view, viewIndex);
    };
    
    self.onDoubleTap = ^(UIView* view, NSInteger viewIndex){
        NSLog(@"Double tap on %@, at %d", view, viewIndex);
    };    self.delegate = self;

    self.onSingleTap = ^(UIView * view, NSInteger viewIndex){
        
        //if it was the Last to be clicked
        NSLog(@"number of items %d",weakSelf.numberOfItems);
        NSLog(@"viewIndex %d",viewIndex);
        NSLog(@"THE NUMBERS ARE THE SAME - %c", weakSelf.numberOfItems == viewIndex + 1);
        
        if (weakSelf.numberOfItems == viewIndex + 1)
        {
            if (weakSelf.imageChooserDelegate)
            {
                [weakSelf.imageChooserDelegate imageChooserClickedLastButton:weakSelf];
                return;
            }
        }
        [UIView transitionWithView:view duration:0.4
                           options:UIViewAnimationOptionTransitionCrossDissolve
                        animations:^{
                            if (view.alpha == 1)
                            {
                                [view setBackgroundColor:[UIColor greenColor]];
                                [view setAlpha:0.5];
                            }
                            else
                            {
                                [view setBackgroundColor:[UIColor clearColor]];
                                [view setAlpha:1];
                            }
                                
                        }
                        completion:nil];
        
        NSLog(@"Single tap on %@, at %d", view, viewIndex);
        NSString * index = [NSString stringWithFormat:@"%d",viewIndex];
        //Check error, looks not good
        
        int indexOfItem = [weakSelf.chosenItems indexOfObject:index];
        if (indexOfItem == NSNotFound)
            [weakSelf.chosenItems addObject:index];
        else [weakSelf.chosenItems removeObjectAtIndex:indexOfItem];
        NSLog(@"chosen items length - %@",weakSelf.chosenItems);
    };
    [self _demoAsyncDataLoading];
    [self buildBarButtons];


}

- (void)animateReload
{
    _items = [NSArray new];
    [self _demoAsyncDataLoading];
}

- (NSUInteger)numberOfViews
{
    return _items.count;
}

-(NSUInteger)maximumViewsPerCell
{
    return 1;
}

- (UIView *)viewAtIndex:(NSUInteger)index rowInfo:(BDRowInfo *)rowInfo
{
    UIImageView * imageView = [_items objectAtIndex:index];
    return imageView;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    //Call super when overriding this method, in order to benefit from auto layout.
    [super shouldAutorotateToInterfaceOrientation:toInterfaceOrientation];
    return YES;
}

- (CGFloat)rowHeightForRowInfo:(BDRowInfo *)rowInfo
{
    //    if (rowInfo.viewsPerCell == 1) {
    //        return 125  + (arc4random() % 55);
    //    }else {
    //        return 100;
    //    }
//    return 55 + (arc4random() % 125);
    return 120;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
