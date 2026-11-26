Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795694446;
	b=QSgGpf01jqOcWOQ3Ysgny41URWsdJBdRG89+9OQcvGxXALXIM+BTlR4HcPnco6zmj+jE
	 MDIGFSk3hKmQNOZAFaPg5LIbpNjDIhWFUeN7XRBvqv5yDUC1wiJ7doZqTtsNFdAlL+8ru
	 68geVwtkB5lF5gsVjc6Hk2j3Yv9ArW1JvIYIVnGf0oFkCdflDY0MZDHCEa1438L+uhMrr
	 8QjCbcEb3spttqMLNj1CqJ+xncAfPT4CarVQUCSM5c2Qj0jTebGSQWHpVWpmsGCIBtDlT
	 oWsxOJ0CqkGgH4H98YX0uG6B6XqR5R4B7PCKI2QmhTX4MuBofigBJL0n2FqbeB13+pA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795694446;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=Wo8gr7WxxCAAD6ElcLjXd3fdhLktIq01023AeY93blE=;
	b=yzG92NS43GMoiUYdP8B6xM5lF67d+xtPpobCZT9CRPhxJ7sYARG9T/hBRnGizLoI1LwK
	 6685FM7epq5QBmfbRerDOJJ36ahCj2ojbtKwxUVUtvqxT9rUkQSLFCYbrei5NSN7UBGkq
	 RVI6UrhA+iNS5menglSrKykwhCfSQLSn3mdmVjT2Fx/nmd4VG0b8XlyyucsjWX/6xY9hM
	 kLlAYIuS43AaAhwBV9VOKZ3JGpPeSOekjv4ah2Z7bTCiwT6tpn3QkOJcFyuFTucqyOF3e
	 K61CSMi/om8E8yBvF9g3BkdZQADhghgEBD9iVqQp13wC0zunIWpXdf4Y46d+3/OPs+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=eXPMLLQI;
	arc=none smtp.remote-ip=45.254.49.198
Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8671606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:00:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8671606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=eXPMLLQI
Received: from user.localdomain (unknown [223.80.110.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 561dabdfe;
	Thu, 26 Nov 2026 20:00:40 +0800 (GMT+08:00)
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
Subject: [PATCH] phy: mediatek: hdmi: Fix potential stale PLL provider on unbind
Date: Thu, 26 Nov 2026 20:00:39 +0800
Message-Id: <20261126120039.4049943-1-202300460064@mail.sdu.edu.cn>
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
X-HM-Tid: 0aa217baadfd03a2kunm6834bc74359e8a
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaTkpIVhpNTh9DHR5LQ0IaGFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVQ0tVSkpLVUpLSllXWRYaDxIVHRRZQVlLVUtVS1VLWQ
	Y+
DKIM-Signature: a=rsa-sha256;
	b=eXPMLLQI+lhb816WAFKexCyQTaPrpLTT51kzqu3SQespGmRTCTBIud/pSiVNR05EzF4ZWGOBa2ezlp0kwjJPlKpqoUWVnlJqLVa+uSl6Jtll0Mhf17d85dsH3USb+xKb5wt0JE+ZgqZoLxWGkkltQhVBnUbyzZ1N4gI+o9vabRE=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=Wo8gr7WxxCAAD6ElcLjXd3fdhLktIq01023AeY93blE=;
	h=date:mime-version:subject:message-id:from;

From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>

The HDMI PHY registers its PLL with devres but leaves the OF clock
provider registered on unbind. Publish the PLL hardware through a
managed provider so it is withdrawn before the PLL is unregistered.

This issue was found by our static analysis tool under development.

Fixes: 8f83f26891e1 ("drm/mediatek: Add HDMI support")
Signed-off-by: Tian Xuechen <202300460064@mail.sdu.edu.cn>
---
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

