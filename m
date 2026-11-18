Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795020788;
	b=l/5ob9CfR2oequ33lIMMSCymyJHCoIlv26qPeR9V+4QWnrmw7Pez66sLIVSrFnFYKRAR
	 DNg7gg3tKA4o9B1BRA2YxyTUMqFrCoS3wEoOjU5aGL5ZuSjraxD34jgLccuonN3thf6cN
	 wzuukyWg+K6YAMITwuWyIjUnUR/pTcxF06EgMX6jtMGZlBmJ8DMls4246fzL+f0T6Qsgh
	 PWBZVZedUe4kh6W5mLrO2eJXZ8iA1LDuzXW2CGk5xVeYKeZ+SZic/yDUXXcUZZiJ11Ru1
	 32NoTUD9dqdD0iukwb2zv7S/ht2tQHJ7HcuoBjcsIKEasSSRxPjQRXwD3KCRtSlx7oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795020788;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=zAeMH+m9bbuc4/9b5hVR3Zv1XPAgorcFNusL+dN/Jro=;
	b=u1UFXgy9TZSZvilHR+gZ5gceOrFhpBJAiEceYXUo8jPZmFBiRimTGUAlKLnCHk7oRy9D
	 EaJV+l7vsnZJTMKGp98PiZWjKsqlrjZcsVcsEXMAVCtxqv2oMvSW7U8u9dpplbFCDBc5x
	 m7v+dX5ArU6QyZpbJdG7DO6wSj4A9MtG0ijxUDGyPrUTAKbqyDN4DfkdmBP8kEXRpeZm4
	 5HiKojD4Y9tvNn0poRU5sIjr4CpfNFtnz7p1cdQidNrRRNN/ApIYDZJ2KezHKhKsARj82
	 Pp/ghB11XTQ5hkEXQYgtKiGhM4Xpy6xfNvGUMtTdW0efrAwfG61Tzyimh1zZD620ntA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=mvkFhNIM;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DB2606B587
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:53:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96DB2606B587
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=mvkFhNIM
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 23D55C4F77E;
	Wed, 18 Nov 2026 16:53:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3DE9A5FE9B;
	Wed, 18 Nov 2026 16:53:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9C1C711BC28F7;
	Wed, 18 Nov 2026 17:52:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795020783; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zAeMH+m9bbuc4/9b5hVR3Zv1XPAgorcFNusL+dN/Jro=;
	b=mvkFhNIMGZR8HN2aWke+n2DEjJ5DlPR9jmwQZCf8mnEOriEdPvaf4pgPLr3k+ARmb3bXS+
	sWPQI9K3PlVFaz+SqvNVho9YgBs9Ea/UFDlnzDmaDsdOX7Lqi7LmbnGqweVLvX5pmXomZB
	5QlIU7T51RRmcu4A5Xlv1XhdhLUVQ4/fvVDg/vfCv6G48yKY0DUHnIah/u/1CZL47xG8kl
	x7tLUvrjqnAxoz2k5Id6znYmdKOwDaZL6TkXj8i7tYOv1l8yjHwDe0bisHN/UQMpitk+n9
	3iGr+gZ7ydBEs4JhHAnvlkdCVKmkMMKLqt1FK83SFmenrytq3J5/1tZla+w0MQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 18 Nov 2026 17:50:11 +0100
Subject: [PATCH RFC v3 28/31] drm/bridge: clear bridge->encoder on detach
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
Message-Id: <20261118-drm-bridge-hotplug-v3-28-44bb3b4a828f@bootlin.com>
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

Attaching a bridge to an encoder rightfully sets bridge->encoder to point
to the encoder. It also sets it to NULL in the error management path.

However drm_bridge_detach() does not set bridge->encoder to NULL.

This will create a potential NULL pointer dereference in a following commit
(part of when introducing DRM bridge hotplug) because drm_bridge_remove()
will have to detach bridges attached to an encoder, so it needs to use 'if
(bridge->encoder)' to know whether the bridge is attached to an
encoder. For this to work, the bridge->encoder pointer must NULL whenever
the bridge is not attached to an encoder.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Issue found by sashiko:
https://lore.kernel.org/all/20261001131425.A001E1F000FF@smtp.kernel.org/
---
 drivers/gpu/drm/drm_bridge.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index a29f3e60bb24..ea7ed2c3bece 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -736,6 +736,7 @@ void drm_bridge_detach(struct drm_bridge *bridge)
 	drm_hotplug_event_notifier_notify(DRM_BRIDGE_DETACHED, bridge);
 
 	bridge->dev = NULL;
+	bridge->encoder = NULL;
 	drm_bridge_put(bridge);
 }
 

-- 
2.56.1

