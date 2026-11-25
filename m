Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629135;
	b=vvoMF7mcW7FddrMkfncpC1catHXqLC2iI+9TWSjZxGPlRsv6ajGFnL657T8oObu5Svbr
	 YpYxEXf43erpa3Opz52K1HaN2ctChFUE9e3NQ9zyR21ggdlcj/5D6frgt/xS3dB59N1nY
	 vvXDCADo8n3JEeeJqAEcG+SjfgY+DhQtNX6ALaJ22KxP/JPn+OIVngCFKIWaOI3+6/zJC
	 0zq7N8JDwUfOewKwsD3mxdmzVHfIFWTLcxbUzQl63K1H+u3KA4atOfu2vS79P/K8gf1YY
	 CyJIDYKwpvlskzg2Ujo6dgOx1u2gu8E7RR1H0Ncpm6+htvZl1+ovDbECXklrCK0D7EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629135;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=FMid6O9mGLNFycapWTq3yUgUfBXm/Q/2lSdG/OTscvI=;
	b=YIewu/y5bHPQWYKW7y3tY2tTEb9eIxOR8IQqqEFLik/gh3d8CSMJYxIMBt0QkA27kfvy
	 YOEFVZzo7TQnQlY64P60ZMGjhqLo2CQkQ+67jOTY8hG3W/Ybc38neaViYHEpj+DvnFYtX
	 ZvFTs773Wh0wS3lprNU3GGHaLxCm+sopAKGTh0vaaJwQlbt38mM7UtdDGnuav6i++Ai2y
	 6+2988kUPs4ZCss3sBaSGF4HBCjhRZGu+F9XzDlvvQNwmjKJj2/lzovjhOUfwotZQEK0R
	 6K4m8q9/N0zGGaN8JyuXmFVYjcvwMUIxceMXl8FtHM7xGWAWiSOPMLtTLFeuoHaN77A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Qb0FqT+N;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B64606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:52:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4B64606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Qb0FqT+N
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 572691A17FD;
	Wed, 25 Nov 2026 17:52:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2A5BE60480;
	Wed, 25 Nov 2026 17:52:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 39A2D11E6B0C5;
	Wed, 25 Nov 2026 18:52:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795629130; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FMid6O9mGLNFycapWTq3yUgUfBXm/Q/2lSdG/OTscvI=;
	b=Qb0FqT+NefijqTx6CjCGrvFAbYAkLTGXqqp2ExyZwuwqFXsep9cTJ3T4htyLGnHqvGMQo+
	yxp3YQtRqJnoVdBqMtgTR6VToqgebKdujyUpu/sO4dEO5J2LYtQ+uiTktxizRlYHf32i2Q
	iLZOghzurnMkFAUmJ7ZydXRiP+bIbjWZKegyfdcA+Yx7t1cKP7XoYAsXM9L//fe0ps/YaT
	L8/6CxK4ZmkO1cfx5ki/Bwa4S1Zwk1+0vVq8ZwVkaVSRcNf22e0XYlR1OfKqNajPsiup9r
	fwoUoSnYuJ8lGZLqWkuozH7o3zQKrgyTbOQDOE+dDj+oBV072dnXSs7kkww+xw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 25 Nov 2026 18:50:25 +0100
Subject: [PATCH v4 12/32] drm/bridge: initialize chain_node list head on
 allocation
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
Message-Id: <20261125-drm-bridge-hotplug-v4-12-822722850492@bootlin.com>
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

In preparation to add a check to detect whether a bridge is not yet
attached, ensure the chain_node list_head is always empty [as in
list_empty()] since it is allocated, until it is attached.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/drm_bridge.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 76242165292f..14ed4ac52e71 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -419,6 +419,7 @@ void *__devm_drm_bridge_alloc(struct device *dev, size_t size, size_t offset,
 		return ERR_PTR(-ENOMEM);
 
 	bridge = container + offset;
+	INIT_LIST_HEAD(&bridge->chain_node);
 	INIT_LIST_HEAD(&bridge->list);
 	bridge->container = container;
 	bridge->funcs = funcs;

-- 
2.56.1

