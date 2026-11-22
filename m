Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795333559;
	b=cXTGdqvOl8AsJO00esQvn8FcyisTcCnURaSELBINwOnEOAfY1hE/cVIS2i7YKAyxpdeu
	 CxxB+Qu91Lijb2ZAhLYHQ0Ug33Y23Hvis5TNusaLLDGQ6sj5GZCRjn8CNUS0nQEqRP0iD
	 KtGifupSWBajenDjDVcb38/SqwWLo101vNRYFOg+SYzCgmhw0NXSJRihJAtRdAzc3EbgJ
	 gmCj89dUzMAk2ghyL5w6tEHymBITIEtSvwZtYivFNLX394mc+H4u7WbPszbRfAar/eh8o
	 +MLRH6izxmadjf149wH7PDGieCol5YaWzwcrBQipN3/C3tdAUZ7mHSvMmFJW9ovcx1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795333559;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mJ1uV0nElB+ZuXOREmohOqblGnYAv6C9rlmGAxRkS6c=;
	b=EGrBLNuGJuiUvJHTaj+xJBxVnpwrzL4GnDoyJGiIrKfl+E7t4jIfGb1Tg0Asc+OpbEHt
	 lkv37S42a3ONa7HcLo621JvieLvMxFmEVWbGxxeYmgoGhiufMTUtU5KNwjQlQd1/yHiOJ
	 BLlC/6mt5hzUQsAV72/UETZnEw1tCJAQVmmAUs2pdtAg3J4wI0s34+4qY5GeI2eUtPxcU
	 cf8ddeRYdVRXjA3hDDeeWszFd+Yp0BUJcPpQp3FieoDgNvL63kZi8N9Wj2HuG4uS9VoF5
	 BoTBX1rqskbaw6x7d974T19FYdak4Qahkh+eO+RZUT5jKsmWPIAPytqdLdWwnaEkH6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KSznfNbj;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF32606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 07:45:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CF32606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KSznfNbj
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b44bdcea8aso609572a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 23:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795333558; x=1795938358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mJ1uV0nElB+ZuXOREmohOqblGnYAv6C9rlmGAxRkS6c=;
        b=KSznfNbjQEdIwCRDjvqUJVj8AWWKkclnfCt/nxKxboMQxFLd5bU0xjpbjJtwi0Hj+C
         VvbXZLFMx0xo2Up2ZVtkJDs22xIaedi7P5Yo5sltOITaT4Os7/8YfGmFSGQ7xNCmbQwY
         I8h8jAXj2PJcspFlWfnyrGSDI4ulSZiWSQrHlEchUDdJD9LlgSkt9acxqSQguQgi5Wfl
         I73kzACl8dCad46JN8471fVV//x08ajMaFEyGK1A0xtyiIQR7HfX5Wu8/LPvw+qTgatP
         /Pz0QsI6b8lboDGj2gFkCziF1rr6HncaiZO9OJgbVMHrZ6eDRL/a40fLCGc859LUCXkR
         kG/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795333558; x=1795938358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mJ1uV0nElB+ZuXOREmohOqblGnYAv6C9rlmGAxRkS6c=;
        b=Qh7uPtqXSr5IPtIvDLZE5DRBDxWHe57zlj3D1axIX7koExeb5mFxv4wLXdyadUyQjf
         hYvlVSDaLVwo6f0XARBIWhnF0TEP72Ok6BnpGq5oMJCqYEKM1TBCDfX1VYVu3e/wQtLj
         ukDhPr59I/jDSiLMeQ85w73H7IeqCoPH9HqK1nMy8BI5m4zO3CfVS2sRLDIGLFnThr7I
         jGO7xGp62/xQpGNm2AyLubiyE1mNVy7TKjOlGflHtwX6xJl5SnyzZM7J4mgJwPcIE3ts
         kGvf6Fsix7g3iDmy7AU9FQOo2w0eQrsuBuidtfkFOM5vezs6YcPprpTDjdq8IUmnd4y4
         F/4w==
X-Forwarded-Encrypted: i=1; AL+hErGECx5Xo/Z2tetf8Y3yGrcfIcrLxQPGAnffRd+YGsWBxWxa9DYEFPl8/C42YtavaQISCOINj+Kob8jglkE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sVteA8Gbj+9Nb3gvTdR5gdW75dWJRVjbvwfjT6/496BNvDMmR
	eDjDcbVtATtG1BnyMpoDX44+EeB4qa1HAvwen4Pf0W2jBEfuiAPoXMyl
X-Gm-Gg: AZFdTZdD1pvlDxs1gP71ZMCPNznS7s6gkTEgo66MbhCA881o4aTebtC/pwQxH1DzuJ4
	WnmcR0qN/EQtyiF1DYAs77KbbP0RpXtBaK9d8HHHp9h3yBZXV0mhJ8c1To3zmE7+kyD/wk7Vtfk
	4SjI3b3osuWFW85EcKsbfz61pZSnHx/ntBXLSgY0N/EAbKUWg8OxRt3YybdBfkNrocrR4IUfxep
	1AFeUexN7Vu8WQlnZCckmOSdfNHsdi0+p1a2A9P6GbIaRN+ifQbCQYXvZ5FS4yUGrE4FBPnYDJZ
	tjqIQYamf/XeCsmH30FEeaRQOlwnrIR2fkRw9sDBK5p5MQQ9deJtqq+PMZ4pyxhqDoyZVEm0Rg0
	C+xoZmPKUF/CjR5ChNdmHiqEeCHnq7p34I23pF4ogQa7NqKF64A4fLzEyDt4P2Oa8Eug+SvhAQA
	QlLWyYOHLBMHY3s1lfT6VKL2yzRKpGu56iI+8aJOXRXAgfmvTm7KzG1h9gMw7SusG/WE+GRVuvV
	eaRC8fWkI35p6KBhdOAsASQGetmXeTHcG9M33YpDIiWbIPy/Y1wpLFfDj0m5iPaEK+tzbsNL41S
	im5lc1ze0vTJruhhWozM6krNSPzQ+td39461zBxexAXuHe7AIDERiTL8RZv8nge/WbsczqP/ag=
	=
X-Received: by 2002:a17:90a:e710:b0:39e:6c68:fd91 with SMTP id 98e67ed59e1d1-3b41c96151cmr5449533a91.38.1795333558425;
        Sat, 21 Nov 2026 23:45:58 -0800 (PST)
Received: from X.tail7c3ebe.ts.net ([103.190.40.238])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcfe23sm11665150a91.15.2026.11.21.23.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 23:45:57 -0800 (PST)
From: Avishek Chaulagain <chaulagainavishek14@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Abhishek Chaulagain <chaulagainavishek14@gmail.com>
Subject: [PATCH] media: atomisp: Remove unused ISP vmem load/store functions
Date: Sun, 22 Nov 2026 07:45:52 +0000
Message-ID: <20261122074552.545-1-chaulagainavishek14@gmail.com>
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

From: Abhishek Chaulagain <chaulagainavishek14@gmail.com>

isp_vmem_load(), isp_vmem_store(), isp_vmem_2d_load() and
isp_vmem_2d_store() are the only external functions provided by
vmem.c, and none of them has a caller anywhere in the tree. Every
other function in the file (load_vector()/store_vector() and the
hive_sim_wide pack/unpack helpers) exists solely to implement those
four, so the whole translation unit is dead.

Remove vmem.c along with its Makefile entry and the four prototypes
in vmem_local.h. The t_vmem_elem/t_svmem_elem typedefs and the
VMEM_ARRAY/SVMEM_ARRAY macros in that header are used elsewhere and
are kept.

Signed-off-by: Abhishek Chaulagain <chaulagainavishek14@gmail.com>
---
 drivers/staging/media/atomisp/Makefile        |   1 -
 .../pci/hive_isp_css_common/host/vmem.c       | 275 ------------------
 .../pci/hive_isp_css_common/host/vmem_local.h |  32 --
 3 files changed, 308 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c

diff --git a/drivers/staging/media/atomisp/Makefile b/drivers/staging/media/atomisp/Makefile
index 1d0fbe220..3b2dad720 100644
--- a/drivers/staging/media/atomisp/Makefile
+++ b/drivers/staging/media/atomisp/Makefile
@@ -146,7 +146,6 @@ atomisp-objs += \
 	pci/hive_isp_css_common/host/mmu.o \
 	pci/hive_isp_css_common/host/sp.o \
 	pci/hive_isp_css_common/host/timed_ctrl.o \
-	pci/hive_isp_css_common/host/vmem.o \
 	pci/hive_isp_css_shared/host/tag.o \
 	pci/system_local.o \
 	pci/runtime/isys/src/ibuf_ctrl_rmgr.o \
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
deleted file mode 100644
index 1c5c50406..000000000
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
+++ /dev/null
@@ -1,275 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Support for Intel Camera Imaging ISP subsystem.
- * Copyright (c) 2010 - 2016, Intel Corporation.
- */
-
-#include "isp.h"
-#include "vmem.h"
-#include "vmem_local.h"
-
-#if !defined(HRT_MEMORY_ACCESS)
-#include "ia_css_device_access.h"
-#endif
-#include "assert_support.h"
-
-typedef unsigned long long hive_uedge;
-typedef hive_uedge *hive_wide;
-
-/* Copied from SDK: sim_semantics.c */
-
-/* subword bits move like this:         MSB[____xxxx____]LSB -> MSB[00000000xxxx]LSB */
-static inline hive_uedge
-subword(hive_uedge w, unsigned int start, unsigned int end)
-{
-	return (w & (((1ULL << (end - 1)) - 1) << 1 | 1)) >> start;
-}
-
-/* inverse subword bits move like this: MSB[xxxx____xxxx]LSB -> MSB[xxxx0000xxxx]LSB */
-static inline hive_uedge
-inv_subword(hive_uedge w, unsigned int start, unsigned int end)
-{
-	return w & (~(((1ULL << (end - 1)) - 1) << 1 | 1) | ((1ULL << start) - 1));
-}
-
-#define uedge_bits (8 * sizeof(hive_uedge))
-#define move_lower_bits(target, target_bit, src, src_bit) move_subword(target, target_bit, src, 0, src_bit)
-#define move_upper_bits(target, target_bit, src, src_bit) move_subword(target, target_bit, src, src_bit, uedge_bits)
-#define move_word(target, target_bit, src) move_subword(target, target_bit, src, 0, uedge_bits)
-
-static void
-move_subword(
-    hive_uedge *target,
-    unsigned int target_bit,
-    hive_uedge src,
-    unsigned int src_start,
-    unsigned int src_end)
-{
-	unsigned int start_elem = target_bit / uedge_bits;
-	unsigned int start_bit  = target_bit % uedge_bits;
-	unsigned int subword_width = src_end - src_start;
-
-	hive_uedge src_subword = subword(src, src_start, src_end);
-
-	if (subword_width + start_bit > uedge_bits) { /* overlap */
-		hive_uedge old_val1;
-		hive_uedge old_val0 = inv_subword(target[start_elem], start_bit, uedge_bits);
-
-		target[start_elem] = old_val0 | (src_subword << start_bit);
-		old_val1 = inv_subword(target[start_elem + 1], 0,
-				       subword_width + start_bit - uedge_bits);
-		target[start_elem + 1] = old_val1 | (src_subword >> (uedge_bits - start_bit));
-	} else {
-		hive_uedge old_val = inv_subword(target[start_elem], start_bit,
-						 start_bit + subword_width);
-
-		target[start_elem] = old_val | (src_subword << start_bit);
-	}
-}
-
-static void
-hive_sim_wide_unpack(
-    hive_wide vector,
-    hive_wide elem,
-    hive_uint elem_bits,
-    hive_uint index)
-{
-	/* pointers into wide_type: */
-	unsigned int start_elem = (elem_bits * index) / uedge_bits;
-	unsigned int start_bit  = (elem_bits * index) % uedge_bits;
-	unsigned int end_elem   = (elem_bits * (index + 1) - 1) / uedge_bits;
-	unsigned int end_bit    = ((elem_bits * (index + 1) - 1) % uedge_bits) + 1;
-
-	if (elem_bits == uedge_bits) {
-		/* easy case for speedup: */
-		elem[0] = vector[index];
-	} else if (start_elem == end_elem) {
-		/* only one (<=64 bits) element needs to be (partly) copied: */
-		move_subword(elem, 0, vector[start_elem], start_bit, end_bit);
-	} else {
-		/* general case: handles edge spanning cases (includes >64bit elements) */
-		unsigned int bits_written = 0;
-		unsigned int i;
-
-		move_upper_bits(elem, bits_written, vector[start_elem], start_bit);
-		bits_written += (64 - start_bit);
-		for (i = start_elem + 1; i < end_elem; i++) {
-			move_word(elem, bits_written, vector[i]);
-			bits_written += uedge_bits;
-		}
-		move_lower_bits(elem, bits_written, vector[end_elem], end_bit);
-	}
-}
-
-static void
-hive_sim_wide_pack(
-    hive_wide vector,
-    hive_wide elem,
-    hive_uint elem_bits,
-    hive_uint index)
-{
-	/* pointers into wide_type: */
-	unsigned int start_elem = (elem_bits * index) / uedge_bits;
-
-	/* easy case for speedup: */
-	if (elem_bits == uedge_bits) {
-		vector[start_elem] = elem[0];
-	} else if (elem_bits > uedge_bits) {
-		unsigned int bits_to_write = elem_bits;
-		unsigned int start_bit = elem_bits * index;
-		unsigned int i = 0;
-
-		for (; bits_to_write > uedge_bits;
-		     bits_to_write -= uedge_bits, i++, start_bit += uedge_bits) {
-			move_word(vector, start_bit, elem[i]);
-		}
-		move_lower_bits(vector, start_bit, elem[i], bits_to_write);
-	} else {
-		/* only one element needs to be (partly) copied: */
-		move_lower_bits(vector, elem_bits * index, elem[0], elem_bits);
-	}
-}
-
-static void load_vector(
-    const isp_ID_t		ID,
-    t_vmem_elem		*to,
-    const t_vmem_elem	*from)
-{
-	unsigned int i;
-	hive_uedge *data;
-	unsigned int size = sizeof(short) * ISP_NWAY;
-
-	VMEM_ARRAY(v, 2 * ISP_NWAY); /* Need 2 vectors to work around vmem hss bug */
-	assert(ISP_BAMEM_BASE[ID] != (hrt_address) - 1);
-#if !defined(HRT_MEMORY_ACCESS)
-	ia_css_device_load(ISP_BAMEM_BASE[ID] + (unsigned long)from, &v[0][0], size);
-#else
-	hrt_master_port_load(ISP_BAMEM_BASE[ID] + (unsigned long)from, &v[0][0], size);
-#endif
-	data = (hive_uedge *)v;
-	for (i = 0; i < ISP_NWAY; i++) {
-		hive_uedge elem = 0;
-
-		hive_sim_wide_unpack(data, &elem, ISP_VEC_ELEMBITS, i);
-		to[i] = elem;
-	}
-	udelay(1); /* Spend at least 1 cycles per vector */
-}
-
-static void store_vector(
-    const isp_ID_t		ID,
-    t_vmem_elem		*to,
-    const t_vmem_elem	*from)
-{
-	unsigned int i;
-	unsigned int size = sizeof(short) * ISP_NWAY;
-
-	VMEM_ARRAY(v, 2 * ISP_NWAY); /* Need 2 vectors to work around vmem hss bug */
-	//load_vector (&v[1][0], &to[ISP_NWAY]); /* Fetch the next vector, since it will be overwritten. */
-	hive_uedge *data = (hive_uedge *)v;
-
-	for (i = 0; i < ISP_NWAY; i++)
-		hive_sim_wide_pack(data, (hive_wide)&from[i], ISP_VEC_ELEMBITS, i);
-
-	assert(ISP_BAMEM_BASE[ID] != (hrt_address) - 1);
-#if !defined(HRT_MEMORY_ACCESS)
-	ia_css_device_store(ISP_BAMEM_BASE[ID] + (unsigned long)to, &v, size);
-#else
-	//hrt_mem_store (ISP, VMEM, (unsigned)to, &v, siz); /* This will overwrite the next vector as well */
-	hrt_master_port_store(ISP_BAMEM_BASE[ID] + (unsigned long)to, &v, size);
-#endif
-	udelay(1); /* Spend at least 1 cycles per vector */
-}
-
-void isp_vmem_load(
-    const isp_ID_t		ID,
-    const t_vmem_elem	*from,
-    t_vmem_elem		*to,
-    unsigned int elems) /* In t_vmem_elem */
-{
-	unsigned int c;
-	const t_vmem_elem *vp = from;
-
-	assert(ID < N_ISP_ID);
-	assert((unsigned long)from % ISP_VEC_ALIGN == 0);
-	assert(elems % ISP_NWAY == 0);
-	for (c = 0; c < elems; c += ISP_NWAY) {
-		load_vector(ID, &to[c], vp);
-		vp = (t_vmem_elem *)((char *)vp + ISP_VEC_ALIGN);
-	}
-}
-
-void isp_vmem_store(
-    const isp_ID_t		ID,
-    t_vmem_elem		*to,
-    const t_vmem_elem	*from,
-    unsigned int elems) /* In t_vmem_elem */
-{
-	unsigned int c;
-	t_vmem_elem *vp = to;
-
-	assert(ID < N_ISP_ID);
-	assert((unsigned long)to % ISP_VEC_ALIGN == 0);
-	assert(elems % ISP_NWAY == 0);
-	for (c = 0; c < elems; c += ISP_NWAY) {
-		store_vector(ID, vp, &from[c]);
-		vp = (t_vmem_elem *)((char *)vp + ISP_VEC_ALIGN);
-	}
-}
-
-void isp_vmem_2d_load(
-    const isp_ID_t		ID,
-    const t_vmem_elem	*from,
-    t_vmem_elem		*to,
-    unsigned int height,
-    unsigned int width,
-    unsigned int stride_to,  /* In t_vmem_elem */
-
-    unsigned stride_from /* In t_vmem_elem */)
-{
-	unsigned int h;
-
-	assert(ID < N_ISP_ID);
-	assert((unsigned long)from % ISP_VEC_ALIGN == 0);
-	assert(width % ISP_NWAY == 0);
-	assert(stride_from % ISP_NWAY == 0);
-	for (h = 0; h < height; h++) {
-		unsigned int c;
-		const t_vmem_elem *vp = from;
-
-		for (c = 0; c < width; c += ISP_NWAY) {
-			load_vector(ID, &to[stride_to * h + c], vp);
-			vp = (t_vmem_elem *)((char *)vp + ISP_VEC_ALIGN);
-		}
-		from = (const t_vmem_elem *)((const char *)from + stride_from / ISP_NWAY *
-					     ISP_VEC_ALIGN);
-	}
-}
-
-void isp_vmem_2d_store(
-    const isp_ID_t		ID,
-    t_vmem_elem		*to,
-    const t_vmem_elem	*from,
-    unsigned int height,
-    unsigned int width,
-    unsigned int stride_to,  /* In t_vmem_elem */
-
-    unsigned stride_from /* In t_vmem_elem */)
-{
-	unsigned int h;
-
-	assert(ID < N_ISP_ID);
-	assert((unsigned long)to % ISP_VEC_ALIGN == 0);
-	assert(width % ISP_NWAY == 0);
-	assert(stride_to % ISP_NWAY == 0);
-	for (h = 0; h < height; h++) {
-		unsigned int c;
-		t_vmem_elem *vp = to;
-
-		for (c = 0; c < width; c += ISP_NWAY) {
-			store_vector(ID, vp, &from[stride_from * h + c]);
-			vp = (t_vmem_elem *)((char *)vp + ISP_VEC_ALIGN);
-		}
-		to = (t_vmem_elem *)((char *)to + stride_to / ISP_NWAY * ISP_VEC_ALIGN);
-	}
-}
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem_local.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem_local.h
index 0163d31cd..3af34c9bd 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem_local.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem_local.h
@@ -16,36 +16,4 @@ typedef s16 t_svmem_elem;
 #define VMEM_ARRAY(x, s)	t_vmem_elem x[(s) / ISP_NWAY][ISP_NWAY]
 #define SVMEM_ARRAY(x, s)	t_svmem_elem x[(s) / ISP_NWAY][ISP_NWAY]
 
-void isp_vmem_load(
-    const isp_ID_t		ID,
-    const t_vmem_elem	*from,
-    t_vmem_elem		*to,
-    unsigned int elems); /* In t_vmem_elem */
-
-void isp_vmem_store(
-    const isp_ID_t		ID,
-    t_vmem_elem		*to,
-    const t_vmem_elem	*from,
-    unsigned int elems); /* In t_vmem_elem */
-
-void isp_vmem_2d_load(
-    const isp_ID_t		ID,
-    const t_vmem_elem	*from,
-    t_vmem_elem		*to,
-    unsigned int height,
-    unsigned int width,
-    unsigned int stride_to,  /* In t_vmem_elem */
-
-    unsigned		stride_from /* In t_vmem_elem */);
-
-void isp_vmem_2d_store(
-    const isp_ID_t		ID,
-    t_vmem_elem		*to,
-    const t_vmem_elem	*from,
-    unsigned int height,
-    unsigned int width,
-    unsigned int stride_to,  /* In t_vmem_elem */
-
-    unsigned		stride_from /* In t_vmem_elem */);
-
 #endif /* __VMEM_LOCAL_H_INCLUDED__ */
-- 
2.43.0

