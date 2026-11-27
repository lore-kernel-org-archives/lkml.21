Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795778470;
	b=XZkVZpE+teE/yDQRgcyGnqdZr7b1rSr2+PAobqfEcvDs0dkZ+6a5xFySIuNDWaJ6DNOI
	 uBlPrjWs9hCHGe3w+j4usWJpEKunryEz7YIB6I/ivI7RqR0iQjEPBaoKhdkhhyAo5VGev
	 GyGY1UUmp2YXQNu6oCS59aindWkmfvoEGQav9qBvhhPrMSdyZ6BdB3cccqvS2KP0ZkTVn
	 DdVTh8tua4SIjG5V77Jda1XVothKb3mnT10vBf1E7sXkNCAgMsxqJl8sLa4JL4h61FBgl
	 UpXC0XoiePrbsAjqgj2+yhT9hdzn6OFS+1I7FZXX7QthcsPs4BJ0KPFaHgutQeRPYLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795778470;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=FGZYTUh9Dnh9HZb1Mwnhgv50c7gO4reBCDDbaHESy94=;
	b=V0OVxWAQR/U8klzwIIg9tTr5l7mTZ+o92csiYOwDtGgKomZLc7TUfmM/xm/aMdeG6BFf
	 SGa2tOOZ2at/3F+AutuEJh3MjX6FIyQsh8WZaQgg01TvUF4AQx9YVxzkkm8KLnxyTtbZj
	 3YyzWZDmiYjTWvXppuVmwjp09rpzY6Mgtu95lxjt6+stPC2zSLghallgyMYLPwl6E9cbj
	 VJH5didtrzN9sDCduZWI/m/3dq/wjSulPb9QIvJKPsLCfNtjROBE1CKOWdV+wYJ5XROmV
	 r4FjtTfjL72rXuDguRd38lD4WCLwJy0NsxSzsPJH5S8EDyeO0ajm8HhjVy6gjdZZjCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=uq2ifurF;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968CA606A32F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:21:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 968CA606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=uq2ifurF
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2F6ED1A1833;
	Fri, 27 Nov 2026 11:21:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 054726049C;
	Fri, 27 Nov 2026 11:21:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1B00311E69316;
	Fri, 27 Nov 2026 12:21:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795778466; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FGZYTUh9Dnh9HZb1Mwnhgv50c7gO4reBCDDbaHESy94=;
	b=uq2ifurFDt+OWR/OdzOTiiONHUMO3jkrjLeTYLU/+VbPV3vZAXktNr0/4VGvIyLVV6KE2Y
	p4jid0jXBhthIHqKD0643ssYVPID5fh8Js1KOD6o+iESR7UgZ9NqkH9vhNTm/jRQC2wMqJ
	YdsHoAKhGjTWQuA8lXBwJbXO0IFeFYVjR0ZLzt1lWhQwyp03FaNBTOFy7D1pXxgWz218cT
	vAIFungOmLKFZHLk5MWBnu6ssCNrVAZylZkhSKkms1hm50/xoq6i930jicIVYV0Lp35guC
	DpV420BEgeHvd9o0cFlo1O2Q+9v6MLq2JCFzpEmzhr1AL+71YsPtZIELTqBTuw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 27 Nov 2026 12:20:36 +0100
Subject: [PATCH v2 1/4] drm/bridge: ite-it66121: check for read errors
 reading IDs
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
Message-Id: <20261127-drm-ite-it66121-log-probe-errors-v2-1-dbe9b5a3c5df@bootlin.com>
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

it66121_probe() calls regmap_read() four times to read the vendor and
device ID registers, without error checking. This leads to silently
continuing using invalid ID values when any of the reads fail (which has
happened and is being fixed [0]).

Adding error checking on all 4 regmap_read()s would be annoying, so switch
to regmap_bulk_read().

[0] https://lore.kernel.org/lkml/20261105-drm-ite-it66121-fix-reset-v2-1-02039d66af29@bootlin.com/

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v2:
- Use just a u8 array (Javier)
- Split v1 patch 1 in two parts (Javier)
---
 drivers/gpu/drm/bridge/ite-it66121.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index 34302db25a8e..8bc96ef006f8 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -1572,7 +1572,8 @@ static const struct it66121_chip_info it66xx_chip_info[] = {
 
 static int it66121_probe(struct i2c_client *client)
 {
-	u32 revision_id, vendor_ids[2] = { 0 }, device_ids[2] = { 0 };
+	__u8 chip_id_regs[4];
+	u32 revision_id;
 	struct device_node *ep;
 	int ret, i;
 	struct it66121_ctx *ctx;
@@ -1636,19 +1637,19 @@ static int it66121_probe(struct i2c_client *client)
 	if (IS_ERR(ctx->regmap))
 		return PTR_ERR(ctx->regmap);
 
-	regmap_read(ctx->regmap, IT66121_VENDOR_ID0_REG, &vendor_ids[0]);
-	regmap_read(ctx->regmap, IT66121_VENDOR_ID1_REG, &vendor_ids[1]);
-	regmap_read(ctx->regmap, IT66121_DEVICE_ID0_REG, &device_ids[0]);
-	regmap_read(ctx->regmap, IT66121_DEVICE_ID1_REG, &device_ids[1]);
+	ret = regmap_bulk_read(ctx->regmap, IT66121_VENDOR_ID0_REG,
+			       &chip_id_regs, sizeof(chip_id_regs));
+	if (ret)
+		return dev_err_probe(dev, ret, "Error reading device IDs\n");
 
 	/* Revision is shared with DEVICE_ID1 */
-	revision_id = FIELD_GET(IT66121_REVISION_MASK, device_ids[1]);
-	device_ids[1] &= IT66121_DEVICE_ID1_MASK;
+	revision_id = FIELD_GET(IT66121_REVISION_MASK, chip_id_regs[3]);
+	chip_id_regs[3] &= IT66121_DEVICE_ID1_MASK;
 
 	for (i = 0; i < ARRAY_SIZE(it66xx_chip_info); i++) {
 		chip_info = &it66xx_chip_info[i];
-		if ((vendor_ids[1] << 8 | vendor_ids[0]) == chip_info->vid &&
-		    (device_ids[1] << 8 | device_ids[0]) == chip_info->pid) {
+		if ((chip_id_regs[1] << 8 | chip_id_regs[0]) == chip_info->vid &&
+		    (chip_id_regs[3] << 8 | chip_id_regs[2]) == chip_info->pid) {
 			ctx->id = chip_info->id;
 			break;
 		}

-- 
2.56.1

