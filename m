Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795778473;
	b=D0O080fJ2irBMWO0bg77rvISQ9i6AHlyQfYI3sFB7JRaldOpiuyHahxAzOGCap8NzKWQ
	 7ryNPi7gG1L4k0kRpnBrI6otxwk8+8IyInzbqY0yhCM5fzrr/uaii8tr9vLZ2d0525KXq
	 aW4mh3tHNdGNWpp0zUjj63WX4ByiPB44a6Wsdm3x7saZKDeJl9Z3XFRZ2M5y2Zrxv7Bk7
	 D2hWHo6kyyKnuBR3u1seFBH4kNk9faQttHIKiCMMaJVl3Oh4N3Bm2krCQkn7jGXD+byjV
	 96acL2tdrx2/1TgfD7xPJWJLvnIW4apymaWExkxiGZ5Yh8Mq/h4xR6Bhp2xRDEkh1KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795778473;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=Jix6Pz7UW5pobNRnrruUYw+ovR/f4EeQICu+13Oeqv4=;
	b=Meu0Wjv1c1YX8Mv+31onGDTzi7i1onap6n6FhoIQPRd8PPnxwseS6jKAu5piVyiWqAB9
	 nOkl5crlKZLFDFo5kVBo5EyJzxHQjw+dyPSgNdD6NW4wmOOkM9GpmPv3pA4Wj55M67Wu7
	 lfvHhL3z1ZUGxlHw7wS2hH7cOlA7KcMGhK67kNUSkzODdEKsf90rmK0jvFjZiNi/VXxMA
	 X2egCa90CowZqsFwj8KDi0VQ0GA2DrT08HkOyaPXUazT5Ps+qR5ICcat0VewP67+CUzqA
	 G45wmizZoKBYzNHLHHBSLCYWHxrmqV8h3NAK7h7RHg+UuYoCRBjh7H0i4b3pQ+HDv8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=djKR8I6d;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CE5606A335
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:21:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9CE5606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=djKR8I6d
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5F8301A1834;
	Fri, 27 Nov 2026 11:21:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2E4566049C;
	Fri, 27 Nov 2026 11:21:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CEE4311E69318;
	Fri, 27 Nov 2026 12:21:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795778469; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Jix6Pz7UW5pobNRnrruUYw+ovR/f4EeQICu+13Oeqv4=;
	b=djKR8I6dFfVi4JSDL2RujtjcTL3aNWdXrGLhBE04WDhnsnKieD252IL0pu7TXKw3XL49+p
	8jYWdL9u+zaBaOpiRqnXTA1YiMbBxOM5F3QIodkJDvWzVl7CqMoFxudUyTjE2OH9N+d/Px
	yd9SBXbSFZk4TAbna76F149P+//VsgKKnC4IELxkluAAyLnPUj26dGI/U+hpxOgQfrNdsz
	7yqgptijrUiuxx+sYdHTUgowGaknln2JiWNKbV0p3/GiDFmFZzFZDUOxZZAO1qgdpl0mWa
	b5hRrybkZO5YYwHzdKhWw1NObuaMWkgcE/d783xXjAhh4P7mpbb250KRKRct6Q==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 27 Nov 2026 12:20:37 +0100
Subject: [PATCH v2 2/4] drm/bridge: ite-it66121: simplify getting the chip
 IDs
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
Message-Id: <20261127-drm-ite-it66121-log-probe-errors-v2-2-dbe9b5a3c5df@bootlin.com>
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

Simplify how the vendor and device ID are computed by using
get_unaligned_le16 instead of open-coded bit operations.

While there, also store the IDs into variables and log them for debugging.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v2:
- new patch, split out of v1 patch 1 (Javier)
---
 drivers/gpu/drm/bridge/ite-it66121.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index 8bc96ef006f8..4642a32f1bd0 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -1573,6 +1573,7 @@ static const struct it66121_chip_info it66xx_chip_info[] = {
 static int it66121_probe(struct i2c_client *client)
 {
 	__u8 chip_id_regs[4];
+	u16 vendor_id, device_id;
 	u32 revision_id;
 	struct device_node *ep;
 	int ret, i;
@@ -1646,10 +1647,14 @@ static int it66121_probe(struct i2c_client *client)
 	revision_id = FIELD_GET(IT66121_REVISION_MASK, chip_id_regs[3]);
 	chip_id_regs[3] &= IT66121_DEVICE_ID1_MASK;
 
+	vendor_id = get_unaligned_le16(&chip_id_regs[0]);
+	device_id = get_unaligned_le16(&chip_id_regs[2]);
+	dev_dbg(dev, "vendor %04x device %04x (rev %01x)\n", vendor_id, device_id, revision_id);
+
 	for (i = 0; i < ARRAY_SIZE(it66xx_chip_info); i++) {
 		chip_info = &it66xx_chip_info[i];
-		if ((chip_id_regs[1] << 8 | chip_id_regs[0]) == chip_info->vid &&
-		    (chip_id_regs[3] << 8 | chip_id_regs[2]) == chip_info->pid) {
+		if (vendor_id == chip_info->vid &&
+		    device_id == chip_info->pid) {
 			ctx->id = chip_info->id;
 			break;
 		}

-- 
2.56.1

