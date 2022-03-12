# Game Manuals plugin for attract mode frontend
A plugin for attractmode frontend for displaying game manuals, where each page is one image, or for displaying instruction or promo videos that should work on any layout used. It works on windows and linux, even on the raspberry pi

![Screenshot 1](/img/screenshot1.png) ![Screenshot 2](/img/screenshot2.png)

[Latest Release](https://github.com/joyrider3774/attract_gamemanuals_plugin/releases/latest)

## Buy me a "koffie" if you feel like supporting 
I do everything in my spare time for free, if you feel something aided you and you want to support me, you can always buy me a "koffie" as we say in dutch, no obligations whatsoever...

<a href='https://ko-fi.com/Q5Q3BKI5S' target='_blank'><img height='36' style='border:0px;height:36px;' src='https://cdn.ko-fi.com/cdn/kofi2.png?v=3' border='0' alt='Buy Me a Coffee at ko-fi.com' /></a>

## Installing
Download the latest release from the [releases tab](https://github.com/joyrider3774/attract_gamemanuals_plugin/releases), extract the files and copy the plugins folder to your attract folder.

## Overview
The plugin can not work with pdf files so you have to convert your pdf files to images first, i will provide a few scripts on how to do this in batch. The tool best used is [pdftopng](https://www.xpdfreader.com/download.html) from the Xpdf command line tools as it will generate png files for each page in the pdf files in the naming convention the plugin expects the files to be. The tool exists both on windows as on linux. A file has to be named like `[gamename]-[XXXXXX].[ext]` for example if your name in the romslist for a rom is `Sonic the Hedgehog 2 (World)` the filename for the first page of the manual should be `Sonic the Hedgehog 2 (World)-000001.png` the second page `Sonic the Hedgehog 2 (World)-000002.png` etc. You are not limited to only png files. The plugin will search for files with the following extensions in this order specified `mp4`, `avi`, `bmp`, `tga`, `png`, `jpg`, `jpeg`, `swf` and `gif`. These must be in lowercase on a linux system so no `.JPG` on windows it does not matter. The first one it encounters with the correct filename specified the plugin will use to display. if no file is found and you have pressed the customn key it will display a no manual found. I have provided a sample image but you can change it to any one you like. You can even have different no manual found images per emulator or system depending on how you setup the plugin.

### Options 

#### Path 
* Path to manuals - can include `[Name]`, `[Emulator]`, `[Year]`, `[Manufacturer]`, `[System]`, `[DisplayName]`
* Default: `manuals/[Emulator]` (manuals subfolder of the plugins directory)

#### View Key
* Key to use to trigger displaying the manuals, can be `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`
* Default: `custom3`
* Note: You have to assign the buttons / keys in input configuration in attract mode
	
#### Cancel View Key
* Key to use to cancel viewing the manuals, can be `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`
* Default: `custom4`

#### Missing Image 
* Path to 'missing' image - can include `[Name]`, `[Emulator]`, `[Year]`, `[Manufacturer]`, `[System]`, `[DisplayName]`
* Default: `png/manual_not_found.png` (png subfolder of the plugin's directory)

#### Preserve aspect ratio Manual
* Preserve aspect ratio of the game manual, can be `Yes`, `No`
* Default: `Yes`
* Note: Set to no if you want to stretch all your manual pages to fullscreen

#### Show background
* Shows a background when Preserve aspect ratio is set overlaying the layout, can be `Yes`, `No`
* Default: `Yes`
* Note: Has no effect when `Preserve aspect ratio Manual` is not enabled 

#### Background color
* Color of the background to display when preserve aspect ratio is set, can be `Black`, `White`, `Grey`, `Blue`, `Red`, `Yellow`, `Green`, `Magenta` 
* Default: `Black`

#### Manual Opacity
* Apply transparancy to the manual (255 is fully visible), can be `25`, `50`, `75`, `100`, `125`, `150`, `175`, `200`, `225`, `255`
* Default: `255` 

#### Background Opacity
* Apply transparancy to background (255 is fully visible), can be `25`, `50`, `75`, `100`, `125`, `150`, `175`, `200`, `225`, `255`
* Default: `175`

### Example configuration
i have placed all my manual images in a folder manuals with subdirectories that are the emulator names found in a romlist and in those subdirectories my manuals are placed.

The `Path` is set to `N:\Hyperpie_V2_PC\manuals\[Emulator]` (note on a linux system use forward slashes)

![Folder Structure](/img/folderstructure.PNG)

and each folder is a name found in the romslist

![Roms List emulator](/img/romlistemulator.PNG)

and this is how my files are named

![Roms List emulator](/img/filestructure.PNG)

### Tips

#### Displaying instruction or promotional video's
you can name multiple instruction video's in the same format as used for images and it will display a new video each time you press the key assigned. or you can first use as set of images from the manuals and add the video as the next following filename (as can be seen in screenshot below). The video will then play at the end of viewing the manual. Or you can do the same if you got promotional video's. or only use instruction video's and no manuals at all

![Instruction or promotional video after manuals](/img/promotionvideoattheend.png)  

#### Emulator / system specific No Image Found option
set your missing image path to `<Path to your manuals>\[Emulator]\missing.png` where `<Path to your manuals>` is your main folder containing the manuals then you can specify in each subfolder (named against the emulator) a `missing.png` picture specific for that emulator or system etc

### Converting PDF Files
First grab a copy of pdftopng from [xpdf commandline tools](https://www.xpdfreader.com/download.html) you need the tools not the xpdf reader and you only need the pdftopng.exe.

if your game name is `Sonic II` in the roms list and thus the manual is named `Sonic II.pdf` you need to open a cmd prompt and run `pdftopng "<pdffilename>" "<pdffilename without externsion>"` to convert files to png. So in our example you would execute `pdftopng.exe "Sonic II.pdf" "Sonic II"` this will create png files for each page in the pdf named `Sonic II-000001.png` `Sonic II-000002.png` etc.

I have created and included a simple batch file for windows which you need to place in the root of your manuals directory where all the subfolders will be for the manuals and which contain your pdf files. If you run the batch file it will convert every pdf file automatically for you in the subfolders to png

Afterwards you may also convert your png files to jpg files and erase the pdf and png files. I had good results with using 85% compression quality for the jpg conversion. To give you an idea i had about 20GB of pdf manuals which converted to 80GB of png files. conversion at 95% jpeg compression quality i had 60GB of jpeg files, conversion at 85% jpeg compression i had about 36GB of jpeg files. It's still bigger than the pdf files but still ok as space is no issue for me.

#### Credits
Plugin is heavily based on code from [SumatraPDF](http://forum.attractmode.org/index.php?topic=1927.0) plugin created by qqplayer
