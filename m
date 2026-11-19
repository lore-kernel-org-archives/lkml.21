Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795080738;
	b=NQzU6YFEJ1tg/mVckkuaQcxLEn+5UPp2k0XkgqDS+i6lbdtN+GM+vXHNpvNkhTRHZpNS
	 LS/aI87gzVbfOws+y/vsDGd8w9gJ+dwcY9Paw064hbQo46hn2cFQS7amdif8zUalC9In3
	 ylJ/gnYpcjyhsh+zc+AEXJxWNhivHoj1pP78ZpDtTGnkxqTkWy29hXn28JLpg37VkNtUJ
	 yzXQREHIReVsyDHLL0rUgVRbOHkUkirC2B9SALzvZJ2lMyq7P+OXOOxTCfiwqA2wyvxoX
	 DI9+d2r6g07biaJBfQe7/t7CKOs4j8dOKBCw6gZjhD51SwiTZ8iVBnp8IWEL4upjv5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795080738;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=bifGHgkFQw9WT1SU5l3hh3Xj/4QujZqZ5yvbaZoTz4g=;
	b=uCxAmIs9c6hRCbhI6eaSdOviSxrnn9YpT1QEZUHXVmOFA1HlBH/1fn21qeVdWTqSqyuL
	 LCGAvAT2eBxxekZ3vbuSbVz5h1olC9yNRTx19ikB7IUkdBfI7JpxyJRtNwPfysLyTwkWe
	 +lBxfdrALjBbl4x8jAlalp/OovOc+Go+6NAOOF7bW0vay+a47bBI6laVD/2r+hjYTBDv1
	 Vlgf63Sz5suGw/4UVXTtf3AAbwQSQXj6DGHyNf/7r4WhM5cNs9TS3HNSTM176cMFEvikI
	 hLbF6rU8yc3h5Wnl+3uOBrbzKhpDc1+2p92eMpO4u0kKJQ7p/Q3TBEmIjY5oDEmvxSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=XINBpvoO;
	arc=none smtp.remote-ip=117.135.210.3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B81606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:32:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58B81606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=XINBpvoO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=bi
	fGHgkFQw9WT1SU5l3hh3Xj/4QujZqZ5yvbaZoTz4g=; b=XINBpvoO6OCHOg4j+h
	c97M24IqbrM8owKFsfJ6jDNPtbiqmNDDF9v0wMftFilaMqPgLUphhYa8Q5rrkrYV
	GzgsYl3KYlaPD+VLHtZqsrWDfn9pa/muO8PK2mZA9AEe4QkGwvKIQzukNpAaKr8H
	kTNV3uiCDUXYrtAhQTcraQh8g=
Received: from localhost.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgCnB4Xjwf5qU7OHGw--.19151S2;
	Thu, 19 Nov 2026 17:31:15 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: ojeda@kernel.org,
	andy@kernel.org,
	geert@linux-m68k.org,
	maxextreme@gmail.com,
	pmarques@grupopie.com,
	akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	Haoxiang Li <haoxiang_li2024@163.com>
Subject: [PATCH v3] auxdisplay: cfag12864bfb: Fix init cleanup and simplify error paths
Date: Thu, 19 Nov 2026 17:31:13 +0800
Message-Id: <20261119093113.3003344-1-haoxiang_li2024@163.com>
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
X-CM-TRANSID:PygvCgCnB4Xjwf5qU7OHGw--.19151S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJFW8tryxtF4UKF45Zr48tFb_yoW5XF45pa
	nxta4rArW5GF47Kr4Sqr12vFy5CryIgayF9ryDGw1j9w4IkFW0gayrtF15XrnrJrWrG3W3
	tFy3Gr48CFWUZrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEKZXUUUUUU=
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbC7gMDcWr+weM9AgAA3W

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
Changes in v3:
 - Use PTR_ERR_OR_ZERO().
 - Remove the redundant <linux/errno.h> include. Thanks, Andy!

Changes in v2:
 - Use platform_device_register_full() to simplify code. Thanks, Andy!
 - Modify the commit message.
---
 drivers/auxdisplay/cfag12864bfb.c | 34 ++++++++++++++++---------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/auxdisplay/cfag12864bfb.c b/drivers/auxdisplay/cfag12864bfb.c
index 24baf6b2c587..b126857da507 100644
--- a/drivers/auxdisplay/cfag12864bfb.c
+++ b/drivers/auxdisplay/cfag12864bfb.c
@@ -12,7 +12,7 @@
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
-#include <linux/errno.h>
+#include <linux/err.h>
 #include <linux/fb.h>
 #include <linux/mm.h>
 #include <linux/platform_device.h>
@@ -118,13 +118,17 @@ static struct platform_device *cfag12864bfb_device;
 
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
@@ -134,23 +138,21 @@ static int __init cfag12864bfb_init(void)
 	}
 
 	ret = platform_driver_register(&cfag12864bfb_driver);
+	if (ret)
+		goto err_disable;
 
-	if (!ret) {
-		cfag12864bfb_device =
-			platform_device_alloc(CFAG12864BFB_NAME, 0);
+	cfag12864bfb_device = platform_device_register_full(&pdevinfo);
+	ret = PTR_ERR_OR_ZERO(cfag12864bfb_device);
+	if (ret)
+		goto err_unregister_driver;
 
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

