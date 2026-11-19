Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795131683;
	b=K8xNKzBQUUecA1dlRQZjtuRpv8JHLHmRop5O4mOTvXyxKUkY0XVsuLfzp2tHnWE352wR
	 dEw1y0KSbSv7vxl5EsRoqhFhKwxys2THnFm6GuBEiiS7hIQz5tvxTLejoiwQMXBMxuY6u
	 gcwKXM2pWmkx1WglcKWzGsCVXo4/tRbMxqPo12a8jixB2qrZqkXoqfezjXATYlPxsvx1v
	 LpdwD1JE556GqaVB64/zRYIUssKbKRIWZalv/VmOrRCTh37OJmpt5pyJhzoysUPbJqMDp
	 rhl7UGO8rpg8Sr76RWpB9LRlDulGEdgKnlDwbDNhDAMF515/3QKj/i2cOvly5n+7pag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795131683;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/bBpAqV6vKIYvVAXxXWFQ3lwfUYXqc1KvZzM1h1nZSo=;
	b=o0VWywQAXJd8AcjO+rm5Ep+z+rIVX+ZW5puGdUFDoeQgm0jNl+RUikCzkp2v7F7VJy7C
	 a2VjsG7mgyoge/6LG1xpBU+yKjZsEeUSPjoOxpQN+vPdPbKoQAeP+U4SKY1rlHxR7zjNY
	 pB0BOTU9xDdmms3oICwwW2O4cpCt3nBT6rmj299q7umiMRfxM/piyct/8CkcSYvDqHUAG
	 NVBkEXJvfxZHavk1UmyuW94B70HmbKj7plc/2LtJ57Yiez8RandoJ/oP8qvaNff8RjSHx
	 oxRmXFPlvZzSrLpn9YkqJ3UgwqIKJ6YtzP1T2wkaejvtYLxV6jBx/oIc/gbX9Cz6bNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dubeyko.com;
	spf=pass smtp.mailfrom=dubeyko.com;
	dkim=pass header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=auFLyBTn;
	arc=none smtp.remote-ip=74.125.224.46
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42822606A330
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 23:41:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42822606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=auFLyBTn
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-67da69e7c31so414149d50.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20260707.gappssmtp.com; s=20260707; t=1795131682; x=1795736482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/bBpAqV6vKIYvVAXxXWFQ3lwfUYXqc1KvZzM1h1nZSo=;
        b=auFLyBTnc+OU0Af5z2ALEYZwf+jLBIma9RB4NffGVhAWF64YbWiXh2L8BhkEttnzc5
         TGmfG7/5Eh2DAXYwmOWiuqqlNeCdtuJPeApkpm9S4f9oOuoNXvKA64puEIZkAXRoTgaC
         R6w43OfpNbaqrXXiBLmqpLkUpf0NOyElgB31YXPoYZEy3trjUoNakJfpZtCo8mZNxykq
         gHx8yP3ZTvW7Z9qqKdIfiTLB7PwKt3DcnVb1MEslTAJnhg2eSLHMfvxoLd7Lhv+1+eKw
         69WH7W+O5HLISkT1/EohyVQmRk0Hj7mqZ4LTsYmhl4lIew9jEqDZMZ7Mq8yoUGQy2fIX
         svrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795131682; x=1795736482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/bBpAqV6vKIYvVAXxXWFQ3lwfUYXqc1KvZzM1h1nZSo=;
        b=Ppmni2PtFNI0HbsLqZMuhojpwC4vbYeUuvnaUNwHA5CN64nieipYrxdf1Kc1hoIkZl
         zSEZw4gOkd11NFHRdcvcSLJSosMtNXkt6RhYxT7NFPD7gfymvzkJ0w+2NLO8V1jeA89s
         SAHaLRlv+bpVGmCo++gHNCZP0x/MvLqXVIL5sQa7nLtsDhrcQflwz11i2hGdLiSQmcpr
         jR8qStNl0TGJy8h8K7W0xJytsSbsMdCIxiqZpBVu0c883U8AScsNdeFNn6Q3MNzfGa0w
         sQqpRrwuA0B3QzmrmaurLI+lMAbca8QqAY6IyDuP4ubAuChwavT/KbYWx/XPPG8ULLhf
         I68Q==
X-Forwarded-Encrypted: i=1; AL+hErE44Zu5vG10ADFzVmnt3FgAR0mALKtwgqhcUy+Jz/VkOPhSYgk27FBuMGrkVWRlFbVMxJBoX67NJ2kwjoo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gv8pqGFL/gg4aU/lvBlWEKzF0GB/Gwc/5br039BIqdRWgBYyQ
	t0Z7tbbS+/Ley7VHHEcuGWiFQqh8yloiE6GPSGZgW149zIdnFArUzK3DEAIZvpkN0ZU=
X-Gm-Gg: AZFdTZeaID3mJuVldlWQzK506BHM1Pb1/2Cfyfwjew8n0ctqOk0an65R1HTbpWWiqHw
	PH1hzd70QVtEr4qgd2NjfNdZELjMvVQuI8UVOl+e/WDj3Xsn0rpbSSzuu9kS9crgjnbcQkc5970
	gisbTX6R8q7l1iWIAZ6vGW8AFZOrBWqd6WGuyx3tt91VdvHEMCeZeRr5qrtL916kXMsOyIjmtyC
	icgdSzdWhyzT4flYf2olaeXPLm1mhgVSuw+7mbUaOBxh/hWcEC157PrsJrZMW1cUyJevRi4Ke+e
	VhnLf1s/J2bjTeGgSzepLpRGZS0HoqfO+hkOwLk0JRIdUVSQnL1tI8ww3VGc3G9cB1tZV3YTZQS
	oAZLWtgFqEhckBnpaGCl8kX2HqfS/8p77Sx+kW3oJEoDpmfXHdiFMj2rfc60Zq1INjpbn1S6cMq
	99CTwQ8XGWu7sgxmKGAw3M+GRTBWp/kwA+rQsRzR/TdlCfFFb6ezrCqDFhqK+KMoAZ6JkwvWDmw
	yfF75gdKlwVOkOVk3d+dTM0ou6FflpbMiNBlQR8rSqQ0RmmQxyWp0/eIwHGefdzGc6JO90mQApB
	/DQI5O5JDHoV3uHgJ4DKVodDcbLcpJmhVCKwHWCO08iW+YVDVIdZCIEXS94LAgqhHfQbHCXJO0B
	ZyjSYQI+//idbB1MsPRAmxXnfuLA+eREePlb1nSyRuXrVc2J9IQURbPGUzY2/Wi4I0rNTkeo=
X-Received: by 2002:a05:690e:1489:b0:679:5bea:d3fb with SMTP id 956f58d0204a3-67df44ff2a3mr507091d50.98.1795131682495;
        Thu, 19 Nov 2026 15:41:22 -0800 (PST)
Received: from system76-laptop.attlocal.net ([2600:1700:6476:1430:1932:ad09:1827:11fb])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df338e8fesm796893d50.16.2026.11.19.15.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 15:41:22 -0800 (PST)
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: glaubitz@physik.fu-berlin.de,
	frank.li@vivo.com
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vdubeyko@coreweave.com,
	Viacheslav Dubeyko <slava@dubeyko.com>
Subject: [PATCH 5/5] hfsplus: name the constants of the allocation bitmap check
Date: Thu, 19 Nov 2026 15:41:12 -0800
Message-ID: <20261119234112.720963-6-slava@dubeyko.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261119234112.720963-1-slava@dubeyko.com>
References: <20261119234112.720963-1-slava@dubeyko.com>
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

hfsplus_file_extend() refuses to allocate when the allocation bitmap
has fewer than eight bits beyond the blocks in use, written as

  i_size * 8 < total_blocks - free_blocks + 8

where the first 8 is the number of bits per byte and the second one is
a margin. Use BITS_PER_BYTE for the first and a new constant,
HFSPLUS_ALLOC_BITMAP_SPARE_BITS, for the second, and name the two sides
of the comparison. The number of blocks in use plus the margin is now
computed in 64 bits, as the bitmap size already was; there is no other
functional change.

Tested on a KASAN and lockdep kernel: filling a volume whose allocation
file is exactly as large as the volume needs fails with -ENOSPC at 0
free blocks and fsck.hfsplus reports the volume as OK; generic/001,
002, 013, 075 and 112 pass.

cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: Yangtao Li <frank.li@vivo.com>
cc: linux-fsdevel@vger.kernel.org
Signed-off-by: Viacheslav Dubeyko <slava@dubeyko.com>
---
 fs/hfsplus/extents.c    | 9 +++++----
 fs/hfsplus/hfsplus_fs.h | 6 ++++++
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/fs/hfsplus/extents.c b/fs/hfsplus/extents.c
index da6ab85a64ae..f910699338e5 100644
--- a/fs/hfsplus/extents.c
+++ b/fs/hfsplus/extents.c
@@ -552,15 +552,16 @@ int hfsplus_file_extend(struct inode *inode, bool zeroout)
 	struct super_block *sb = inode->i_sb;
 	struct hfsplus_sb_info *sbi = HFSPLUS_SB(sb);
 	struct hfsplus_inode_info *hip = HFSPLUS_I(inode);
+	u64 bitmap_bits = (u64)sbi->alloc_file.inode->i_size * BITS_PER_BYTE;
+	u32 used_blocks = sbi->total_blocks - sbi->free_blocks;
 	u32 start, len, goal;
 	int res;
 
-	if (sbi->alloc_file.inode->i_size * 8 <
-	    sbi->total_blocks - sbi->free_blocks + 8) {
+	if (bitmap_bits < (u64)used_blocks + HFSPLUS_ALLOC_BITMAP_SPARE_BITS) {
 		/* extend alloc file */
 		pr_err_ratelimited("extend alloc file! (%llu,%u,%u)\n",
-				   sbi->alloc_file.inode->i_size * 8,
-				   sbi->total_blocks, sbi->free_blocks);
+				   bitmap_bits, sbi->total_blocks,
+				   sbi->free_blocks);
 		return -ENOSPC;
 	}
 
diff --git a/fs/hfsplus/hfsplus_fs.h b/fs/hfsplus/hfsplus_fs.h
index 9a304d946297..4f604c664cb9 100644
--- a/fs/hfsplus/hfsplus_fs.h
+++ b/fs/hfsplus/hfsplus_fs.h
@@ -120,6 +120,12 @@ struct hfsplus_alloc_file {
 	struct hfsplus_overflow_extents overflow;
 };
 
+/*
+ * Bits the allocation bitmap must have beyond the blocks in use for
+ * hfsplus_file_extend() to allocate more blocks.
+ */
+#define HFSPLUS_ALLOC_BITMAP_SPARE_BITS	8
+
 struct hfsplus_sb_info {
 	void *s_vhdr_buf;
 	struct hfsplus_vh *s_vhdr;
-- 
2.53.0

