Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795782891;
	b=rMEr2IRJbyEvWZ651v2jwsL7pJEWe03T2kdRbaI7xOdsn6L9Ejt6gF/30YvdjQCjA3yE
	 LLXnLcD90zr6lmIcD6bjsXHeTajJrmGsWTc1gamcR6suh14o+dt8qy16w3MWoZZ0SZwKg
	 xd+eItAfNPjKOzXjtTH8PHzAO85CPUdi2Sct2Z+VeIqNB/thCZYjaILq7swM6P3X8CtU3
	 m0E3+Y+6ulgFPL2Z2tHIzaP4b/Zkaxm+6I4oKwZ7aWwBkxba7U2TvHtvE9cYvzlaCNlxO
	 I2uvxJDIGQOl0+W2at353uD27kbiZyIvI0yB7F1QbDNa1z4SzZmwjcqnIJ2K51tkWJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795782891;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ReptZUc4V2l1GFcHM1MI8g5CyAssfcev0pq0Ob8If/Y=;
	b=awTexrC0LISYZmyKmCfDHU8la4CHsZCBrusIVFZ0SiafU86HTuR57QZ/QfyjLyHAft5v
	 CjbvpHTcAt1wRX9rCHwZMAium4jVbYipCysXRM4I8rbxLyyeoimysZbYd5T4YFIZdBhSn
	 /vJNJkaBTQEqZfMMkJb9wZDHJl19LVpLfJip5AHBzegT4aASFGsd/Hpy2+Nw2VX/+IDoN
	 aX3sBtCmsvripVEaH47sW4d+ApGCrELz+zI0Yp26/2n77zfTVTksg+hAxq/zF53nMgPGs
	 kqdlMG9PgiPWt3upgy/zu6jtm+va0Ib4exU50Dpv5VwoxYQwIL2gBX+Z9wQrJhN+Mcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=let742wp;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DC5606A32F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:34:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8DC5606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=let742wp
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8a0880a46e7so4804362b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795782889; x=1796387689; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ReptZUc4V2l1GFcHM1MI8g5CyAssfcev0pq0Ob8If/Y=;
        b=let742wpcDgfOnXcOMM6MOkFvcK4OUFW9yT6bndSU8zBSrh9m7EhLYaiwV39Lo5cLW
         s0cw/VzzmIMaLlDx40tuBl+yyLn3kksCD+3R/i84dQB6zGPrJZGJvmaqDbTquNx6iASa
         g+8We2W/+CLce6bmDrD6Egn+6wQm06HlxD918jHwzmzOBDhH5b2rPvJu39YEMFy3DcE5
         lB4828IVsz48grxLR+D15tK6FFVnITUmA2TGbcxx0/DOVwp9dSdcLmWtkNuGP+jsxwVz
         kSVry0FvW9uiSl+VJmjiF39Er2oZHhS+yJced9qCyyovZNL6ZPHfGLCfm1oIO5sm3HEj
         KBhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795782889; x=1796387689;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ReptZUc4V2l1GFcHM1MI8g5CyAssfcev0pq0Ob8If/Y=;
        b=DkjMBK+O+WMZy3CcmyY0M1sAtYKeTarzLj3e5VnWJehHR8c/DF521jMBePf0nNhymz
         sYAEEdS5ONSPxNcUH+zrqvmxjpflZXFr5UeJOjiTthm3sCn2KOm67XWWp4TD/6Lmx1zf
         8eCngPCyNcIdLO13sfP9id2nvKo+bEVIYDDC9FElIKtyaIUUvtKarIlqvErOztlprltr
         f0hxltia70n+KR0JrI4OVpe1MpJec4HnBUJutTtHq9xcK2Dd6pn6niV39ey7A1mjJeza
         OgueVedftJoTl8JM8yv82I6IqNu+lZBXVKQ9h8Wu38RhGZudHvqIPnLTwGQCmN8v77ks
         WsQA==
X-Forwarded-Encrypted: i=1; AL+hErFSKBkRlzo3MlNp5XtXNyY2/LDnvGT1m0VJpE6kOO0/HgMnQuiKwGWUjOs8dYCg3U8PDvccijzjKDJX+2c=@vger.kernel.org
X-Gm-Message-State: APuU4Z9n5iV9+ecJ35Yqe+Zd3jQWheZqWhf+pdhdAMPqtgeNfdoKLvMh
	623G0SUEJXYRebK9HG7xs6S50Royj44nYoDPC2d/jqjg2Qqhf3ICrUkw
X-Gm-Gg: AZFdTZfqvS3ITRvhtLF2O2t5TrgNHxMsdWVguK6edmnWEJdmSpXOOTz8lntYgZ0GyMb
	tbdhdxYGAnpJho0jx+Mmav9v3xvH+TT8/wOLaJ5JLz4N5PpnG1rOWWVxPKaFN//GVZi4QiidvAt
	/39a6AjIiEObKvwiCqdm0cCZHAbJV11GKSRmUQ35i2/m5tiJWFNyUxqmQmREchYcIb8K4+O3l2H
	DLQlUV97Wev6GHtTLJSg3BbtaDKxAYF2eSMPbzQDP8Z+ZH8wJY3Gt8yCuxNFN+KLmNXRt8M8RtR
	0jN0C6VeGLAPybg+zELHAMDJ/WG7I3TDGB2UFcjcBAuGpriVeyBrWVkhNG4a8DM70vSXC3V9y8y
	sUNdT+blY88GBmtJOnXAedI6JOX86YrI4qEiJ4d6VLAuCIABHkd0lPFg0eX+9Jf7+pk7Yq3AOhk
	0XO2E4ue/D11UaBJd5l0d3e4/NRdXAByqJ0K5QFzYswpSillDH7D9AyqFhjADJLN02fiL6b642T
	QZ0EEgzK5OEWiQZkNOsbqjk0PC5E0cs/jBqgy5QMvRTTttlPXMiUwTCSK24XSWjef1yLdh7h6dB
	EV8F0kBIRwx0rul6FMo1rb6oq2/p586d8xycoy1jRvhqRtqF0QHhJ2eQ6IlqZOAi
X-Received: by 2002:a05:6a00:4a89:b0:8bd:5539:5984 with SMTP id d2e1a72fcca58-8c7dd9d6834mr12527922b3a.25.1795782889218;
        Fri, 27 Nov 2026 04:34:49 -0800 (PST)
Received: from [192.168.1.102] (59-127-145-64.hinet-ip.hinet.net. [59.127.145.64])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872951febsm12282669b3a.14.2026.11.27.04.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:34:48 -0800 (PST)
From: Zhi-Jun You <hujy652@gmail.com>
Date: Fri, 27 Nov 2026 20:34:35 +0800
Subject: [PATCH net v2] net: ethernet: mtk_wed: fix double free in
 mtk_wed_rx_reset
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-doublefree-v2-1-c0c6d3da3b52@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5XOTQ6CMBAF4KuQWVvTKT9GV97DsChlCjVATVuIh
 nB3aXXh1uWbzPtmVvDkDHm4ZCs4Wow3dtqDOGSgejl1xEy7ZxBcVIhYstbOzUDaETFV5LIirjg
 WZ9gLD0faPBN2g4kC1J+hn5s7qRCZuKadHVnoHckfmRdfmSV6QYaMtCxFLqoTF/rajdIMR2XHS
 PTGB+te6esF072/mXrbtjesSyyO/wAAAA==
X-Change-ID: 20261115-doublefree-c43a6e0c0149
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sujuan Chen <sujuan.chen@mediatek.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org, 
 Zhi-Jun You <hujy652@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795782889; l=2322;
 i=hujy652@gmail.com; s=20261123; h=from:subject:message-id;
 bh=RN2yLGJnyx5H7no7hudUjpQ4FMkUtmVh8Gq3EY48fGk=;
 b=9t/lmpz6QbAGKctOeVKWPpQPH1bvAJ5wQ4FMZxDbEoDdPv7wfjAmeh/TzUHRRG4+C+FIxuuW/
 AXqZ1kH9OjwDPoXIVJy8IAzDz/DB3X1yxqZZj1aEH1raasz9PmVXmWm
X-Developer-Key: i=hujy652@gmail.com; a=ed25519;
 pk=MXiVj6rTyQLjK+RN0A0WiriSkqHj/WJPKnbDVaSWdgU=

mtk_wed_free_rx_buffer already calls mtk_wed_hwrro_free_buffer but
mtk_wed_rx_reset calls both subsequently. This would cause double free
because dma_free_coherent doesn't set freed desc to NULL.

Fix this by setting dev->rx_buf_ring.desc, dev->hw_rro.page and
dev->hw_rro.desc to NULL after freeing so the NULL check can work.

Also remove the duplicated mtk_wed_hwrro_free_buffer call.

hwrro path is compile tested only because I don't own v3 hardware.

Fixes: 1543b8ff02f0 ("net: ethernet: mtk_wed: add wed 3.0 reset support")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/map/216156
Cc: stable@vger.kernel.org
Signed-off-by: Zhi-Jun You <hujy652@gmail.com>
---
Changes in v2:
- set dev->rx_buf_ring.desc, dev->hw_rro.page and dev->hw_rro.desc
  to NULL after freeing
- update commit message
- link to v1: https://patch.msgid.link/20261104-double-free-v1-1-efa52326702f@gmail.com
---
Hi Lorenzo, sorry I decided to update this patch instead of adding
another patch.
Hope this is okay.
---
 drivers/net/ethernet/mediatek/mtk_wed.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index 0bae25247798..0f215dd3d2d4 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -880,9 +880,11 @@ mtk_wed_hwrro_free_buffer(struct mtk_wed_device *dev)
 
 	dma_free_coherent(dev->hw->dev, dev->hw_rro.size * sizeof(*desc),
 			  desc, dev->hw_rro.desc_phys);
+	dev->hw_rro.desc = NULL;
 
 free_pagelist:
 	kfree(page_list);
+	dev->hw_rro.pages = NULL;
 }
 
 static void
@@ -896,6 +898,7 @@ mtk_wed_free_rx_buffer(struct mtk_wed_device *dev)
 	dev->wlan.release_rx_buf(dev);
 	dma_free_coherent(dev->hw->dev, dev->rx_buf_ring.size * sizeof(*desc),
 			  desc, dev->rx_buf_ring.desc_phys);
+	dev->rx_buf_ring.desc = NULL;
 
 	mtk_wed_hwrro_free_buffer(dev);
 }
@@ -1722,7 +1725,6 @@ mtk_wed_rx_reset(struct mtk_wed_device *dev)
 				   false);
 	}
 	mtk_wed_free_rx_buffer(dev);
-	mtk_wed_hwrro_free_buffer(dev);
 
 	return 0;
 }

---
base-commit: 28a371228d4eb4857cc31eeb1a0d7d01e9c3ea2f
change-id: 20261115-doublefree-c43a6e0c0149

Best regards,
--  
Zhi-Jun You <hujy652@gmail.com>

