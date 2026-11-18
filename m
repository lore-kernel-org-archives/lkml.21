Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794993961;
	b=3EoRhs4Oed9DT8u30tJaEeTh1ivKnSoaVB9Bba9KQo0ws/4y+ymh1vG3SX2lO+AFZ05Y
	 UcshtpadVa/7l8hMo+a47J0CWFz4ctFSios6ihg1JN2IxUQj5WMW7B1N9acy67yUp2UdD
	 nWspTJbMylYhGZdwrREizqB1xjsoXDq0texigX4sR2Copc33FzDLYtRbl4RMMZea+3R1L
	 lO3S4G6InICbq1/YWcc0Z+rIQ3GndUGwqOiz4rgVPutic0M5HL2221cnrXX2hJY0uyUCZ
	 nAJdQQWHJqHbO0ul9h8+13Cxak8/xkqe80wK3hDb2oHIv3NSqQgXnh8UWtRA0lCNPJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794993961;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=Q66aCCscU5Yksj+Gr2Pi64F85rArI19ScQvw2zYlBHs=;
	b=ermdcC4pp8Ds5ewTTauOg+uLAIFwh2jpkPp9FGbm1zKd1C1pe2+cxArkGb+WL9zLNyf/
	 WzTuh4gO8jPuuhDImaX+MNbOAF4FAQ6EBFkfxRkujGF0p1BlWJvakYvipK3WHmMY5GYJP
	 cXTlKzxfQUncjan2tpifB+vrombPvAFti7YV0qSrslkY3/R6002uO280vdfodrhHAXFlq
	 bke4H7bQIMonRQxZXwKaU6d0WSXAS6yefAH9oKay7pG9xjoQqjb93QLf7M+YOHk1Hjq2+
	 h0S6DgLkLfJYSNVClJmV6jAHRSGwSJ/LFrll8MUBKtfkxK6NDFGpp0eKQeoOaX4D7/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=ERZi93EE;
	arc=none smtp.remote-ip=117.135.210.3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A283606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:25:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A283606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=ERZi93EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Q6
	6aCCscU5Yksj+Gr2Pi64F85rArI19ScQvw2zYlBHs=; b=ERZi93EEr2Qhe3LF5W
	tAxY+BpQqrfLErwK7Oa+WakT4Kh4zRG24kUyCTYnZOKhWpLZDbcB1Pqz5+5lDy0r
	EYaxsPIxbhfPU6QGvaFVoQo2Lb10O/7lprGsA+rNKWEECZyBPC8yTYuUpG+TQPFA
	6HzZ8oWxDz2ZvNIFlpDP0Cmak=
Received: from localhost.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgDXlI0Gb_1qJaCyGg--.56752S2;
	Wed, 18 Nov 2026 17:25:28 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: ojeda@kernel.org,
	andy@kernel.org,
	geert@linux-m68k.org,
	maxextreme@gmail.com,
	pmarques@grupopie.com,
	akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	Haoxiang Li <haoxiang_li2024@163.com>
Subject: [PATCH v2] auxdisplay: cfag12864bfb: Fix init cleanup and simplify error paths
Date: Wed, 18 Nov 2026 17:25:26 +0800
Message-Id: <20261118092526.2210410-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
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
X-CM-TRANSID:PygvCgDXlI0Gb_1qJaCyGg--.56752S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJFW8tryxtF4UKryfCw4UArb_yoW5GFyUpa
	nxta45ArW5GF47KrWSyr12vFy5GryIgayFkFyDGw109w4IkF48WayrtF15XrnrJrWrG3W3
	tFy3Gr48CFWUZrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEJPE7UUUUU=
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbC7gj3Zmr9bwi62wAA3m

If initialization fails after cfag12864b_enable() succeeds, LCD
refreshing remains enabled. A subsequent attempt to load the
framebuffer module can fail because refreshing is still marked
as in use.

Use platform_device_register_full() to simplify device registration
and its error handling. Unregister the platform driver if device
registration fails, and call cfag12864b_disable() on all failure
paths after refreshing has been enabled.

Fixes: 70e840499aae ("[PATCH] drivers: add LCD support")
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
Changes in v2:
 - Use platform_device_register_full() to simplify code. Thanks, Andy!
 - Modify the commit message.
---
 drivers/auxdisplay/cfag12864bfb.c | 34 +++++++++++++++++--------------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/drivers/auxdisplay/cfag12864bfb.c b/drivers/auxdisplay/cfag12864bfb.c
index 24baf6b2c587..b1fe462715d6 100644
--- a/drivers/auxdisplay/cfag12864bfb.c
+++ b/drivers/auxdisplay/cfag12864bfb.c
@@ -13,6 +13,7 @@
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
+#include <linux/err.h>
 #include <linux/fb.h>
 #include <linux/mm.h>
 #include <linux/platform_device.h>
@@ -118,13 +119,17 @@ static struct platform_device *cfag12864bfb_device;
 
 static int __init cfag12864bfb_init(void)
 {
-	int ret = -EINVAL;
+	const struct platform_device_info pdevinfo = {
+		.name = CFAG12864BFB_NAME,
+		.id = 0,
+	};
+	int ret;
 
 	/* cfag12864b_init() must be called first */
 	if (!cfag12864b_isinited()) {
 		printk(KERN_ERR CFAG12864BFB_NAME ": ERROR: "
 			"cfag12864b is not initialized\n");
-		goto none;
+		return -EINVAL;
 	}
 
 	if (cfag12864b_enable()) {
@@ -134,23 +139,22 @@ static int __init cfag12864bfb_init(void)
 	}
 
 	ret = platform_driver_register(&cfag12864bfb_driver);
+	if (ret)
+		goto err_disable;
 
-	if (!ret) {
-		cfag12864bfb_device =
-			platform_device_alloc(CFAG12864BFB_NAME, 0);
+	cfag12864bfb_device = platform_device_register_full(&pdevinfo);
+	if (IS_ERR(cfag12864bfb_device)) {
+		ret = PTR_ERR(cfag12864bfb_device);
+		goto err_unregister_driver;
+	}
 
-		if (cfag12864bfb_device)
-			ret = platform_device_add(cfag12864bfb_device);
-		else
-			ret = -ENOMEM;
+	return 0;
 
-		if (ret) {
-			platform_device_put(cfag12864bfb_device);
-			platform_driver_unregister(&cfag12864bfb_driver);
-		}
-	}
+err_unregister_driver:
+	platform_driver_unregister(&cfag12864bfb_driver);
 
-none:
+err_disable:
+	cfag12864b_disable();
 	return ret;
 }
 
-- 
2.25.1

