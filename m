Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795719100;
	b=kkh/moJh2alRFyI2IWOHyZrGP+nTqefXXwToDcYRx7qN3NzaoGGJkVuR/Db4BbSxyghI
	 Ks2LsFY2TFBAvjEeva2HOLr9fKcD5OL2F7o9JF4nblS9rGF1KKRh53VLvOD0CL1HcLceH
	 yldeN8s3H4at8+BLfraHkYk59roIr13rFu9VjQ4mfgJP2nAbUhpkvu50FTprx+cR1WIyL
	 6+9HfSLGUd5Cie9EewEukmnm65pS4jMFC3uEnzdbOmWoIZWuyORcV2DL1qoOR2rRqE7bY
	 UMl8F1APS0H/7Bg3iHZhRquARkQep92bVZmFIjG3JhhohxyEL4lJq85HlAbbNI+KQ9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795719100;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mrLEC/tUIlpyHMdC0wLVawPYUHVLQLEsP0xd9iCsuyc=;
	b=OgCR730zWv9eX/fLc3DlUow5Ll+1On9JkWoPWup/p4hf30sDo8aHqHIbhWCNFEFTVT7Y
	 FFD8FQJrfIEufb53ss8cYgG9c0XK7oPsReXZo1zfHQbAbqFWdSMnUkVD5MtdhPQJLy41U
	 hq9jetyYo5pCr2CE9oTS32JBDMdJvNi6SnIDIAkjda5allQE+c26nhtljijFPMKsGFszi
	 CXR8yZlUNW0f1W5XwQVHhpKuutXsouCSJMs2zNUj7XU4cQIAhlPnOdUYBz7Jr9QIG4Djy
	 +G78kf5gQc4ZvWp784i3kaCJ88NBX7zdlInnBJSw5plLJ3ekGqfXeFWB21t4Uq9Egxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ObkL2qbT;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996C1606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:51:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 996C1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ObkL2qbT
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2f0213202fdso38559515ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795719100; x=1796323900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mrLEC/tUIlpyHMdC0wLVawPYUHVLQLEsP0xd9iCsuyc=;
        b=ObkL2qbTe/5xyBmIa8coAb4dYmGpyfsJhnyDvYJxxH4C+CfBiYEc0AuUz6sA/FFL2m
         guqTp5UTz5BSfEO4tvp5twtepg61EokoZYWKQgBNenH7QbVR42WFt9FtA3ObJV54An+7
         V+d6WCgH3oCM0fAFu6Gt63R/hgD45n17jUZeNTvQG66mrG9eRl/iOVz8iSbWIH+3daoh
         VC5eqSDs5hUjqnVmZtj5uXXtC7PAgiu+S/bBEhUzsvvYrH3C4/zbCybbO5gLw8Q6MFIR
         4LKkbzwlYmVRlH9wLrzI01jZaHnLyK49YrCHd1wn1m+BkiPdyIriQ14PwLwuCEG3flLW
         Tv8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795719100; x=1796323900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mrLEC/tUIlpyHMdC0wLVawPYUHVLQLEsP0xd9iCsuyc=;
        b=SZYN9FQzgn6Q0QA7hnryXFvb1/p3l5eVTcYa0QDN757f2G48kd8bdR7JLhLHr5B+Vh
         DoLHAysJEWf5h7lc4ATie0samzmnTa+QtFaBnJbHnluNCMHUg+ExjkE7YzzgxnlJRoQf
         ksoE3lX1+ZuKupIjyIELpmRirchRQGzirtEhw+fRuNrZGom+YImbidWyDLYLM8VtAOhf
         F5+pDEC9WeBlOwilqT4k4KvOj8QlywF0mlE1aSCJQ7C5YTl6yOeRNQtBaqynhpSUUJdx
         3pb8D7k/18jcy3e+gMp0Nw8jxHK9b26ST+XwTcpDJvB6LEJq/3atGEL3DRq2yLdvbKGI
         6XMQ==
X-Forwarded-Encrypted: i=1; AL+hErE6Bf8FkjxzVycd1kCEnScN3lugyRo8hWITnTUmavqOvQWQdTbUmSGcgiZyS8dJEVhhQC1ypGsQr0K8Apw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Bgx+dquxK/gJCUOK/X1/L0f3yFqpHsbMv1zOTiDbyqpGzA++5
	RIallJQheblod4SFnZAPLoIBBSHLpNLR0cCguUzAvX1RQp2ReFh04Kys+AA+rw==
X-Gm-Gg: AZFdTZf7iYGd8oz5Tv9rse9Y5J6j7m44v3gXtK2vVOYEcBr8tBAir/ot417AeHqCSiS
	H99dPq3aNbDmQnSQA47yIVOANLhOdVR78ZficsQBSuTsE0/4svLETpcBekj/RRtYNHZ4CwlPMsj
	e6jPpxtILCyyAvAlUJztlBJxHOZ9boLxKAQabQZi6POePa1ICymhghXvkFCzujrVs3Snqo+NpDJ
	Xz2TO72hnuvRUoXE6tdMDPuYfu/2PwsbVzxu1WdMr5/pwI2VxztRpkC1nXoBsyoPxTO7TA7ZZjJ
	q02F3qR0WDB7YRk7s6InrKxCzmP4qkABcA297X2KoatTjLDgORTuLAQTShXus2grvDpqNWhL4Bj
	FJIJRBPXhSkmBwwQ+62GSSKgJsg934nM4ZksgSQo82uFBL4vMZk+uE6R2Bkek8KLPThDNDU+rac
	OMf4Ed+uOMrUxYdlEpXQWT7QWHwbqGUszjbdO5EgVd3lTmT85i02verSHIHa975wlBHEwXg/sYK
	o9uIcriY5GfMFYkIhmbK8I3LEtKCTCXbDazYJWrDelIKSTwa3cL1/f/bBLSnMV93Qeo/xzyrP+2
	aKc/kqDBdrxklwqPVu0GFqxN3pDJR4RuDKUYSpRpxVPu1SX9YD40lvV5fqkKC33rNOwCOrqxQfy
	0rZqNK1ZgqXd7N+VsCICtJI0=
X-Received: by 2002:a17:903:32ce:b0:2e9:7ff5:5459 with SMTP id d9443c01a7336-2f03f17d17amr238824525ad.15.1795719099914;
        Thu, 26 Nov 2026 10:51:39 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1276c5sm112041665ad.67.2026.11.26.10.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:51:39 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: geert@linux-m68k.org,
	tglx@kernel.org
Cc: radu@rendec.net,
	marscheng@google.com,
	eleanor15x@gmail.com,
	jserv@ccns.ncku.edu.tw,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH v2 2/7] irqchip/goldfish-pic: Use for_each_set_bit() to iterate pending IRQ
Date: Thu, 26 Nov 2026 18:51:15 +0000
Message-ID: <20261126185120.3815699-3-visitorckw@gmail.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
In-Reply-To: <20261126185120.3815699-1-visitorckw@gmail.com>
References: <20261126185120.3815699-1-visitorckw@gmail.com>
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

Use for_each_set_bit() instead of open-coding the loop with __fls()
in goldfish_pic_cascade() to simplify the code.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/irqchip/irq-goldfish-pic.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-goldfish-pic.c b/drivers/irqchip/irq-goldfish-pic.c
index c3c33f066140..12113ca90872 100644
--- a/drivers/irqchip/irq-goldfish-pic.c
+++ b/drivers/irqchip/irq-goldfish-pic.c
@@ -7,6 +7,7 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/bitops.h>
 #include <linux/goldfish.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
@@ -35,16 +36,14 @@ static void goldfish_pic_cascade(struct irq_desc *desc)
 {
 	struct goldfish_pic_data *gfpic = irq_desc_get_handler_data(desc);
 	struct irq_chip *host_chip = irq_desc_get_chip(desc);
-	u32 pending, hwirq;
+	unsigned long pending;
+	u32 hwirq;
 
 	chained_irq_enter(host_chip, desc);
 
 	pending = gf_ioread32(gfpic->base + GFPIC_REG_IRQ_PENDING);
-	while (pending) {
-		hwirq = __fls(pending);
+	for_each_set_bit(hwirq, &pending, GFPIC_NR_IRQS)
 		generic_handle_domain_irq(gfpic->irq_domain, hwirq);
-		pending &= ~(1 << hwirq);
-	}
 
 	chained_irq_exit(host_chip, desc);
 }
-- 
2.56.1.839.g22a8290db9-goog

