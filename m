Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795431777;
	b=QYrGIKB6fD5ZL7ZiQheumVisq2wTs42M5dsXCbKUQTY7VKhdp53el6Kzij3C6zqdlj1S
	 eE6767B42G8xaIPUh1Z/8eDZj4Nb6hH4mToUGpVFGQog3ff8aEINuLpF1LsyAjcln/D3H
	 fhaPyBlGzuQWqkGpp3T2y7nBcM4Cc3rwXuAs7qrzSGS3H7wOqBdaHsZGmpCvU4v8cxSr1
	 voNXwKUC7W7D4rbaaRC+dZLj7jS0FoZVfpO7TUhpB77A4d3XvcvfPEKW2k9BcOK/Gf0fe
	 gtRINKyqYhKmlYd7JCjdj0BQpleT4TArAOOW47ZE9CdRS9wvlotzcHGB238eoZWBEgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795431777;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=+5CEc3xRBtlmi0Ruv0ajJzuep+GZVYYLK7wyckUonGw=;
	b=nSZJy8hp0MVoKtziccF2Yfn7Sn5sWz9ccGgKVwZsCbitRIooAvIv717zUEqJfSWFFLRf
	 dn3bwJrx/KoqixMm937iMP4spoazGQTuDSGtW5NJomkUFUNmhVckB0S9uW4momqQd7Gn/
	 0QHTBDo7XoVo5VCErnk9IW+ZAYv1IFlgt9k50ufBuqX6HAnnRAtr7GLaI0Q48avk+T9mZ
	 Uj4cQjT7dia89GVZvLNLWNIC95qQjM+pqF8qrLFhhZR/6OfyR61/AubjW3ZRms2wjamJB
	 +kyLImS4ddRgMrgCfi43PEcULhlamjTJrQGCmKvZMaOIH3Fj4kMb3yHQLJKTOOAq22A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xa2vl+3M;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BFB606A682
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:02:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76BFB606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xa2vl+3M
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ed3df47bc7so3259755ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795431777; x=1796036577; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+5CEc3xRBtlmi0Ruv0ajJzuep+GZVYYLK7wyckUonGw=;
        b=xa2vl+3M7vuWvkPRr2bcY+a9dL88SQ/0B4vhxkW4tHv3pS1LE5/56cYIFyOyZ/KDBg
         8CMotNFlxDumIhMlZvv665uAU9bEaI6Ar0RCFMjs/TrHpnLRTnkBlE/P1r0gJ+KBwe7n
         5ZSMznyVu36D4XTjyfaw2dI2CnMFHuJPNidknVzIoKXGm4CvNEM2cIjA/kz8lYfcq+li
         y/qhSOMYes3WonYC0lwVAWlrTXf6xykjZpaUAk3keyrQS8r0P2F9M01cv6DIZqFhol50
         ihHLWcNRb3+gUp+CUllvO5xDO0LoTmHckD06Gq0c/+fuuL6henDEkKpOqch2QYN7WF9a
         g46g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795431777; x=1796036577;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+5CEc3xRBtlmi0Ruv0ajJzuep+GZVYYLK7wyckUonGw=;
        b=zTEqs01DkiXWieVu++PMdMojhQLnpP7OLxJl08EQ1iziivn5j0l3sfAazkfFd8DvTd
         /qx9l56Ep+KD7Mc1RHnJLjvpedYffg86kRZuvn4aA24aq8TcIRpupnYnIFW2oCLhotC3
         1DHB2BT5tQply6pHBAo+LX0hXDlMVI/G7u7/jYwCP+vBEAFw1QPO70UP3xODgrUrt/bn
         wTUfdOHKmaZXuDskN+li6Psoacu6LVTNMLdVox15jpcJMvIL29fdfZEpXwLEVRR/kTkL
         S/KUsm+zKBudqv9D/GO+TJQRkwikcQySmHmHLqHffeIyT2O/1ZPDuk/M/rXKmEwZb0bN
         o3hg==
X-Forwarded-Encrypted: i=1; AL+hErEhdDashlDixdasxcuMkdPxw4PrffDu7RLyvyncNEv2JkPRNAE76IzSDu7QmJBdnjr4/YM+DZ1GGSBeNyM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CHyjp+0Sre5Z7np1FQLCv+nM9LWwdoqe07KwQswqUFcR2GPN4
	J++O6Tuy/CyJBXgjaUfCAA6pp7koLB+keVrxvWGCY3EsQ2GAIF/NgRvV
X-Gm-Gg: AZFdTZdh2LixgHrjvKHRWn9gERDGW6mpKmGBlRfaPzxp55QJyBavoM2Xgx3m4IAkne1
	BmPXx/CRIkI1c1Emw3UvbdzEw5SnB8eaHCSU0SCxbnV7GzAd1plOK2nnnmkza0WrnhIWLDLVYTG
	759f0PsVBhS6tFRmrt8pokxMj4KfZUtWBIyg4ykl5hUVfJnm4IruEE3WbgE3jIZ+bzC0WTrL+cE
	ygn5hs4Uml/9sc6Z2Y7RyYBJ8Y53x4u8mPZt3AwBXUz8Cx/wQ70SoE4pGeraQ1/bFFViGhaHOVj
	ww4oeQiFbEkQsUJAfVtEaF3QQOaypa2JaaLhF7rfnrxUhSMagchHE//JSEk6pi92x0ziGBXum0G
	uFxet0qsW+LQ+GUfItYee4Pl1XZAMdgav6tfB44yG8ysguj+HVD5AWPv5OMA47TqVWAQXcevPSW
	osPN8a/Hd3WaXKobzZKsQFMARiKf5+TSktKDZ2rtFybuGmKBg8DGrOGjBiNcZbNNOG90rvXi2WI
	W4lrQdqDbH6Un8sIK2TiiHNEABzZVQVeDpDOkESvi7hQZ8b7u3Z8vlHzE/XZ1M3rXSr7jXgjv1i
	7RdIU6l9yVYVlMTG+HVtqHAVq97AR1mhqCs/747//w6EWRJpxZvpk8wTcG1nVngyZXUl+gW+BZv
	bzlA1bllMHINhdB+R3brFvdNB
X-Received: by 2002:a17:903:4586:b0:2f0:3cbf:743d with SMTP id d9443c01a7336-2f03f16db29mr164980595ad.4.1795431776860;
        Mon, 23 Nov 2026 03:02:56 -0800 (PST)
Received: from chenyou.ncku.edu.tw ([140.116.19.16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1aa3sm50380785ad.21.2026.11.23.03.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:02:56 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: alexs@kernel.org,
	corbet@lwn.net
Cc: wy@wyuan.org,
	dzm91@hust.edu.cn,
	si.yanteng@linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH v2 10/25] docs/zh_TW: process: sync gdb-kernel-debugging.rst with the English original
Date: Mon, 23 Nov 2026 19:02:01 +0800
Message-ID: <20261123110217.170025-11-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123110217.170025-1-chenyou910331@gmail.com>
References: <20261123110217.170025-1-chenyou910331@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The translation carries "update to commit d5af79c05e93 ("Documentation:
move dev-tools debugging files to process/debugging/")", but as
commit e07f694cbd09 ("docs/zh_TW: move gdb-kernel-debugging to
process/debugging/") already noted, that marker was the oldest baseline
checktransupdate.py could see after the move, not the version the text
follows.  A section-by-section comparison against the current English
text shows the translation includes the lx_per_cpu examples from
commit 09e1d93a421f ("scripts/gdb: update documentation for
lx_per_cpu"), but lacks the "make scripts_gdb" step from
commit 6b219431037b ("docs/scripts/gdb: add necessary make scripts_gdb
step") and the "Debugging GDB scripts" section from
commit 7f7f468548ce ("Documentation: Provide hints on how to debug
Python GDB scripts").  Bring it in line with the full current original:

- add the "Build the gdb scripts" step and the "Debugging GDB scripts"
  section
- drop text the original does not have: the "(kernel source build)"
  note on the cd step and the "(command not found)" note on the
  auto-load warning, and a duplicated word in the breakpoint step
- translate "convenience functions" and "a snapshot of the initial
  version" as written instead of as "debugging helpers" and "some
  examples of the initial version"
- replace the mainland terms left over from the zh_CN conversion
  (調試, 內核, 模塊, 加載, 接口, 硬件, 信息, 文檔, 命令行, 函數, 字段,
  斷點, 鏡像, 控制檯, ...) with Taiwanese usage, and use 為, 啟 and 才
- add the SPDX-License-Identifier line carried by the other zh_TW
  translations in process/

Now that the file is in sync, drop the unmaintained-zh_TW.rst notice
that commit 6561dd301873 ("docs/zh_TW: add a notice for translations
not kept in sync") added until it was updated.

update to commit 7f7f468548ce ("Documentation: Provide hints on how to
debug Python GDB scripts")

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../debugging/gdb-kernel-debugging.rst        | 104 ++++++++++--------
 1 file changed, 60 insertions(+), 44 deletions(-)

diff --git a/Documentation/translations/zh_TW/process/debugging/gdb-kernel-debugging.rst b/Documentation/translations/zh_TW/process/debugging/gdb-kernel-debugging.rst
index 45f178c0bf59..81e6433f16e4 100644
--- a/Documentation/translations/zh_TW/process/debugging/gdb-kernel-debugging.rst
+++ b/Documentation/translations/zh_TW/process/debugging/gdb-kernel-debugging.rst
@@ -1,67 +1,75 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 .. highlight:: none
 
 .. include:: ../../disclaimer-zh_TW.rst
-.. include:: ../../unmaintained-zh_TW.rst
 
 :Original: Documentation/process/debugging/gdb-kernel-debugging.rst
 
-通過gdb調試內核和模塊
-=====================
+透過gdb對核心與模組除錯
+=======================
+
+核心除錯器kgdb、QEMU等hypervisor，或基於JTAG的硬體介面，都能在執行期間使用
+gdb對Linux核心及其模組除錯。Gdb提供了強大的python腳本介面，核心也提供了一組
+輔助腳本，可以簡化典型的核心除錯步驟。本文是一份簡短的教學，說明如何啟用與
+使用這些腳本。本文以QEMU/KVM虛擬機器作為目標，但其中的範例也同樣適用於其他
+gdb stub。
 
-Kgdb內核調試器、QEMU等虛擬機管理程序或基於JTAG的硬件接口，支持在運行時使用gdb
-調試Linux內核及其模塊。Gdb提供了一個強大的python腳本接口，內核也提供了一套
-輔助腳本以簡化典型的內核調試步驟。本文檔爲如何啓用和使用這些腳本提供了一個簡要的教程。
-此教程基於QEMU/KVM虛擬機，但文中示例也適用於其他gdb stub。
 
+需求
+----
 
-環境配置要求
-------------
+- gdb 7.2+（建議：7.4+），並啟用python支援（各發行版通常都已啟用）
 
-- gdb 7.2+ (推薦版本: 7.4+) 且開啓python支持 (通常發行版上都已支持)
 
-設置
+設定
 ----
 
-- 創建一個QEMU/KVM的linux虛擬機（詳情請參考 www.linux-kvm.org 和 www.qemu.org ）。
-  對於交叉開發，https://landley.net/aboriginal/bin 提供了一些鏡像和工具鏈，
-  可以幫助搭建交叉開發環境。
+- 為QEMU/KVM建立一台Linux虛擬機器（詳情請參考www.linux-kvm.org與
+  www.qemu.org）。若要進行交叉開發，https://landley.net/aboriginal/bin 提供了
+  一批機器映像檔與工具鏈，可以作為起點。
+
+- 建置核心時啟用CONFIG_GDB_SCRIPTS，但保持CONFIG_DEBUG_INFO_REDUCED關閉。
+  如果你的架構支援CONFIG_FRAME_POINTER，請保持啟用。
 
-- 編譯內核時開啓CONFIG_GDB_SCRIPTS，關閉CONFIG_DEBUG_INFO_REDUCED。
-  如果架構支持CONFIG_FRAME_POINTER，請保持開啓。
+- 在guest上安裝該核心，必要時在核心命令列加上“nokaslr”以關閉KASLR。
+  另外，QEMU也可以透過-kernel、-append、-initrd這些命令列選項直接啟動核心。
+  這通常只在你不依賴模組時才有用。關於此模式的詳細資訊，請參閱QEMU文件。
+  在這種情況下，如果架構支援KASLR，應該在停用CONFIG_RANDOMIZE_BASE的情況下
+  建置核心。
 
-- 在guest環境上安裝該內核。如有必要，通過在內核command line中添加“nokaslr”來關閉KASLR。
-  此外，QEMU允許通過-kernel、-append、-initrd這些命令行選項直接啓動內核。
-  但這通常僅在不依賴內核模塊時纔有效。有關此模式的更多詳細信息，請參閱QEMU文檔。
-  在這種情況下，如果架構支持KASLR，應該在禁用CONFIG_RANDOMIZE_BASE的情況下構建內核。
+- 建置gdb腳本（v5.1以上的核心需要此步驟）::
 
-- 啓用QEMU/KVM的gdb stub，可以通過如下方式實現
+    make scripts_gdb
 
-    - 在VM啓動時，通過在QEMU命令行中添加“-s”參數
+- 啟用QEMU/KVM的gdb stub，可以
+
+    - 在VM啟動時，於QEMU命令列加上“-s”
 
   或
 
-    - 在運行時通過從QEMU監視控制檯發送“gdbserver”
+    - 在執行期間，從QEMU monitor主控台下達“gdbserver”
 
-- 切換到/path/to/linux-build(內核源碼編譯)目錄
+- cd /path/to/linux-build
 
-- 啓動gdb：gdb vmlinux
+- 啟動gdb：gdb vmlinux
 
-  注意：某些發行版可能會將gdb腳本的自動加載限制在已知的安全目錄中。
-  如果gdb報告拒絕加載vmlinux-gdb.py（相關命令找不到），請將::
+  注意：某些發行版可能會將gdb腳本的自動載入限制在已知安全的目錄。
+  如果gdb回報拒絕載入vmlinux-gdb.py，請將::
 
     add-auto-load-safe-path /path/to/linux-build
 
-  添加到~/.gdbinit。更多詳細信息，請參閱gdb幫助信息。
+  加入~/.gdbinit。詳情請參閱gdb的說明。
 
-- 連接到已啓動的guest環境::
+- 連線到已開機的guest::
 
     (gdb) target remote :1234
 
 
-使用Linux提供的gdb腳本的示例
-----------------------------
+使用Linux提供的gdb輔助工具的範例
+--------------------------------
 
-- 加載模塊（以及主內核）符號::
+- 載入模組（以及主核心）的符號::
 
     (gdb) lx-symbols
     loading vmlinux
@@ -74,18 +82,18 @@ Kgdb內核調試器、QEMU等虛擬機管理程序或基於JTAG的硬件接口
     ...
     loading @0xffffffffa0000000: /home/user/linux/build/drivers/ata/ata_generic.ko
 
-- 對一些尚未加載的模塊中的函數函數設置斷點，例如::
+- 對某個尚未載入的模組函式設定中斷點，例如::
 
     (gdb) b btrfs_init_sysfs
     Function "btrfs_init_sysfs" not defined.
     Make breakpoint pending on future shared library load? (y or [n]) y
     Breakpoint 1 (btrfs_init_sysfs) pending.
 
-- 繼續執行::
+- 讓目標繼續執行::
 
     (gdb) c
 
-- 加載模塊並且能觀察到正在加載的符號以及斷點命中::
+- 在目標上載入模組，觀察符號的載入以及中斷點的觸發::
 
     loading @0xffffffffa0034000: /home/user/linux/build/lib/libcrc32c.ko
     loading @0xffffffffa0050000: /home/user/linux/build/lib/lzo/lzo_compress.ko
@@ -95,7 +103,7 @@ Kgdb內核調試器、QEMU等虛擬機管理程序或基於JTAG的硬件接口
     Breakpoint 1, btrfs_init_sysfs () at /home/user/linux/fs/btrfs/sysfs.c:36
     36              btrfs_kset = kset_create_and_add("btrfs", NULL, fs_kobj);
 
-- 查看內核的日誌緩衝區::
+- 傾印目標核心的日誌緩衝區::
 
     (gdb) lx-dmesg
     [     0.000000] Initializing cgroup subsys cpuset
@@ -107,21 +115,21 @@ Kgdb內核調試器、QEMU等虛擬機管理程序或基於JTAG的硬件接口
     [     0.000000] BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff] reserved
     ....
 
-- 查看當前task struct結構體的字段（僅x86和arm64支持）::
+- 檢視目前task struct的欄位（僅支援x86與arm64）::
 
     (gdb) p $lx_current().pid
     $1 = 4998
     (gdb) p $lx_current().comm
     $2 = "modprobe\000\000\000\000\000\000\000"
 
-- 對當前或指定的CPU使用per-cpu函數::
+- 針對目前或指定的CPU使用per-cpu函式::
 
     (gdb) p $lx_per_cpu(runqueues).nr_running
     $3 = 1
     (gdb) p $lx_per_cpu(runqueues, 2).nr_running
     $4 = 0
 
-- 使用container_of查看更多hrtimers信息::
+- 使用container_of輔助函式深入檢視hrtimers::
 
     (gdb) set $leftmost = $lx_per_cpu(hrtimer_bases).clock_base[0].active.rb_root.rb_leftmost
     (gdb) p *$container_of($leftmost, "struct hrtimer", "node")
@@ -144,10 +152,11 @@ Kgdb內核調試器、QEMU等虛擬機管理程序或基於JTAG的硬件接口
     }
 
 
-命令和輔助調試功能列表
-----------------------
+命令與函式列表
+--------------
 
-命令和輔助調試功能可能會隨着時間的推移而改進，此文顯示的是初始版本的部分示例::
+命令與便利函式（convenience function）的數量可能會隨時間演進，以下只是初始
+版本的快照::
 
  (gdb) apropos lx
  function lx_current -- Return current task
@@ -159,6 +168,13 @@ Kgdb內核調試器、QEMU等虛擬機管理程序或基於JTAG的硬件接口
  lx-lsmod -- List currently loaded modules
  lx-symbols -- (Re-)load symbols of Linux kernel and currently loaded modules
 
-可以通過“help <command-name>”或“help function <function-name>”命令
-獲取指定命令或指定調試功能的更多詳細信息。
+命令的詳細說明可以透過“help <command-name>”取得，便利函式的詳細說明則可以
+透過“help function <function-name>”取得。
+
+除錯GDB腳本
+-----------
+
+GDB並未啟用完整的Python回溯（backtrace），這可能讓除錯GDB腳本變得比必要的
+更困難。以下設定可以印出python環境的完整回溯::
 
+ (gdb) set python print-stack full
-- 
2.43.0

