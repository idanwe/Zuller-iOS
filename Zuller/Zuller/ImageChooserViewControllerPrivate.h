//
//  ImageChooserViewControllerPrivate.h
//  Zuller
//
//  Created by Idan Wender on 5/25/13.
//  Copyright (c) 2013 Idan Wender. All rights reserved.
//

#import "ImageChooserViewController.h"

@interface ImageChooserViewController (Private)


- (void) _demoAsyncDataLoading;
- (void) buildBarButtons;
-(UILabel *)createLabelForImageClickedAtIndex:(int)viewIndex;
@end
