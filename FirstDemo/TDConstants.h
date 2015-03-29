//
//  TDConstants.h
//  FirstDemo
//
//  Created by 王世坚 on 14/12/28.
//  Copyright (c) 2014年 airrons. All rights reserved.
//

#ifndef FirstDemo_TDConstants_h
#define FirstDemo_TDConstants_h

#ifdef DEBUG
#  define DLog(...)  NSLog(__VA_ARGS__)
#else
#  define DLog(...)  /* */
#endif

#define ALog(...)  NSLog(__VA_ARGS__)

#define TD_BASE_URL @"http://api.tudou.com/v6/video/"
#define TD_SEARCH_URL @"http://api.tudou.com/v6/video/search?"

#define APPv3KEY @"0ea75e4ec4b5417d"
#define APPv3SECRET @"7f9768696b5f176934a0f172b725d13e"

#define YK_BASE_URL @""
#define YK_SEARCH_URL @""


#endif
