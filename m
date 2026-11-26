Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795677218;
	b=OI8DilP9ohiUZK9XRgok98yehjudTFiMOJzeiRKHqEX9J+i+0/PfavxH3I4YHpU2E902
	 i2sU/GUZWfsQ0zm/9GnWhQqQfO/BIx5nu0XQ7d1d1E+ZnEsF1HrwaX6Q7ImQ+OcpoB15w
	 WfnC6nhp8z85wJ9Giex+5SsTHWgEqsfhMu+eq6jKynEXqQN/SfyZtERooYErNTv3Js5Im
	 o5tfu1DFeQehGCott7dkNOohUynLB58RhZXCZiGWJB0kKZJ9hfnuXuzgqB+0R3zhybH1l
	 j7FqmRVwsaw5KR2s9LhhOqSbnffL9vhAAiokCZUOmFfQsxriHINsEfeXumcmADxHcMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795677218;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qPWijXdqnnf31Uvd9pQegZ3VFu+gZGvbQbzLAzg1T+4=;
	b=Tgm9Tkgo++xfKQdBtLFqf30CF24J3zWnzQdpnTKwge/Wfe+hZMWekWph78++ryU4nT42
	 AoWn31/7R6gqPY7i2rJJPPAKIogjfjM8mwnK+T7/kCeMkQB1RPeW4MgzFkuPtDHN2MS0G
	 S8AflWCGqloDxjmuDhS+ljvPedTzGuaR0nOqOPHtwPO+6lWbwc7C2DuDDm2sxQbcrMq9R
	 v6THRwNBQTRtvhdNGh/pE3Upie6OsXr9AL/U9BVQj4W3Ngpq/Tu6wPesg09Y87eQIF7lR
	 bs6QTkTauqW0oa0yLXbjU6ZMZBVrT7hj1MdUnGmKVOH8yH043chu0b8zSQXpMlewLhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=K+nSo8aW;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2894F606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:13:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2894F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=K+nSo8aW
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2f0458cc9easo54090215ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795677216; x=1796282016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qPWijXdqnnf31Uvd9pQegZ3VFu+gZGvbQbzLAzg1T+4=;
        b=K+nSo8aWWYUhWLctSI6XrsJCc5J3YCSeDOz0ByX0mzEoXkxlwSANd3UOLv0r5hDQCW
         qY0Ao63L8oWN49zH1gEke5DT16oXWkmPKi1frdRr+ZJxHAshwZ9QGEtFAI6VAdOi47w4
         FRQO9/LSphipaywD2FiXsIGdjgG1stipwepQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795677216; x=1796282016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qPWijXdqnnf31Uvd9pQegZ3VFu+gZGvbQbzLAzg1T+4=;
        b=MzwcC14puRQYCpkCoX+WgH+Lijlh49hiCUldFpky5LSgdJH4PHnNCMNZiniA05bZVE
         CFcHQE6vZBDONEOCxF4D3pgZK3jagAiSwaB99JkzF6O9oUvQdSmth8L0VBlLLrt18HWs
         jZ+PFWJYTc6dT/RxVRfX82ZkykCblr3bAb0TBpUqKK2QgJGnWBGSn7R9ApasUWYCwKPD
         8LvQnRDIx05UaZYrKiSbu5NiDfQsK3ZBqcvEllX29qn3UNqhEd8rhUv2UB/rSsymx7Au
         wI63GhqU5TmFmoYqRR+CT59UJpjUcnXjy+Z6b2Rwhs+bG+5fryrxTlBst/0rypmuoae5
         WDZA==
X-Forwarded-Encrypted: i=1; AL+hErF7rlPzY2ow71i9o0HpDVlbGzU6qoU2HkjGFL321sfuaP0SlBy1ivfLhyNOFH6+m9O6tXWb8kJTjhiYQk0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9uu09F06FREzvVMdV5VlELKIkNbftJn3+KZfsVv3vQKGJ1wCSG
	3h1QwZ0hEINRgaAWqHXMEeDaN9BsTmvGbDr3MdToQ1CQgHVZNFBwybo772n/kWWjzA==
X-Gm-Gg: AZFdTZcyPYl3UMJXb5LAISG0Ou02tzSz9B+VbZ01pxBYynRaBBDeZT7tT40+1uBubzn
	muw6/WMui8+PJGiw5DYR2Nt7GypKxA7tDug+FdbChAzUHRrdEMYLbAo4o/UrnC1f2Igu7hNKFWx
	G0n5QUba7kGNekGzvB8O79OeuIHnyFeuLMp1+51G04+mIULGKjLD06Iv1KvwQrb2Rsy8SnF8EbV
	LQ2AsitQdtSHy2Ng8LnsTfMQzooa2QtNPx//I61cGSN5/doX0W7v520ciSXzhm+SnaPllFOY08Q
	jzNNchzelgPGU9pk42fwE2FFfjSiq8hKYAsBCHeT6HXJjmcUpQadPumrilnf9sP28KV8sfBVWA6
	TRZxYHuF+gx/GH44fsuGT3NiB62ZwnrhoCYnTgiplYqnkbu2W/focCKAczOXUhT+7vkYuWHUqvo
	kmIiyOoakhTiXZhWnSICb3ZxdqrpkAnoFTjuUJy1jWRY+bmpCjL/YVdzCuZvYCgzeWSVKSjrXVZ
	s1oYkj6eYmMH/YnItDpXW1EP8CzqH7JsKKHnfEHyiuiw2K3WA9YGHe2D+GBVyvKUfpmPXmOV/hG
	hIRRllErG20z2VwSysxB9Qen4csv85SnaJU2Y6iY3QKIXWDt9/L6nsLXoG95
X-Received: by 2002:a17:902:e847:b0:2ed:c9bf:9570 with SMTP id d9443c01a7336-2f03f1a4599mr214081945ad.26.1795677216392;
        Wed, 25 Nov 2026 23:13:36 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:418f:e7d0:882d:ceec])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2f03f120769sm99461835ad.57.2026.11.25.23.13.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 23:13:36 -0800 (PST)
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
Subject: [PATCH RFT v4 2/5] drm/fb-dma-helper: Add drm_fb_dma_get_gem_clipped_addr()
Date: Thu, 26 Nov 2026 15:12:50 +0800
Message-ID: <20261126071314.253890-3-wenst@chromium.org>
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

Cc: stable@vger.kernel.org # dependency for next patch
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v3:
- Expanded kerneldoc to explain clipping
- Added comment to highlight different source coordinates used

Changes since v1:
- Use new drm_framebuffer_get_block_offset() helper
---
 drivers/gpu/drm/drm_fb_dma_helper.c | 50 ++++++++++++++++++++++++++---
 include/drm/drm_fb_dma_helper.h     |  4 +++
 2 files changed, 50 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_dma_helper.c b/drivers/gpu/drm/drm_fb_dma_helper.c
index ab0f37d8a5ff..789e6ac42c17 100644
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
@@ -86,6 +87,47 @@ dma_addr_t drm_fb_dma_get_gem_addr(struct drm_framebuffer *fb,
 }
 EXPORT_SYMBOL_GPL(drm_fb_dma_get_gem_addr);
 
+/**
+ * drm_fb_dma_get_gem_clipped_addr() - Get DMA (bus) address for the start
+ * of the visible (CRTC-clipped) part of the framebuffer
+ * @fb: The framebuffer
+ * @state: Which state of drm plane
+ * @plane: Which plane
+ *
+ * A plane may be positioned partially off-screen, in which case it gets
+ * clipped to the visible CRTC area by drm_atomic_helper_check_plane_state()
+ * (populating the clipped coordinates in &drm_plane_state.src and
+ * &drm_plane_state.dst). For example, if a plane extends past the left or
+ * top edge of the screen, only its right and/or bottom portion is visible.
+ * Drivers whose hardware cannot clip by itself (i.e. accept negative
+ * destination coordinates) should use this helper instead of
+ * drm_fb_dma_get_gem_addr() so scanout starts from the visible portion of
+ * the framebuffer.
+ *
+ * For pixel formats where values are grouped in blocks, this returns the
+ * beginning of the block.
+ *
+ * This function will usually be called from the PLANE callback functions.
+ *
+ * Return: GEM DMA address for the visible part of the framebuffer.
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
+	/* Use clipped source coordinates state->src.[xy]1 instead of state->src_[xy] */
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
2.56.1.839.g22a8290db9-goog

