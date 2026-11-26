Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795677223;
	b=e5r2aA7DzFv6IFbCobTovqPm5B43i3RZcqAcozyQQgnpSnAETuc3Ob3TbvB0p405sHQ+
	 HOfBqvLRsHV3/lepHcI4oKiC9OpzC0U6AVo66dY19JhE3rj7+UA6In7kFmHLuvFbFtuoF
	 6QpIHyFPc99//hgTfLtZJM/v+iliNhpR/QKewQn9YmreT4kQcnLAn0OszwB38SPp5XmCp
	 kYP0yJ4tIlQKxBTAb+1XHbqE4AOCpThYcDHcN+LQHxAiLYaueUDfmixy6suTa9mjWeZcA
	 ZznETHmfe3lhb9ZY/jqzaPKW/JAaEVykyghQlpjNTYU7kfLBVKfvXaJLHghUeIetRkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795677223;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cQV4QP0qYKuYxZ6jnr2bO2k6G5yVFMpzRyKHmSwnLAg=;
	b=0kh2x1XRiDrTbP28NODi6Vlfm0oaOaDU5Iwfh//Niu1yxGprhPYM5dr08XzpemfpBg5G
	 ptiTQ+sFkW4/x28Jm9ggVg1tIi0c4y8IAhwjbNlcDj7kkXcf4qL5+zGztERcyQsaKVSyb
	 U/79vFtqakdEQkZteMs17A6ksVqW+JNetgHYBM3meWI5yRLpKU4S+as10PS/zm0qIFnEr
	 CrrFxYXpoqLKGUlf6dEdmJuqiG+rVa5xVOv2T3MncoUjL3RLGY6grra3qXFVagoAk7j/m
	 eGap/PJHaMdN7/04Yl+G31F6Fs0pWKsV5UCulhv2atNWowBiVZJL+dqb+751vKRhP6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=kLhjqtux;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6F6606A326
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:13:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA6F6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=kLhjqtux
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ae1da332bcso3476934a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795677222; x=1796282022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cQV4QP0qYKuYxZ6jnr2bO2k6G5yVFMpzRyKHmSwnLAg=;
        b=kLhjqtux6XoFLiVz7cXR0eao5WOFLPaFrl1O00H6GtHUmF0WhrPghAuGlkfsFuf+fG
         V+cNsBABihBT7+EHD6CC+Wdw5tGaTOM6H1+N7RltSrjM21U520FEdxwQxLS4P1HFmc4N
         PsZEymLv9qpZs5qqghTiniJK7T4XvOTFbWYSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795677222; x=1796282022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cQV4QP0qYKuYxZ6jnr2bO2k6G5yVFMpzRyKHmSwnLAg=;
        b=kW+KmWgq4unKyPcb52tXPgnR9cuIVmRGjsdtrxovQzH6QCZyhEKO4OCw0TeSW2uWHf
         NiuIr6ksgcMEzIblBouYVDVjfL2IxRBHrFRo72JhKYrmuAkxd5YPmN7YYVip04xNZZOt
         +VfGfI/rLlTa7PjYhDN1TNFjrCGw3i3BEYcH03GXY1NZKW4wT+06M8yCk336ghBq0oTx
         uYCYqNKBaJ/fzxF37fcjR8gfHfaZ+Rvnc/kAVZfoBV/po+1inN59TyyPWl5jXfrD3TqO
         qgTvIP0AW+MhVmMEoEWrr39eKrvNWQz3SAEL9ZLgs+BV2sXxUyW+ol5ra3B9fS3BeVVJ
         6RFA==
X-Forwarded-Encrypted: i=1; AL+hErERWX0/DmVk//eX74Yc2OZDkPViFixUQo23KG5+228PzqI6hfxtJRE3VZGi/Ki1HTnnglZt23Z44Qw0m5M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Dadzm4U9+AwHaNbyQziU7z7hzGiRk1lwpU/jlmg3Ak9m5zziu
	27L2XGtBwIjLzW2a/+unEXcWAwNtTVCxsCGcOG2KXVmz+NcukcqnswWkHhNpUQSKRQ==
X-Gm-Gg: AZFdTZcP+RIWUM+Y3yBnQ8nY8mvxnqAg2RGwaWi/Rtog+2xk2eZSbQtJFe4mr+mgk6D
	bHEPUxkuH+USEpNArJavrdCwzh4jZSeq4lRVtwCtd9yZff5mTY+BGCn6yN7knidFDQkGr5C9yjj
	BNmiS2nlbkvPjJ/f7Duj/MRmIsVFCURSZFMs4utNhnPtW/XYfC8G9uQpelM8rJ1Z3C3Zzfn7f2S
	sj3fX5PS1dmKBW/9X0wtiP7kT1xK8o6UHzhYnQHa00QIR8e2QNBt0Wyrq6DkjR+2T9ar7B3qYml
	hhklb9M4cENrt8rIbP4TbaMyaLT0SidPzwA9K4H/+p0Mfqn2K6Shgs6mMDn9Dndd7uQw24JvBrE
	IDGJZl8JkhrLswIIHq6RUqz61geRYks2+cMxc30hfyOEtik7dYTiPDVOWp/yhvrTjIU5+3QSBgJ
	IrKj5k/a/LIRLQkVl40uf9kzm5iDnu9ovFk2YvYq6KHEQLM6nLQtoNdRbBe67C3TvR9jDMXoXvm
	9hQIi+YwUo1ZLAyz9LSbRvOf4tCzlDXzNdBz+GyJDdvT563soYsDtN2+LeNv2TZTmVYKjXhTFQ5
	Oa2MlJjbmgixZDP5SJ8maUCy+Ip8YeTjx/RrFEyytuKEkGxFA0zKeSRfC2E3ZAgCMhGQpsgynBk
	kwcDYYA==
X-Received: by 2002:a17:90b:4b0e:b0:3b1:8380:a9a0 with SMTP id 98e67ed59e1d1-3b41c95c18dmr20709401a91.46.1795677221915;
        Wed, 25 Nov 2026 23:13:41 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:418f:e7d0:882d:ceec])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3b41ad0b52dsm33777492a91.5.2026.11.25.23.13.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 23:13:41 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liu Ying <victor.liu@nxp.com>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-sunxi@lists.linux.dev,
	imx@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH RFT v4 3/5] drm/sun4i: layers: Fix VI buffer address for clipped offsets
Date: Thu, 26 Nov 2026 15:12:51 +0800
Message-ID: <20261126071314.253890-4-wenst@chromium.org>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
In-Reply-To: <20261126071314.253890-1-wenst@chromium.org>
References: <20261126071314.253890-1-wenst@chromium.org>
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

Commit 79ac1c945ab8 ("drm/sun4i: layers: Use drm_fb_dma_get_gem_addr() to
get display memory") dropped the code to calculate the framebuffer's DMA
address in favor of drm_fb_dma_get_gem_addr().

This turned out to be wrong in a couple ways. The hardware is programmed
with clipped dimensions, so it needs the buffer address to start at the
clipped boundary. Moving to the helper negated the clipping. Also, when
clipping on the left, the buffer address needs to start at the first
pixel in the sub-sampling group even for the luma plane. The hardware
handles the interpolation internally.

Switch to the new drm_fb_dma_get_gem_clipped_addr(), which provides the
buffer address starting at the clipped boundary. Calculate the intra-group
offset and adjust the luma plane buffer address so that it points to the
start of the sub-sampling group.

Fixes: 79ac1c945ab8 ("drm/sun4i: layers: Use drm_fb_dma_get_gem_addr() to get display memory")
Cc: stable@vger.kernel.org # v7.1+, needs drm_fb_dma_get_gem_clipped_addr()
Tested-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
This is an alternative to Jernej's original revert:
https://lore.kernel.org/all/3980ea1aeb3f7fe8b4700e36560deeba3d050664.1785772659.git.jernej.skrabec@gmail.com/
---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c |  2 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 16 +++++++++++++++-
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index f9c7f28f9fa2..67cce1b0e70f 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -130,7 +130,7 @@ static void sun8i_ui_layer_update_buffer(struct sun8i_layer *layer,
 	ch_base = sun8i_channel_base(layer);
 
 	/* Get the start of the displayed memory */
-	dma_addr = drm_fb_dma_get_gem_addr(fb, state, 0);
+	dma_addr = drm_fb_dma_get_gem_clipped_addr(fb, state, 0);
 
 	/* Set the line width */
 	DRM_DEBUG_DRIVER("Layer line width: %d bytes\n", fb->pitches[0]);
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 4d3fc03f9877..b6796416d550 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -205,7 +205,21 @@ static void sun8i_vi_layer_update_buffer(struct sun8i_layer *layer,
 
 	for (i = 0; i < format->num_planes; i++) {
 		/* Get the start of the displayed memory */
-		dma_addr = drm_fb_dma_get_gem_addr(fb, state, i);
+		dma_addr = drm_fb_dma_get_gem_clipped_addr(fb, state, i);
+
+		/*
+		 * The mixer can handle odd offsets into sub-sampled YUV
+		 * planes, but needs the address of the first pixel in each
+		 * sub-sampled block. Adjust the luma buffer address backwards.
+		 */
+		if (i == 0) {
+			u32 x_diff, y_diff;
+
+			x_diff = (state->src.x1 >> 16) & (format->hsub - 1);
+			y_diff = (state->src.y1 >> 16) & (format->vsub - 1);
+			dma_addr -= y_diff * fb->pitches[i];
+			dma_addr -= x_diff * format->cpp[i];
+		}
 
 		/* Set the line width */
 		DRM_DEBUG_DRIVER("Layer %d. line width: %d bytes\n",
-- 
2.56.1.839.g22a8290db9-goog

