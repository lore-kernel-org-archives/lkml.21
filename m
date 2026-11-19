Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795055191;
	b=DD6mumeBRiqpCAzVTnr3Z/GGMPSCK4X9NWS1igBC2a8rPG/BXmH+Qg3VA2V2tiNRdurZ
	 CUtMhbFdwnBJJ1m47RiWJhPkgJnT39B67w17jBqnTxcH1sbF4myuSxwqCBc4jRlxdFAma
	 tMEh+j10qmsDbyU4VPFzaHsHfsKjJpFTjvxnQ29t9uyZO29lkTGarG95+WPDxjM+WzuxA
	 GByXLG8CgPHMD/uMeJj0JJaffAQtaVxAX/OFx7IRkoVyFSNVQZb4hHuV4Lv4aHmzSomAq
	 yYycraHhuo/TEAUEeYrfp/30RIPvoEHc2x87FGwa2BRLI/Lex4jUrdWLU8T1Hasnrvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795055191;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=MDGr/CGcb/0yjx18NczlFkS1nfAX9xBsnpRe/oCD73g=;
	b=kz4K9cAN9TkJzyRwpUDW2jj8Fssc87H0/IhRczrpaWA+BwbAQdxtYZN8L5s9rnpL3b68
	 V6rP8Gw+fgY7p2OzwEoVjdZXlefB0FKnXa7StM1XHlu5NK2+D7m35wG8BwT9S7lWMY8hH
	 IiJYHBLqN5jawn8YdfsDd8Ji5kVhl1XxaNRLWc078d/ZQiknSigXD6DZMIxmkeA1M+9M7
	 QoblQaMjEnv2/H9WK5etSkIxVwH8D/D5W12JeMPCMQ64diMATLo2WGPY+0+qc4ybbx1eh
	 /sTC5S6XbAbo+0BWBSbnZxu+arTAaW+QVWfViYw0pCH8dFxrSALRgecq1NNTBBjya2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=JO+1wNpf;
	arc=none smtp.remote-ip=117.135.210.4
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7DC606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 02:26:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED7DC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=JO+1wNpf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=MD
	Gr/CGcb/0yjx18NczlFkS1nfAX9xBsnpRe/oCD73g=; b=JO+1wNpfViKbAiBhtp
	LIbk93GcQPCuZ+R4ewSTargKgG4I0cKURbvPWHzA452VWCzg0fp9hSVFy38ybeJN
	PWWbUfZpQ12BqbL6sInDPwdwFNpy9i/LG6+gn61QNTBY0xPvvirpXHpMVZsCqg61
	+NcMCAcwgIIVIJRZY/XIaevQo=
Received: from localhost.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgD3P54UXv5qU0tCGw--.12514S2;
	Thu, 19 Nov 2026 10:25:26 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	granquet@baylibre.com,
	dmitry.osipenko@collabora.com,
	rex-bc.chen@mediatek.com,
	amergnat@baylibre.com,
	ck.hu@mediatek.com
Cc: dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Haoxiang Li <haoxiang_li2024@163.com>
Subject: [PATCH] drm/mediatek: dp: Unregister child devices on probe failure
Date: Thu, 19 Nov 2026 10:25:23 +0800
Message-Id: <20261119022523.2767735-1-haoxiang_li2024@163.com>
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
X-CM-TRANSID:PygvCgD3P54UXv5qU0tCGw--.12514S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tr1kGF45CrWUur15XFWkZwb_yoW8Kr1DpF
	4Fga15Cry09r4jqrZ7AF4DAF98C3Wxt3yfurW3Xw1Iv3s8XryUJ3yDAa4jvF1IyFyvkF12
	yrsrJryxuayjyFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRFD7sUUUUU=
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbC7hb2ZWr+XhatgQAA3b

If PHY initialization fails after the audio codec device has been
registered, mtk_dp_probe() returns without unregistering the audio
device. Later failures during eDP AUX bus setup, panel linking or
bridge registration also leave the PHY device registered.

Add error labels to unregister successfully registered child devices
in reverse order before returning the probe error.

Fixes: e71a8ebbe086 ("drm/mediatek: dp: Audio support for MT8195")
Fixes: 214a0944e664 ("drm/mediatek: dp: Use devm variant of drm_bridge_add()")
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 974c4fff6fd3..5be69622242f 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -2804,7 +2804,7 @@ static int mtk_dp_probe(struct platform_device *pdev)
 
 	ret = mtk_dp_register_phy(mtk_dp);
 	if (ret)
-		return ret;
+		goto err_unregister_audio;
 
 	mtk_dp->bridge.of_node = dev->of_node;
 	mtk_dp->bridge.type = mtk_dp->data->bridge_type;
@@ -2838,27 +2838,37 @@ static int mtk_dp_probe(struct platform_device *pdev)
 			if (ret == -ENODEV) {
 				ret = mtk_dp_edp_link_panel(&mtk_dp->aux);
 				if (ret)
-					return ret;
+					goto err_unregister_phy;
 			} else {
 				mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
 						   DP_PWR_STATE_BANDGAP_TPLL,
 						   DP_PWR_STATE_MASK);
 				mtk_dp_power_disable(mtk_dp);
-				return ret;
+				goto err_unregister_phy;
 			}
 		}
 	} else {
 		mtk_dp->bridge.ops = DRM_BRIDGE_OP_DETECT |
 				     DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_HPD;
 		ret = devm_drm_bridge_add(dev, &mtk_dp->bridge);
-		if (ret)
-			return dev_err_probe(dev, ret, "Failed to add bridge\n");
+		if (ret) {
+			dev_err_probe(dev, ret, "Failed to add bridge\n");
+			goto err_unregister_phy;
+		}
 	}
 
 	pm_runtime_enable(dev);
 	pm_runtime_get_sync(dev);
 
 	return 0;
+
+err_unregister_phy:
+	platform_device_unregister(mtk_dp->phy_dev);
+
+err_unregister_audio:
+	if (mtk_dp->audio_pdev)
+		platform_device_unregister(mtk_dp->audio_pdev);
+	return ret;
 }
 
 static void mtk_dp_remove(struct platform_device *pdev)
-- 
2.25.1

