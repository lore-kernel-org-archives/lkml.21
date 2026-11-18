Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795020682;
	b=cuZt18R9T0tpV/pWumtsjMHDHRh3BKvW3Dq0OPuoR85xMi0Vsoag/DicCyImd43V2lPD
	 J/7lptPwL2gIpRhfKrHoOzLYi0YP+dyZ4WxkDtWTD0G1K4s3rcuLCkoGILdH/isi25+3F
	 Ty7xNEd2Z0SIxRo3/e93EnIFPU6H8vF5fD3dXWLe7zB0Xf7Q/UV+krqbFyUaWxpNsXO6h
	 /cTAUST4oI8aPQsF0vvLbAs2/i67qTiwyAi0N+icaewvMTIGtqzFHuwj/jli9NJw3WnqJ
	 gXzlB1vYcl5VkaF1VGSdSPLcjl9bYPufenF6Lo6IJPC7ycDAKq/ZKxAyTc8m9MbW6YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795020682;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=JJaj1pzguVVi4wrbJ2dUOb481zjC5mrMJwQIMmLcnGk=;
	b=V9Q+kxCj2n45V+EsqR2D/58gImN11P+mc132Nt0JIlJv7WvlCbATXxB7CmybqEyLKxfP
	 AkxbqSnEDDD4jI6ssNIasH2hKTpqkBiJSBpmxpB7gzLV7Wv1vmp0N8x55+slr7EH5K6zQ
	 WOSg3SSIK7akO2LBUsJmKcDTSAppGIxH/2dkziygxKj+Sm1OUODV+C4wu+JE4P2SiDIRL
	 VkWes7cRj0hHeN7M8YB9msPSI6Fyjbsv3yYt0Qx9lrbNkvWLOBSjki1t/I27aLzob7X5R
	 PDX4MYv/cXVMV/td49H50iUGwJKr3eXBjPykixzHqIt8F5Fvnk1Q+z/zry7n9Mt9pRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=runb4UUv;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC29A60A2600
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:51:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC29A60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=runb4UUv
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 886EEC4F77B;
	Wed, 18 Nov 2026 16:51:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A08E35FE9B;
	Wed, 18 Nov 2026 16:51:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4424E11BC27C2;
	Wed, 18 Nov 2026 17:51:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795020678; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JJaj1pzguVVi4wrbJ2dUOb481zjC5mrMJwQIMmLcnGk=;
	b=runb4UUvjNlVAxag3hTrCWwUr7Nn0+edq+cZ7iSkzlkYJlWKNZf+KlFIBXgUzmRz6t2rrQ
	idcH7iMeoen8Dny11WTbRaz2yp22n1p6FVWWiOzMUvZq44kZmw7dAvUNNSf9WL0n8HcnW3
	hSq+s0Xjd0z9uhc0s6W/RMaSz+2p+O7TaXGiQOxrTYYi5rB8mqP3muGhFbOT8yI7MskaR9
	jzLuhjHjcDgxjxH/ThYypeUq3Nq1thYaFrP8xx+3Zd7JHhPZEsMqO/esnxT2O1qdukWGaz
	s/F2ahm6yF77p6MGIzFfNkCq2RbFrwxiL/2mpp70inU1u3Ri3LXcVQx4CmTj5g==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 18 Nov 2026 17:49:54 +0100
Subject: [PATCH RFC v3 11/31] drm/bridge: constify
 of_drm_find_and_get_bridge() device_node parameter
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
Message-Id: <20261118-drm-bridge-hotplug-v3-11-44bb3b4a828f@bootlin.com>
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

The @np argument does not need to be modified. Similarly to what
of_drm_get_bridge_by_endpoint() already does, make it const. This allows
passing a const pointer.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

New patch in v3, needed for the v3 code of "drm: drm_hotplug_helper: new
helper to implement bridge hotplug"
---
 drivers/gpu/drm/drm_bridge.c | 2 +-
 include/drm/drm_bridge.h     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 6272513316cd..92f47dd962fc 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1648,7 +1648,7 @@ EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify);
  * RETURNS:
  * drm_bridge control struct on success, NULL on failure
  */
-struct drm_bridge *of_drm_find_and_get_bridge(struct device_node *np)
+struct drm_bridge *of_drm_find_and_get_bridge(const struct device_node *np)
 {
 	struct drm_bridge *bridge;
 
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 1981d24a700d..c88532998aae 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1272,7 +1272,7 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 		      enum drm_bridge_attach_flags flags);
 
 #ifdef CONFIG_OF
-struct drm_bridge *of_drm_find_and_get_bridge(struct device_node *np);
+struct drm_bridge *of_drm_find_and_get_bridge(const struct device_node *np);
 struct drm_bridge *of_drm_find_bridge(struct device_node *np);
 struct drm_bridge *of_drm_get_bridge_by_endpoint(const struct device_node *np,
 						 int port, int endpoint);

-- 
2.56.1

