Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795058316;
	b=dbpUKeXhIIKC/sdUz5x1Q5m380LVkGjKUUjQelOthQ1QuPGEhGtRQf2jJlFpDXe0pATd
	 KR1AW5FuT1FOQUFAftPt1U/0Q4VoMLrx58M02kZ01ga5YDboPua/q13tCDq/8dpawdPYd
	 27Ghsin4d66h2nKSMny5UXTZYKjcgBCetdKUxllQ1s7NaqgzSKeTOw4ouhWyswP8onUkV
	 apLKMzy4IX2GCtX2EBu2pBnUfDIbaVQEmKcKiw5xxHOMnbKQPnlWuNc+cz/02Xd8IV1iT
	 9qT3g7xadabvfZ73iPdAygOAZdf+PI5wOxBxsE/P3xtSCrmVf+2KKFGXgu7tpc4dvHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795058316;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=nzumizWeRahFF6SbXg6af2NSKWXv+aezI70WP4j1Pos=;
	b=Cv0u3g4i1s2vu1pQPkUQ/+frD9nK7J4QyFnHb5VZPpj8YV+K+UnjHRMiUHo17CHZaN87
	 HK8BgHCAG7W1fBVPCgd5/B8A9AKDBTUfXcc2Jk6Fh3Rr8GNzPIPndWyNskcJTVntd028x
	 CmzlbwQg5sMWkloF1j1Cp7GAZXvuRyV7lEBV836u9N89+jaCj4DBv44LtMsFxqt52dlJ8
	 gg1yZ3I0AbNg/m7SSsQUK7eH7sGr9YNHNNZDjJuO4bQhqcqKOEAsQfazZVLMVUt45/Msn
	 RzCe1oIM8iaThyqLJc11hVBI0qUwCq5NnTVlHU3SpCxm1r2OyB+7EDoIRxOp6PRooPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=J5cJw6kp;
	arc=none smtp.remote-ip=117.135.210.5
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA072606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:18:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA072606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=J5cJw6kp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=nz
	umizWeRahFF6SbXg6af2NSKWXv+aezI70WP4j1Pos=; b=J5cJw6kpHgyFz+DwZC
	iGQDN9hqkKtTWX8TsphzxnVIoMeY6X0zoOt6h+8xj8GP75rd4Vqr3h79yrd3D7kj
	Z2WaYZrWL6VERXYtU9fSPsDFf/L1WZZNqPGCyx3qN2czhs6bJE/HhqyJNXy2FqI+
	CHaSggwD3+I3pVzBVNbTeRu9E=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgBX7xNQav5q3MyXGQ--.21624S2;
	Thu, 19 Nov 2026 11:17:38 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	junzhi.zhao@mediatek.com,
	jie.qiu@mediatek.com
Cc: dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Haoxiang Li <haoxiang_li2024@163.com>
Subject: [PATCH] drm/mediatek: mtk_hdmi_common: Fix clock reference leaks
Date: Thu, 19 Nov 2026 11:17:34 +0800
Message-Id: <20261119031734.2797802-1-haoxiang_li2024@163.com>
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
X-CM-TRANSID:PSgvCgBX7xNQav5q3MyXGQ--.21624S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJrW8Kry7JrykXrWftF47urg_yoW8Zr4fpF
	47G34YyFy7Ar4jgr1qyr1xXFnYkw17uFW3GrW3Wwn3Crn8XFyrtF13ta45ZFWSkr97Z39I
	yrZ0ka4fXa4UuFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piGjg7UUUUU=
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbC7hIJd2r+alIOmgAA36

mtk_hdmi_get_all_clk() acquires clock references using
of_clk_get_by_name(), but these references are never released.
They leak when a later clock lookup or subsequent probe step
fails, as well as on driver unbind.

Use devm_clk_get() to automatically release each successfully acquired
clock reference on probe failure or driver unbind. Remove the now
unused device-node parameter from mtk_hdmi_get_all_clk() and update
its caller.

Fixes: 8f83f26891e1 ("drm/mediatek: Add HDMI support")
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi_common.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
index a36d8dd6b761..8e8ea4111351 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
@@ -199,13 +199,13 @@ void mtk_hdmi_audio_set_plugged_cb(struct mtk_hdmi *hdmi, hdmi_codec_plugged_cb
 }
 EXPORT_SYMBOL_NS_GPL(mtk_hdmi_audio_set_plugged_cb, "DRM_MTK_HDMI");
 
-static int mtk_hdmi_get_all_clk(struct mtk_hdmi *hdmi, struct device_node *np,
+static int mtk_hdmi_get_all_clk(struct mtk_hdmi *hdmi,
 				const char * const *clock_names, size_t num_clocks)
 {
 	int i;
 
 	for (i = 0; i < num_clocks; i++) {
-		hdmi->clk[i] = of_clk_get_by_name(np, clock_names[i]);
+		hdmi->clk[i] = devm_clk_get(hdmi->dev, clock_names[i]);
 
 		if (IS_ERR(hdmi->clk[i]))
 			return PTR_ERR(hdmi->clk[i]);
@@ -305,7 +305,7 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi, struct platform_device
 	struct device_node *remote, *i2c_np;
 	int ret;
 
-	ret = mtk_hdmi_get_all_clk(hdmi, np, clk_names, num_clocks);
+	ret = mtk_hdmi_get_all_clk(hdmi, clk_names, num_clocks);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to get clocks\n");
 
-- 
2.25.1

