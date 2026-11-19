Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795061660;
	b=VW1iOdYSCAFSROqoRqp4PFIF6xmSp2YVpRyk5cMk97quTqFQHhcsYORIVEaUBOiR+e29
	 0XLmGT4s1WPMVpjWGAwn0oKIFVugc89m8IbrhOoSEL1xAptiQyw8O4UmAJJVbwsZsZU3c
	 w4fibbfSUPJCkA4TCM/grk5F4EzOYj10l2GWtOvFRaqN/7UUnv400WOB9ALca0NlWMO5K
	 +ZdHcq5FJwoTV82GvcF3CUDf1lMGnjQTQ+2QjA7uybX+QDhrSyijLqE0O8DtePjFnBIi6
	 aMmr0h94KzEkVg/JJYsJGDCewXrgwgcJM2NtI0TzZ+QmV8p4qPEf5uHEw7LqtmO4gpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795061660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NiL1NT5qnEnqZDpOhZrlQYA5hzsUwLBbTeQ3CkP6SRs=;
	b=XqsQelX8KxhXzAopVKyESAEEUcv2mguMo5e/977P1VXJ8bex5/hX+Q2NfcaWSTtHjRnK
	 Cyggm04Y2csIStdWY2sjcwocL3Wu/s//6WC/XNM87BmXuW80DM58h34njRRpKi+uuPOo7
	 7LpkSz3qtCxbyNlS7KIOoDudHWhZIEUJ/FFHMSXzdPa0NN5cm6y05U78rnYeRm8+qj1M2
	 LvXdH7LBrXKke7/KalC2gNiZHpuTbTEuq3sHVDXjUIWXyRFTMSr68HUVu8KZG1hyV3S89
	 Kmv1P16bMJcQwmf9zVPtEPHJ44VC0nS5SgvphWhmoky/WmvLbsnzDiAizQpJUnQPm5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WMlpNaJm;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEF5606A332
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 04:14:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBEF5606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WMlpNaJm
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc751eddf25so1373216a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795061659; x=1795666459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NiL1NT5qnEnqZDpOhZrlQYA5hzsUwLBbTeQ3CkP6SRs=;
        b=WMlpNaJmFXpRMfqrSnoZUIAmOvP9iaDUxDKMqFRiHsa3qVqEipT2t/ciU6U+7q2EOe
         RT+PK4nousJqCxBSy/i+uPwlLse0iZHa2iC2YNkhFaLkLGisC+yk4FjLH6qnDXo9UedA
         ++yEdJtSZdfNjVOC+AvhyndkHTy/ppFjBY5Vo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795061659; x=1795666459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NiL1NT5qnEnqZDpOhZrlQYA5hzsUwLBbTeQ3CkP6SRs=;
        b=M5SLGWGIRkjj08gqGox1OViaMgnevJs3k+i/oj6+aWShoGKisqAro76DVPdYyOP80O
         tNg9WkfKD7B0o202mw/gmxq2KelgJDV+ninEO11t0ethH9DeW7J/GZgQUSdv4cQuEOmu
         wYvBbcK+guMMlDO8Ybbvq2Rssx/DXI8+qMJi7BG6DvgE1xYYenL1M+dbLvdtWQQhBSBp
         M+RK/llUcr7xSGYleYk56qN9WcCQ10KL2FOYWIw8QA8+5uGvkp6+aKJ8Jr0vqQKEPm9y
         RRiZyMY5rOm2TduNBlKlBsTIxU/DnWqpRDvPzbY4Mj5v4A/SAEHwg5Q1mZx8M5wsvNCR
         H+sg==
X-Forwarded-Encrypted: i=1; AL+hErFJF5+6e6rF4epl0oq3CxwkRvDuU4FzP+1eCSgEW5l1PAWmP7M/8fnKixBubHHPwzM4CBMsdSOB9LhS7BY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vV0e8k6yeRT/wpFcLGEZiUqCO+cCp87Qyi+GDxWV5NYANA9NI
	Yyl7jPHOX6tod924Tr8AQw7NR+4ACLW+nGBqzf2+HVNT6D18ukz1g9ix7jWUgKa6XK0PcTcx9dM
	ZJKI=
X-Gm-Gg: AZFdTZc27XMT8U834QPlX1BTMQ3/OdcqUsn7yhYQSq4T2ByfaPt1lwxKGm8dBIY2dHb
	fikd6erkknXlv1ACSl996yFJtuvwxK5Vu4ma26FrrNnJ4JYbGXUi96FlB/tpTuV2QLU/gmI8KtV
	PamrXhv4fmKpQkHSjLPLwStDBbcOodBFTzI4m7+dCOShXhB4lQ5ijWnXW5t8PuZqz44tqVmHoUS
	hai143rNVrMKDI9RIjZ04vqkE2X+1PedDLQTw5VhCemwd9z1+j6zD+HJYIzOAqnvAeVn3Dh3KWB
	wNfMpHTOVW4PLKv7mcuCQqj/a34di8XW3XoVS9FD7t3va8IErAWzcaabUgwYyreUDR8dFxQ1ogt
	6BzEjUexk9RnSQawS8qc9e8J4GhruxS70260WT8q2c6zlQdtsYtsHVysi/qMt2Dx41jtAe+7xwi
	rLwwIJwlD4k8XcO8qHyt7uvs7uAuhdUYOYVoPjAvMIkDbYf38cqNGs9oBgQJ3qssdD12r5xwPnL
	14cI0iK994fQie2WdXLuaydVRy5VhzBRkil5XJsa4gxAyingDIe5wikxKFiqeFt4fhsEwzaqvDu
	qqmC0KNt5CWJxss2kNBlKfeXPIv9uExSfYjnUjclVoIbyXhJL6G1APHrVRnFxaM5BKjbjloSqyn
	QbFkvz/DWRlOkBXBxhg==
X-Received: by 2002:a17:90b:5307:b0:3ab:884b:65a8 with SMTP id 98e67ed59e1d1-3b3d0761a5cmr4646684a91.26.1795061659189;
        Wed, 18 Nov 2026 20:14:19 -0800 (PST)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:9297:4989:4c44:dad6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40593719esm438795a91.13.2026.11.18.20.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 20:14:18 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Minchan Kim <minchan@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH 2/2] zram: use SPDX license identifier
Date: Thu, 19 Nov 2026 13:13:52 +0900
Message-ID: <80d88d3679dd0b67afe634562e1520aac6686a91.1795061575.git.senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
In-Reply-To: <39f6056e0c8834fc3eca2001fcb44f3b6048f74d.1795061575.git.senozhatsky@chromium.org>
References: <39f6056e0c8834fc3eca2001fcb44f3b6048f74d.1795061575.git.senozhatsky@chromium.org>
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

Replace the license text with the matching SPDX identifier,
(GPL-2.0-only OR BSD-3-Clause).  The copyright notices stay
as they are.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/block/zram/zram_drv.c | 8 +-------
 drivers/block/zram/zram_drv.h | 8 +-------
 2 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index 946b625761f8..90f06523bb8b 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -1,15 +1,9 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 /*
  * Compressed RAM block device
  *
  * Copyright (C) 2008, 2009, 2010  Nitin Gupta
  *               2012, 2013 Minchan Kim
- *
- * This code is released using a dual license strategy: BSD/GPL
- * You can choose the licence that better fits your requirements.
- *
- * Released under the terms of 3-clause BSD License
- * Released under the terms of GNU General Public License Version 2.0
- *
  */
 
 #define pr_fmt(fmt) "zram: " fmt
diff --git a/drivers/block/zram/zram_drv.h b/drivers/block/zram/zram_drv.h
index d64c99b74214..724f8ce6709b 100644
--- a/drivers/block/zram/zram_drv.h
+++ b/drivers/block/zram/zram_drv.h
@@ -1,15 +1,9 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
 /*
  * Compressed RAM block device
  *
  * Copyright (C) 2008, 2009, 2010  Nitin Gupta
  *               2012, 2013 Minchan Kim
- *
- * This code is released using a dual license strategy: BSD/GPL
- * You can choose the licence that better fits your requirements.
- *
- * Released under the terms of 3-clause BSD License
- * Released under the terms of GNU General Public License Version 2.0
- *
  */
 
 #ifndef _ZRAM_DRV_H_
-- 
2.56.1.708.g77570a6a1d-goog

