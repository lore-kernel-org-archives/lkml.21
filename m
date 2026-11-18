Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018810;
	b=bZQZfGQ3pAWuooR43CQN3c2AD8CYKJwoqrpap1iyF4gzbc+bCIsgt+6dmS5i8GYN0bhd
	 j9THTt9QzD9Q+HYY2cyJ6Bsfdoc3hmE8a0EjW3EhN69h8FzhNJ/O250lkZUDwtgwqEqwU
	 t4g97Cu3Wsoj2WPImIIakc0dp2W5Sa3B3t5VFMhUkR8xRM9E7ROA49Mmr1mVf4SUt4Fcl
	 /SCctx3dxNwSS+OxHgld0w21VkgAJKHBBya5oOp8KE+jxUhwZYR3yeyAsvf9Ol98ZBU1y
	 RYHA5gPmwLYYGL7WhIYF7XXVE60zlVHUqBDQyRJoA2awt0kVPTlZgg8Zu0990ozh+KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018810;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=rxH4cRTlih2nYqrfKusqL9MuJhz5QOuEx96vGmCTg/E=;
	b=sQMevN3jqKn66JqBMZLCv2/WtMm01pqNMbfethEwxjr6tsumbXkh8Pn/meJClUClSpMO
	 Scas25ZJZYpCmtoip8z/BTlPT9GYWBxSZxBNI0GFh5seyfd2W79ahXLeeRnMiUrh6a4+4
	 zUsm1P4kG7JGLSjMm+5cNJUQArL0MO52a67oZHyezQy+EFJ1i8XVuI+WKPmNB/OQcG1dZ
	 GOKHUVdSpUmoQW1gucAlFuyPYmwiC0hF15N0B7J53GJxn2TVJvWe+ncCHjhz/H9+z64cj
	 d1RA2UHlrzbv2mWqTNrWa25NceDUuZoDdeKzWgXGw/MpheUaUUjh/+DokyZfHMdfd0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=nZ1MxDru;
	arc=none smtp.remote-ip=220.197.31.3
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CEB606A333
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:20:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08CEB606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=nZ1MxDru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=rx
	H4cRTlih2nYqrfKusqL9MuJhz5QOuEx96vGmCTg/E=; b=nZ1MxDruYTpiRv6Taa
	lw7kkSrSjo66gEswW5Y2FYtbwBpe+nG3z/HapSm7MpYdLBwFVUPShFrwWF875Kfh
	lKECJtU1+sy9z9obfOo34ouoVkVYUhiQ53DDV+gFHpQB93wci7sh3GcobJRKgXp7
	bbq/ed7FrzpXPVXhp3AdgmTo4=
Received: from localhost.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgD3WJIJ0P1q3Za9Gg--.25673S2;
	Thu, 19 Nov 2026 00:19:23 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: anitha.chrisanthus@intel.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	tzimmermann@suse.de,
	sam@ravnborg.org
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Haoxiang Li <haoxiang_li2024@163.com>
Subject: [PATCH] drm/kmb: Uninstall IRQ handler on DRM registration failure
Date: Thu, 19 Nov 2026 00:19:21 +0800
Message-Id: <20261118161921.2460608-1-haoxiang_li2024@163.com>
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
X-CM-TRANSID:QCgvCgD3WJIJ0P1q3Za9Gg--.25673S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKr43Xr1fWw17urykAr4DXFb_yoWfZrg_WF
	12qr4xWrs0kFnxJr129F4a9rW2yF1v9Fs3Gw10ga95K3srZryqvrWq93Z7ZF18uF45AFZ8
	Gw4jqF4fW347WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRiBHq5UUUUU==
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbC7QtQvmr90AsG0QAA3T

kmb_probe() installs the LCD IRQ handler before calling
drm_dev_register(). If registration fails, the error path stops
polling and cleans up the display resources without uninstalling
the handler.

Call kmb_irq_uninstall() in the registration error path

Fixes: 58889cdc39cf ("drm/kmb: Convert to Linux IRQ interfaces")
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 drivers/gpu/drm/kmb/kmb_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
index 7c2eb1152fc2..d8e2fc28ee9e 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -569,6 +569,7 @@ static int kmb_probe(struct platform_device *pdev)
 
  err_register:
 	drm_kms_helper_poll_fini(&kmb->drm);
+	kmb_irq_uninstall(&kmb->drm);
  err_irq:
 	pm_runtime_disable(kmb->drm.dev);
  err_free:
-- 
2.25.1

