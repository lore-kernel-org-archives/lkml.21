Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795886181;
	b=TLOTrmdwSb5gM1mAttWetfXSaAa0+X5O88BFCY8WL3v2OwS86ijZq7UjCZmDjLrAkooR
	 ENKUVUAO18VwbKq9nbyjXqIg3Y3kAHQKpNpNefLDwthxQL1wDAV6PkYRs07v5TPQoYZ1C
	 qF0vU43pahxcpwfTwthJ6Zdu8kb1SwmOFvCleW3wI+OmKFFrzCp8+VxoQgAgUjHvxHp3z
	 lVL+9NkpxHQwkIKU7FefLWFmllZAhVf+9muvUCyaPky4n7GHUck2rgJVZDSSUSp4y/OFE
	 8JX2jDFOrtSM6SapGf+QWS3UoKi2IzryFVplZGa2mUukUvqGcMClkj4yzPkyVNPj5rQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795886181;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Yd/VwvUqJJIqFqY9twXj4iOv0vtupXkf/Ao+p68hXVU=;
	b=lq3kZMDJXgzBPm/mTl0SjmuczI0E32ZqYI5qAMcOIbqdTk0H5hqXD4s1hSiiv6DtMPvC
	 eanTtmq9K7jFkE5ezcr2ku2yUGTcEdDjOaWGIqUjUH7BeISA4NwbEFcm4cZbnc2ReCoo5
	 jC3uVkVZYKisl00WNI3Ehsk2Iwv/LiWAI8WeJxgqfjqM/sA8LDOROS/u3fuIcM+PB+Vst
	 mHYi39xL048L/+Nk8X5ZorIPSEvNs0tySR4NKExa9o4qHPlV7K/8DS2ktubjpsJvunbil
	 zmOQ+Q75xGnyR+ALo8lk4BVHEWr83YB3ENCVNI0bCIZXelIgC0JIp1/zBul5JpivQmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T6KqdOzg;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B7D606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 17:16:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82B7D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T6KqdOzg
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4ac08f4a0b2so6408753f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 09:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795886180; x=1796490980; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yd/VwvUqJJIqFqY9twXj4iOv0vtupXkf/Ao+p68hXVU=;
        b=T6KqdOzgS0AIO4gz44Zl3CNiEpSWGFlPSpMVXnM8fQ7RetVu8w+M5DQYeyN0zjAwRq
         8nR1GN9JmyG+W3e/53TGk35G5bYpdiuK+uBYpWNfhA7wyG/xDArLEsI6sHMX4RwaQ98R
         43cuIQ3s3tauq5fClad8cnIozttOjKlfk76wRn0yGy6DHPcQ6tjJPKn6r8oakONQhZxg
         52a8BOnkKni1llraXMcDs9W/w8GiXqqlIjYRZ1KNoI3bqIeZZlELsBTOL4x5A6y3+PEh
         QOan8LQrXgCHCfBHXxWvxXJGno5FxCTfHO6rtehizgZ6KcqbBwqq0KmXD18WWy5tWl+F
         O42A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795886180; x=1796490980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yd/VwvUqJJIqFqY9twXj4iOv0vtupXkf/Ao+p68hXVU=;
        b=XfiOEynFMNekMv4+5h56x8SOQQQ0HnOF1MEIjiUuXBa0U24MKhVk0hl0blmM4IEbjI
         IFMdecCnIl2mIM1DpDWNyRqnM75LmtXPvbBmHhYTX3hZyJOcEBWnfZgNIWbohn+OMB/9
         RJzfRTtny+S1RkTE4yNDDzg7vFHAporgP5JgweNJA7pQdRAzHUQ12bE5J/e36JRY5VJ3
         p77v22XunFcoFn1jO9NJ9o4vsX7VSNOYvYsGqELGqnQ4t0lEla+cIIuSYSpVtJnwMTTe
         qzWtOjzGV3Mj768oT1kRYCC3y3lMfER47xmrg/jwSKwxa72sN9Dp7C9JNrIy6JH0vl4K
         Z73w==
X-Forwarded-Encrypted: i=1; AL+hErEczxw/wHc3lZt2HevMQ1qZxEDS2nstYN51YeR7ue2jqQS248PFE/dhj19MJ6udyLVoWuuZaNR0cLuR9yM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8H0yH0Fdoswl/D7w1CWgm7k8WNYQeN3nGfirFUZffBtgxax8mM
	stW5nxmnm2MtlnujClCKbPp2Gp0eblTQOKga4YsIBfZCPllcpNk8besz
X-Gm-Gg: AZFdTZe8kV9/XtzvJSlOYKov1/Pa1eQ9FQxPFAu4dgkZbk5vsRiK6pS1w5EgkqjDg4a
	sqGsAIycGf/VZ/tMV/iNpAx77kL64U3xLP2icTqP9LpGYj5RA96Yw+51Htoy/eJkNlgTKSLHxhb
	gjpm/0PTVzpkjcNw4Eu5Tlz1/s0iBQDtd81yPUnKfJcHhYcS1dNwVSsc+xIXBbpnZmJeoswTDuM
	8jjR6VnG9RRatCMCyYyImycfj8WugyqA2km2XQKI9wkGKTO24MeE2b+h6FsU1Z/433UwqswQSJm
	glRq3NHzAYgfmGHnahpso20TgumRO/bAH5zduKReT+lzliCLTeHcn/znR1mERIpcHMIEdPy+NSY
	DMxgad4/icNneKaLRGnhKtsWKjCv5LpNNu6TsBu1YmesoMJC+WD1otodIvSues2jOqx1lMrGYQr
	BqNdItudBCroY+cpvzZvf2uf3y/jjTiUHw56M370bGfY9X+T7j9SdShD35+TpZypNkR8wiR06DQ
	bkFVd7lioCSrp8dmfyK5WN+Yulsz0bEsdvuHmWuvx1gtD0gzD1ri0QBn+ypjHthDQwERojGl/GY
	R12TzZ3HDL3bTxqXzc4XAk63jwVpoPT8lwhnbQ==
X-Received: by 2002:a05:6000:2c05:b0:48e:870:7791 with SMTP id ffacd0b85a97d-4abb18cbe21mr55732970f8f.26.1795886179740;
        Sat, 28 Nov 2026 09:16:19 -0800 (PST)
Received: from [10.56.169.198] ([95.179.249.152])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3c4dsm45654229f8f.46.2026.11.28.09.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 09:16:18 -0800 (PST)
From: Oarora Etimis <oaroraetimis@gmail.com>
Date: Sat, 28 Nov 2026 18:15:23 +0100
Subject: [PATCH 5/7] drm/vkms: add a 3D LUT colorop
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
Message-Id: <20261128-colorop-v1-5-dd79919f822b@gmail.com>
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

Add a 3D LUT colorop of 17x17x17 entries, interpolated tetrahedrally.
The composer picks the cell each value falls in and weights the four
corners of the selected tetrahedron. Red is the fastest moving index, as
the uapi documents.

The existing colorops and their order are unchanged.

Signed-off-by: Oarora Etimis <oaroraetimis@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_colorop.c  |  19 ++++++
 drivers/gpu/drm/vkms/vkms_composer.c | 126 +++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_composer.h |   2 +
 drivers/gpu/drm/vkms/vkms_drv.h      |   2 +
 4 files changed, 149 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_colorop.c b/drivers/gpu/drm/vkms/vkms_colorop.c
index 584305b0abfd..cceb9acca0da 100644
--- a/drivers/gpu/drm/vkms/vkms_colorop.c
+++ b/drivers/gpu/drm/vkms/vkms_colorop.c
@@ -138,6 +138,25 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
 
 	drm_colorop_set_next_property(ops[i - 1], ops[i]);
 
+	i++;
+
+	/* 7th op: 3D LUT */
+	ops[i] = kzalloc_obj(*ops[i]);
+	if (!ops[i]) {
+		drm_err(dev, "KMS: Failed to allocate colorop\n");
+		ret = -ENOMEM;
+		goto cleanup;
+	}
+
+	ret = drm_plane_colorop_3dlut_init(dev, ops[i], plane, &vkms_colorop_funcs,
+					   VKMS_LUT3D_SIZE,
+					   DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
+					   DRM_COLOROP_FLAG_ALLOW_BYPASS);
+	if (ret)
+		goto cleanup;
+
+	drm_colorop_set_next_property(ops[i - 1], ops[i]);
+
 	list->name = kasprintf(GFP_KERNEL, "Color Pipeline %d", ops[0]->base.id);
 
 	return 0;
diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index e00d1d0b2f2d..51ac2ae75cf0 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -256,6 +256,115 @@ VISIBLE_IF_KUNIT u16 apply_lut32_to_channel_value(const struct drm_color_lut32 *
 }
 EXPORT_SYMBOL_IF_KUNIT(apply_lut32_to_channel_value);
 
+/*
+ * Tetrahedral interpolation of one channel in a 3D LUT. The input value of
+ * each axis selects a cell of the LUT; the fractions pick one of the six
+ * tetrahedra the cell is split into, and the four corners of that
+ * tetrahedron are weighted.
+ */
+static u16 apply_3dlut_to_channel_value(const struct drm_color_lut32 *lut, u32 size,
+			       enum lut_channel channel, u16 r, u16 g, u16 b)
+{
+	u32 max_index = size - 1;
+	u32 r_index, g_index, b_index;
+	u32 r_fraction, g_fraction, b_fraction;
+	const struct drm_color_lut32 *v000;
+	u64 position, sum;
+	u16 v000_c, v100_c, v010_c, v001_c;
+	u16 v110_c, v101_c, v011_c, v111_c;
+
+	position = (u64)r * max_index;
+	r_index = position / U16_MAX;
+	r_fraction = position - (u64)r_index * U16_MAX;
+
+	position = (u64)g * max_index;
+	g_index = position / U16_MAX;
+	g_fraction = position - (u64)g_index * U16_MAX;
+
+	position = (u64)b * max_index;
+	b_index = position / U16_MAX;
+	b_fraction = position - (u64)b_index * U16_MAX;
+
+	if (r_index >= max_index) {
+		r_index = max_index - 1;
+		r_fraction = U16_MAX;
+	}
+
+	if (g_index >= max_index) {
+		g_index = max_index - 1;
+		g_fraction = U16_MAX;
+	}
+
+	if (b_index >= max_index) {
+		b_index = max_index - 1;
+		b_fraction = U16_MAX;
+	}
+
+	v000 = &lut[r_index + size * (g_index + size * b_index)];
+
+	v000_c = lut32_channel_value(v000, channel);
+	v100_c = lut32_channel_value(v000 + 1, channel);
+	v010_c = lut32_channel_value(v000 + size, channel);
+	v001_c = lut32_channel_value(v000 + size * size, channel);
+	v110_c = lut32_channel_value(v000 + size + 1, channel);
+	v101_c = lut32_channel_value(v000 + size * size + 1, channel);
+	v011_c = lut32_channel_value(v000 + size * size + size, channel);
+	v111_c = lut32_channel_value(v000 + size * size + size + 1, channel);
+
+	if (r_fraction >= g_fraction) {
+		if (g_fraction >= b_fraction)
+			sum = (u64)v000_c * (U16_MAX - r_fraction) +
+			      (u64)v100_c * (r_fraction - g_fraction) +
+			      (u64)v110_c * (g_fraction - b_fraction) +
+			      (u64)v111_c * b_fraction;
+		else if (r_fraction >= b_fraction)
+			sum = (u64)v000_c * (U16_MAX - r_fraction) +
+			      (u64)v100_c * (r_fraction - b_fraction) +
+			      (u64)v101_c * (b_fraction - g_fraction) +
+			      (u64)v111_c * g_fraction;
+		else
+			sum = (u64)v000_c * (U16_MAX - b_fraction) +
+			      (u64)v001_c * (b_fraction - r_fraction) +
+			      (u64)v101_c * (r_fraction - g_fraction) +
+			      (u64)v111_c * g_fraction;
+	} else {
+		if (r_fraction >= b_fraction)
+			sum = (u64)v000_c * (U16_MAX - g_fraction) +
+			      (u64)v010_c * (g_fraction - r_fraction) +
+			      (u64)v110_c * (r_fraction - b_fraction) +
+			      (u64)v111_c * b_fraction;
+		else if (g_fraction >= b_fraction)
+			sum = (u64)v000_c * (U16_MAX - g_fraction) +
+			      (u64)v010_c * (g_fraction - b_fraction) +
+			      (u64)v011_c * (b_fraction - r_fraction) +
+			      (u64)v111_c * r_fraction;
+		else
+			sum = (u64)v000_c * (U16_MAX - b_fraction) +
+			      (u64)v001_c * (b_fraction - g_fraction) +
+			      (u64)v011_c * (g_fraction - r_fraction) +
+			      (u64)v111_c * r_fraction;
+	}
+
+	return (u16)min_t(u64, DIV_ROUND_CLOSEST_ULL(sum, U16_MAX), U16_MAX);
+}
+
+VISIBLE_IF_KUNIT void apply_3dlut_to_pixel(struct pixel_argb_s32 *pixel,
+					   const struct drm_color_lut32 *lut,
+					   u32 size)
+{
+	u16 r = clamp_val(pixel->r, 0, 0xffff);
+	u16 g = clamp_val(pixel->g, 0, 0xffff);
+	u16 b = clamp_val(pixel->b, 0, 0xffff);
+
+	if (size < 2)
+		return;
+
+	pixel->r = apply_3dlut_to_channel_value(lut, size, LUT_RED, r, g, b);
+	pixel->g = apply_3dlut_to_channel_value(lut, size, LUT_GREEN, r, g, b);
+	pixel->b = apply_3dlut_to_channel_value(lut, size, LUT_BLUE, r, g, b);
+}
+EXPORT_SYMBOL_IF_KUNIT(apply_3dlut_to_pixel);
+
 
 static void apply_lut(const struct vkms_crtc_state *crtc_state, struct line_buffer *output_buffer)
 {
@@ -347,6 +456,20 @@ static void apply_1d_lut(struct pixel_argb_s32 *pixel,
 						clamp_val(pixel->b, 0, 0xffff), LUT_BLUE);
 }
 
+static void apply_3d_lut(struct pixel_argb_s32 *pixel,
+			 const struct vkms_colorop_state *state)
+{
+	const struct drm_colorop *colorop = state->colorop;
+	const struct drm_color_lut32 *lut;
+
+	if (!state->data)
+		return;
+
+	lut = state->data->data;
+
+	apply_3dlut_to_pixel(pixel, lut, colorop->size);
+}
+
 static void apply_colorop(struct pixel_argb_s32 *pixel,
 			  const struct vkms_colorop_state *state)
 {
@@ -363,6 +486,9 @@ static void apply_colorop(struct pixel_argb_s32 *pixel,
 	case DRM_COLOROP_1D_LUT:
 		apply_1d_lut(pixel, state);
 		break;
+	case DRM_COLOROP_3D_LUT:
+		apply_3d_lut(pixel, state);
+		break;
 	case DRM_COLOROP_FIXED_MATRIX:
 		break;
 	default:
diff --git a/drivers/gpu/drm/vkms/vkms_composer.h b/drivers/gpu/drm/vkms/vkms_composer.h
index 6da85efc5524..28323df662a4 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.h
+++ b/drivers/gpu/drm/vkms/vkms_composer.h
@@ -24,6 +24,8 @@ u16 apply_lut_to_channel_value(const struct vkms_color_lut *lut, u16 channel_val
 			       enum lut_channel channel);
 u16 apply_lut32_to_channel_value(const struct drm_color_lut32 *lut, u32 lut_size,
 				 u16 channel_value, enum lut_channel channel);
+void apply_3dlut_to_pixel(struct pixel_argb_s32 *pixel,
+			  const struct drm_color_lut32 *lut, u32 size);
 void apply_3x4_matrix(struct pixel_argb_s32 *pixel, const struct drm_color_ctm_3x4 *matrix);
 #endif
 
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 05fba864cf36..d975cb684fd9 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -38,6 +38,8 @@
 /* Entries in the 1D LUT colorop of a plane's color pipeline. */
 #define VKMS_LUT1D_SIZE 256
 
+/* Entries per dimension in the 3D LUT colorop of a plane's color pipeline. */
+#define VKMS_LUT3D_SIZE 17
 /**
  * struct vkms_frame_info - Structure to store the state of a frame
  *

-- 
2.56.1

