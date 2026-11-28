Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795843536;
	b=O2CPNQENoPYTOJldiA5/PduQ0IDPLRjHw8yYKOQ69ZdPPOqhpPQHG20/4SSl+YxHEZ79
	 rOtSnH4qqjDKnBQfpkmBNI4XNezL0CEMwRF48OH8eKil5gQTvCmiXzUh8IIEJ+HvSo0NT
	 bAMMbioPi1Gt07s9gS5BC7lfPXVuu6BrbaM4tNAeDIRfTpqR3QP5WFwaqWtpVM1f1dlxc
	 qoRAdgZn+HEqL6/7rH4fj+A/9Hkmqqc9yxMvfyqU/SgWIdFuMtQ32DOEwyhjQ98L5bg7J
	 DDy8K/DOKIniRhhKPDz92NKuwend14+yzTyZTLLKoQQiDNZs83DUUdaWTi2/ttWsvbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795843536;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LTT+F+8eGiTtnoaAOJgxFuyeZr+Zc/qtavdsCFWjKow=;
	b=4rftvpNsBJJzPkj4qkT1KzFVenE2QJkHls2fkDDMV6FPSteRTEuTUbo1/kh0mqEz9djG
	 qt7vnyVgR34yqJ7sy5i8kP4VgAIk/eL0RFbofmGNpDbTp5bniO43wRj7+OPlhzVAMNUkO
	 kUw/7wlG+XYvenskplba6y3UDHcSzVa4NMqka9er758iqz3F9CgMsKWiUVqnZH2VjijA/
	 j5q0m92r+FIx52qZjpssfbIrntEvAPIYZJK3NeNT03N5U/Q7y9stmTvofcZZISeh2qyXr
	 9NdHtdwm2wjsEYkHz+XgLwdHbglxhZqHtUAPdU2Kivg2Ib4a6tShT/DmwMxdaKBvm8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Csn9C31G;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D20606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 05:25:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4D20606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Csn9C31G
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2f0458cc9easo68656805ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 21:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795843535; x=1796448335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LTT+F+8eGiTtnoaAOJgxFuyeZr+Zc/qtavdsCFWjKow=;
        b=Csn9C31GyefqXel/Pu5z7paIM0NjtCsN7IkQsZaara9c3GJxBkOjTTE6NohGcPrLF4
         aEb2Bv/K2Yjcq8hsbs8asvyDOMpw502zL6Wsxz/fJG75C7Ee9DZltsEjH8UFirlqj3MD
         qjuAUvi+0461Bj5SJ83MJgYW26ekT4bH0r1aHxpdEXhRGqMrd2EMDsM4l/aENi/PbYgJ
         0RJbYZqkC/3tFkVgkl915v5lHQ2Cf9Zgfzwt/AF/xk30122foTBa/ACtRpEyGGjkUoFf
         +Zy5Ksjeu/0QdnLyhlj3Rk73Tg+FbrB7XNO5L7OvqbNfjPOvQ6MC9w0OZdyXCxryUABF
         0Mdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795843535; x=1796448335;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LTT+F+8eGiTtnoaAOJgxFuyeZr+Zc/qtavdsCFWjKow=;
        b=lOA8JHmZXstPTXHg8BgWYcV+mRSlMhtKssz0iBsT3JViKSgkUmshHvQ3OL1gKhxdTy
         t6Q+0st2z2tAYZ/ndblLr+wmc3gNlrcH2AiY/LFFt+dTdTg/iO7NW0r8c4ugHLox/HVP
         D6fN7NhPuXV0h1LlivVg1wEqt//PppQjJemqB17aY8KJcuPZkVD/LpppPg8a8fLMY6/3
         izK0N5BCWD86ztCuO+o5vC54uqQSsDQSSr3yZfnfmQ/x19ok6dzmpX1+Soej9X1BVurW
         /tHhMtnK1vUgn1U1OgEmiba5Wy/kRlWWZ4iqLaqV3l68k0cFBTIpBAwQtLSgW+vdvOfg
         /V+A==
X-Forwarded-Encrypted: i=1; AL+hErF405c7yphA9OF//d76rKW83MGP0jF0DWWE7/yLH+hW2dYevn4vpNdbQVGgFhuCTEueylp184RZiye+xck=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LAtvTfM0EL3TruMRE7c0U7e6Tm/rM1WYn1fQRParIaS/8hWny
	3U+R1mH1/QSBmQKJbiPMRkND3wnlqaiimbj/Cz09nL6AVNMWYAdGhHL4
X-Gm-Gg: AZFdTZfO7f9bygrJVwZMMzONGYlvn4gegaWvLzfl+0NbapnLm/RE2LgSJ+pk6XZSWKK
	miEJlUuMpWkACwfGIQIIKFyZfCIJYukleO9B/y5FsYLKmGo5aq5/Eev1f4Nl/jZ2+94n7MfHOU4
	le9neyxjrKSd79PLFgZyDb3YYShUF7EixLX4DKBFjDg24I37ZPxDBFowjEWKQMpsUy2B8kR9iVK
	XoUufagH2V+vZjpsbV3yo4Hag3nf9KfmMAjZ8vNCh4IQIe0ovar4l8GWBoDKvJm9coa8hQUI3O/
	adyu5qC5oHaGOytCZqgUKkwONGkQWam6H3y5kPF5zx2YGXawXQ98BSvbUIjMcMTqCpgMpUfD8WE
	02D8VHkgQ9sGm/8EdP1OcbFGw0UnGW820pLQkMTaJJnqJ4sUVoHMIA3yyG/OzzE19IwZdQYB+FJ
	3P/0wrP5pHo8m+mz0ZzQ4b8AZEIbxvnuP/IeFjpkotQ1DEporJAL7/G5PjT64drv6iDk1gLkW/h
	oYmLmeKXUY/MHUouB2qZZnsMxdO7/U+5I+prz5/XJEqK6/LHra4PaUapJvgcZB68VzkWQ1LhqUK
	mG0mwUGwuZs8z9d6DMd/2FkoxXNJ2tSamndqq8aynYgFOR3t+Q==
X-Received: by 2002:a17:90b:1802:b0:3b0:9f53:e8a8 with SMTP id 98e67ed59e1d1-3b41c959dfbmr26204669a91.52.1795843534930;
        Fri, 27 Nov 2026 21:25:34 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([172.219.65.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b5210be133sm9958967a91.11.2026.11.27.21.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 21:25:34 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: ysato@users.sourceforge.jp,
	dalias@libc.org,
	glaubitz@physik.fu-berlin.de,
	terrelln@fb.com,
	dsterba@suse.com
Cc: geert+renesas@glider.be,
	ljs@kernel.org,
	n.schier@fritz.com,
	linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [RFC PATCH] sh: boot: add Zstandard compressed kernel support
Date: Fri, 27 Nov 2026 23:25:30 -0600
Message-ID: <20261128052530.456111-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for booting Zstandard compressed kernels on SuperH.

Select HAVE_KERNEL_ZSTD and add the required image generation rules
for Zstandard compressed kernel images.

Include the Zstandard decompressor in the compressed kernel and
provide the architecture helper routines required by it,
including the SH implementations of the division, memory movement,
and leading/trailing zero count helpers.

Tested on:

- SH4 R2D: successful Zstandard kernel boot under QEMU.

- SH4: successful builds with and without
  CONFIG_CC_OPTIMIZE_FOR_SIZE.

- SH3 EDOSK7705: successful Zstandard kernel build.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 arch/sh/Kconfig                   |  1 +
 arch/sh/boot/Makefile             | 12 ++++++++++--
 arch/sh/boot/compressed/Makefile  | 26 +++++++++++++++++++++++++-
 arch/sh/boot/compressed/clz_ctz.c |  3 +++
 arch/sh/boot/compressed/misc.c    |  3 +++
 5 files changed, 42 insertions(+), 3 deletions(-)
 create mode 100644 arch/sh/boot/compressed/clz_ctz.c

diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
index aa579aa041b5..d3919834a6dd 100644
--- a/arch/sh/Kconfig
+++ b/arch/sh/Kconfig
@@ -49,6 +49,7 @@ config SUPERH
 	select HAVE_KERNEL_LZMA
 	select HAVE_KERNEL_LZO
 	select HAVE_KERNEL_XZ
+	select HAVE_KERNEL_ZSTD
 	select HAVE_KPROBES
 	select HAVE_KRETPROBES
 	select HAVE_MIXED_BREAKPOINTS_REGS
diff --git a/arch/sh/boot/Makefile b/arch/sh/boot/Makefile
index cf63e319b786..49f32431a7e3 100644
--- a/arch/sh/boot/Makefile
+++ b/arch/sh/boot/Makefile
@@ -25,11 +25,13 @@ suffix_$(CONFIG_KERNEL_BZIP2)	:= bz2
 suffix_$(CONFIG_KERNEL_LZMA)	:= lzma
 suffix_$(CONFIG_KERNEL_XZ)	:= xz
 suffix_$(CONFIG_KERNEL_LZO)	:= lzo
+suffix_$(CONFIG_KERNEL_ZSTD)	:= zst
 
 targets := zImage vmlinux.srec romImage uImage uImage.srec uImage.gz \
-	   uImage.bz2 uImage.lzma uImage.xz uImage.lzo uImage.bin \
+	   uImage.bz2 uImage.lzma uImage.xz uImage.lzo uImage.zst \
+	   uImage.bin \
 	   vmlinux.bin vmlinux.bin.gz vmlinux.bin.bz2 vmlinux.bin.lzma \
-	   vmlinux.bin.xz vmlinux.bin.lzo
+	   vmlinux.bin.xz vmlinux.bin.lzo vmlinux.bin.zst
 subdir- := compressed romimage
 
 $(obj)/zImage: $(obj)/compressed/vmlinux FORCE
@@ -80,6 +82,9 @@ $(obj)/vmlinux.bin.xz: $(obj)/vmlinux.bin FORCE
 $(obj)/vmlinux.bin.lzo: $(obj)/vmlinux.bin FORCE
 	$(call if_changed,lzo)
 
+$(obj)/vmlinux.bin.zst: $(obj)/vmlinux.bin FORCE
+	$(call if_changed,zstd22)
+
 $(obj)/uImage.bz2: $(obj)/vmlinux.bin.bz2 FORCE
 	$(call if_changed,uimage,bzip2)
 
@@ -95,6 +100,9 @@ $(obj)/uImage.xz: $(obj)/vmlinux.bin.xz FORCE
 $(obj)/uImage.lzo: $(obj)/vmlinux.bin.lzo FORCE
 	$(call if_changed,uimage,lzo)
 
+$(obj)/uImage.zst: $(obj)/vmlinux.bin.zst FORCE
+	$(call if_changed,uimage,zstd)
+
 $(obj)/uImage.bin: $(obj)/vmlinux.bin FORCE
 	$(call if_changed,uimage,none)
 
diff --git a/arch/sh/boot/compressed/Makefile b/arch/sh/boot/compressed/Makefile
index b85aa5f0d616..f06c0293c3ee 100644
--- a/arch/sh/boot/compressed/Makefile
+++ b/arch/sh/boot/compressed/Makefile
@@ -8,8 +8,18 @@
 OBJECTS := head_32.o misc.o piggy.o \
            ashiftrt.o ashldi3.o ashrsi3.o ashlsi3.o lshrsi3.o
 
+zstd-udivsi3-y := udivsi3_i4i-Os.o
+ifneq ($(CONFIG_CC_OPTIMIZE_FOR_SIZE),y)
+zstd-udivsi3-$(CONFIG_CPU_SH3) := udivsi3_i4i.o
+zstd-udivsi3-$(CONFIG_CPU_SH4) := udivsi3_i4i.o
+endif
+
+OBJECTS-$(CONFIG_KERNEL_ZSTD) += clz_ctz.o memmove.o movmem.o $(zstd-udivsi3-y)
+OBJECTS += $(OBJECTS-y)
+
 targets := vmlinux vmlinux.bin vmlinux.bin.gz vmlinux.bin.bz2 \
-           vmlinux.bin.lzma vmlinux.bin.xz vmlinux.bin.lzo $(OBJECTS)
+           vmlinux.bin.lzma vmlinux.bin.xz vmlinux.bin.lzo \
+           vmlinux.bin.zst $(OBJECTS)
 
 #
 # IMAGE_OFFSET is the load offset of the compression loader
@@ -32,6 +42,18 @@ LDFLAGS_vmlinux := --oformat $(ld_bfd) -Ttext $(IMAGE_OFFSET) -e startup \
 
 KBUILD_CFLAGS += -DDISABLE_BRANCH_PROFILING
 
+$(obj)/memmove.o: $(srctree)/arch/sh/lib/memmove.S FORCE
+	$(call if_changed_dep,as_o_S)
+
+$(obj)/movmem.o: $(srctree)/arch/sh/lib/movmem.S FORCE
+	$(call if_changed_dep,as_o_S)
+
+$(obj)/udivsi3_i4i.o: $(srctree)/arch/sh/lib/udivsi3_i4i.S FORCE
+	$(call if_changed_dep,as_o_S)
+
+$(obj)/udivsi3_i4i-Os.o: $(srctree)/arch/sh/lib/udivsi3_i4i-Os.S FORCE
+	$(call if_changed_dep,as_o_S)
+
 $(obj)/vmlinux: $(addprefix $(obj)/, $(OBJECTS)) FORCE
 	$(call if_changed,ld)
 
@@ -48,6 +70,8 @@ $(obj)/vmlinux.bin.xz: $(obj)/vmlinux.bin FORCE
 	$(call if_changed,xzkern_with_size)
 $(obj)/vmlinux.bin.lzo: $(obj)/vmlinux.bin FORCE
 	$(call if_changed,lzo_with_size)
+$(obj)/vmlinux.bin.zst: $(obj)/vmlinux.bin FORCE
+	$(call if_changed,zstd22_with_size)
 
 OBJCOPYFLAGS += -R .empty_zero_page
 
diff --git a/arch/sh/boot/compressed/clz_ctz.c b/arch/sh/boot/compressed/clz_ctz.c
new file mode 100644
index 000000000000..81a708c6808b
--- /dev/null
+++ b/arch/sh/boot/compressed/clz_ctz.c
@@ -0,0 +1,3 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include "../../../../lib/clz_ctz.c"
diff --git a/arch/sh/boot/compressed/misc.c b/arch/sh/boot/compressed/misc.c
index 3690379cc86b..3739e5dd6250 100644
--- a/arch/sh/boot/compressed/misc.c
+++ b/arch/sh/boot/compressed/misc.c
@@ -66,6 +66,9 @@ static unsigned long free_mem_end_ptr;
 #ifdef CONFIG_KERNEL_LZO
 #include "../../../../lib/decompress_unlzo.c"
 #endif
+#ifdef CONFIG_KERNEL_ZSTD
+#include "../../../../lib/decompress_unzstd.c"
+#endif
 
 int puts(const char *s)
 {
-- 
2.56.1

