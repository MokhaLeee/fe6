gMapBuf --> ChapterInfo::asset_map --> MapTsa_Chapter1
gMapMetatiles --> rawed chapter map --> MapAsset01_Tsa

sTilesetInfo --> mapasset tilemap

PutMapMetatile:
    sTilesetInfo + gMapMetatiles[y][x] = TM * 4

1. 完整的地图图片过大，超过了内存容量，需要做分割
2. 分割方法是将完整的地图图片提取成 asset_img + asset_tsa，可以通过 TSA 将压缩过的图片还原成原本的地图图片
3. 图片分成 32x16 的两张图片，原始图片尺寸则为 64x64。
4. 之所以能够通过 tsa 分割，是因为原始规则中定义了一些可以复用的元素，例如可以通过 flip 的形式做替换
5. TSA 的生成过程有很多规则，例如：
    a). 肯定有一些 tileset 是预设可以直接复用的，不是让脚本自动识别哪些元素可以做 flip
    b). 需要服务于 tile-anim 与 pal-anim，因此一些砖块放在哪里是有讲究的
    c). 待定项: 如何服务于 terrain?
