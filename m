Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794949259;
	b=bks05xb2LogGszh5I4nzIFv8yJ9atMTHDVAYR49QSWwwI57Nglz6d8Mh+wA52QJbgJb8
	 TZwhb3zHBrUvYRsv/u2kOXrEcqR1Bzk3eQlDCQad/rNjXXT2MJ83Iviet0+A+HFCDJ8o+
	 GgW7Gpt3iZRa2aj4M58FsDcg7jvSggeK1Ah16Y1zerMjNNse4YEKZa75fJCA1V8F54IcY
	 yWrI3AbVXh6tOu3yL2enMQ+UQsdHGf4gL5KlJQVglFS4cI1okN0hUlalJ3sN7U191D1dP
	 j57LTK3InIWHwTPF0uFyVsptTasxQGYJ1OuSxm8G6CVXMqWXSEbDrYLN+Dh/c6DOcLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794949259;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OljbLO0o7fbYwnjA2PLLGVcm6yo2I+s32YKKod0cYck=;
	b=LsmvWjsAOyKetr7fA2hAOJ/hR4rLJRCRNqITd6nQmiy1xgEA8QY68/TfbMSnJjTJxUhE
	 m0bvKc7zQERnFS8iwWkEGHKRR+84UKI1T7SxjmqgekLOY+ZWf9JU98Gf3g+qejbLbaeDS
	 0okLfY4UtuNA/uxYcRu+3omtV4Dn7k6294wI92Fs94CYTbljCc8D6M8sMiBcy5lTsIeQY
	 sRbIViiH+7anwYDgfZALPEbB4TVey3+LjxojLkPRCfgeodNS4pj1i47U48sF03hMr8/Ae
	 3lf8c6PnmaFdEMyv1pbZt+hzOeWqs2T2/kr9Tx2l/tIK8kN1RlHFppu2r1uXnJREksA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b49oL8W8;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3898E606A332
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 21:00:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3898E606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b49oL8W8
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36dbde64409so635357eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794949258; x=1795554058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OljbLO0o7fbYwnjA2PLLGVcm6yo2I+s32YKKod0cYck=;
        b=b49oL8W8FqzeE+bQSSsInysA8frhrELQnV0i60xadrcJDUVIpJiD8giu+Xbedfatrm
         +6WdTlCZNF2bhlt4+n5XJ4yFOumP5zu0g590gfTBuLxIxxI79QH4/VLeVWEbpOxZy3aI
         92J8qdKu0eBSHDlEn/VgSzQSGUESjn9VL2EH8b9eAFfCKk1il7ht/2dH9pO1DhdsgGK7
         qZGzxca/+5U69lcgxbG+ZjiVoox2SuxFTSBOju7jH1VkCIKS73KjSO5T/+uCaty+JDZV
         JkhfdeKVzoDPU8g2IXbxhgrdCfLCkEkMA0U+mFNJMNWQHXNG16Ig+bbmvc6OCqW6mJtc
         PNbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794949258; x=1795554058;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OljbLO0o7fbYwnjA2PLLGVcm6yo2I+s32YKKod0cYck=;
        b=2sap37NhANhbSYKcVwA6THMtz3Kue+D7DpxIZcE70Wz4kp6xqmQeoq4wxIZMAgyTYL
         9RnReiOfnQ9sNr5R339wbKWlCx8gIpfAFtKgl03fOMOId56yLCrFfVcY1VFldCKIb5LG
         V9Dv1suFvFZuyHD41koRGGuduCTojOnIqzLnw4oJzTyXzDUnIA2s3ThfLFxZy43nSelq
         6uDZLMjxfVfV2HvQqx74G7Y/pW8yL8UQIfHUDPonkRR19YPtqRG/TbSCd74wnfwKzgin
         lAAA2L/I4FgVKo4/ogdbUvPihEpFwxP7Y3X433OmEVyBvvLGCNw7QSZbcAIu+d/nYIuW
         wbPw==
X-Forwarded-Encrypted: i=1; AL+hErFGWS32OVAaHmQUR1t5iFZ614fWgR0w62OMTeD7MmoyNJZUCkA8GM/BXyQDwEMZvw+UdpGJpXXoE1qu0dE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9b9aMkeFi+VEW7V19FRpaJaRMOBG69uDrySna54rAJjMh/M2Uf
	wnlMAnihOS6ylnZ8xvW1Ka/e+J/S4kWCcWpK7FBH/m06dRSTfeDplOAtCvYrhyN6
X-Gm-Gg: AZFdTZcFGRFQDnm1YnmCXV3GhFTGJ7+jAMPiui+W6PbgMSssH5y9iBbRLC4WxJQBghY
	nttxwb090KJIOjqw9MTYxhLyVAYQ4YywcH2SnardEYRY4pKjFF3Vd2iB0llEPVpkackEcIY5q6m
	WAG+5x1KPu5l0mE+rF0bO5xADDzzkrBhq4f7aXtl1yeM31620WsxrS6aVCbwIbMYL43QcBk/rqw
	/DzLqPhYiHxtQQyhd8fKnq/7XpbU7RAJbKzhMxOgiooTFqipa1rX2+ztePEHHtpPOEqBjCvMJGX
	+SEhH3n+m1ElkItmoTQV5QVkai/QFddFxCwMi8ohb9rxwo3qT0ndPw3JrB/YTYmNc8GkseW24DJ
	aN2/7pb9vDNUyKT2Pp+5bJC8FJAhnhxBs5LnGVy5ulVH4Sh+qcNAuQJ6V3x/l05WrieFo1we28U
	ptFoSowEL2kfDUvM93n1/lp1e5wWyq5X3ftCNMwonNOmyBoRwitDgv/nowD5sVRVAo639OHCaET
	nLWgezskGppUShZ+4wPobUHF1MLi4BEZMFhKKJRt4XLapa3qM9KakpPVlpQCBd2Io308IWhTZEL
	Aq2gCW96ZBJzRjOb4SQjRytB/MmzNG9n8RHpy/vNNqldnGywemk+WgOJMShDYNRRktY4Ra2Dy6m
	ryimAVhPB1KP25tFE
X-Received: by 2002:a05:7301:4712:b0:35e:f4ac:5f8e with SMTP id 5a478bee46e88-3827a312061mr456032eec.0.1794949258014;
        Tue, 17 Nov 2026 13:00:58 -0800 (PST)
Received: from localhost.localdomain ([136.126.251.209])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6800338sm665842eec.11.2026.11.17.13.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 13:00:55 -0800 (PST)
From: Henry Zhang <henryzhang62@gmail.com>
To: mripard@kernel.org,
	dave.stevenson@raspberrypi.com,
	mcanal@igalia.com
Cc: kernel-list@raspberrypi.com,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/vc4: dsi: Allocate the encoder per DRM device
Date: Tue, 17 Nov 2026 12:59:02 -0800
Message-ID: <20261117205902.1293962-1-henryzhang62@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DSI encoder is embedded in struct vc4_dsi, which lives as long as
the DSI platform device, but it is initialised with drmm_encoder_init()
and so is only cleaned up when the DRM device is released. The DRM
device can outlive the unbind of the vc4 components: unloading the DSI
panel driver detaches from the DSI host, which deletes the DSI component
and unbinds the whole vc4 DRM device, but a compositor that keeps the
DRM device open keeps it alive.

If the panel driver is loaded again before that, the new DRM device
binds the DSI component and calls drmm_encoder_init() on the encoder
that is still on the old DRM device's encoder list. The old device's
release later cleans it up from under the new one. On a Raspberry Pi 4
with a 6.18-based kernel, closing the old DRM device then gave:

  WARNING: drivers/gpu/drm/drm_encoder.c:214 at drmm_encoder_alloc_release+0x30/0x40 [drm]
  Call trace: drmm_encoder_alloc_release <- drm_dev_put <- drm_gem_dmabuf_release <- __fput
  Unable to handle kernel NULL pointer dereference at virtual address 0000000000000008
  pc : drm_mode_config_cleanup+0x5c/0x2f0 [drm]
  Call trace: drm_mode_config_cleanup <- drm_managed_release <- drm_dev_put

Allocate the encoder in bind with drmm_encoder_alloc(), so each DRM
device has its own and releases only its own. The DSI bridge is still
shared: while the old DRM device holds it, drm_bridge_attach() in the
new bind fails with -EBUSY, so binding again before the old DRM device
is released now fails cleanly instead of corrupting both devices.

The analysis, this change and this description were prepared with the
help of an AI coding assistant (Claude Code).

Fixes: 6f0ca506c30e ("drm/vc4: dsi: Switch to DRM-managed encoder initialization")
Signed-off-by: Henry Zhang <henryzhang62@gmail.com>
---
Testing:

- On this base (drm-misc-next 467ac0b56aeb): compile-tested only,
  arm64 defconfig with DRM_VC4=m, W=1, no new warnings.

- A backport to a downstream Raspberry Pi 6.18.34 kernel, on a
  Raspberry Pi 4 with an out-of-tree modular DSI panel driver: with the
  compositor stopped and a process holding /dev/dri/card1 open, unload
  the panel driver and load it again. The bind now fails cleanly:

    vc4-drm gpu: failed to bind fe700000.dsi (ops vc4_dsi_ops [vc4]): -16
    vc4-drm gpu: adev bind failed: -16

  the panel probe fails with -16, and there is no warning or oops,
  also when the holder then closes the old DRM device. Unloading and
  loading the panel driver again after that brings back the display
  and the compositor. Without the change, the same kernel gave the
  warning and oops above. The backport differs from this patch in two
  ways: that kernel still gets the panel bridge with
  drmm_of_get_bridge(), which has a use-after-free of its own in this
  sequence, so the test kernel used devm_drm_of_get_bridge() instead
  (not needed here, where the panel bridge is refcounted); and a
  downstream DSI restart worker that used the embedded encoder now
  follows a pointer to the current one.

The -EBUSY is final: the panel probe is not retried when the old DRM
device goes away, so the panel driver has to be loaded again. Would you
prefer the DSI host to wait for the old DRM device to be released
before adding its component again, or a bridge allocated per bind?

Not addressed: a connector probe that is already running when the
panel is removed can still call into the panel driver.

This applies to drm-misc-next on its own. It also applies on top of my
"drm/vc4: dsi: Serialize register writes through the DMA workaround",
and it does not touch the code changed by my vc4 DSI series
<20261028164539.3471833-1-henryzhang62@gmail.com>.

Tools: Claude Code (an AI coding assistant) analysed the crash logs and
the vc4/DRM lifetimes, located the introducing commit, wrote the change
and this description, built and checkpatch-checked it, and ran the
backport test on the board, at my request.

 drivers/gpu/drm/vc4/vc4_dsi.c | 35 +++++++++++++++++++++++------------
 1 file changed, 23 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index ec008f766..5bd8f579b 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -546,9 +546,18 @@ struct vc4_dsi_variant {
 
 };
 
+/*
+ * The encoder of one DRM device. The DRM device can outlive the unbind of
+ * this component, so a later bind must not reuse the encoder of an earlier
+ * one: allocate one per bind, managed by the DRM device.
+ */
+struct vc4_dsi_encoder {
+	struct vc4_encoder base;
+	struct vc4_dsi *dsi;
+};
+
 /* General DSI hardware state. */
 struct vc4_dsi {
-	struct vc4_encoder encoder;
 	struct mipi_dsi_host dsi_host;
 
 	struct platform_device *pdev;
@@ -601,7 +610,7 @@ struct vc4_dsi {
 	container_of_const(host, struct vc4_dsi, dsi_host)
 
 #define to_vc4_dsi(_encoder)					\
-	container_of_const(_encoder, struct vc4_dsi, encoder.base)
+	(container_of_const(_encoder, struct vc4_dsi_encoder, base.base)->dsi)
 
 #define bridge_to_vc4_dsi(_bridge)				\
 	container_of_const(_bridge, struct vc4_dsi, bridge)
@@ -1626,7 +1635,8 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 	struct platform_device *pdev = to_platform_device(dev);
 	struct drm_device *drm = dev_get_drvdata(master);
 	struct vc4_dsi *dsi = dev_get_drvdata(dev);
-	struct drm_encoder *encoder = &dsi->encoder.base;
+	struct vc4_dsi_encoder *dsi_encoder;
+	struct drm_encoder *encoder;
 	int ret;
 
 	drm_bridge_get(&dsi->bridge);
@@ -1637,9 +1647,6 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 
 	dsi->variant = of_device_get_match_data(dev);
 
-	dsi->encoder.type = dsi->variant->port ?
-		VC4_ENCODER_TYPE_DSI1 : VC4_ENCODER_TYPE_DSI0;
-
 	dsi->regs = vc4_ioremap_regs(pdev, 0);
 	if (IS_ERR(dsi->regs))
 		return PTR_ERR(dsi->regs);
@@ -1758,12 +1765,16 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
-	ret = drmm_encoder_init(drm, encoder,
-				&vc4_dsi_encoder_funcs,
-				DRM_MODE_ENCODER_DSI,
-				NULL);
-	if (ret)
-		return ret;
+	dsi_encoder = drmm_encoder_alloc(drm, struct vc4_dsi_encoder, base.base,
+					 &vc4_dsi_encoder_funcs,
+					 DRM_MODE_ENCODER_DSI, NULL);
+	if (IS_ERR(dsi_encoder))
+		return PTR_ERR(dsi_encoder);
+
+	dsi_encoder->dsi = dsi;
+	dsi_encoder->base.type = dsi->variant->port ?
+		VC4_ENCODER_TYPE_DSI1 : VC4_ENCODER_TYPE_DSI0;
+	encoder = &dsi_encoder->base.base;
 
 	ret = devm_pm_runtime_enable(dev);
 	if (ret)

base-commit: 467ac0b56aebc804360f276feffbc9032c265a6e
-- 
2.47.3

