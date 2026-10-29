# savemenu 命名对照表（已实施）

> **实施记录（2026-10-29）**
>
> 已按本表完成 4 批改动，涉及 `src/savemenu.c`、`src/savemenu_2.c`、`include/savemenu.h`、
> `src/opinfo.c`，共约 700 处标识符替换：
>
> 1. 函数名 219 处（含 `ProcScr_*` 与跨文件引用 `StartSaveDrawFadeOut64`）
> 2. 结构体字段 395 处 + 类型名/全局变量/精灵数组 97 处
> 3. 枚举 `UNK_SAVEMENU_*` → `SAVEMENU_ACTION_*` 63 处
> 4. `savemenu.h` 声明区补全（原 70 余行注释替换为真实原型），删除 `savemenu.c` 顶部手写原型
>
> **验证方式**：重命名不改变代码生成，因此直接对比改名前后目标文件的段内容
> （`objcopy --only-section=.text/.rodata/.data` + `cmp`）——
> `savemenu.o` 与 `savemenu_2.o` 的 `.text`/`.rodata`/`.data` **全部字节一致**。
>
> **已知阻塞**：本机 `ld 2.34` 无法链接该仓库的 `fe6.lds`
> （`no memory region specified for loadable section 'ewram_overlay_0'`）。
> 已用原始未修改源码做对照实验证明这是**既有问题**，与本次重命名无关；
> 详见第 11 节。
>
> 与表格的小差异：`struct Unk_0868A308` 实体化为 `struct SaveMenuWindowProc`（表中未列）；
> `unk_08336C74` 两处局部表仍保留为函数内 `static`，未提取为文件级变量（表中建议项未做）。


## 0. 背景与结论

* 当前 `make` 干净通过（`sha1sum -c fe6.sha1` → `fe6.gba: OK`）。
* 本工程用 `agbcc` + `-Wimplicit -Werror`，因此**不存在**「引用未声明标识符」意义上的
  undefined symbol —— 那种情况会直接编译失败。
* review 找到的真实问题是两类：
  1. **声明缺口**：`src/savemenu.c` 顶部手写了 13 个 `extern` 函数原型，而
     `include/savemenu.h` 对应位置只有 `// func_fe6_0808xxxx` 注释。这些函数是「未正式声明」。
  2. **占位命名**：`func_fe6_0808xxxx`、`unk_XX`、`UnkProc_0868Axxx` 尚未语义化。
* 下表只做**重命名**，不改变代码生成结果，因此 ROM 应保持字节一致（验证方式见第 8 节）。

命名原则：沿用仓库现有风格（`SaveMenu_*` / `SaveDraw_*`、proc 回调用 `_Loop` 后缀），
不引入新前缀体系；子 proc 用 `SaveMenuSlot_` / `SaveMenuBg_` / `SaveMenuCursor_`。

---

## 1. `src/savemenu.c` 函数

| 现名 | 建议新名 | 语义依据 |
|---|---|---|
| `func_fe6_08087C60` | `SaveMenu_StartExit` | 跳 `L_SAVEMENU_16` 并把 BGM 音量压到 0 |
| `func_fe6_08087CB0` | `GetSaveMenuBitIndex` | 「slow ctz」，取最低置位下标；与 `GetSaveMenuSelectIndex` 成对 |
| `func_fe6_08087CD4` | `SaveMenu_UpdateHelpBox` | 按当前动作决定是否弹帮助框 |
| `func_fe6_08088094` | `SaveMenu_InitSlotList` | 建槽位列表：解压 BG2/TSA、读 4 个槽、算 `action_mask`、spawn 子 proc |
| `func_fe6_080881B8` | `SaveMenu_GotoLabel` | `Proc_Goto(proc, proc->unk_2D)` |
| `func_fe6_080881C8` | `SaveMenu_Main_Loop` | `L_SAVEMENU_1` 主菜单（继续/开始/复制/删除）输入循环 |
| `func_fe6_08088404` | `SaveMenu_HandleAction` | A 键后执行/确认当前动作（`unk_36` 决定是/否） |
| `func_fe6_080885DC` | `SaveMenu_SlotSelect_Loop` | `L_SAVEMENU_4` 槽位选择与难度选择输入循环 |
| `func_fe6_08088854` | `SaveMenu_ConfirmAction` | 仅转发 `SaveMenu_HandleAction` 的 proc 回调 |
| `func_fe6_08088860` | `SaveMenu_ExitAnim_Init` | `L_SAVEMENU_5` 收起动画的初始化 |
| `func_fe6_08088870` | `SaveMenu_ExitAnim_Loop` | 收起动画循环（`anim_clock` 8/0x20/0x30 三个节点） |
| `func_fe6_08088B40` | `SaveMenu_SlotScrollIn_Loop` | `L_SAVEMENU_2` 槽位列表滑入（14 帧） |
| `func_fe6_08088B9C` | `SaveMenu_SlotScrollOut_Loop` | `L_SAVEMENU_3` 槽位列表滑出 |
| `func_fe6_08088EB8` | `SaveMenu_MoveXmapSlot` | XMAP 界面按上下键切换存档槽（跳过无效槽） |
| `func_fe6_080890B8` | `SaveMenu_StartWindowAnim` | 启动窗口收缩动画后 `Proc_Break`（**当前无调用者，疑似 dead code**） |
| `func_fe6_080891DC` | `SaveMenu_GotoExtraScreen` | 按 `sel_index` 跳 `XMAP1_MAIN` 或 `EXTRA_MENU` |

已语义化、不动：`SaveMenuOnHBlank`、`GetSaveMenuSelectIndex`、`SaveMenu_InitSong`、
`SaveMenu_InitDisplay`、`SaveMenu_PutScreen`、`SaveMenu_ExtraMenuScrollIn/Out`、
`SaveMenu_XMap1ScrollIn/Out`、`SaveMenu_ExtraMenu_Loop`、`SaveMenu_Xmap1_Loop`、
`SaveMenu_Finish`、`SaveMenu_StartXmapSoundRoom`、`StartMainMenu`、`StartSaveMenu`。

---

## 2. `src/savemenu_2.c` 函数

| 现名 | 建议新名 | 语义依据 |
|---|---|---|
| `func_fe6_080893D0` | `SaveDrawFadeOut32_Loop` | 与 `SaveDrawFadeOut_Loop` 同构，`SCALE=0x20`（32 帧淡出） |
| `func_fe6_08089490` | `SaveDrawFadeOut64_Loop` | 同构，`SCALE=0x40`（64 帧淡出） |
| `func_fe6_08089578` | `StartSaveDrawFadeOut32` | spawn `ProcScr_SaveDrawFadeOut32` |
| `func_fe6_0808958C` | `StartSaveDrawFadeOut64` | spawn 64 帧淡出；**被 `src/opinfo.c:31` 引用，改名需同步** |
| `func_fe6_080895A0` | `CopyPaletteBlock` | 通用 `u16` 块拷贝（`count * 0x10`），非 savemenu 专用 |
| `func_fe6_080895B8` | `SaveMenu_AnimateHighlight` | 按 `point` 在 `OBPAL_2`/`OBPAL_1` 间插值，做高亮脉冲 |
| `func_fe6_08089684` | `SaveMenu_PutSaveTime` | 用数字精灵画 时:分:秒 |
| `func_fe6_08089894` | `SaveMenu_SetBgAffine` | 由 angle/scale 构造 `BgAffineSet` 写入 BG2/BG3 仿射寄存器 |
| `func_fe6_080898F0` | `SaveMenuSlot_Init` | 槽位绘制 proc 初始化 |
| `func_fe6_080899F0` | `SaveMenu_SetIconPalette` | 设置 `OBPAL_6 + 8`（**当前无调用者**） |
| `func_fe6_08089A3C` | `SaveMenu_PutAction` | 画左列动作项（框 + 图标） |
| `func_fe6_08089ABC` | `SaveMenu_PutExtraAction` | 画右列 extra 菜单项 |
| `func_fe6_08089B3C` | `SaveMenuSlot_UpdateCursor` | 光标缩放/高亮调色板每帧更新 |
| `func_fe6_08089C70` | `SaveMenuSlot_PutSuspendIcon` | 画暂停存档（suspend）指示 |
| `func_fe6_08089D30` | `SaveMenuSlot_Loop` | 槽位绘制主循环 |
| `func_fe6_0808A14C` | `StartSaveMenuSlot` | spawn 槽位绘制 proc |
| `func_fe6_0808A160` | `SaveMenuBg_Init` | 背景旋转 proc 初始化 |
| `func_fe6_0808A194` | `SaveMenuBg_Loop` | 背景旋转循环 |
| `func_fe6_0808A210` | `StartSaveMenuBg` | spawn 背景旋转 proc |
| `func_fe6_0808A228` | `SaveMenuCursor_Init` | 光标 proc 初始化 |
| `func_fe6_0808A25C` | `SaveMenuCursor_Loop` | 光标插值/镜像绘制循环 |
| `func_fe6_0808A3C8` | `SaveMenuCursor_MoveTo` | 设置光标目标坐标并激活 |
| `func_fe6_0808A3E8` | `SaveMenuCursor_PutStatic` | 在固定位置画一个不动的指针（用于「复制来源」标记） |
| `func_fe6_0808A418` | `StartSaveMenuCursor` | spawn 光标 proc |
| `func_fe6_0808A42C` | `SaveMenu_InitText` | `InitTextFont` + `InitText` |
| `func_fe6_0808A454` | `SaveMenu_PutPrompt` | 在 BG1 (7,17) 画/清提示文本 |
| `func_fe6_0808A4B8` | `SaveMenu_UpdatePrompt` | 按当前动作取 `SaveMenuPromptTextTable` 并绘制 |
| `func_fe6_0808A4F0` | `SaveMenu_ClearVram` | 清 VRAM 0x8000 / 0xC000 两屏 |
| `func_fe6_0808A524` | `SaveMenu_UpdateAvailableActions` | 计算 `action_mask`/`action_count`/`extra_mask`/`max_index` |
| `func_fe6_0808A6C8` | `SaveMenu_MoveSlot` | 上下移动存档槽选择 |
| `func_fe6_0808A79C` | `SaveMenu_IsActionAvailable` | `(unk_2E & unk_30) != 0` |
| `func_fe6_0808A7B8` | `SaveMenu_WindowAnim_Loop` | WIN1 框开合动画 |
| `func_fe6_0808A8B4` | `StartSaveMenuWindowAnim` | spawn 窗口开合动画 proc |
| `func_fe6_0808A8E8` | `SaveMenu_CopyBg2` | `RegisterDataMove(gBg2Tm → VRAM+0x7000)` |
| `func_fe6_0808A904` | `StartSaveMenuBg2Copy` | spawn BG2 拷贝 proc（**当前无调用者**） |
| `func_fe6_0808A918` | `SaveMenu_LoadSlotInfo` | 读存档/暂停存档的标题、时间、通关标志 |
| `func_fe6_0808A9F4` | `SaveMenu_UpdateSlotPal` | 按通关/难度标志刷新槽位标题调色板 |
| `func_fe6_0808AA54` | `SaveMenu_GetActionIndex` | 数出 `end_mask` 之前有多少个可用动作 |

已语义化、不动：`SaveDraw_SavePalette`、`SaveDrawFadeIn_Loop`、`SaveDrawFadeOut_Loop`、
`StartSaveDrawFadeIn`、`StartSaveDrawFadeOut`、`SaveMenu_GetNextSaveIndex`。

### 2.1 文件内 ProcScr / 精灵数据（本地定义，无外部引用，可安全改名）

| 现名 | 建议新名 |
|---|---|
| `ProcScr_Unk_0868A0CC` | `ProcScr_SaveDrawFadeOut32` |
| `ProcScr_Unk_0868A0E4` | `ProcScr_SaveDrawFadeOut64` |
| `ProcScr_Unk_0868A28C` | `ProcScr_SaveMenuSlot` |
| `ProcScr_Unk_0868A2AC` | `ProcScr_SaveMenuBg` |
| `ProcScr_Unk_0868A2CC` | `ProcScr_SaveMenuCursor` |
| `ProcScr_Unk_0868A308` | `ProcScr_SaveMenuWindowAnim` |
| `ProcScr_Unk_0868A328` | `ProcScr_SaveMenuBg2Copy` |
| `Sprite_0868A0FC` | `Sprite_SaveMenuSlotFrame` |
| `Sprite_0868A116` | `Sprite_SaveMenuSideTabs` |
| `Sprite_0868A12A` | `Sprite_SaveMenuSlotFrameAlt`（源注释 `// unused?`） |
| `Sprite_0868A150` | `Sprite_SaveMenuHand` |
| `Sprite_0868A158` | `Sprite_SaveMenuHover` |
| `Sprite_0868A160` | `Sprite_SaveMenuTimeFrame` |
| `Sprite_0868A224` | `Sprite_SaveMenuTimeColon` |
| `gUnk_0868A234` | `gSaveMenuTimeDigits` |
| `gUnk_0868A260` | `gSaveMenuHourDigits` |
| `unk_08336C74`（两处局部表） | `sSaveMenuBobCurve`（`func_fe6_0808A194` / `func_fe6_0808A25C` 里各有一份重复定义，建议提成文件级 `static const`） |

`Sprite_0868A174` … `Sprite_0868A21C` 共 22 个数字/冒号精灵，建议统一为
`Sprite_SaveMenuDigit0` … `Digit9`、`Sprite_SaveMenuColonSmall` 等，但收益一般，可放到第二批。

---

## 3. `struct SaveMenuProc` 字段（`include/savemenu.h`）

| 现名 | 建议新名 | 语义依据 |
|---|---|---|
| `anim_clock` | 保留 | 动画时钟 |
| `unk_2A` | `menu_index` | 左列（存档动作）光标序号 |
| `selected_id` | 保留 | 当前选中的存档槽 0..2 |
| `copy_from_id` | 保留 | 复制来源槽 |
| `unk_2D` | `label` | 注释已写「proc label」，`Proc_Goto` 用 |
| `unk_2E` | `action` | 当前动作（`UNK_SAVEMENU_*` 位值） |
| `unk_2F` | `scroll_x` | 主屏 X 滚动偏移（`0xF4 - unk_2F`） |
| `unk_30` | `action_mask` | 可用动作位掩码 |
| `unk_31` | `action_count` | 可用动作数量 |
| `unk_32` | `extra_mask` | extra 菜单可用项位掩码 |
| `max_index` | `extra_count` | extra 菜单项数量 |
| `hand_index` | `extra_index` | 右列 extra 菜单光标 |
| `sel_index` | `extra_action` | 右列选中动作位值（`GetSaveMenuSelectIndex` 返回值） |
| `unk_36` | `choice` | 确认状态：0 未选 / 1 左·是 / 2 右·否 |
| `unk_37[3]` | `slot_titles[3]` | 每槽章节标题索引（0xFF 空） |
| `unk_3A[3]` | `slot_completed[3]` | 每槽是否通关（`& 1`） |
| `unk_3D` | `difficulty` | 0 未选 / 1 普通 / 2 困难 |
| `unk_3E` | `help_shown` | 帮助框是否已弹出 |
| `unk_3F` | `target_id` | 当前指向的存档槽（0xFF = 无） |
| `unk_40` | `scale` | 光标缩放（0x100 → 0xF0 → 0） |
| `unk_42` | `extra_scroll_x` | 右列/背景 X 偏移 |
| `unk_44[3]` | `slot_times[3]` | 每槽存档时间 |
| `unk_50` | `suspend_time` | 暂停存档时间 |
| `unk_54` | `slot_proc` | 槽位绘制子 proc（`UnkProc_0868A28C*`） |
| `unk_58` | `bg_proc` | 背景旋转子 proc（`UnkProc_0868A2AC*`） |
| `unk_5C` | `chapter_sprite` | 章节标题精灵动画 proc |

## 4. 三个子 proc 结构体

| 结构体 / 字段 | 建议 |
|---|---|
| `struct UnkProc_0868A28C` | `struct SaveMenuSlotProc` |
| `· unk_2A` / `unk_2C` | `clock` / `angle` |
| `· unk_2E`, `unk_30`, `unk_32` | 均只赋 0/0x100 且无读取 → `unk_2E` 等保留或合并为 `_pad` |
| `· unk_33` | `action`（缓存父 proc 的 `unk_2E`） |
| `· unk_34` | `cursor_proc`（`UnkProc_0868A2CC*`） |
| `· unk_3C` | `last_selected_id` |
| `struct UnkProc_0868A2AC` | `struct SaveMenuBgProc` |
| `· unk_2A` / `unk_2C` | `clock` / `angle` |
| `· unk_34`…`unk_3D` | 只初始化不读取 → 暂保留 |
| `struct UnkProc_0868A2CC` | `struct SaveMenuCursorProc` |
| `· unk_2A` | `clock` |
| `· unk_2C` | `time`（插值帧计数） |
| `· unk_2D` / `unk_2E` | `target_x` / `x` |
| `· unk_2F` / `unk_30` | `target_y` / `y` |
| `· unk_31` | `active` |
| `· unk_32` / `unk_33` / `unk_34` | `static_y` / `show_static` / `clear_static` |
| `· unk_35` | `mirror`（1 = 单侧、0 = 左右镜像成对） |
| `struct Unk_0868A518` | `struct SaveMenuSpriteEntry`（字段 `sprite` / `unk_04` → `x_offset`） |
| `struct SaveMenuUnkPalProc` | `struct SaveDrawPalProc`，`unk_29` → `progress` |

---

## 5. 全局变量（`EWRAM_OVERLAY(savemenu)`）

| 现名 | 建议新名 | 说明 |
|---|---|---|
| `gUnk_Savemenu_02000000` | `gSaveMenuUnk00` | 只写不读（`SaveMenu_PutScreen` 置 0），可查证后删除 |
| `gUnk_Savemenu_02000002[0x200]` | `gSaveMenuPalBackup` | 淡入淡出前的调色板备份 |
| `gUnk_Savemenu_02000404[0x20]` | `gSaveMenuPalFx` | 高亮脉冲用调色板（从 `gUnk_0832C35C` 拷入） |
| `gUnk_Savemenu_02000464[3]` | `gSaveMenuSlotFlags` | 每槽 `play_st.flags` |
| `gSaveMenuFont` / `gSaveMenuText` | 保留 | 已有语义名 |

---

## 6. 枚举

| 现名 | 建议新名 |
|---|---|
| `UNK_SAVEMENU_0` | `SAVEMENU_ACTION_RESUME`（继续·暂停存档，无提示） |
| `UNK_SAVEMENU_1` | `SAVEMENU_ACTION_CONTINUE`（读档开始，提示「はじめる/やめる」） |
| `UNK_SAVEMENU_2` | `SAVEMENU_ACTION_COPY` |
| `UNK_SAVEMENU_3` | `SAVEMENU_ACTION_ERASE` |
| `UNK_SAVEMENU_4` | `SAVEMENU_ACTION_NEW_GAME` |
| `UNK_SAVEMENU_5` | `SAVEMENU_ACTION_EXTRA` |
| `UNK_SAVEMENU_6` | `SAVEMENU_ACTION_SAVE` |
| `UNK_SAVEMENU_7` | `SAVEMENU_ACTION_EXIT` |

依据：`SaveMenuPromptTextTable[]` 的下标正是 `GetSaveMenuBitIndex(action)`，
提示文本与 `SaveMenu_Finish` 里的 `SetNextGameAction` 完全对上。

`SAVEMENU_PROMPT_*`、`BGCHR_*`、`OBCHR_*`、`OBPAL_*` 保留。

---

## 7. 建议暂不改动（第二批/不做）

| 类别 | 原因 |
|---|---|
| `L_SAVEMENU_1`…`L_SAVEMENU_16` | 只影响可读性；改 `SAVEMENU_STATE_*` 要动 40+ 处 `Proc_Goto`，收益低 |
| `gUnk_0832B554`、`gUnk_083280B0`、`gUnk_0832A130`、`gUnk_0832C35C`、`gUnk_0832C39C` | 定义在 `data/*.s` / `asm`，改名必须同步汇编与 `.lds`，风险高，建议单独 PR |
| `Sprites_0868A4F8`、`Sprites_0868A518`、`Sprites_0868A550`、`Sprites_0868A55C` | 同上，data 段外部定义 |
| `func_fe6_0808AA84` 等 `xmap.c` 符号 | 不属于 savemenu |

---

## 8. 头文件声明整理（与命名同步做）

`src/savemenu.c` 顶部 23–35 行的手写原型应删除，改为在 `savemenu.h` 中统一声明：
`SaveMenu_StartExit`、`GetSaveMenuBitIndex`、`SaveMenu_UpdateHelpBox`、`SaveMenu_InitSlotList`、
`SaveMenu_GotoLabel`、`SaveMenu_HandleAction`、`SaveMenu_LoadSlotInfo`、`SaveMenu_UpdatePrompt`、
`SaveMenu_PutPrompt`、`SaveMenu_IsActionAvailable`、`SaveMenu_MoveXmapSlot`、
`StartSaveMenuWindowAnim`、`StartSaveMenuSlot`、`StartSaveMenuBg`、`StartSaveMenuCursor` 等
所有非 `static` 定义。

同时把 `savemenu.h` 里 164–192、196–239 行的 `// func_fe6_...` 注释行替换为真实原型。

---

## 9. 顺带发现（不属于命名，但 review 该报）

1. **疑似笔误**：`SaveMenu_InitSong`（`savemenu.c:130`）
   `GetCurrentBgmSong() == SONG_01 || GetCurrentBgmSong() == SONG_44 || GetCurrentBgmSong() == SONG_01`
   —— `SONG_01` 重复两次，第二处很可能是 `SONG_45` 之类，建议查证原 ROM。
2. **注释偏移错**：`savemenu.h:116-117`，`/* 30 */ u16 unk_30;` 之后 `/* 30 */ u8 unk_32;`
   应为 `/* 32 */`。
3. **声明与定义签名不一致**：`savemenu.c:26` 声明 `func_fe6_0808A6C8(..., int arg_1)`，
   定义（`savemenu_2.c:1192`）为 `fi8 direction`；`func_fe6_0808A4B8` 同理（`int` vs `bool`）。
   统一后更安全。
4. **dead code**：`func_fe6_080890B8`、`func_fe6_080899F0`、`func_fe6_0808A904`
   在 C 侧无调用者，如确认汇编里也没有引用，可加 `// unused` 或删除。
5. `func_fe6_0808AA54` 的 `for (mask = 1; mask < end_mask; ...)` 用的是 `<` 而非 `<=`，
   配合 `end_mask = UNK_SAVEMENU_5`(=32) 恰好正确，但语义上像 off-by-one，建议加注释。

---

## 10. 执行与验证

1. 纯标识符替换，不改变控制流/数据布局 → 目标仍是**字节级 match**。
2. 每批改完执行：`make -j16 && sha1sum -c fe6.sha1`。
3. 涉及跨文件的名字只有 `StartSaveDrawFadeOut64`（`src/opinfo.c`），其余均在本模块内。
4. 建议分三批提交：① 函数名 + 头文件声明；② 结构体字段；③ 枚举/数据数组。

---

## 11. 构建阻塞（既有问题，与重命名无关）

`make` 在新的 `ld`（GNU ld 2.34）下链接失败：

```
arm-none-eabi-ld: error: no memory region specified for loadable section `ewram_overlay_0'
```

**对照实验**：`git stash` 回退全部 savemenu 改动后重新链接，报错完全相同。

原因：`fe6.lds` 中 `ewram_overlay_0` / `ewram_overlay_savemenu` / `ewram_overlay_sio`
三个 `(NOLOAD)` 输出段没有指定 `> ewram` region，且 `ewram_overlay_sio` 段内用
`. = 0x000000` 这种**绝对地址**写法（本意应是 `__ewram_overlay_beg + offset`）。
尝试补 `> ewram` 会连续暴露下一段，修到 `sio` 时触发
`cannot move location counter backwards`，说明该 lds 依赖旧版 ld 的宽松行为。

**建议**：单独开一个 PR 修 `fe6.lds`（给三个 overlay 段显式指定 region 并修正 sio 段的
VMA 写法），不要和本次命名 PR 混在一起。
