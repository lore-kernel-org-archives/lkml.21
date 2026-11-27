Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795778479;
	b=KVzpXcob9tG6UdWqas1Jhi1uXEdlTx63a8tybpE+UOztZWqNmS8ILw2j8elOU8/PLzLM
	 i5oYCXDdtcEdl/RQ17glfqcfdCE+2MCzHE0cSdw0nLIk5mUbVWx+nhIFPfBX8bMGf62wq
	 65y0+sGKS5vejeHutfpTLBzbU7UJXLPfrdZDfBFMGWOzos2cAFwVIa8h+s5h5omHu+r+6
	 jwwNovzEMa/NM3qqZNhgwgeidCXFvg57IfgMM0RuFoyxkHSEfBjAPcYCMnFjOfUH03M/g
	 vivDcf+Qw9TqShEUuI3AAXZboE4RUBo55mY2OC/jvajekRMZ2NBnfyrkNuHvJgGm7Dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795778479;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=wyuSxlsNtZdzS2kMPgy+yUGqxcXiLdY+DvJIUECPPNQ=;
	b=z2xTEWOyM5n84GpzRLZCeyImu8IeueRnzaKlbgrxPpdJXAW0OKFDHoeCeGXZh5jEAPTU
	 axavAr/AnN3tfQlkAX7Khu/Z2XLtveEHimN79lBJZF7+SYKW8S3jPh02Omtu8Vg55BWtb
	 Nt5r4HegJIV+rt9jr8IkfmzE9CBu7sao20Nj73n5lV3LqRQPbIGfxo8Ole+fs4elmp33y
	 2AUP0FRamxOKYBEXe7bAoN2WLO9nu8oMgTERmUO94+1zZ4M2N89aV6n8bNlCre/lxrCKe
	 h1uZyWA6r67h5TT8Y2lj8USZJUhCl68gfgslixCI1dN18UQ5eJzjZqpAQA4D64gzc3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=cbY3bcGy;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18FAB606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:21:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18FAB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=cbY3bcGy
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4F97E4E417C5;
	Fri, 27 Nov 2026 11:21:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1B9D86049C;
	Fri, 27 Nov 2026 11:21:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 006EE11E69316;
	Fri, 27 Nov 2026 12:21:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795778475; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wyuSxlsNtZdzS2kMPgy+yUGqxcXiLdY+DvJIUECPPNQ=;
	b=cbY3bcGytC6uR/qaoGG2WYulJAKU1kZd2N+BTXLtGwH3o2JIF/vwZ2E9NOwbBQ/bc3AndZ
	N5gXCGPtvV1wEG6JD80jXnidLCDU8qFLIf9K+tuYvzdKVdNW7N823kUZgZsai3saVsK7iZ
	mV2s+sbmCuTW+r/FV7K2Q2/vh5D+G6v2yma0/adHU5dC5dKzel1g02ClP2ela0DfDQdVss
	aOMD25CPOL2ynktKwZH0ojnrZEAMuuvCAcQKK4xeDK70NkqDmI+r23eLAppiYMVyUBK5bw
	7nVZAPkZI/PNiyX6FWSZ0daHFhJlh0a7Kx/hfVNbfuvPBaA6tsv1rMuw2doAqQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 27 Nov 2026 12:20:39 +0100
Subject: [PATCH v2 4/4] drm/bridge: ite-it66121: make successful probe
 quiet
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
Message-Id: <20261127-drm-ite-it66121-log-probe-errors-v2-4-dbe9b5a3c5df@bootlin.com>
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

When drivers are working properly they should be quiet. Turn the dev_info()
into a dev_dbg(). While there, also make it more informative.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/ite-it66121.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index 596c31f3d5a9..d11f947e33b2 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -1698,7 +1698,8 @@ static int it66121_probe(struct i2c_client *client)
 
 	drm_bridge_add(&ctx->bridge);
 
-	dev_info(ctx->dev, "IT66121 revision %d probed\n", revision_id);
+	dev_dbg(ctx->dev, "IT66121 vendor %04x device %04x revision %d probed\n",
+		vendor_id, device_id, revision_id);
 
 	return 0;
 }

-- 
2.56.1

