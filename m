Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795020664;
	b=jppl3Urz1DEr+w5VPTtI18lK8cTojHO50MqOS4d76apcckmrBcFOB7Qnfgkjm26aV+l3
	 up00mk9aA0Y9q1/f/k2XsAdPIKI5NgDfHEX52didKTWYeHqpMzw96mMN+3euIBXpG+oip
	 xhW9GHonm86ehhI9bewDaCj53aZ19zvKXdUuAHvYTYSZRwykBPWD1y9ZoJjB7OwOH0ztA
	 ijiP7B0Iy88xxLpzz0OKosV9o75MAh1dBG0leeZVCNJNF74JfBoVPrGu6ZIQ7cVmEDI0c
	 ubLu4Ton4aTCMsaGMg8KYk4Bs1NL88425/ZwZvyvXAf667qgkfO0SJiCtRwI3uAQl9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795020664;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=xMDGdQQqSK1PYacGJc8PKE4CVLn0Cepep5ypo7GFAAg=;
	b=w825NHa3SRjMjO8jf1jB4VuiWMPHg3Jb4iQBcvmz9lwnBxng1nzRjlNvi3RSNL5XLyJQ
	 LjAzg/9ruxHWMT3iFjbfTmy8fVo8rbLjsVrbBNER08gjpc1WDamToheIiTdVgqC7t5Rzu
	 KUTT2NQBENLkkFi9iQ8AwDnS4QnDD2yk3Cm2o6jr3JlNT1geGm6nM/A2cLFN/ZpniaMuJ
	 QTYmnXzRlYZQTTqxjrpcvEsDG520y2WFlhwl+RDTs0Tv/pEbmIRt/7DZSEvmlYLxW7XyZ
	 ZbJ/hO6chs8cvcNV96x+lVoJlBvT2GpC5Ai5rXw62OQI7s2D4OxP3eMHxbj+e9Egq/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=pqNW5zsl;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E33E60A263F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:51:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E33E60A263F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=pqNW5zsl
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D480F4E40546;
	Wed, 18 Nov 2026 16:51:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9BA7B5FE9B;
	Wed, 18 Nov 2026 16:51:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3BA6A11BC28AE;
	Wed, 18 Nov 2026 17:50:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795020655; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xMDGdQQqSK1PYacGJc8PKE4CVLn0Cepep5ypo7GFAAg=;
	b=pqNW5zsl8ZQ5lcZuQt5/FjlGuooQvzkr9GHMqaOBYyJxRMuQI7bwN4mu0wambTvDRR3Heo
	J5mp/T8C2UV8k/9YPgh6fP1fI1VCqdBS9Ou9vKt/yEVeA0CJXw+VH/GY9xhbAYD9aJU0za
	54/APJSdXIGrmRHaO5uKGKVHt6YLB2liEmfJzgQTW7IhOrX2OPKvx7BvC/+lGO+Q1QNMZj
	nGa1zmbhMId5S5TejKF3Q7eoDx0Qr0NY1LzjzGCOUxJ3zhNrsagZHrBr3VSSfDAPh6zBEA
	qFvVQcuT7eoe8aLs0I5IJ64mWNSN7JUIQDk7DGPrrU1WJkd4sKehAYD7S2NIRg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 18 Nov 2026 17:49:51 +0100
Subject: [PATCH RFC v3 08/31] drm/display: bridge-connector: hoist error
 management to common code
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
Message-Id: <20261118-drm-bridge-hotplug-v3-8-44bb3b4a828f@bootlin.com>
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

In prepataion to add more error management code common to the HDMI and
non-HDMI branches, move error management to be common to both cases.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 19cacae617dc..f4a71801e8a3 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -1057,15 +1057,13 @@ drm_bridge_connector_initialize(struct drm_bridge_connector *bridge_connector,
 					       &drm_bridge_connector_funcs,
 					       &bridge_connector->hdmi_funcs,
 					       connector_type, ddc);
-		if (ret)
-			return ERR_PTR(ret);
 	} else {
 		ret = drmm_connector_init(drm, connector,
 					  &drm_bridge_connector_funcs,
 					  connector_type, ddc);
-		if (ret)
-			return ERR_PTR(ret);
 	}
+	if (ret)
+		return ret;
 
 	if (bridge_connector->bridge_hdmi_audio ||
 	    bridge_connector->bridge_dp_audio) {

-- 
2.56.1

