Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795506065;
	b=s6egiiGIKW+v94a0VeOe6kNOQbsuO+A0NmMCAL7/yR+ojgtENZn4wmY9TzpUK1/EZMdP
	 qN64QpPcD3vpHFMqqCnHh2pLz0RwawE0f22RMcX0Z69kQtpXrGkl1al39rBz8oSuD/hXA
	 PVJnaE5axpMBBzijhamKn8GQ5s47haNgLXPnzHki+juI8+/Dv938t2+0ulsHgdnFSOmnn
	 cXw730gq5k5KvchlcGGZldhi/AXYullsQn4OMvFZ33ifaL06JHFy9eAH8RlpPVlMNTMSy
	 y3+fsPjXUpObzIou1ByutVmZuZxfjnXyC4z5S+Lf7R4wvrjqxz5Co877HontrC2NWQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795506065;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WVGnOxIIOZpu68Nyn3y7Nw6nHdmb3NEH0yzfOULERRk=;
	b=twH3NAy30+uH82ObzBqptl0NlGaP/KphxFuOLY9IAxUM0zXHDkmB9/0BjmI2Myjr43OK
	 1OLjbIsRfrIOvirfUJOCX422J3TBHISsPja7l9jL8wvAPh417RrbhR146MLAi79vqz05s
	 cwZAHk/4MlEBU7XYGucIOtyMXmfQ23uxgmrSWxLJxtBiRlCcIzSG1QFSLycpN8ZfnINT8
	 L6NL9h+i8rra1Cn0ZJuax2Zkv3jsvhw3arn/xX/tgV5abpLqft5GuqVK8T2BYi0PngD/e
	 edOYLekQ7Z1a5UpUk/NFpjgmt/D9qwOii4okrXYQic3+SChUo3zMNNpI2TtDF3mLVZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=La9PCRuD;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817B9606A326
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:41:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 817B9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=La9PCRuD
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cdb2893531bso2219741a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795506065; x=1796110865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WVGnOxIIOZpu68Nyn3y7Nw6nHdmb3NEH0yzfOULERRk=;
        b=La9PCRuDAzv8+KQ7XMikyOp2hPy6GwDwYKNnENUqqR9+qHHJHvf7WHwhzRm1KhbdZQ
         6fEM5kdFSCyegN8RRg/pAZfI+fcFhbPROfQAL/+s7sdkf59lPQd6ksE62a13ZaqhYyQq
         2bEw9ZEVUyutvvQBH1IY6YkLwIzXnaHvhKdW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795506065; x=1796110865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WVGnOxIIOZpu68Nyn3y7Nw6nHdmb3NEH0yzfOULERRk=;
        b=m7GgywH2RdWA12fwbDyt2gFkF0IkD++lrXAbCsRXLjZ4ShVLCuyORX7MGntjG+gCKP
         xjknQm4iWRP8tHeEhdcsMkpH55E+ybDck+y65yNgk474CiuqjSAhaJTponMweGqTG5Ez
         ebmevCyG1c88hhV6qSVmFkZzHBvXvKlE4RbVM/3y2aaifDsiKicOFMjCRCtRW0ojkQl/
         TpAB2dEbCrNvfu2whGkLE6IHt8vb8hxNN+KhL3SLRdQzr3ihDNZe9vPisylZkWgaRAN8
         KHMXG3qGhMirWR72vGH/2zo4QeBqPFh7LmYMPcJr7nhu3dfUxsFhbiuGt10RQNCtPplB
         Yl2Q==
X-Forwarded-Encrypted: i=1; AL+hErECJHqxJRT6vM2MQxAPS/zNiJqJyYv5iQK4dpGcEFgC0FAJ3q5vo5MXHD/QAhTCnD07TGCY0EKRbjKWRco=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AdUQsVb0qQLpho6cxGunDK0mS/PSLUny8ftHIhWZCBGmZXkWr
	U+0K5rcbKfXrIOnQ1YPAgHWtlsdP5kl8f8mOTl+C8WTtHvPGPMSe99Ij+EnMZqNyBA==
X-Gm-Gg: AZFdTZdsO9BLq8XUhQ3GIj0AqNTqMVVROtdeEqb0Ke5+6n+sGCD9KyS6Z6sv440zJqK
	O7MPda5DJXbSK+xCM+2JlHMnHNJPvtAyrfq8KbCvB6FpUlp9+DFD2pa4iimckNeMF28UEPtM1pN
	8DspTdq5DQRvS91IoD1Oi9SgoSW47KIdZUlL5NIAJO7oEsDgp8lUo5+k0JrhxFGpLOmuJABoXCc
	qM9jpcogNZ10jKDMjjzZzaopOYs7iIW7KdI0ZQCrJywV1cQlTlTAhrTRmG21Skehc+quOVRnFpp
	RZtDudTzkqQOuzWvjZ+RDP082njYz/D4hb5bHRt/zoPCrpFs1SlysAwYc5whJCtZfA6OTvgs6xs
	BbABWSR2dbVMm8cDJ1xdeKhhSy8XWQ7+8bUjuUfZPyiTKsDUAYyzerAhG5IU/bZDn2S7BzqY0nZ
	9+rILIYjlTDLXMHIhOiWK9KU9PKAX4BPUsJR9jFxduwgfGUjx3hhvHjerMLKnMRTxfAnMsglwGl
	r2/n2g+/+E7Z1vSHHKJ1E/HdyoT6Dc9Sj4w1iAqVHid8aTzGvIqgZ9OkBl2itaWr3xB0NgRgoHz
	nxdpphsHmyryd7Pouu4Wdct6odHq5ZhJREOqiF/5h9QwO0Wav9j3WS3nsjzG
X-Received: by 2002:a17:90b:2c86:b0:3b0:a9de:9886 with SMTP id 98e67ed59e1d1-3b41c8d9179mr13079197a91.12.1795506064871;
        Mon, 23 Nov 2026 23:41:04 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:8f32:8910:4727:ea03])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3b405d639fdsm24820073a91.10.2026.11.23.23.41.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 23:41:04 -0800 (PST)
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
	stable@vger.kernel.org
Subject: [PATCH RFT v3 2/5] drm/fb-dma-helper: Add drm_fb_dma_get_gem_clipped_addr()
Date: Tue, 24 Nov 2026 15:39:30 +0800
Message-ID: <20261124074041.115251-3-wenst@chromium.org>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
In-Reply-To: <20261124074041.115251-1-wenst@chromium.org>
References: <20261124074041.115251-1-wenst@chromium.org>
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

drm_fb_dma_get_gem_addr() returns the DMA address to the "unclipped"
framebuffer. However some display drivers want the "clipped" framebuffer
instead, as they are also using the clipped coordinates to program the
hardware.

Some of these drivers are open-coding drm_fb_dma_get_gem_addr() with
the source coordinates replaced, while others have been incorrectly
converted to using drm_fb_dma_get_gem_addr(), which would end up
causing incorrect parts of the framebuffer to be displayed if it were
somehow clipped.

Add drm_fb_dma_get_gem_clipped_addr(), a "clipped" version of
drm_fb_dma_get_gem_addr() for these drivers to use.

Cc: <stable@vger.kernel.org> # dependency for next patch
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Use new drm_framebuffer_get_block_offset() helper
---
 drivers/gpu/drm/drm_fb_dma_helper.c | 37 +++++++++++++++++++++++++----
 include/drm/drm_fb_dma_helper.h     |  4 ++++
 2 files changed, 37 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_dma_helper.c b/drivers/gpu/drm/drm_fb_dma_helper.c
index ab0f37d8a5ff..0aaf4926db4e 100644
--- a/drivers/gpu/drm/drm_fb_dma_helper.c
+++ b/drivers/gpu/drm/drm_fb_dma_helper.c
@@ -60,15 +60,16 @@ struct drm_gem_dma_object *drm_fb_dma_get_gem_obj(struct drm_framebuffer *fb,
 EXPORT_SYMBOL_GPL(drm_fb_dma_get_gem_obj);
 
 /**
- * drm_fb_dma_get_gem_addr() - Get DMA (bus) address for framebuffer, for pixel
- * formats where values are grouped in blocks this will get you the beginning of
- * the block
+ * drm_fb_dma_get_gem_addr() - Get DMA (bus) address for unclipped framebuffer,
+ * for pixel formats where values are grouped in blocks this will get you the
+ * beginning of the block
  * @fb: The framebuffer
  * @state: Which state of drm plane
  * @plane: Which plane
- * Return the DMA GEM address for given framebuffer.
  *
  * This function will usually be called from the PLANE callback functions.
+ *
+ * Return: GEM DMA address for given framebuffer, unclipped.
  */
 dma_addr_t drm_fb_dma_get_gem_addr(struct drm_framebuffer *fb,
 				   struct drm_plane_state *state,
@@ -86,6 +87,34 @@ dma_addr_t drm_fb_dma_get_gem_addr(struct drm_framebuffer *fb,
 }
 EXPORT_SYMBOL_GPL(drm_fb_dma_get_gem_addr);
 
+/**
+ * drm_fb_dma_get_gem_clipped_addr() - Get DMA (bus) address for clipped
+ * framebuffer, for pixel formats where values are grouped in blocks this
+ * will get you the beginning of the block
+ * @fb: The framebuffer
+ * @state: Which state of drm plane
+ * @plane: Which plane
+ *
+ * This function will usually be called from the PLANE callback functions.
+ *
+ * Return: GEM DMA address for given framebuffer, clipped.
+ */
+dma_addr_t drm_fb_dma_get_gem_clipped_addr(struct drm_framebuffer *fb,
+					   struct drm_plane_state *state,
+					   unsigned int plane)
+{
+	struct drm_gem_dma_object *obj;
+
+	obj = drm_fb_dma_get_gem_obj(fb, plane);
+	if (!obj)
+		return 0;
+
+	return obj->dma_addr + drm_framebuffer_get_block_offset(fb, plane,
+								state->src.x1 >> 16,
+								state->src.y1 >> 16);
+}
+EXPORT_SYMBOL_GPL(drm_fb_dma_get_gem_clipped_addr);
+
 /**
  * drm_fb_dma_sync_non_coherent - Sync GEM object to non-coherent backing
  *	memory
diff --git a/include/drm/drm_fb_dma_helper.h b/include/drm/drm_fb_dma_helper.h
index c950732c6d36..b2a0bd7ef9d0 100644
--- a/include/drm/drm_fb_dma_helper.h
+++ b/include/drm/drm_fb_dma_helper.h
@@ -17,6 +17,10 @@ dma_addr_t drm_fb_dma_get_gem_addr(struct drm_framebuffer *fb,
 				   struct drm_plane_state *state,
 				   unsigned int plane);
 
+dma_addr_t drm_fb_dma_get_gem_clipped_addr(struct drm_framebuffer *fb,
+					   struct drm_plane_state *state,
+					   unsigned int plane);
+
 void drm_fb_dma_sync_non_coherent(struct drm_device *drm,
 				  struct drm_plane_state *old_state,
 				  struct drm_plane_state *state);
-- 
2.56.1.809.ga0b61035b5-goog

