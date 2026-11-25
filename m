Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795649513;
	b=Uu7Cf0+8434LPxsegQUWw1Cp7fcGJZecucobS9/TE2aWzwj+czj6litjb4sXtaE5+5QZ
	 fvi6z7hwC7tyO7wi3cC7H1PitXvWmtAli2qZqkocCZwRaryJ+d1dBLhX+fVahE3OJvs0n
	 karwPX0Rf4GIkKJEL2+9YLdSjkx4UphwnNodmX1+C5OGsKy6O2pJ3L/EUKryzEby3XW0I
	 nEhYilpPPBsnZxGlp8X3yOhxW5rAs0YNdx8N2MRetL/voNQjD1O3zkfSH4GwB3uu3y0s6
	 Kufan4QjuR3VNNkWjoTbOf+I4IqpFg39o3BGUjEJ+wBtfArYOa24Y11JgXlA6ulVegQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795649513;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=sM/bxrlZWM2gs1gGiWx18pCt2PsQho/4iB9t+kQihGE=;
	b=n7lre33MmR6iAu+ZeADnQ3k2yyRIel13gOC90VHb1jSm4gQe11aEXOQRiYAzoCXRp0Ty
	 oi0AXE2kJ0r9ygGERs+iHSowt8xzpvuYVIvAqSjJxax8qLYL9lw+sDVGoZCaa3u/4kooV
	 RTxQWNVeV3nk6Luo4yFIrb+0k5dB0e4nCsmy4SDb63cIS1SLX3H04uKUOiI4MFZNSzdiB
	 HXC+X2P1/RVn3QqeweV4dzlxmir+3+B9IwsB+6qPmpSSc2KPppwhbmXqzhMKiMJHz7EFB
	 4vfeViv4S5zdffFhffzBnhzufPyH6BxHJpJc1LruJnt+RP+zJGn4aht9tkuMAP/ub+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hcZgm70A;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62481606A336
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:31:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62481606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hcZgm70A
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so5882112f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:31:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795649511; x=1796254311; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sM/bxrlZWM2gs1gGiWx18pCt2PsQho/4iB9t+kQihGE=;
        b=hcZgm70AS6uWjLpRckRyX6ZIVk3/mpR15nW12QYN9rTxtx6hQqNvEl6bKeBH0uuOCE
         B7cZgoGjUDPRBFc2stdvWCxmtUO1n/YVBd9AzVNBSdLX9E2wQFeXJcabmME0zmTL9QTr
         D02S5aKB8cRRTlEGmegocWkUINWT6SnCbDn1GlZ5yfKk7tTQkOrxO0iY2eUIaafg4Q2Q
         jGT0TjBaCTQt1jRU9VeR6rkaYHOY5ABNgPooj4ibpTgO9O42lzWhWRTfSiGVUDYKOJBH
         cRFEKaNw7AbGlRzrGN5x75GP0azjlvP2toejejBS1tWbYHG1ez1Yuy+LFJzg9tAnH3QF
         wiRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795649511; x=1796254311;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sM/bxrlZWM2gs1gGiWx18pCt2PsQho/4iB9t+kQihGE=;
        b=1DeVQyzBpR8jGWaPpLzbq9jCyQYSrAcFFo+QbpxivTbG/0RgWemIh1JwWdbikaFXzm
         k/aTF/pUwCB8r15S58ddMIEOAcocl2dWOhgDuD3iaxxnNy78MIvxDMMZ88z6dsmWW6lA
         Ug7jtCBofg2nAb1KmID3nYnd6XbpD8jaDVV5LP8RTOi6WcdkviPi1VB5qsouymqmwD9o
         PvItKymrS3znYnfqPkpB2zH/4vYyZ+Z6ah+pdb1mvhrugr0u1m/gr1yGg+Verrr6EXe+
         ghBkk97rO8uhzRHC9dfF1pDe9bnvF3UApABUGsTRIXmWUuXYadG64HWnp2tzEZtKnobT
         IyUA==
X-Forwarded-Encrypted: i=1; AL+hErHDPGicqR4re/5IiM6jaOywIPj9Pns4H0RBiP5a8Db2z1wnT64bLC7eiHZVnBirIVElejvV8PfX8twwBtA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Fr6Nnrayek9GRlkKSnnsy06x9UlgW5jqLXw87R/QMCx+/HucI
	L4mtbQq34GQgAweAiZpJOROSSHpbQj0LYEl02aHLrJVETZ5DsnsdEu7S
X-Gm-Gg: AZFdTZen7/R5nL7V99sGddbhX6XNe92lYTyuONrbSE7YnP4dXeS7XN/ABPYHuuS5xIt
	PYxJMydpOP2/k8SlbyROxRU/oZ46aCCj05OmF/+ZZ/vQdr5e1KaM0773EoEpDRwlSvEJuiGTe5b
	Fe18+rVi7hS10OY3/ZyXgNWwUv8KoHeB76aITGLpWCrBVOeSqEeTsTbf0Zq0eS/ONZTFaunnDn2
	5PVXutVfeoBNDvDDpXLN7vuAx7lh61BInkYLn9Fa9OGeXqvS3b2fFR2oTsM2uMHXQJcDOJyuKcc
	UICrpM/eYoAf1gmX5Te7YIeFLa60gaFwPOux80JSv+jrc841aoQcuLeU+fa3q1m0kLTRaPWiUTh
	YuzS9XsBty5nc2dhLVlhMypuxaFGopi3b/WC0blEcFg28YpLXLKFX7avvIMGSyk/y4eCraSWUfV
	Oj7ozLd14T6opmt0kznrI6nzN0wAM+K3a2rqeW8IqyPegm8fQ0TmC0AbkWSiR7eiz7DCcW2b56x
	4EKPGsmXI8BGTHqu1FJ0QRKXv6VURVnnIPZoH6PsYjggPO9Rtru1vU1gcIpQCNqCFNyXe9naFZo
	AUdX+bYAL3dgDHSkRSXoCufkuUpy5baLECBIyP6jvuYVcchqXFmg01KnJP995B5OgPu+Ais7P0C
	Q4t6W1tj2V/c=
X-Received: by 2002:a5d:64eb:0:b0:4ae:e824:1fa8 with SMTP id ffacd0b85a97d-4aee8241fc9mr26855783f8f.9.1795649510672;
        Wed, 25 Nov 2026 15:31:50 -0800 (PST)
Received: from localhost (bl20-90-91.dsl.telepac.pt. [2.81.90.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6ae2dcf9sm36628788f8f.32.2026.11.25.15.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:31:50 -0800 (PST)
From: =?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Kees Cook <kees@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH RFC 14/19] riscv: Synchronize instructions written to ESP32-P4 PSRAM
Date: Wed, 25 Nov 2026 23:30:15 +0000
Message-ID: <20261125233020.1380594-15-vitorhg20080@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125233020.1380594-1-vitorhg20080@gmail.com>
References: <20261125233020.1380594-1-vitorhg20080@gmail.com>
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

On ESP32-P4, a load can observe new instruction bytes in the data
cache while the instruction fetch path still sees old bytes. The
runtime constant patching code can then execute stale instructions
and use an invalid address during boot.

Write back the L1 data and L2 caches for the modified PSRAM range,
invalidate the local L1 instruction cache for that range and issue
fence.i before executing the modified instructions. Apply the same
sequence to NOMMU userspace code, including FLAT binaries and the
signal return trampoline.

Split the aligned range into 32 KiB chunks and restore the caller's
IRQ state after each chunk. In instrumented measurements on the
Waveshare board, the longest observed IRQ-disabled window fell from
2.69 ms with 128 KiB chunks to 1.13 ms with 32 KiB chunks.

Bound cache synchronization by a fixed number of reads per command.
After a timeout, stop issuing commands because the controller may
still be busy. Propagate failures through executable loading and
signal setup. Treat a failure to synchronize patched kernel text as
fatal.

The ESP32-P4 board probe observed stale instructions after fence.i
alone. Combining data writeback and instruction cache invalidation
made the modified instructions visible.

Verified boot to the UART shell on a Waveshare ESP32-P4-Module-DEV-KIT
with SDMMC disabled in Linux. The shell handled SIGUSR1 and resumed
execution. With CLIC disabled, the RV32 NOMMU patch.o and signal.o
matched the reference byte for byte.

AI assisted with isolating the cache synchronization change from
the rest of the ESP32-P4 port.

Link: https://docs.espressif.com/projects/esp-idf/en/stable/esp32p4/api-reference/system/mm_sync.html
Signed-off-by: Vítor Hugo Silva <vitorhg20080@gmail.com>
---
 arch/riscv/include/asm/cacheflush.h |   6 ++
 arch/riscv/kernel/patch.c           | 132 +++++++++++++++++++++++++++-
 arch/riscv/kernel/signal.c          |   6 +-
 fs/binfmt_flat.c                    |   6 +-
 fs/exec.c                           |  10 ++-
 include/linux/cacheflush.h          |   7 ++
 6 files changed, 160 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
index c2b0a2928f06..a5c20d7d1c9d 100644
--- a/arch/riscv/include/asm/cacheflush.h
+++ b/arch/riscv/include/asm/cacheflush.h
@@ -85,6 +85,12 @@ static inline void flush_icache_range(unsigned long start, unsigned long end)
 	flush_icache_all();
 }
 
+#ifdef CONFIG_RISCV_ESP32P4_CLIC
+int esp32p4_sync_user_text(unsigned long start, unsigned long end);
+
+#define flush_icache_user_range_checked esp32p4_sync_user_text
+#endif
+
 extern unsigned int riscv_cbom_block_size;
 extern unsigned int riscv_cboz_block_size;
 extern unsigned int riscv_cbop_block_size;
diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
index 2b5adf01c550..e0687c943358 100644
--- a/arch/riscv/kernel/patch.c
+++ b/arch/riscv/kernel/patch.c
@@ -3,6 +3,13 @@
  * Copyright (C) 2020 SiFive
  */
 
+#ifdef CONFIG_RISCV_ESP32P4_CLIC
+#include <linux/align.h>
+#include <linux/io.h>
+#include <linux/irqflags.h>
+#include <linux/panic.h>
+#include <linux/sizes.h>
+#endif
 #include <linux/spinlock.h>
 #include <linux/mm.h>
 #include <linux/memory.h>
@@ -173,9 +180,132 @@ static int __patch_insn_set(void *addr, u8 c, size_t len)
 }
 NOKPROBE_SYMBOL(__patch_insn_set);
 
+#ifdef CONFIG_RISCV_ESP32P4_CLIC
+#define ESP32P4_CACHE_BASE		0x3ff10000
+#define ESP32P4_CACHE_SYNC_CTRL		0x98
+#define ESP32P4_CACHE_SYNC_MAP		0x9c
+#define ESP32P4_CACHE_SYNC_ADDR		0xa0
+#define ESP32P4_CACHE_SYNC_SIZE		0xa4
+
+#define ESP32P4_CACHE_INVALIDATE	BIT(0)
+#define ESP32P4_CACHE_WRITEBACK		BIT(2)
+#define ESP32P4_CACHE_SYNC_DONE		BIT(4)
+#define ESP32P4_CACHE_SYNC_MAX_POLLS	1000000
+
+#define ESP32P4_CACHE_L1_I0		BIT(0)
+#define ESP32P4_CACHE_L1_D		BIT(4)
+#define ESP32P4_CACHE_L2		BIT(5)
+
+#define ESP32P4_PSRAM_START		0x48000000UL
+#define ESP32P4_PSRAM_END		0x4c000000UL
+#define ESP32P4_CACHE_MAX_LINE		128
+
+static int esp32p4_cache_sync(u32 map, u32 start, u32 size, u32 op,
+			       unsigned int count)
+{
+	/* The caller holds local IRQs disabled on the single supported hart. */
+	static bool sync_failed;
+	void __iomem *base = (void __iomem *)ESP32P4_CACHE_BASE;
+	unsigned int polls;
+
+	if (sync_failed)
+		return -EIO;
+
+	writel(map, base + ESP32P4_CACHE_SYNC_MAP);
+	writel(start, base + ESP32P4_CACHE_SYNC_ADDR);
+	writel(size, base + ESP32P4_CACHE_SYNC_SIZE);
+
+	while (count--) {
+		writel(op, base + ESP32P4_CACHE_SYNC_CTRL);
+		/* Order the sync command before reading its completion status. */
+		mb();
+		for (polls = 0; polls < ESP32P4_CACHE_SYNC_MAX_POLLS; polls++) {
+			if (readl(base + ESP32P4_CACHE_SYNC_CTRL) & ESP32P4_CACHE_SYNC_DONE)
+				break;
+			cpu_relax();
+		}
+		if (polls == ESP32P4_CACHE_SYNC_MAX_POLLS) {
+			sync_failed = true;
+			return -ETIMEDOUT;
+		}
+	}
+
+	return 0;
+}
+
+static int esp32p4_cache_writeback(u32 start, u32 size)
+{
+	int ret;
+
+	/* Repeat writeback to avoid losing a sync with conflicting writes. */
+	ret = esp32p4_cache_sync(ESP32P4_CACHE_L1_D, start, size, ESP32P4_CACHE_WRITEBACK, 2);
+	if (ret)
+		return ret;
+
+	return esp32p4_cache_sync(ESP32P4_CACHE_L2, start, size, ESP32P4_CACHE_WRITEBACK, 2);
+}
+
+static int esp32p4_sync_text(void *addr, size_t len, bool fatal)
+{
+	unsigned long start = (unsigned long)addr;
+	unsigned long first, end, flags;
+
+	if (start < ESP32P4_PSRAM_START || start >= ESP32P4_PSRAM_END ||
+	    !len || len > ESP32P4_PSRAM_END - start)
+		return 0;
+
+	first = ALIGN_DOWN(start, ESP32P4_CACHE_MAX_LINE);
+	end = ALIGN(start + len, ESP32P4_CACHE_MAX_LINE);
+
+	/* Allow interrupts between chunks if they were enabled on entry. */
+	while (first < end) {
+		u32 size = min_t(u32, end - first, SZ_32K);
+		int ret;
+
+		local_irq_save(flags);
+		ret = esp32p4_cache_writeback(first, size);
+		if (!ret)
+			ret = esp32p4_cache_sync(ESP32P4_CACHE_L1_I0, first, size,
+						 ESP32P4_CACHE_INVALIDATE, 1);
+		if (ret) {
+			if (fatal)
+				panic("ESP32-P4 text cache sync failed: %d\n", ret);
+			local_irq_restore(flags);
+			return ret;
+		}
+
+		local_flush_icache_all();
+		local_irq_restore(flags);
+		first += size;
+	}
+
+	return 0;
+}
+
+int esp32p4_sync_user_text(unsigned long start, unsigned long end)
+{
+	int ret;
+
+	if (end > start) {
+		ret = esp32p4_sync_text((void *)start, end - start, false);
+		if (ret)
+			return ret;
+	}
+
+	flush_icache_range(start, end);
+	return 0;
+}
+#endif
+
 static int __patch_insn_write(void *addr, const void *insn, size_t len)
 {
-	return copy_to_kernel_nofault(addr, insn, len);
+	int ret = copy_to_kernel_nofault(addr, insn, len);
+
+#ifdef CONFIG_RISCV_ESP32P4_CLIC
+	if (!ret)
+		esp32p4_sync_text(addr, len, true);
+#endif
+	return ret;
 }
 NOKPROBE_SYMBOL(__patch_insn_write);
 #endif /* CONFIG_MMU */
diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index 59784dc117e4..05266d7c1466 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/compat.h>
+#include <linux/cacheflush.h>
 #include <linux/signal.h>
 #include <linux/uaccess.h>
 #include <linux/syscalls.h>
@@ -21,7 +22,6 @@
 #include <asm/switch_to.h>
 #include <asm/vector.h>
 #include <asm/csr.h>
-#include <asm/cacheflush.h>
 #include <asm/usercfi.h>
 
 unsigned long signal_minsigstksz __ro_after_init;
@@ -453,7 +453,9 @@ static int setup_rt_frame(struct ksignal *ksig, sigset_t *set,
 
 	addr = (unsigned long)&frame->sigreturn_code;
 	/* Make sure the two instructions are pushed to icache. */
-	flush_icache_range(addr, addr + sizeof(frame->sigreturn_code));
+	err = flush_icache_user_range_checked(addr, addr + sizeof(frame->sigreturn_code));
+	if (err)
+		return err;
 
 	regs->ra = addr;
 #endif /* CONFIG_MMU */
diff --git a/fs/binfmt_flat.c b/fs/binfmt_flat.c
index b5b5ca1a44f7..890a81d805dc 100644
--- a/fs/binfmt_flat.c
+++ b/fs/binfmt_flat.c
@@ -32,6 +32,7 @@
 #include <linux/user.h>
 #include <linux/slab.h>
 #include <linux/binfmts.h>
+#include <linux/cacheflush.h>
 #include <linux/personality.h>
 #include <linux/init.h>
 #include <linux/flat.h>
@@ -40,7 +41,6 @@
 
 #include <asm/byteorder.h>
 #include <linux/unaligned.h>
-#include <asm/cacheflush.h>
 #include <asm/page.h>
 #include <asm/flat.h>
 
@@ -830,7 +830,9 @@ static int load_flat_file(struct linux_binprm *bprm,
 #endif /* CONFIG_BINFMT_FLAT_OLD */
 	}
 
-	flush_icache_user_range(start_code, end_code);
+	ret = flush_icache_user_range_checked(start_code, end_code);
+	if (ret)
+		return ret;
 
 	/* zero the BSS,  BRK and stack areas */
 	if (clear_user((void __user *)(datapos + data_len), bss_len +
diff --git a/fs/exec.c b/fs/exec.c
index 8d2b14e1d455..9066d2bebd1a 100644
--- a/fs/exec.c
+++ b/fs/exec.c
@@ -23,6 +23,7 @@
  * formats.
  */
 
+#include <linux/cacheflush.h>
 #include <linux/kernel_read_file.h>
 #include <linux/slab.h>
 #include <linux/file.h>
@@ -827,8 +828,13 @@ EXPORT_SYMBOL(open_exec);
 ssize_t read_code(struct file *file, unsigned long addr, loff_t pos, size_t len)
 {
 	ssize_t res = vfs_read(file, (void __user *)addr, len, &pos);
-	if (res > 0)
-		flush_icache_user_range(addr, addr + len);
+
+	if (res > 0) {
+		int ret = flush_icache_user_range_checked(addr, addr + len);
+
+		if (ret)
+			return ret;
+	}
 	return res;
 }
 EXPORT_SYMBOL(read_code);
diff --git a/include/linux/cacheflush.h b/include/linux/cacheflush.h
index 55f297b2c23f..6a7d6f425737 100644
--- a/include/linux/cacheflush.h
+++ b/include/linux/cacheflush.h
@@ -26,4 +26,11 @@ static inline void flush_icache_pages(struct vm_area_struct *vma,
 
 #define flush_icache_page(vma, page)	flush_icache_pages(vma, page, 1)
 
+#ifndef flush_icache_user_range_checked
+#define flush_icache_user_range_checked(start, end) ({	\
+	flush_icache_user_range((start), (end));		\
+	0;						\
+})
+#endif
+
 #endif /* _LINUX_CACHEFLUSH_H */
-- 
2.56.1

