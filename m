Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729485;
	b=LYfL87z0IYoGjNoFHyVfA5jomWNS+sZuz7WhD06i7WA6lpcHhUTJ8fffvnoYHLBYPw1c
	 NtDCXqERUchxduMyrdzSIT41xk3Cyk+WvPX9ar9Y5RYz9ohEBqrTQu8RuEd7G2h516Im/
	 65cfgRuOtaDnqcMuRJD72qpxXheGnuorKNcPLGkkLffbqm+XTSa/QPjwoPuJBCtE04yRb
	 uO5AvsCScJd1b5S3cyO12Uh8uxKlPRUl27AZnE4jbOkNo+NobjqlqMEQSco3tH69xkKOl
	 pYzewvY0Gf121UagHFXGHbrezsk+fPXesIQs2XngdXpoeaugKpLWs7gnzHfvSbIBXvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729485;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Rthem334wkm2a7wmTCRGlWmB/Wf3+iH9fn3pLKOROFg=;
	b=y7XVIsz64w2kMkBW88y1XhRg2242HsqAcNfbuXgun5PNPvrUXbgXeTPT4TPeIm/uKEvL
	 KBsLNMdcN3PQ5VO/+dfHB2FX7dXn90AYlAeMw4yk9DSPDQt6cl1dBfsVHBDxuVnEQ5qfh
	 UvOXUMe5Mv4mPdXs/RYsp1gIldMtNOglW+lyaXnXXxv8uWvE6japM8urQCq4au89w0szE
	 N5W+vr5NAtUvEzmQcyzqy1O73soW6C/HRxoFr5GHWUYrSCKvoOoL2fZP7LvgzjIvL60Qp
	 bNtaGpW+NjgFjlJ3b+CoUXNEHilIRUaWKmddJMO+odYtKZkX0obZfD73r/U9wrfcLxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kgHy1QX7;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DA860A3801
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:44:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07DA860A3801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kgHy1QX7
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so5832384f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729483; x=1796334283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rthem334wkm2a7wmTCRGlWmB/Wf3+iH9fn3pLKOROFg=;
        b=kgHy1QX7XA2+Szlj3vv2Bv7fs7JXMdigxpRNGecSd9cb5jEt1eJYrEiivNXTMrpryN
         4I49RvtcDiKQQMj/0KhLNZYsz1EBBV8UguEAJde0y7yCacs629RotipPScXHESPqyYaG
         ivNXRNoLU9kXUgAsHnOZ9p+9S6lzv6IgLjr9+vR+xdVEGnl788qC2YfF2lYb7wwXA7t6
         nuZHdUF7Pxd0GQapsNPNyxUQhIbgHR2Px42dMsecjXPhLtryWgl5DrlaIUuzSASPh+7g
         f+h8xOl+lChvDRs1Ubc2+GdMl9TxZQvyOT9g/mpi4ZDghQHphWWIWeOE0dzaZkLk2lID
         P+Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729483; x=1796334283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rthem334wkm2a7wmTCRGlWmB/Wf3+iH9fn3pLKOROFg=;
        b=wzTzRG7OQT4fl6MGN1+R/ClIhnh3wsMkWmMOEG1yGBcBT8YWAcrsPVQZHHmqGZNFlW
         SgSAMwlYmbr1sdG5/bDB4GdjKwPyLelRQIjIx5/+6grKMDKAk+FfMiJ53ruAYp6oPtde
         qxzQ2u4omLwkUrTMex4ctFK8oeg4WTt4jvjTS4fftqTm0goZj1Sbv33SLakqhhUvYSox
         WxAdfxFjoLRW1yIRwRqdYLsIguk1RlaqeKt9Q0gSAAmHWih3HXLf0epa5ooJu/XvYBUR
         w9qL/m0eca+7j3Q+wM/SMbJUV7mxEhtGW9XQsCdykBl8RUUdOkWKykRCjlfB3jqHQGWu
         EJ4g==
X-Forwarded-Encrypted: i=1; AL+hErFUA8/Utu+zeAK+9cDyk+6lj9XWmEP0vfzvGcHAtrExtmhIzrGCASBFBK9y0+6RzrJOQq924ZHrAT8Dnv8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/IEDN2pOrOv3KyBoOcsKe+i9vu8mhjFEO/RcxLLXNUEAM4/uMU
	lo3nyw5WjnbcnpgPnFa3RLhF/SH49viBSxltuKzdo6AUys0feuMhyEyoRIv0QA==
X-Gm-Gg: AZFdTZdAHvT/aEkgnNhw+JmMB6YeSNpjT5gGbiS7WVKfmdTbU+Xz0YLmRJ5Tyv3yPeN
	slhGAHFmHr+aYeA1hW3jgATdy6mw32k6+xSFB0WYHPG5MiKCy1mZkKYGemJXnZKOqFvq2pBlNK7
	79X0KsXOkCuPfzHvegCeEK605+MGuKY+NhaaLRzqONQ6QR00JLY6/OxoxwP5shhOmBR9r/1Vv0L
	thAhWxRnRoZ8eN8eEuiQGLHZYv37TMz7M80aA/tHdBepl8dTFxsMs9yQDmWDZL83MYATfaoHCw8
	qq7DL3yDeeu5st+ayEHjRadgElEO3CGEIFI4gRrIAyieeTtr1v2hGEPr2+5uua6nRv00IRyAP4x
	J6mRP7Izwrgz+Ej2BYJmCLS//g2qDC6tS+5azCBDUJBFA1ESY7CkdNqglolyqXAPNE7IG0r8OR2
	vYZVmENPLgLwsKQnHOZfomB0NXDwpQN7NjMg7ELGIr2mPkJtIH34LP6mbOaHnimGPyHGTURcMEN
	NeTrmF/hzXjGE12MNHrNPbPyMfvFaCvTIUujnF239sb3YBamFAZHPRiAUg8KWEI0qVOQsbLuXrz
	nAQ7CPnV1OlnYIm4zVmF9eDg2Yc5nws3NybuFmhW8YjJfpgV8LqFCGQ/6sbVM6z1Ou8ciUFrNbT
	hZRE883GUjSPy9Ps7AUhOQy0pF22LjKPB3x39sNeCw7n/yYnwayOxYp1z9nLJZk0PPfEAKDbPyy
	PCRwgahwnWXqJqiB5D80WbYETQvX5zTlEGwlxc9BcIi3PKVrKnf0YlXe4P7CzGi6yzG8seH5W6c
	S+bTRs4H9gVfPew4eGS+gT0AJH1Q0mSbY49CjWJLg==
X-Received: by 2002:a05:600c:5303:b0:4a2:1a:a11d with SMTP id 5b1f17b1804b1-4bb88785d24mr434400835e9.0.1795729483289;
        Thu, 26 Nov 2026 13:44:43 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm40403963f8f.18.2026.11.26.13.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:44:42 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	jernej.skrabec@gmail.com,
	p.zabel@pengutronix.de,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/11] drm/sun4i: Add support for H616 TCON TOP
Date: Thu, 26 Nov 2026 22:44:25 +0100
Message-ID: <20261126214433.3562326-4-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
References: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
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

TCON TOP in H616 is similar to R40, with the exception of missing DSI
and a different position of the TCON TV1 clock gate, which sits right
after the TCON TV0 gate (bit 21 instead of bit 24).

Make the TCON TV1 gate position a quirk and add support for H616.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_tcon_top.c | 13 ++++++++++++-
 drivers/gpu/drm/sun4i/sun8i_tcon_top.h |  3 ++-
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
index 86e1e8fed03a..5ea55a2844a7 100644
--- a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
+++ b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
@@ -18,6 +18,7 @@
 struct sun8i_tcon_top_quirks {
 	bool has_tcon_tv1;
 	bool has_dsi;
+	u8 tcon_tv1_gate;
 };
 
 static bool sun8i_tcon_top_node_is_tcon_top(struct device_node *node)
@@ -246,7 +247,7 @@ static int sun8i_tcon_top_bind(struct device *dev, struct device *master,
 		clk_data->hws[CLK_TCON_TOP_TV1] =
 			sun8i_tcon_top_register_gate(dev, "tcon-tv1", regs,
 						     &tcon_top->reg_lock,
-						     TCON_TOP_TCON_TV1_GATE, i++);
+						     quirks->tcon_tv1_gate, i++);
 
 	if (quirks->has_dsi)
 		clk_data->hws[CLK_TCON_TOP_DSI] =
@@ -314,6 +315,7 @@ static void sun8i_tcon_top_remove(struct platform_device *pdev)
 static const struct sun8i_tcon_top_quirks sun8i_r40_tcon_top_quirks = {
 	.has_tcon_tv1	= true,
 	.has_dsi	= true,
+	.tcon_tv1_gate	= TCON_TOP_R40_TCON_TV1_GATE,
 };
 
 static const struct sun8i_tcon_top_quirks sun20i_d1_tcon_top_quirks = {
@@ -324,6 +326,11 @@ static const struct sun8i_tcon_top_quirks sun50i_h6_tcon_top_quirks = {
 	/* Nothing special */
 };
 
+static const struct sun8i_tcon_top_quirks sun50i_h616_tcon_top_quirks = {
+	.has_tcon_tv1	= true,
+	.tcon_tv1_gate	= TCON_TOP_H616_TCON_TV1_GATE,
+};
+
 /* sun4i_drv uses this list to check if a device node is a TCON TOP */
 const struct of_device_id sun8i_tcon_top_of_table[] = {
 	{
@@ -338,6 +345,10 @@ const struct of_device_id sun8i_tcon_top_of_table[] = {
 		.compatible = "allwinner,sun50i-h6-tcon-top",
 		.data = &sun50i_h6_tcon_top_quirks
 	},
+	{
+		.compatible = "allwinner,sun50i-h616-tcon-top",
+		.data = &sun50i_h616_tcon_top_quirks
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, sun8i_tcon_top_of_table);
diff --git a/drivers/gpu/drm/sun4i/sun8i_tcon_top.h b/drivers/gpu/drm/sun4i/sun8i_tcon_top.h
index 2b887470a49f..e775737e69ae 100644
--- a/drivers/gpu/drm/sun4i/sun8i_tcon_top.h
+++ b/drivers/gpu/drm/sun4i/sun8i_tcon_top.h
@@ -21,7 +21,8 @@
 
 #define TCON_TOP_GATE_SRC_REG		0x20
 #define TCON_TOP_HDMI_SRC_MSK			GENMASK(29, 28)
-#define TCON_TOP_TCON_TV1_GATE			24
+#define TCON_TOP_R40_TCON_TV1_GATE		24
+#define TCON_TOP_H616_TCON_TV1_GATE		21
 #define TCON_TOP_TCON_TV0_GATE			20
 #define TCON_TOP_TCON_DSI_GATE			16
 
-- 
2.43.0

