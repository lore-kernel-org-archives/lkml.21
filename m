Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169896;
	b=4IzhnZctPQOvggyMtGu+pnCQMFf8ydj6d371nox8pFnY4vMxg99L785lGURRUyVYETCW
	 pO1sDY7ijdcSyTLxqLX7fHqVEFB+czQUFdPipNXgjYc1w8oC3hvtqE3S1aquVpq6cMiNM
	 pZd4HkKaBRUK+R4Qd5Aayz8gSj/lGhwdzpVU7FXDfWJ6b7RL4noCNgfgE9cy6KdizwzNU
	 u0na8fJWwdq6C6mmT8IFATotW/2ReI7CIKxe3wrGDyWDJiZR8VjCcMtoFmjExZbOWcidw
	 RI0QVNmUjxyhMjaM52lthX5qnO5TAGIuK99n6U3+HJvCm8JPz8XUDrVcsau1eK2NAFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169896;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0840EDq5sPqsJHKgUXXcqS6nB05CdxuLpexyxuNzBmU=;
	b=G/zIQFefRp1rMYqcIwketETY3OKVb26kgc/vA5DsbS9giKowbJfr65dbtP0q56PbNhfk
	 hR9AeNYTXFck3/jQ2j0mjonbb56QiXTwHEIuqZFloMK+Ey1/qlbrNfgC2LZ3SbN7uYQfZ
	 y/ObBYSOXLU1Q4mHYbe37ivXD0pm7GzvonsDfRX+xX3uTDqS42UuSkyMG4owEkAkgKp7c
	 GU1yyQEpUW6ksGKeQWyUo5HQnP+21nn0TSDrcuxd31sBim2NpgwArVZJS4tQDiPf3snvm
	 E6d9mCw+3m/h49vvZMkU165gvNUNKJdD+2DuP9dzui1flZyLH7lj/JBSLEpnpz68+CQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0UWDzhBg;
	arc=none smtp.remote-ip=74.125.229.135
Received: from mail-dl2-f7.google.com (mail-dl2-f7.google.com [74.125.229.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2B3606A326
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:18:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA2B3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0UWDzhBg
Received: by mail-dl2-f7.google.com with SMTP id a92af1059eb24-139b659a45eso86752c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795169895; x=1795774695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0840EDq5sPqsJHKgUXXcqS6nB05CdxuLpexyxuNzBmU=;
        b=0UWDzhBgiZt5U/3N4EeZci/JkWF9eKwGJXsAHn33Vkruk3qem1UHqvfcGP6nWBvInq
         BdCARVy8qG6wx2oPff/jAo/jp2sEbNZLdW+aiXFbEcQvb+2WEqXLeca3fkfqaEXKAl5n
         lrgbH9EcwYkxXzc9HMRgG7npL0l+MYg5mlUyrqhOj3eUmlzNEcy7ln+bAP6DfG+rwxQU
         dsO1QW0R8k0RfLSX8CSqHIqkiai9v1pDGS9vIm2NPVZof7kmQaUntowQ99KIIV3Dqesi
         diGgYheEaF+iqiezAvbSE5xWM5zNHf3jCQGh4t/IW7lxv6XFNtuqqnqqO9UlxRCX7oQl
         s24Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795169895; x=1795774695;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0840EDq5sPqsJHKgUXXcqS6nB05CdxuLpexyxuNzBmU=;
        b=k1QTk5th58wyyyCscde06HJrFr6hgseNEyIn+6dRkfg7EhFusv7PUfTemydoJYoS7J
         Z12AktpovfYSOISG8JHudEpKm22jXrQq+XRRJ0ZvY6imIqDDsbf6QxWvlISTgiyx7f/6
         +CZVHgT7HrmuY9pG5y59YTf/jlGkZa1Vrb7Zvk0wWKJE0a9CA5EoGPbA8OGpzDjZjxA2
         xZli3t3PEJsPdINftuG5h6HCiKPRKSICQ7GLmMWUjsAjv83MPy6XKiiHiXLYhod+jgrg
         2c9zOSTeWe/St5U32vOrfrdrY2FKEjsRdx3wpxDoKWKQofyXLNE7Ia8DI2oEX4mjVhqT
         RGXQ==
X-Forwarded-Encrypted: i=1; AL+hErFPIJR2Xwo3C3HT35Q5FSgLkIoG9OWYVYP0fbEUcp7JxIzn8/waOrFpJW2QfUWFd6yiaGGirWQFmaqeJbk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/slVPJc9zSDB5DxPUK5jiy7BOJ00eandzW5Zy2R4Xulq9EGbQc
	e4iff5tWFBMvMnk/EQwtZg04sbrW0Zb86PEZW1CMnWOcgQPflvbBR4w5
X-Gm-Gg: AYBFou2JvjkT6Ou4NlhjijK45mN0LmXix5uqJ6hCQnXvjdl2SmeyBpeG1F0YH1EXHOG
	bRx+Ai3e9XjrcWiNsLaxhfTaF8YeQ/zGR8p80NmyRjAEt0BspOvipfkcHf0DiWzIfRvbRDiagJH
	Z+vKU32IzH2vzBxWd4EvdKXK33Wj3I6y43SR3UBLBhL5AG/MNLvJnnH7hjoMCuj2R9tElCwe+wy
	14NKafYtWyz30w/BgkMydcFbfx3kHfa5bEL3iussnP7mgaRDCnUfvC5EYqNhhyHRZ7dwDpAqyZm
	AWSKHmUZMpgwawythZz1FI6oKAMyY4hbGyZScCV/1V9ZYljevU/P5UgaeChNGUD8QHmufIhDokk
	WuQlr1cpVt60+f6+3aG0PzB9hZGzpvho44Lr/EZZK/hpBHVr/EdEmYdx1qy/7KcCz9zch3+ugoo
	RNehDx60GesVn3NanCFVLI+V6ayYyWey9pCHASG6HSG4zjVTEkCTsbn3bgKEVombtUELk03Vwwo
	xls6GmDfIwD4TsTlS8Pdj5Ep4T40wDDPc9o7LUCUrKshf/thHOLtcpuyALPA3n+gAO3BNuJQz9Z
	/tfOFInkJASRX1oIFrq365lvPIo0fgIzoq3ZHYuxzgF7BBEUAPjZx7hht0UozQfrne7oPPyxTui
	mjmBbu9gKU+0Zd9RcdH6EsfMKr82ODNde2Mu4zg==
X-Received: by 2002:a05:701b:2901:b0:143:3c9f:10a6 with SMTP id a92af1059eb24-1b5567b315cmr2415345c88.4.1795169894971;
        Fri, 20 Nov 2026 02:18:14 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5568592adsm5905170c88.15.2026.11.20.02.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:18:14 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: axboe@kernel.dk
Cc: hch@infradead.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dm-devel@lists.linux.dev,
	mtsai@redhat.com,
	stable@vger.kernel.org,
	dennylin0707@gmail.com,
	hch@lst.de
Subject: [PATCH v4] block: fix discard alignment for non-power-of-two granularities
Date: Fri, 20 Nov 2026 10:17:58 +0000
Message-ID: <20261120101758.45513-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
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

bio_discard_limit() uses round_up() and round_down(), which require a
power-of-two alignment. However, discard_granularity need not be a power
of two. For example, dm-thin supports data block sizes that are arbitrary
multiples of 64 KiB and advertises the block size as its granularity.

With a 192 KiB granularity, discarding one complete block at offset
384 KiB is split into 128 KiB and 64 KiB bios. Neither covers a complete
thin block, so dm-thin ignores both and the mapping remains allocated.

Use div_u64_rem() to find the starting sector's remainder without
modifying the sector. Round the maximum bio size down with rounddown()
and subtract the remainder so that the next bio starts on a granularity
boundary. This handles non-power-of-two granularities and avoids a small
initial bio when a large discard starts at an unaligned sector.

When discard is unsupported or disabled, discard_granularity can be zero.
Return BIO_MAX_SECTORS in that case so the existing bio submission checks
can handle unsupported discard requests without dividing by zero.

Fixes: 9b15d109a6b2 ("block: improve discard bio alignment in __blkdev_issue_discard()")
Reported-by: Ming-Hung Tsai <mtsai@redhat.com>
Link: https://lore.kernel.org/r/CALjSBEvjbiGDVewuapWKhGDtaxZwcn4=22raUiBEOyj22rY7-g@mail.gmail.com
Suggested-by: Christoph Hellwig <hch@infradead.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
Changes in v4:
- Add Christoph Hellwig's Reviewed-by.

v3: https://lore.kernel.org/r/20261103185909.71843-1-dennylin0707@gmail.com

Changes in v3:
- Use div_u64_rem() instead of sector_div(), as suggested by Christoph
  Hellwig, so the input sector is not modified.
- Subtract the starting-sector remainder from the rounded maximum size
  instead of emitting a short initial bio, following Christoph's proposal.
- Include <linux/math64.h> explicitly and retain v2's zero-granularity guard.

Changes in v2:
- Handle zero discard_granularity before dividing. Leave unsupported
  discard handling to the bio submission path.

v2: https://lore.kernel.org/r/20261026195131.46699-1-dennylin0707@gmail.com

 block/blk-lib.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/block/blk-lib.c b/block/blk-lib.c
index 688bc67cbf7..e98aa483707 100644
--- a/block/blk-lib.c
+++ b/block/blk-lib.c
@@ -3,6 +3,7 @@
  * Functions related to generic helpers functions
  */
 #include <linux/kernel.h>
+#include <linux/math64.h>
 #include <linux/module.h>
 #include <linux/bio.h>
 #include <linux/blkdev.h>
@@ -13,26 +14,25 @@
 static sector_t bio_discard_limit(struct block_device *bdev, sector_t sector)
 {
 	unsigned int discard_granularity = bdev_discard_granularity(bdev);
-	sector_t granularity_aligned_sector;
+	u32 unaligned_sectors;
+
+	if (!discard_granularity)
+		return BIO_MAX_SECTORS;
 
 	if (bdev_is_partition(bdev))
 		sector += bdev->bd_start_sect;
 
-	granularity_aligned_sector =
-		round_up(sector, discard_granularity >> SECTOR_SHIFT);
-
-	/*
-	 * Make sure subsequent bios start aligned to the discard granularity if
-	 * it needs to be split.
-	 */
-	if (granularity_aligned_sector != sector)
-		return granularity_aligned_sector - sector;
-
 	/*
-	 * Align the bio size to the discard granularity to make splitting the bio
-	 * at discard granularity boundaries easier in the driver if needed.
+	 * Align the bio size to the discard granularity to make splitting the
+	 * bio at discard granularity boundaries easier in the driver if needed.
+	 *
+	 * If the current sector is not aligned, shorten the range so that the
+	 * next one is aligned.
 	 */
-	return round_down(BIO_MAX_SIZE, discard_granularity) >> SECTOR_SHIFT;
+	div_u64_rem(sector, discard_granularity >> SECTOR_SHIFT,
+		    &unaligned_sectors);
+	return (rounddown(BIO_MAX_SIZE, discard_granularity) >> SECTOR_SHIFT) -
+		unaligned_sectors;
 }
 
 struct bio *blk_alloc_discard_bio(struct block_device *bdev,

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.50.1 (Apple Git-155)

