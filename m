Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795020755;
	b=edVyq7glx2MrOTp5qigBHxeS5+oVrvznEkGbJSxeOgpI0aJ6ApeXlvx9BwZdqcvaODiR
	 R2ibtL/j1vaN5LxnAfvW9EY7ha06FKM+2RhMuE18pcnJAWNM2lQKbHOtt27PBYoeJNrlJ
	 R7lUzJKIkR56ktO1Cj8DkaAf+37bySE6uLlXMlgzXt8jXEGIBierz82FR5NZ0rnlkaUVv
	 GbgA2r3Ni3H705woGGL6/dU1GDcYuXrzp19fGjErQELVsenRjPWkqlyy03Ab97EB3stT8
	 wMDU+8Nrxvjs+ANJfsZWlU44DTSTwpA5abgy76Mr8yVZYf2+qhjYDhAPZsE/suqZVEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795020755;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=79krwX+yyeP5wQB3giUSTaFzi+h4xK2ZzarDncWghUM=;
	b=uF+QV/o/zO3uLkBr5xYMmdGQILNrOcwX0XjQBPyLnbfFfqvXXi4eimCKznxKNkmJDIPc
	 OS0HCkCOhh5xujMnrdVw8lAwA056fzc58jqmFs2w0oLwfKHVS4jLzKrWnoxN2uQmiOaLt
	 CLf5dob1UuPkA9JdcOH6nGaa0l+JM5WCtsLs4kTfbkLt3sw3ysOT+H1EZpI7su7Agj9F0
	 FTDPKWG3se1E0qcAdhjB8PUCpaKSHerXFCCsjHc3tYASRu8euHbD6Ryl8bCxI/E1GyNwe
	 poXAkoESDrXHAI6qjn+mF5dEbyrr2Ob7oYpOxZ/00R2KAdXWY5Jk9j0k1rNa52Lpx+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="xqh/9ZIM";
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FD3606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:52:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5FD3606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=xqh/9ZIM
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4C048C4F77B;
	Wed, 18 Nov 2026 16:52:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 641765FE9B;
	Wed, 18 Nov 2026 16:52:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B313E11BC27F3;
	Wed, 18 Nov 2026 17:52:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795020747; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=79krwX+yyeP5wQB3giUSTaFzi+h4xK2ZzarDncWghUM=;
	b=xqh/9ZIMDEnNJlnXR28jZ8B7RiXCisq0/9o/SsyTbxfcQXhcv3xUjmG3ZfcSuw6CLqUONi
	3lsGQQqpIlPXeGFH5LawVMXehMbvHv3N9/t5T+ASzengvdaUHvYR22Gsy3vUs0oODbR8SI
	4rWsQtM1GdeKED8/AMFIUz5vVa7zFWS6sRGa+EEIGJ/X70NYJdJSZ0q/2iM7aD4HLUkBVO
	Z+Uwdg/RdFEw0ynP9RycrVUcz3XoMict7cXi3QeN/sH0tDVtfIHlFWwS3ia9OWi/x/KDor
	kmQd1df1wvyfIeHIga462ANGQwOvYBA+13zkY2bifDi0sQR3Kq0HD3eR5iZ5PQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 18 Nov 2026 17:50:05 +0100
Subject: [PATCH RFC v3 22/31] drm/bridge: ti-sn65dsi83: implement
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
Message-Id: <20261118-drm-bridge-hotplug-v3-22-44bb3b4a828f@bootlin.com>
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
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index 525cddc57876..3886dafae6d7 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -295,6 +295,13 @@ static struct sn65dsi83 *bridge_to_sn65dsi83(struct drm_bridge *bridge)
 	return container_of(bridge, struct sn65dsi83, bridge);
 }
 
+static struct drm_bridge *sn65dsi83_get_next_bridge(struct drm_bridge *bridge)
+{
+	struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
+
+	return ctx->panel_bridge ? drm_bridge_get(ctx->panel_bridge) : ERR_PTR(-ENODEV);
+}
+
 static int sn65dsi83_attach(struct drm_bridge *bridge,
 			    struct drm_encoder *encoder,
 			    enum drm_bridge_attach_flags flags)
@@ -795,6 +802,7 @@ sn65dsi83_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
 }
 
 static const struct drm_bridge_funcs sn65dsi83_funcs = {
+	.get_next_bridge	= sn65dsi83_get_next_bridge,
 	.attach			= sn65dsi83_attach,
 	.detach			= sn65dsi83_detach,
 	.atomic_enable		= sn65dsi83_atomic_enable,
@@ -1065,6 +1073,7 @@ static int sn65dsi83_probe(struct i2c_client *client)
 	ctx->bridge.of_node = dev->of_node;
 	ctx->bridge.pre_enable_prev_first = true;
 	ctx->bridge.type = DRM_MODE_CONNECTOR_LVDS;
+	ctx->bridge.ops = DRM_BRIDGE_OP_GET_NEXT_BRIDGE;
 	drm_bridge_add(&ctx->bridge);
 
 	ret = sn65dsi83_host_attach(ctx);

-- 
2.56.1

