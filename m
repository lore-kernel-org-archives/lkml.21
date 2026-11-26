Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795677211;
	b=Nhw1McI+FFcfXOaUZ7Wd7EcAUPObgnvZnfOIuY0cGGhe9/gebdTM7ko4O1i57U6hQ6xI
	 qSMiuGpY6ucpC2tzj3RynBh0Q3qW4BUxYh7smwwtqRua7p83SagK+Prw+ladqbYFNwqMI
	 aXLYd7aBHop+Y2xWfJv71MajmU9ykF75/RRU4l/0ugP4TKA7MczpOeRM8tJmTURAdl9g7
	 OqbuzlYMmZjrV3Z+8FZYriOYBgS+oSAibVlrdAfIik3BrK3qMUCWC4iszaPmkLJEC5+4y
	 iR6YNpl06wkp4rXp7AGhBhqlfnngGhTqZQcut5FYL0pGy1lHl8wV0aJkqmQs9UlzrIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795677211;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aVE6uQY9znCYqrgi6+/JSfmRMS1q7/GU0dj9T9uQX+4=;
	b=yoipfoObcykPkhJxmDQshkawlWocbYxoSA0C/aB9sH8vYmhgYY12/Sc+ywaZsF89byic
	 cIQSKRf6Ti+0hAEwvteQDLfnWjVcSyl5Ig0Vxe9W80p9Mv3P8+r90LL+e541ZARURzTuc
	 Vw01S70SNYFo7A7n5ZRzacawGmkwfznLOgVc/jA9e+q3tqb9OTqlB9PXLL6riRh7NWbCD
	 RyncVB2Wewk3BtuE92bf9rnUy1I04TR+0npPGfPFO1OxOp+fw3MuZa5G4YAzylU9yqOEY
	 PyGWs8eYyj9RnYqIf69RG1CXAu3MMJSmNop9dbjFE2kxPhlip1BU71z89PZdGkU0jCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cnQnoygJ;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE31606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:13:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEE31606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cnQnoygJ
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8b612fd74e1so2344827b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795677210; x=1796282010; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aVE6uQY9znCYqrgi6+/JSfmRMS1q7/GU0dj9T9uQX+4=;
        b=cnQnoygJZFyd6qqbDXu1P1IdIIs9W16GuDQhHY9PmSw5+USuvyeTqv7Uf5gktlo0kd
         UxhvRdD9jTXueiHQpd4ttqJjgrF1MACsSvc80aTTR7k+kuxw4nZ9yHHaDKYj47TgFNws
         g6XlrJmN/XIwzoMPDZz9j0WGszkrSlX6anbyc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795677210; x=1796282010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aVE6uQY9znCYqrgi6+/JSfmRMS1q7/GU0dj9T9uQX+4=;
        b=C9TI+NhH0M0+H2huhmB7adtXs3k3UvItK681w1ItWZRJZ1oeOQbB2HM5J9TUFEfjps
         nY5EealzM6qzF6W812fiOp0HrsHjByx0m7uxuFjU1uxQzRgkrGRzAllOQnNRFbNkApLy
         xjgm3391moiAKbdfzFo2vmf/vXNjm2h5VQ3E0e+wsl2gq89+rFKRAYQzY8ya7WHv4cMO
         brNssIkW2pWve7X4/HrcasssmUm9y5HKVI51weZOdcC747xystP+j5mNvOprXtIqZ2HN
         zD1vQ6vxvhaDIsMfF4pcx/g/bhzBe6HDXxl9odMCwq06LZ0HKXcUsf5yAo3eQ9RO042R
         TloA==
X-Forwarded-Encrypted: i=1; AL+hErHCZN/S8Ffrqde/pXoz0i0bwc1PRdqYs9aUZQuTst1gvlgFdR3Ic5nE211a0vKPh4wtOVEZXWn89joT3X4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9lAtdqttvcQQKNal3ZIo8BM1BkQ7K72hOjyrmWypPyPBtby/Aw
	O/C5yghcO19hv5gpTpIrQFib5MRgCEXGRlfQ/Og6RMxHQlsiImhTBD0zRNgGzMf2aA==
X-Gm-Gg: AZFdTZcM6PoPOLLXfeiay3Ck5VtDAFzLReAJUP8YabyFhiO64j1zMfZKWUalfrY41ju
	gjst7oJoREaoy7sCp9Mq1h0u22Dr8vI+xRtE+uPc2qiNsCFfzS/jDWLm/qNdj4mYFv6ieAV/fvG
	aD1n5CuU568xNni3fHC7rha+Ijt/YgkiA7HYDL0D/IMPqntmzfDdVWB/uKlJo+AyuEyqWS5kLuL
	xfZDsvzw+g3sOVdES/+lCVMhwNpKuJwNiqOKKTkRmT2cYS52MvCDgSSApfC5/VJjQ39nBf50MHO
	swalcEXwC0zJej8f+ZosnhGXCcZ5oPduePewjXOL/DnVUiuA4Adb7+5k26iLFfXLPO2OUPUzC9E
	rX1nqxcgOvRPt7f6DLRILWoqeYs9o7Ig8+uWVSzyarDdyeEu2FWL1eaGyc8YU4GVVAQDgHpUXNl
	8ICN2e9I71ATJnIUAnpxIdkMF55cd6KnImaOXq0AIYE6RAQu8MD1sai0Jpt+dW3+KeWjLnS0urx
	zf7IwfLrmt9EvuT26oILwf4vIh6c/L7C1sD6UMdJd2wbVnNPqIOzYhbK2ABXSLGh6aU/AwzZA1Z
	f+U3dhNU8Vt8Q3TmK69fjuxwxu87CjqPbqsey6kiUFll2FIRIK02JbwcuUxq
X-Received: by 2002:a05:6a00:238b:b0:89f:521:8089 with SMTP id d2e1a72fcca58-8c87bcbcfebmr18588681b3a.19.1795677210131;
        Wed, 25 Nov 2026 23:13:30 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:418f:e7d0:882d:ceec])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-8c87285b60csm10397352b3a.9.2026.11.25.23.13.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 23:13:29 -0800 (PST)
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
Subject: [PATCH RFT v4 1/5] drm: Split framebuffer pixel offset calculation from drm_fb_dma_get_gem_addr()
Date: Thu, 26 Nov 2026 15:12:49 +0800
Message-ID: <20261126071314.253890-2-wenst@chromium.org>
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

Currently drm_fb_dma_get_gem_addr() calculates the offset into the
framebuffer memory for the framebuffer's unclipped source coordinates,
adds that to the framebuffer's backing storage, and returns the result.

We are about to add a variant that uses the clipped source coordinates,
so there is already some reuse of code. However, calculating the data
offset for a given pixel is not specific to the DMA FB helpers. The
offset is only related to the framebuffer.

Split out the offset calculation into a new framebuffer helper so that
non-DMA users can also reuse the same code.

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: stable@vger.kernel.org # dependency for next patch
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
fb->offsets and fb->pitches are (or should have been) checked by the
driver's .fb_create callback, either in drm_gem_fb_init_with_funcs()
or reimplementing the checks directly.

Changes since v2:
- Change offset local variable and return type to u64, and use
  mul_u32_u32() to avoid 32-bit overflow before widening
Changes since v1:
- New patch
---
 drivers/gpu/drm/drm_fb_dma_helper.c | 28 ++----------------
 drivers/gpu/drm/drm_framebuffer.c   | 46 +++++++++++++++++++++++++++++
 include/drm/drm_framebuffer.h       |  3 ++
 3 files changed, 52 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_dma_helper.c b/drivers/gpu/drm/drm_fb_dma_helper.c
index fd71969d2fb1..ab0f37d8a5ff 100644
--- a/drivers/gpu/drm/drm_fb_dma_helper.c
+++ b/drivers/gpu/drm/drm_fb_dma_helper.c
@@ -75,36 +75,14 @@ dma_addr_t drm_fb_dma_get_gem_addr(struct drm_framebuffer *fb,
 				   unsigned int plane)
 {
 	struct drm_gem_dma_object *obj;
-	dma_addr_t dma_addr;
-	u8 h_div = 1, v_div = 1;
-	u32 block_w = drm_format_info_block_width(fb->format, plane);
-	u32 block_h = drm_format_info_block_height(fb->format, plane);
-	u32 block_size = fb->format->char_per_block[plane];
-	u32 sample_x;
-	u32 sample_y;
-	u32 block_start_y;
-	u32 num_hblocks;
 
 	obj = drm_fb_dma_get_gem_obj(fb, plane);
 	if (!obj)
 		return 0;
 
-	dma_addr = obj->dma_addr + fb->offsets[plane];
-
-	if (plane > 0) {
-		h_div = fb->format->hsub;
-		v_div = fb->format->vsub;
-	}
-
-	sample_x = (state->src_x >> 16) / h_div;
-	sample_y = (state->src_y >> 16) / v_div;
-	block_start_y = (sample_y / block_h) * block_h;
-	num_hblocks = sample_x / block_w;
-
-	dma_addr += fb->pitches[plane] * block_start_y;
-	dma_addr += block_size * num_hblocks;
-
-	return dma_addr;
+	return obj->dma_addr + drm_framebuffer_get_block_offset(fb, plane,
+								state->src_x >> 16,
+								state->src_y >> 16);
 }
 EXPORT_SYMBOL_GPL(drm_fb_dma_get_gem_addr);
 
diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
index d32aceb6ca9b..589619bd8f0b 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -21,6 +21,7 @@
  */
 
 #include <linux/export.h>
+#include <linux/math64.h>
 #include <linux/uaccess.h>
 
 #include <drm/drm_atomic.h>
@@ -1208,6 +1209,51 @@ void drm_framebuffer_print_info(struct drm_printer *p, unsigned int indent,
 	}
 }
 
+/**
+ * drm_framebuffer_get_block_offset() - Get offset to start of pixel block for
+ * the given framebuffer and coordinates.
+ * @fb: The framebuffer
+ * @plane: Which plane
+ * @x: x coordinate for pixel
+ * @y: y coordinate for pixel
+ *
+ * This function will usually be called from the PLANE callback functions,
+ * or from one of the helpers that calculates the framebuffer's DMA address.
+ *
+ * Return: offset from start of framebuffer to start of pixel block
+ */
+u64 drm_framebuffer_get_block_offset(struct drm_framebuffer *fb, unsigned int plane,
+				     unsigned int x, unsigned int y)
+{
+	u8 h_div = 1, v_div = 1;
+	u32 block_w = drm_format_info_block_width(fb->format, plane);
+	u32 block_h = drm_format_info_block_height(fb->format, plane);
+	u32 block_size = fb->format->char_per_block[plane];
+	u32 sample_x;
+	u32 sample_y;
+	u32 block_start_y;
+	u32 num_hblocks;
+	u64 offset;
+
+	offset = fb->offsets[plane];
+
+	if (plane > 0) {
+		h_div = fb->format->hsub;
+		v_div = fb->format->vsub;
+	}
+
+	sample_x = x / h_div;
+	sample_y = y / v_div;
+	block_start_y = (sample_y / block_h) * block_h;
+	num_hblocks = sample_x / block_w;
+
+	offset += mul_u32_u32(fb->pitches[plane], block_start_y);
+	offset += mul_u32_u32(block_size, num_hblocks);
+
+	return offset;
+}
+EXPORT_SYMBOL(drm_framebuffer_get_block_offset);
+
 #ifdef CONFIG_DEBUG_FS
 static int drm_framebuffer_info(struct seq_file *m, void *data)
 {
diff --git a/include/drm/drm_framebuffer.h b/include/drm/drm_framebuffer.h
index 38b24fc8978d..6f838b485730 100644
--- a/include/drm/drm_framebuffer.h
+++ b/include/drm/drm_framebuffer.h
@@ -220,6 +220,9 @@ void drm_framebuffer_remove(struct drm_framebuffer *fb);
 void drm_framebuffer_cleanup(struct drm_framebuffer *fb);
 void drm_framebuffer_unregister_private(struct drm_framebuffer *fb);
 
+u64 drm_framebuffer_get_block_offset(struct drm_framebuffer *fb, unsigned int plane,
+				     unsigned int x, unsigned int y);
+
 /**
  * drm_framebuffer_get - acquire a framebuffer reference
  * @fb: DRM framebuffer
-- 
2.56.1.839.g22a8290db9-goog

