Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629207;
	b=ya1Gw9ztS2CgwKjcjqnIzZajIBBlAP4ffA9zOdyNiOtJ8ZhnP/PhFdVowdzcDuIziCR6
	 RVfNC7o6d0QBK3deLaWQgW+Sp3FdrzlXUwotU1WU0Agvc55OqPFrBhxz52K4TccdtRyMY
	 yXTF905pRKzbpqzYrFNqdTPBZMigIjbiOgYefkSXsA70zPGgXTbRXSI1ED4NYFfayRLsh
	 zpz2ZmnHtNBGWiLwqgqldK4R8GhqrXBnfnNASXzgNYxuqEfsKXi7A+rH7NH0dhAszEqi7
	 OEKlLsN60cprFacvNid8kP0NoUCmFAP209dLUBdRj/6WWNbCqzqesCuS3OEfQiFGvjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629207;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=kx6aRWMk+gHvtf/TGtSk6odRYlFp8x81lSAbHrh48+E=;
	b=Rbi2jYWinuOHfQ++71wabDC16Dgj4u/+EiME34EERy9QSYcLIwyAvQmUTpL0pGzhtTco
	 3iH3wa5rafpsv6M+b8U0gcYHgPDh8N1c06bUZQQIYUfSPa18q/L/p1T0lZB9L+FbFx04o
	 bor9ZuVAj4FyeFikUNUfg1q+XspA056PV14U+ZGHFMUUlUfamPEFcepJcLy3vpzTldLPo
	 PTImpUtjJkBFlAxokUfjKLlYLweQNIM7bVQQPi5xzZ7RnkOq5cgvnhzysh+kXxdDUk+nX
	 8GjT/hoOB71uKWcJmh/s5tUtEKAn1dm6nTEs0Kw8toUiNjiDFMH7vXUFNk+qA7EmHxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=GI1vvacQ;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FA0606A6AA
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:53:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8FA0606A6AA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=GI1vvacQ
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 990AC1A17FF;
	Wed, 25 Nov 2026 17:53:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6BE3660480;
	Wed, 25 Nov 2026 17:53:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0FD2A11E6B0D3;
	Wed, 25 Nov 2026 18:53:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795629199; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kx6aRWMk+gHvtf/TGtSk6odRYlFp8x81lSAbHrh48+E=;
	b=GI1vvacQlHmj38D8eydTuNR3fQjbD9C/BbRKpC5llFvsqdMs5nA+RdmzYHkzq3YKG7mKwi
	eiGYhP5AbuZn+ZbCzj1quAerIeRtW5VuSvXO6iEJFxS7pbKGQOaEhhBBeg4AWFHcrptweH
	WI8hw6MezKaNvEQu1R88bKYbhqtc4zpAxmrEj8px1fp1PWTiLCV5y8uQs2qKsI8XP4u5e1
	0IBD47yOMowtOvJVilgNtSCg51WOBo2I9mNingZIRprQsvr4Z571c4djEmLUkSyfNBtaFG
	fE+RfkhIWMPKBEnfSTBXYr8BxO0+xgPCy9BRgXvbv/wF/k9GGC7S9FQO+PpVVQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 25 Nov 2026 18:50:34 +0100
Subject: [PATCH v4 21/32] drm/panel: implement .get_next_bridge
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
Message-Id: <20261125-drm-bridge-hotplug-v4-21-822722850492@bootlin.com>
References: <20261125-drm-bridge-hotplug-v4-0-822722850492@bootlin.com>
In-Reply-To: <20261125-drm-bridge-hotplug-v4-0-822722850492@bootlin.com>
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
Cc: Javier Martinez Canillas <javierm@redhat.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

This bridge never has a next bridge. Add get_next_callback func to expose
this.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/drm_panel.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index 26d9378563f5..ed8d6c43b6fb 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -70,6 +70,11 @@ static const struct drm_connector_funcs panel_bridge_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
+static struct drm_bridge *drm_panel_bridge_get_next_bridge(struct drm_bridge *bridge)
+{
+	return NULL;
+}
+
 static int panel_bridge_attach(struct drm_bridge *bridge,
 			       struct drm_encoder *encoder,
 			       enum drm_bridge_attach_flags flags)
@@ -220,6 +225,7 @@ static void panel_bridge_debugfs_init(struct drm_bridge *bridge,
 }
 
 static const struct drm_bridge_funcs panel_bridge_bridge_funcs = {
+	.get_next_bridge = drm_panel_bridge_get_next_bridge,
 	.attach = panel_bridge_attach,
 	.detach = panel_bridge_detach,
 	.atomic_pre_enable = panel_bridge_atomic_pre_enable,
@@ -516,7 +522,7 @@ void drm_panel_add(struct drm_panel *panel)
 	mutex_unlock(&panel_lock);
 
 	panel->bridge.of_node = panel->dev->of_node;
-	panel->bridge.ops = DRM_BRIDGE_OP_MODES;
+	panel->bridge.ops = DRM_BRIDGE_OP_MODES | DRM_BRIDGE_OP_GET_NEXT_BRIDGE;
 	panel->bridge.pre_enable_prev_first = panel->prepare_prev_first;
 
 	drm_bridge_add(&panel->bridge);

-- 
2.56.1

