//
//  ViewController.m
//  TestGradientImage
//
//  Created by  on 2011/12/27.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    //UIImageView *fishView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 90, 320, 100)];
    //[fishView setImage:[UIImage imageNamed:@"fish.png"]];
    
    //UIImage init會沒有圖？
    UIImage *fishImage = [UIImage imageNamed:@"fish.png"];    
    UIImageView *fishView = [[UIImageView alloc]initWithImage:fishImage];
    [fishView setFrame:CGRectMake(0, 60, 320, 100)];
    
    [fishView setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:fishView];
    
    UITextView *textView = [[UITextView alloc]initWithFrame:CGRectMake(0, 100, 320, 200)];
    textView.text = @"「我的血型Ｂ型，爸媽都是Ａ型，這種狀況明明存在，難道老師教錯？」一名國中生上了生物課血型與遺傳後，向父親提出疑問，意外讓王姓男子發現養了十多年的兒女，都是老婆和同一名外遇對象所生的，訴請離婚獲准。\n台北地方法院並認為，王妻婚後不到二年就與外遇對象發生性關係，其兒女年齡相差八歲，可見王妻與外遇對象起碼維持近十年的不正常關係；王姓男子悉心呵護子女，卻在年過半百之際，發現子女非其親生，情何以堪？判決妻子還須賠償他一百萬元精神慰撫金。\n王姓男子結婚廿多年，妻子婚後二年多生下女兒，女兒聰慧乖巧，王姓男子疼愛有加，八年後又生兒子，但兒子一出生就罹患罕見疾病，王姓男子為了讓兒子有個快樂童年，及完整的生活照護，辭掉工作專心照顧兒子日常起居，不僅接送上下學，也積極參與兒子學校活動。\n為了刺激兒子學習成長，王姓男子陪兒子學下棋、心算，甚至在部落格記錄兒子的成長。豈料，兒子上國中後，在生物課上學習血型與遺傳課程，好奇詢問父母血型，發現父母都是Ａ型，但他卻是Ｂ型後，直言老師說「Ａ型父母應該生不出Ｂ型小孩」，難道是老師教錯了？\n王姓男子上網查詢相關資料，確認老師講得沒錯，為進一步查明真相，帶兒女驗ＤＮＡ，證實兒女皆非他所生，氣的訴請離婚，並要求妻子賠償三百五十萬元。\n王妻承認婚後不久就外遇，且兩名兒女都是與同一名外遇對象所生，她原本不確定兒女生父是誰，這次訴訟驗ＤＮＡ後才確定。她並說，丈夫十多年不工作，靠借貸過日，兩人早就無婚姻之實。據了解，王姓男子在全案爆發後，已沒有和妻兒們同住。";
    //粗體
    //[textView setFont:[UIFont boldSystemFontOfSize:10]];
    //斜體
    //[textView setFont:[UIFont italicSystemFontOfSize:10]];
    //系統字型
    //[textView setFont:[UIFont systemFontOfSize:10]];
    //自定
    //[textView setFont:[UIFont fontWithName:<#(NSString *)#> size:<#(CGFloat)#>]];
    [self.view addSubview:textView];
    
    //往前移
    [self.view bringSubviewToFront:fishView];
    
    /*移動圖層位置
     //加入順序會影響圖層位置，先加入的會在下面
     
     //往前移，相對位置
     [self.view bringSubviewToFront:fishView];
     //往後移，相對位置
     [self.view sendSubviewToBack:fishView];
     //交換
     [self.view exchangeSubviewAtIndex:indexA withSubviewAtIndex:indexB];
     */
    
    //使用RGB顏色模型
    CGColorSpaceRef myColorspace=CGColorSpaceCreateDeviceRGB();
    
    //影響漸層遮色片範圍
    CGSize size=CGSizeMake( 320, 200);
    //漸層位置
    CGRect rect=CGRectMake(0, 100, 320,200);
    //開始繪圖
    UIGraphicsBeginImageContext(size);
    
    //建立畫布
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    
    //顏色的分配，值在0跟1之間
    //指定關鍵顏色位置
    CGFloat locations[] = { 0, 0.25, 0.5, 0.75, 1 };
    //關鍵顏色的陣列，四個一組分別為R,G,B,A
    CGFloat components[] = { 
        1.0, 1.0, 1.0, 0.1,
        0.75, 0.75, 0.75, 0.25,
        0.5, 0.5, 0.5, 0.5,
        0.25, 0.25, 0.25, 0.75,
        0.0, 0.0, 0.0, 1.0
    };
    
    //建立一個漸層的物件，最後“4"是代表顏色數量。
    //使用色彩，關鍵顏色，關鍵顏色位置，關鍵顏色數量
    CGGradientRef myGradient = CGGradientCreateWithColorComponents(myColorspace, components, locations,5);
    
    //繪製線性漸層
    CGContextDrawLinearGradient(context, myGradient, CGPointMake(0,0), CGPointMake(0,rect.size.height), 0); 
    //保存
    CGContextSaveGState(context);
    //
    CGContextRestoreGState(context);
    //
    CGImageRef theCGImage=CGBitmapContextCreateImage(context);
    
    //UIImage 漸層遮色片
    UIImage *image=[UIImage imageWithCGImage:theCGImage];
    //ImageView位置
    UIImageView *imageView=[[UIImageView alloc] initWithFrame:rect];
    [imageView setImage:image];
    
    [self.view addSubview:imageView];
    
    //結束繪圖
    UIGraphicsEndImageContext();
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
