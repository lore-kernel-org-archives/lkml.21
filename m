Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795020760;
	b=WAUqI4JEZo9oJfkYRZtb/fnHnv8JXFwOnQxFNMKH/RCIdWS1XjXDpQPK7IDHBUj7TxC1
	 wnpv5AsUsA/fNfE3EbEtEifxQWabDZw2ed1B8/10bQaSxcqcIrLpF9QzLxIPvhJqtQ5Nd
	 giUy7TUVjJPj2Zs4o4Yx8E9l7EMJeWA0W4bIucfwR8Q59BzActFudz4TKlhcOAejE3qvb
	 zc5luzSavC/QmmXqxmsvKZOZd7t6aZyZlf4rnxYuvjlMgy2GzFcOd0pFQ7wdb1b/tf6Nu
	 mp0vCyQBR1WCgxkrk0qFO0ExTaPWM8DpNbKHquYA6XWxMpdM/JIMw7fFoeN9bvwuohw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795020760;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=UQW0nXrPyYbjo4S1oXxussje5vbJBtGNzCRcDY+IPUI=;
	b=iq/mESuyYaxdjatnfIwTeBca9KWH4ra9dllBRhXR3BGfIccO6JqvEbHLUy56FyM1iyyf
	 UGkBKcze5CjRjUxfFLmhfYh7KftnEbqJXwJfgI1B79twDmkgdwPPeP2ivZwMjyTYZKs9r
	 pKX/vAv1+cOhctVk5CsK7wxWW54DUIKJUhGHRa5Y4gksowWEk2oavRgRgdGMFRwZ2k+Lw
	 YqL8g3iqFuPZ/xvyzWYTZGWPHp9knJHG++uIXNEuremTzVofPoM4VTEVrRGNq1Ksv81Oj
	 hTdVD+s+TLAA28hYYQJIlMtsflCuoJEC9fIXore9wVpq/baxS2Hx+UL1DObWE3o5uEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=z6U8OeUG;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC287606A33F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:52:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC287606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=z6U8OeUG
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8C2741A16CA;
	Wed, 18 Nov 2026 16:52:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5A4805FE9B;
	Wed, 18 Nov 2026 16:52:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 01C3311BC28D2;
	Wed, 18 Nov 2026 17:52:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795020756; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=UQW0nXrPyYbjo4S1oXxussje5vbJBtGNzCRcDY+IPUI=;
	b=z6U8OeUGx24j59DLc4w+fnKkcOO7UM0k0NqgdPg8ADQXR+N0kViIqu/euZ9VUAU8EzzzOi
	7syx7sE/CELspN/0yfv4xCc9SRR2TcOsJa+E5u/kUm7xDbTR63n+k9fX9rd2nF7dyXEmNS
	q/fauQM+zzPPnzPQ73YLJhLVjbNz98dj/JQbq9z6Fz/QUcPq+u7YXLiN2WN9p9SzMeqSyW
	lG/hDiSpAsTM7cO9toOKTE85BDfvXVyie/f7YeAiSWzBMR169iErk6xtwbgLB47On1BCns
	fNC/E5+Xk1NIvQQdsTYVj0NkG7fekzFrwXg+zrxJF8SAMq1zNQOfwRxYM3u4MA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 18 Nov 2026 17:50:06 +0100
Subject: [PATCH RFC v3 23/31] drm/bridge: ti-sn65dsi86: implement
 .get_next_bridge
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
Message-Id: <20261118-drm-bridge-hotplug-v3-23-44bb3b4a828f@bootlin.com>
References: <20261118-drm-bridge-hotplug-v3-0-44bb3b4a828f@bootlin.com>
In-Reply-To: <20261118-drm-bridge-hotplug-v3-0-44bb3b4a828f@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>, Marek Vasut <marex@denx.de>, 
 Stefan Agner <stefan@agner.ch>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

Add get_next_callback func to expose the next bridge.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v3:
- add missing drm_bridge_get
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 75e36bf261b0..637e4f4076eb 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -768,6 +768,13 @@ static int ti_sn_attach_host(struct auxiliary_device *adev, struct ti_sn65dsi86
 	return devm_mipi_dsi_attach(&adev->dev, dsi);
 }
 
+static struct drm_bridge *sn65dsi86_get_next_bridge(struct drm_bridge *bridge)
+{
+	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
+
+	return pdata->next_bridge ? drm_bridge_get(pdata->next_bridge) : ERR_PTR(-ENODEV);
+}
+
 static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 			       struct drm_encoder *encoder,
 			       enum drm_bridge_attach_flags flags)
@@ -1374,6 +1381,7 @@ static void ti_sn_bridge_hpd_disable(struct drm_bridge *bridge)
 }
 
 static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
+	.get_next_bridge = sn65dsi86_get_next_bridge,
 	.attach = ti_sn_bridge_attach,
 	.detach = ti_sn_bridge_detach,
 	.mode_valid = ti_sn_bridge_mode_valid,
@@ -1512,8 +1520,9 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
 	pdata->bridge.type = pdata->next_bridge->type == DRM_MODE_CONNECTOR_DisplayPort
 			   ? DRM_MODE_CONNECTOR_DisplayPort : DRM_MODE_CONNECTOR_eDP;
 
+	pdata->bridge.ops = DRM_BRIDGE_OP_GET_NEXT_BRIDGE;
 	if (pdata->bridge.type == DRM_MODE_CONNECTOR_DisplayPort) {
-		pdata->bridge.ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT;
+		pdata->bridge.ops |= DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT;
 		if (client->irq)
 			pdata->bridge.ops |= DRM_BRIDGE_OP_HPD;
 		/*

-- 
2.56.1

