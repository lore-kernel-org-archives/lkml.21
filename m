Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795020691;
	b=cfXJ+BseTRsM5dmI4L51PmKbuy5ErLlNO3Wjc8CX/Cu/fYWH9wkN1dIBTtL81cQrdp5f
	 IdgEDDDO8XYeVxwpT1fi1m8wj/yKZw92TmdhJ0mc32fHNn/ysV2Tgdhg8JZRZAELDgPY6
	 EZlAd9R1FSdRXjRJkkzIHqtydVkEtpmo0ADvoeXw/KQb2zMpEI03FlMYMeDL/UuADfe/c
	 s6tIFlDpWuY8UTtSFteMDSxy04+U/aCKoGLbDpPMg1AloZUvoLJ3Q3ltE7Hv7381qfe3L
	 /Ufz4/Uqz0TpGVMUT4sbJpWFGz1EXIDLr4LG+WyzlEVTqvmmFrmTpY5Vd6bk4bjHIvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795020691;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=iHS1CP9tSXe3fyN73BGrE3K8GQSmYW6v05x00gz8hDQ=;
	b=3v+W3QNpBeFJpokN7CVGKeyp5jO3fG4t8wSn6zx7aPDcGlnBVCJ1DboXl6JdscK2MjBK
	 Dhn1GaIAdijXKyQbiINZjyOQKQwuNXq01wG1VO77hfPNxk1k6BS6yo/y5Dc54u7mlMkE3
	 8LK5X45tA206qtdCoPqYqFc7GbHiU4gRnBC70+NapsAm/WVe5vI1T1e0vd+pi+zhAqWkp
	 F7zx0KZXBnlI2ViO9Yu0kIi+qnHqhPvfAv7dYwp44plIrQyzqSecUtL6qMyjF7VxZAJpK
	 GPOuBwFlj5mndHlL3acyubLc0XNhTEFNzeHgBSpoV3ojuIu1W6wWeNmdAPGZhjhTfkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=A7Kx9TT1;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459ED606A33B
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:51:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 459ED606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=A7Kx9TT1
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 224F64E40546;
	Wed, 18 Nov 2026 16:51:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DEFC35FE9B;
	Wed, 18 Nov 2026 16:51:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DD33F11BC27C2;
	Wed, 18 Nov 2026 17:51:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795020687; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=iHS1CP9tSXe3fyN73BGrE3K8GQSmYW6v05x00gz8hDQ=;
	b=A7Kx9TT1tx1v7xnjVIVqScxdjU6vfofBonPi+8rfV09BF7rP5dVeHL9aQPpdOKQZ+fKCLM
	JBgraxfuQipCB9fgw5EdNhbp++9FwBmzSag++L5aGseLjVWj0KutbIRkjM7Y/Yid20bpck
	YUP28BT8jlNRXEdc3QG2VwtcnPCQaoNRGjLR+PkbjCtLvZW375ZUC3JCAZTIR7ARXv4GHO
	mM5Fe/DTX6Z8dC41rM0nZvHbPXwfTIGFi6u0BwFUAMTyC4/BWm1nOHVHbjwm8XFD5lr61u
	lTLviEri//6K68J7+qnwd0UM7LmW44m1PwJQ2gkgGTJKgfLhzIfzWGAYBDNKPg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 18 Nov 2026 17:49:56 +0100
Subject: [PATCH RFC v3 13/31] drm/bridge: initialize chain_node list head
 on detach and attach errors
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
Message-Id: <20261118-drm-bridge-hotplug-v3-13-44bb3b4a828f@bootlin.com>
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

When a bridge is detached it is removed from the encoder bridge_chain list,
but the bridge::chain_node list head is not cleared. This is going to be
problematic with the upcoming hotplug bridge support because if a bridge is
detached from the encoder chain but not yet removed, when later detaching
it the encoder code may think it is still attached, thus trying to detach
it twice.

Avoid this by clearing the list head on detach, so there's a clear and
simple way to know when a bridge is not attached anymore.

Do the same in the error management code in drm_bridge_attach(), so that
chain_node is always empty [as in list_empty()] when it is not
(yet|anymore) in the bridge chain.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/drm_bridge.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index f1a88c8c75af..d54245f3c4d3 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -664,7 +664,7 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 	bridge->dev = NULL;
 	bridge->encoder = NULL;
 	mutex_lock(&encoder->bridge_chain_mutex);
-	list_del(&bridge->chain_node);
+	list_del_init(&bridge->chain_node);
 	mutex_unlock(&encoder->bridge_chain_mutex);
 
 	if (ret == -EPROBE_DEFER)
@@ -694,7 +694,7 @@ void drm_bridge_detach(struct drm_bridge *bridge)
 	if (bridge->funcs->detach)
 		bridge->funcs->detach(bridge);
 
-	list_del(&bridge->chain_node);
+	list_del_init(&bridge->chain_node);
 	bridge->dev = NULL;
 	drm_bridge_put(bridge);
 }

-- 
2.56.1

