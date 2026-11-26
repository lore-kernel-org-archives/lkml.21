Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=101.71.155.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795698392;
	b=jW9n44csnR1v0eKWgkMlaL2lsHtbCauVDJjyRfj83VTPFDJUOp26JJOEJwVeSmA8To03
	 5iHBh0/b9SQNqk494dfaFsA+I2zo4pAYZLL9L3mTQeZA4tIYKG8bn9GGmp+4JdfABJA45
	 u6Zb8k2XKhUU9Ymwv/7UTF6uu7nVRDWJY3uTAy8ghaewvoGH1UCw01WDJZ44VmvI2mZZc
	 M8U83MZAppQCPDtLj742mL3/ZSzTTvEjOFfYeEhYlu8ea1ThkdoUKfzOy5LAl857TPAgl
	 xulhN0WvxwSTd9R7qxxHlDiKvRgRstnfxmR4swpYAP7AxbtXhHdvQFR+V4apsUZ//ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795698392;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=mKr1keYM02EumLxC+PGjz0vKlqa4GJrbdZwQ+sNCyN8=;
	b=UF4GATBmHphjvh9lLYoK6a8nFvM/sN5EBONO1HSd3c7l8Ot2JLTR1LyEpz8j6XCtRuad
	 JommaNHUZpLhii2FMXNKreZDRB5L1WDZsbwuFcMkwmk9VOFRDwTnZnFSaFXbs/L5QBlbZ
	 YhPxxExkTQPCZNTIeYNvFuP1YZEmmlIW1xVgTigpyMrTnw6M2vmLlkg1VvUhPGm3Qv5Oj
	 194wVoyXzNtPRU+7llk1GC1OT3tT587py+cESwPo2HU7xo1kvYbfMkXysdV2yC/tOLtpK
	 gnclUKTs3hGGj1d0w5TXbxTjLcf2np2nkL2o10547bqzDE4zXFdzP/hFXRq3LZWAE4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=VGVreo6J;
	arc=none smtp.remote-ip=101.71.155.101
Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8897B606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:06:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8897B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=VGVreo6J
Received: from user.localdomain (unknown [223.80.110.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 561f6fac9;
	Thu, 26 Nov 2026 21:06:23 +0800 (GMT+08:00)
From: Tian Xuechen <202300460064@mail.sdu.edu.cn>
To: chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	chunfeng.yun@mediatek.com,
	vkoul@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	jie.qiu@mediatek.com,
	junzhi.zhao@mediatek.com
Cc: neil.armstrong@linaro.org,
	mani@kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	liguangshuo@mail.sdu.edu.cn
Subject: [PATCH v2] phy: mediatek: hdmi: Fix potential stale PLL provider on unbind
Date: Thu, 26 Nov 2026 21:06:22 +0800
Message-Id: <20261126130622.4073620-1-202300460064@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.34.1
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
X-HM-Tid: 0aa217f6da9903a2kunmd1d1900f35cb30
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaTh9CVhhCH0MfQh0ZSk0ZHlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVQ0tVSkpLVUpLSllXWRYaDxIVHRRZQVlLVUtVS1VLWQ
	Y+
DKIM-Signature: a=rsa-sha256;
	b=VGVreo6JblqymZugb0+4qCtBedflwSKtMKFPEPUwtLOPRBf1bqaoOTw/IUQ1UtMTRhInHiPaD0h3NIHRYV0OacgYxdq4PaqbdqHKy1tM9bjdqoaMMzdAhehUUh30H1jXGEnP480VMFA2EK68jAkNk9VeOxAYhgiOxK/Bqk0BdvQ=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=mKr1keYM02EumLxC+PGjz0vKlqa4GJrbdZwQ+sNCyN8=;
	h=date:mime-version:subject:message-id:from;

The HDMI PHY registers its PLL with devres but leaves the OF clock
provider registered on unbind. Publish the PLL hardware through a
managed provider so it is withdrawn before the PLL is unregistered.

This issue was found by our static analysis tool under development.

Fixes: 8f83f26891e1 ("drm/mediatek: Add HDMI support")
Signed-off-by: Tian Xuechen <202300460064@mail.sdu.edu.cn>
---
v2:
  - Update the patch author attribution to Tian Xuechen.
  - No code changes.

 drivers/phy/mediatek/phy-mtk-hdmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi.c b/drivers/phy/mediatek/phy-mtk-hdmi.c
index d063fc787c28..06784393b0ef 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi.c
@@ -178,8 +178,8 @@ static int mtk_hdmi_phy_probe(struct platform_device *pdev)
 			return ret;
 	}
 
-	return of_clk_add_provider(dev->of_node, of_clk_src_simple_get,
-				   hdmi_phy->pll);
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get,
+					   &hdmi_phy->pll_hw);
 }
 
 static const struct of_device_id mtk_hdmi_phy_match[] = {

base-commit: 4dce97c6c265544342e716e62fd24bbb232590c5
-- 
2.43.0

