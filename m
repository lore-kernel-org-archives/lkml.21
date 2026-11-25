Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629143;
	b=SJUbZGswE2C+FvWhgFT0SkUfVSWnOFgH9rj22GzbBJ/5V/Q9dkLnHkxufTsMikUPok7g
	 4otRidDJpdEhjpQo41dcJ2LGIJCdtI7dsKBNW5aTJ1lOvlc+VmE3iZJG4YftRmBisPJev
	 EES3CVSjHPTa1Q/PfHSoWkhgM7hxavG9bKdlAMvUalT7Tku1ZidoN8dRVumqBpLf1ZxaU
	 UeN1GCzoxkr3eK3kwl/0sBJVbT12kRJBVpyjYH6dIRYRVFDxYDqIQa7EUv5Oprw2u5MfL
	 KQYQD2qNBv4hInnUOr98A9sCr861waDsjz1ylMemBbBu8tvP6RQmwb3v/P46EjVg1kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629143;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=1DxMNbouVynawZta17OcaCgH7VNF6J/H0q5Ot2fi1p8=;
	b=YUsZEUHbYRx0uvxcBDiSGkEgVtkRXkxuNFB8kfpxuP20sblwhOV+qIbCECA2KogGTSHw
	 os1o4rvfrXBFXH7aciDSgcIpfXxW8/X/TbHwJV9Wk9JYdi1VWFTBwuuBsCt3stFaJx+uT
	 v6rdXvDsmGVxYmuDFkuRtMO5yutkVFtGqlutNTtPkEGXTx+1hw7CyMLz9E4Y9fsvmielC
	 9hJiKQzgq4BoghadN8jAKkx16uBbWto0ijfdNCC0KhCdsnnSSAwZxIxj8OUF30V01ZqTP
	 2FqsZiskdIYNM5CVh+Txzk11w7hCZ4yqieIshn7+bq16eINvN8YSq2c9Viuqs4ZaRWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ijCcDjVV;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DE9606A329
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:52:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9DE9606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ijCcDjVV
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8DC95C6221E;
	Wed, 25 Nov 2026 17:52:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 94DF060480;
	Wed, 25 Nov 2026 17:52:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9706311E6B0D0;
	Wed, 25 Nov 2026 18:52:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795629137; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1DxMNbouVynawZta17OcaCgH7VNF6J/H0q5Ot2fi1p8=;
	b=ijCcDjVVGumRXpuzom8IfVaX/I0PgOEt2m6cbluiKfknSmeVG6v3LSPqLdimM51uW3ngN3
	S0DpV16kGFKxLQ1sFQP0b8C9wIObnHFXem+clamSwZiNSL0qeFPo1MB39/zZVNXUojWdge
	3UT3eZYXLICVPKmXnnv4fS0ZrODq/A9qwxNgvbqVHZiLADLyHRmumPtIbKettb89nSY5E+
	HwNqx/wibHKXvD2/0VbDKrJtRMIf6WTA1LohmIIkpY6vawENGjrPxGY+iE0c9JSRiykg/5
	PVZXf9SOCqi33cWehEemmwrsczRQgoaYgqrfPJLEm5k5w6u/r7z/l7RptGjALw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 25 Nov 2026 18:50:26 +0100
Subject: [PATCH v4 13/32] drm/bridge: initialize chain_node list head on
 detach and attach errors
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
Message-Id: <20261125-drm-bridge-hotplug-v4-13-822722850492@bootlin.com>
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
index 14ed4ac52e71..310f03bdb744 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -679,7 +679,7 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 	bridge->dev = NULL;
 	bridge->encoder = NULL;
 	mutex_lock(&encoder->bridge_chain_mutex);
-	list_del(&bridge->chain_node);
+	list_del_init(&bridge->chain_node);
 	mutex_unlock(&encoder->bridge_chain_mutex);
 
 	if (ret != -EPROBE_DEFER)
@@ -709,7 +709,7 @@ void drm_bridge_detach(struct drm_bridge *bridge)
 	if (bridge->funcs->detach)
 		bridge->funcs->detach(bridge);
 
-	list_del(&bridge->chain_node);
+	list_del_init(&bridge->chain_node);
 	bridge->dev = NULL;
 	drm_bridge_put(bridge);
 }

-- 
2.56.1

