Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795886165;
	b=IpJQ5FtepC3MUa3ZWBoUBdcQdHX/hRTdKgXvIj0+oUAu0ZskRZ29Mw27iVx6MBeFJt0C
	 gNnXBQ3vWjYv+Ck2Dm+tzAsczPJ6P7sQAQ25qrBZPnAUcpy9bSuAFkjb/2IxMBM0p9ptw
	 Bem2Zl8t5jkkEgPD/DjsodKQKES51SByyPfVtzhjZVDifErDyR9ZXCdJmfChjLk9l+Eq/
	 KQwALkINm3H9KE/qJKTuU70ZacIiwGWGN1FQ378eIw9yF+Er7ykJSl4pu2ZHVjGCl2CBy
	 etK1+lDm43wDwRbV2YOdFHaYoXcanWPhOHCXFKdZlizjsENmiwtDL/MC0RKNMfkM8qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795886165;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=JpwD/zNGpA8B8BOz7lns8OOdv6N1YRfQD7xfZgcILa4=;
	b=qCNWuUBSy0p7yzZSEnQHhgcFRCHVdwJwgVskWxG5mhGNkXdiZJz64CHa2QtpnlQmT0HH
	 rRsLtgutWcB7Wl2fHNqu2aHB8i8kO63YERstHWEVol55Bf3CrzX/PgcgksxuZqbZ6dEMA
	 U/74LzqtJ7Y95g/Wnef9MfNngBr/17epw6JWTMWFCDI6Rp5Qzx5FObV1459B3Dyx/xYuf
	 S+EJT/CElYbS4PfjueTEINznKmZVd8O5fcn0JKwp143MIE5IBQJsLg0fF04vPGztNxhHm
	 r5cO4tMCGAQfs23qBOpg75wuzryR3c6AhDiOz+EO9//nirsMYY6frZst4u6KPNagtUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EgcdTAI3;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C450606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 17:16:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C450606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EgcdTAI3
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4a34ffd3e39so4949081f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 09:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795886163; x=1796490963; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JpwD/zNGpA8B8BOz7lns8OOdv6N1YRfQD7xfZgcILa4=;
        b=EgcdTAI3tl8bgO3wPoRmX8sPNN+AI+qvebinLYb88M8ajGYFmUQJc8W5FiQNHHb8AB
         f/0gXuYN5tP4j8uFlPkDF62hUhEXYZQyEOcYA6BOLp+fDI8ntDP2G72hnCahHZ/4iNXi
         N2gUTm0d7hJs6fEqYMzYGhqbQghUsrkoSDolikw38jDr7rdtLPxrXDFDIxJJBgzgOeX8
         gljgAmLGb+j3dgf6Lhbp6PM56QeO3uF8DtECfj7SrngPSeeihbySsh2sXna2pwc1mcoF
         Sy+86C95MUU5VUx0t7BBbNGyEmzfsxgQjnNxnm/H9tZFCb4M/D8Ni40lMGqkSp4tqk26
         x4cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795886163; x=1796490963;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JpwD/zNGpA8B8BOz7lns8OOdv6N1YRfQD7xfZgcILa4=;
        b=Z9wD65hoDx0zVitaaxmnZ5nxKXpEa28wZUhTdZL29e3iiQsHJF2ebhcoHGqN1ANrAI
         5UQiYy0x0jCqdjqFinMf7CS5dBOPLdVIS6tzAqpWKxsc7Aejy0dsBjEpUgHESnRFzGnF
         +TdHAw1w04hb2QyptyXY+MRXq7h1PqqXxmi+7FYnPntvI2IkGpYhjjHyI5qljTcdVFKH
         r54g3V8QLe1HV+E55jyw6saSHyotFx2S6hjaV3j+OR44XRWOKrgCe5ii4Y4fIychuRD2
         Qya8sNzriLWihQhkRXU/JUGTrw3M8OCNhcHR4H5EhRf/ywuGckJJKSaXFTScjT4PrlYz
         kLYA==
X-Forwarded-Encrypted: i=1; AL+hErEPyDgxFkYOd9+DETFHTpPTDH0NZykmsOMkWKpx9PBbXfGt6sNrLk53nwQ8s+AhrdozYtSq7nzzCyT1QDk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3m8l06WVa/5UG4RWuN7byuPwYKs1TvnZbimk69ITTMXjAaLT9
	+c6zQ8Z13qoxFMXghocC0Gg9UnxBSNaFVJqckDfMM1KZoM57vL5nQa7K
X-Gm-Gg: AZFdTZfE278u0NOw1iINZvCoRrpFcN1HkQiwoGLmPKv0XWq5pCnOiy8Yt2oOiom63Ib
	TAqtHMID7Q2moVswt0MVZLeCTCOTSFBU3oUJpuXi4ZgUyru3U5N696os97e4GOyUa9056eT3CW3
	j1kb4jRlwwFGtEwEhTBCJ9SkCJJm+3+yGX9bFOmX4xASkVgedyIr6/vPqRylWe6dqVISAn9y3Vy
	PUFsprJb7S6d08Q3mPgovMdzSMYaJfxwUemDl6OvkLhPQwt42OPB07irN7UMHp+jlaLCPIzA0kr
	BR1QL23iubx4gvS4bnf4o7HzvogZezP+u3727weAkCz1eXOI0jHweZwHck39x9BGqeel38VNegg
	W0iMbR/HF+LOalkod/osvqzheLtSgzhrvSbXG5Q/PXcwZvB9kZTag6DmAMUsT7ntyi6kedMBY6q
	HvzcediYiS/8r67YZuxWXOc+LWTgwt16gYQbL+E7JcxDDsYiZBZmw2tholaSchQ28qWWdrsaOar
	VNvmb6JJx/Bqi46sHTvDy3wTW9y6iikuDhjwztvkEhLyEpUdeiBtxavmGX16iGXP5lvEzeMAgT8
	B7vF0bFoscbTup9nZ8bFpdM4FDOSyxqcUZ0qjA==
X-Received: by 2002:a05:600c:c09b:b0:4bb:665f:7e52 with SMTP id 5b1f17b1804b1-4bb8880995dmr427638195e9.10.1795886162787;
        Sat, 28 Nov 2026 09:16:02 -0800 (PST)
Received: from [10.56.169.198] ([95.179.249.152])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3c4dsm45654229f8f.46.2026.11.28.09.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 09:16:02 -0800 (PST)
From: Oarora Etimis <oaroraetimis@gmail.com>
Date: Sat, 28 Nov 2026 18:15:21 +0100
Subject: [PATCH 3/7] drm/vkms: use the colorop states of the state being
 composed
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
Message-Id: <20261128-colorop-v1-3-dd79919f822b@gmail.com>
References: <20261128-colorop-v1-0-dd79919f822b@gmail.com>
In-Reply-To: <20261128-colorop-v1-0-dd79919f822b@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Alex Hung <alex.hung@amd.com>, 
 Robert Mader <robert.mader@collabora.com>, 
 Harry Wentland <harry.wentland@amd.com>, Simon Ser <contact@emersion.fr>, 
 Daniel Stone <daniels@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2

The composer runs asynchronously and reads drm_colorop::state, which a
later commit can replace and free. If that commit writes a value the
colorop already has, core leaves the plane and its CRTC out, so nothing
flushes the composer first and the worker is left holding a pointer to
the freed state.

Record the values the composer needs in vkms_plane_state from
atomic_flush(), together with a reference of the LUT blob, and read only
that copy.

Fixes: c1e578bd08da ("drm/vkms: Add enumerated 1D curve colorop")

Signed-off-by: Oarora Etimis <oaroraetimis@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_colorop.c  |  4 +-
 drivers/gpu/drm/vkms/vkms_composer.c | 92 +++++++++++++++++++-----------------
 drivers/gpu/drm/vkms/vkms_crtc.c     | 43 ++++++++++++++++-
 drivers/gpu/drm/vkms/vkms_drv.h      | 56 ++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_plane.c    |  2 +
 5 files changed, 149 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_colorop.c b/drivers/gpu/drm/vkms/vkms_colorop.c
index ed557a1c6a05..01b1ed2a5991 100644
--- a/drivers/gpu/drm/vkms/vkms_colorop.c
+++ b/drivers/gpu/drm/vkms/vkms_colorop.c
@@ -24,11 +24,9 @@ static const struct drm_colorop_funcs vkms_colorop_funcs = {
 	.destroy = drm_colorop_destroy,
 };
 
-#define MAX_COLOR_PIPELINE_OPS 5
-
 static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list)
 {
-	struct drm_colorop *ops[MAX_COLOR_PIPELINE_OPS];
+	struct drm_colorop *ops[VKMS_MAX_COLOROPS];
 	struct drm_device *dev = plane->dev;
 	int ret;
 	int i = 0, j = 0;
diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 7a6a7875520c..2cd909bc8adc 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -247,39 +247,48 @@ VISIBLE_IF_KUNIT void apply_3x4_matrix(struct pixel_argb_s32 *pixel,
 }
 EXPORT_SYMBOL_IF_KUNIT(apply_3x4_matrix);
 
-static void apply_colorop(struct pixel_argb_s32 *pixel, struct drm_colorop *colorop)
+static void apply_1d_curve(struct pixel_argb_s32 *pixel,
+			   const struct vkms_colorop_state *state)
 {
-	struct drm_colorop_state *colorop_state = colorop->state;
-	struct drm_device *dev = colorop->dev;
-
-	if (colorop->type == DRM_COLOROP_1D_CURVE) {
-		switch (colorop_state->curve_1d_type) {
-		case DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF:
-			pixel->r = apply_lut_to_channel_value(&srgb_inv_eotf, pixel->r, LUT_RED);
-			pixel->g = apply_lut_to_channel_value(&srgb_inv_eotf, pixel->g, LUT_GREEN);
-			pixel->b = apply_lut_to_channel_value(&srgb_inv_eotf, pixel->b, LUT_BLUE);
-			break;
-		case DRM_COLOROP_1D_CURVE_SRGB_EOTF:
-			pixel->r = apply_lut_to_channel_value(&srgb_eotf, pixel->r, LUT_RED);
-			pixel->g = apply_lut_to_channel_value(&srgb_eotf, pixel->g, LUT_GREEN);
-			pixel->b = apply_lut_to_channel_value(&srgb_eotf, pixel->b, LUT_BLUE);
-			break;
-		default:
-			drm_WARN_ONCE(dev, true,
-				      "unknown colorop 1D curve type %d\n",
-				      colorop_state->curve_1d_type);
-			break;
-		}
-	} else if (colorop->type == DRM_COLOROP_CTM_3X4) {
-		if (colorop_state->data)
-			apply_3x4_matrix(pixel,
-					 (struct drm_color_ctm_3x4 *)colorop_state->data->data);
-	} else if (colorop->type == DRM_COLOROP_FIXED_MATRIX) {
-		/*
-		 * Fixed Matrix is a no-op here. YUV-to-RGB conversion
-		 * is handled at format read time via the
-		 * conversion_matrix set in vkms_plane_atomic_update().
-		 */
+	struct drm_device *dev = state->colorop->dev;
+
+	switch (state->curve_1d_type) {
+	case DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF:
+		pixel->r = apply_lut_to_channel_value(&srgb_inv_eotf, pixel->r, LUT_RED);
+		pixel->g = apply_lut_to_channel_value(&srgb_inv_eotf, pixel->g, LUT_GREEN);
+		pixel->b = apply_lut_to_channel_value(&srgb_inv_eotf, pixel->b, LUT_BLUE);
+		break;
+	case DRM_COLOROP_1D_CURVE_SRGB_EOTF:
+		pixel->r = apply_lut_to_channel_value(&srgb_eotf, pixel->r, LUT_RED);
+		pixel->g = apply_lut_to_channel_value(&srgb_eotf, pixel->g, LUT_GREEN);
+		pixel->b = apply_lut_to_channel_value(&srgb_eotf, pixel->b, LUT_BLUE);
+		break;
+	default:
+		drm_WARN_ONCE(dev, true, "unknown colorop 1D curve type %d\n",
+			      state->curve_1d_type);
+		break;
+	}
+}
+
+static void apply_colorop(struct pixel_argb_s32 *pixel,
+			  const struct vkms_colorop_state *state)
+{
+	const struct drm_colorop *colorop = state->colorop;
+
+	switch (colorop->type) {
+	case DRM_COLOROP_1D_CURVE:
+		apply_1d_curve(pixel, state);
+		break;
+	case DRM_COLOROP_CTM_3X4:
+		if (state->data)
+			apply_3x4_matrix(pixel, (struct drm_color_ctm_3x4 *)state->data->data);
+		break;
+	case DRM_COLOROP_FIXED_MATRIX:
+		break;
+	default:
+		drm_WARN_ONCE(colorop->dev, true, "unknown colorop type %d\n",
+			      colorop->type);
+		break;
 	}
 }
 
@@ -289,8 +298,6 @@ static void pre_blend_color_transform(const struct vkms_plane_state *plane_state
 	struct pixel_argb_s32 pixel;
 
 	for (size_t x = 0; x < output_buffer->n_pixels; x++) {
-		struct drm_colorop *colorop = plane_state->base.base.color_pipeline;
-
 		/*
 		 * Some operations, such as applying a BT709 encoding matrix,
 		 * followed by a decoding matrix, require that we preserve
@@ -306,18 +313,15 @@ static void pre_blend_color_transform(const struct vkms_plane_state *plane_state
 		pixel.g = output_buffer->pixels[x].g;
 		pixel.b = output_buffer->pixels[x].b;
 
-		while (colorop) {
-			struct drm_colorop_state *colorop_state;
-
-			colorop_state = colorop->state;
-
-			if (!colorop_state)
-				return;
+		for (size_t i = 0; i < ARRAY_SIZE(plane_state->colorop_states); i++) {
+			const struct vkms_colorop_state *state;
 
-			if (!colorop_state->bypass)
-				apply_colorop(&pixel, colorop);
+			state = &plane_state->colorop_states[i];
+			if (!state->colorop)
+				break;
 
-			colorop = colorop->next;
+			if (!state->bypass)
+				apply_colorop(&pixel, state);
 		}
 
 		/* clamp values */
diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index 7d18178d5320..e7ea487187bc 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -5,6 +5,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_blend.h>
+#include <drm/drm_colorop.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
@@ -186,11 +187,43 @@ static void vkms_crtc_atomic_begin(struct drm_crtc *crtc,
 	spin_lock_irq(&vkms_output->lock);
 }
 
+static void vkms_plane_colorops_update(struct vkms_plane_state *plane_state,
+				       struct drm_atomic_commit *commit)
+{
+	struct drm_colorop *colorop;
+	size_t slot = 0;
+
+	/*
+	 * The plane state is freshly allocated for this commit, so its
+	 * colorop_states array is zero and holds nothing to release.
+	 */
+	for (colorop = plane_state->base.base.color_pipeline;
+	     colorop && slot < ARRAY_SIZE(plane_state->colorop_states);
+	     colorop = colorop->next) {
+		struct drm_colorop_state *colorop_state;
+		struct vkms_colorop_state *state;
+
+		colorop_state = drm_atomic_get_new_colorop_state(commit, colorop);
+		if (!colorop_state)
+			break;
+
+		state = &plane_state->colorop_states[slot++];
+		state->colorop = colorop;
+		state->bypass = colorop_state->bypass;
+		state->curve_1d_type = colorop_state->curve_1d_type;
+		state->multiplier = colorop_state->multiplier;
+
+		if (colorop_state->data)
+			state->data = drm_property_blob_get(colorop_state->data);
+	}
+}
+
 static void vkms_crtc_atomic_flush(struct drm_crtc *crtc,
 				   struct drm_atomic_commit *state)
 	__releases(&vkms_output->lock)
 {
 	struct vkms_output *vkms_output = drm_crtc_to_vkms_output(crtc);
+	struct vkms_crtc_state *crtc_state = to_vkms_crtc_state(crtc->state);
 
 	if (crtc->state->event) {
 		spin_lock(&crtc->dev->event_lock);
@@ -205,7 +238,15 @@ static void vkms_crtc_atomic_flush(struct drm_crtc *crtc,
 		crtc->state->event = NULL;
 	}
 
-	vkms_output->composer_state = to_vkms_crtc_state(crtc->state);
+	/*
+	 * Capture the color operations of this commit: drm_colorop::state is
+	 * the current value of the colorop, not the one this frame was built
+	 * from, and the composer runs asynchronously, so it must not read it.
+	 */
+	for (size_t i = 0; i < crtc_state->num_active_planes; i++)
+		vkms_plane_colorops_update(crtc_state->active_planes[i], state);
+
+	vkms_output->composer_state = crtc_state;
 
 	spin_unlock_irq(&vkms_output->lock);
 }
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index b7eb7033fb4b..1c5205aa6e0c 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -6,6 +6,7 @@
 #include <linux/hrtimer.h>
 
 #include <drm/drm.h>
+#include <drm/drm_colorop.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_atomic_helper.h>
@@ -25,6 +26,13 @@
 
 #define NUM_OVERLAY_PLANES 8
 
+/*
+ * Number of color operations in a plane's color pipeline. Must match the
+ * number of colorops that vkms_initialize_color_pipeline() creates, with
+ * room for the ones that follow.
+ */
+#define VKMS_MAX_COLOROPS 10
+
 #define VKMS_GAMMA_LUT_SIZE 256
 
 /**
@@ -139,6 +147,44 @@ struct conversion_matrix {
 	int y_offset;
 };
 
+/**
+ * struct vkms_colorop_state - colorop state recorded at commit time
+ * @colorop: the color operation these states belong to
+ * @data: LUT blob, with a reference held by this state
+ * @multiplier: gain of a DRM_COLOROP_MULTIPLIER
+ * @curve_1d_type: curve of a DRM_COLOROP_1D_CURVE
+ * @bypass: whether the operation is bypassed
+ *
+ * The composer must not read drm_colorop::state: that is the current value
+ * of the colorop, not the one the frame is built from, and the worker runs
+ * asynchronously. Writing the value a colorop property already has does not
+ * count as a change, so core leaves the plane out of that commit and the
+ * replaced state can be freed while a published frame still refers to it.
+ * Copy the states the composer needs instead.
+ */
+struct vkms_colorop_state {
+	const struct drm_colorop *colorop;
+	struct drm_property_blob *data;
+	u64 multiplier;
+	enum drm_colorop_curve_1d_type curve_1d_type;
+	bool bypass;
+};
+
+/**
+ * vkms_colorop_state_release - drop what a state holds
+ * @state: the state to clear
+ *
+ * The blob reference is the only thing a state owns. Clearing a state
+ * without dropping it leaks that reference, so every place that discards
+ * one goes through here.
+ */
+static inline void
+vkms_colorop_state_release(struct vkms_colorop_state *state)
+{
+	drm_property_blob_put(state->data);
+	memset(state, 0, sizeof(*state));
+}
+
 /**
  * struct vkms_plane_state - Driver specific plane state
  * @base: base plane state
@@ -146,14 +192,24 @@ struct conversion_matrix {
  * @pixel_read_line: function to read a pixel line in this plane. The creator of a
  *		     struct vkms_plane_state must ensure that this pointer is valid
  * @conversion_matrix: matrix used for yuv formats to convert to rgb
+ * @colorop_states: the color operations of this plane's pipeline, with the state
+ *	      the composer needs, recorded when this state was committed
  */
 struct vkms_plane_state {
 	struct drm_shadow_plane_state base;
 	struct vkms_frame_info frame_info;
 	pixel_read_line_t pixel_read_line;
 	struct conversion_matrix conversion_matrix;
+	struct vkms_colorop_state colorop_states[VKMS_MAX_COLOROPS];
 };
 
+static inline void
+vkms_plane_colorops_release(struct vkms_plane_state *plane_state)
+{
+	for (size_t i = 0; i < ARRAY_SIZE(plane_state->colorop_states); i++)
+		vkms_colorop_state_release(&plane_state->colorop_states[i]);
+}
+
 struct vkms_plane {
 	struct drm_plane base;
 };
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index fd3d34dcf0fe..b05475b0f5d4 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -79,6 +79,8 @@ static void vkms_plane_destroy_state(struct drm_plane *plane,
 			drm_framebuffer_put(vkms_state->frame_info.fb);
 	}
 
+	vkms_plane_colorops_release(vkms_state);
+
 	__drm_gem_destroy_shadow_plane_state(&vkms_state->base);
 	kfree(vkms_state);
 }

-- 
2.56.1

