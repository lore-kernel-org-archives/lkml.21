Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795778475;
	b=eEBPmTVpsv0sQHoComAcz9wLLxSW70D/hmw33STbJQrCFs0OVUJSaPyY3pVoQdL2EXLj
	 o1QHoiSRU/xUjOoqAzQJjle9ppNqikASnVfavj+bAvi3RMxysJ3EuzFkCl1k7WlyqGQX8
	 uDea1uhgiDPeTU+L5hXwhZ9RsEyr0d2s/Pl4SF1lterAG4xE+RsZnIsl8QqN0u+nPRSoV
	 8Fbgw4kutW78dUGmpnDXFOlx58BCJ38yXbILdx8hqb6hIqwUcPRyyQJe3c9yO6DtUbNd8
	 p6x5507OL3SQwQa92ET8W7u8+t6lwsWrsSaPhWQ7DbHWMsbdGlB364zPlijm0/0lIbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795778475;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=nOxes14wQRCie7+aKqzYUwuQPRSHdGILYH8KNpmcKRM=;
	b=yFKIprm1Aol480p/M8IRSSBB00RriWg5MQFu7CEO7UF6X0/Bp55/d+xGiVrUZKJL87LQ
	 IDrdOMC+LMDeHBm5HMWazKLA2dInXcDWE67XFccQedbjJpC6QBclmuAOv8Rq0M1wWDUQ1
	 XD7mwI5oEb4alvuwpXkrFMSSXsy110Qk3xgVNQYxKj1oTKtYMPBsn/FJgXFvZgA6xF0Oy
	 1m9vzkT5zHOfLKXv0bKyYnqzZkNwBUOuLxp4LhCNLEs9b4Kq1XWGaNxIcXhzSzWTCGrIZ
	 FGKaMyCwakSwAAznTSouBtYztySq72j/bEiYoqe2aEumSF0Y5JrTLPCxT7aF9oWi4Cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=LEXBSZ1w;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8B9606A330
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:21:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A8B9606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=LEXBSZ1w
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 27FF71A1832;
	Fri, 27 Nov 2026 11:21:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EAB626049C;
	Fri, 27 Nov 2026 11:21:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1A1B911E6930D;
	Fri, 27 Nov 2026 12:21:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795778472; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nOxes14wQRCie7+aKqzYUwuQPRSHdGILYH8KNpmcKRM=;
	b=LEXBSZ1w9hzu5mqA6pG1zvEQXX3/Z9ZRXXob+dTjKM5UC0O0xW8QlZACuAYzG7x0H6vXEd
	l3XkU6zla7WMYOtn427eATARnIPUGTCu/z66VsRZo00Ha/M/IcFqrfZxVyTlXQmf9NYmSC
	+10aWmi80VDWXhXnLyzE+l8vfCY+Er8cZr/V6sQpmcwp0Iv2THdumm4SFE4obBK6yROIuD
	RTj6XCA4g3hVqnnMyoexUXuPLKolzd09jmOHtD+pipHZAYv9o/FZkd5dRxHuiE8LWEO4Wk
	Tl1gy0vQxwAcio7eoixbaFcftYbBqP7gRJwsgQKlpB+7qWUijTugY4qGWFLeOw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 27 Nov 2026 12:20:38 +0100
Subject: [PATCH v2 3/4] drm/bridge: ite-it66121: log an error if the IDs do
 not match
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
Message-Id: <20261127-drm-ite-it66121-log-probe-errors-v2-3-dbe9b5a3c5df@bootlin.com>
References: <20261127-drm-ite-it66121-log-probe-errors-v2-0-dbe9b5a3c5df@bootlin.com>
In-Reply-To: <20261127-drm-ite-it66121-log-probe-errors-v2-0-dbe9b5a3c5df@bootlin.com>
To: Phong LE <ple@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Julien Chauveau <chauveau.julien@gmail.com>
Cc: Paul Cercueil <paul.cercueil@bootlin.com>, Nishanth Menon <nm@ti.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

If the IDs read from the chip do not match any of the known models,
it66121_probe() fails silently, making troubleshooting unnecessarily
difficult. Log an error to clarify the failure reason, showing the IDs read
from the hardware.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/ite-it66121.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index 4642a32f1bd0..596c31f3d5a9 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -1661,7 +1661,8 @@ static int it66121_probe(struct i2c_client *client)
 	}
 
 	if (i == ARRAY_SIZE(it66xx_chip_info))
-		return -ENODEV;
+		return dev_err_probe(dev, -ENODEV, "Unknown vendor %04x device %04x (rev %01x)\n",
+				     vendor_id, device_id, revision_id);
 
 	ctx->bridge.of_node = dev->of_node;
 	ctx->bridge.type = DRM_MODE_CONNECTOR_HDMIA;

-- 
2.56.1

