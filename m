Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795708059;
	b=u3hBeeYqjjofBhFs/HPVj6epAosaXjMCSvIZn+63Y6Xg0idDfy2Fl4Ky2hN5GDuMRE7v
	 Rh1Nw0YK7mkV+0w3JLsPS++8uS5aZ7K6rt+C11WggGOJZwbYMv5FAiITNDp/SbvBO/sl9
	 8Xh2NFvK+aDsVQoVLiukgBSkPP6Srh9acd5IW5Bgisojy7Sh6ltw7B4Nj07lbxmf2RlJ7
	 v+rAxgr6LsL9eB9ccXqxj5RB7Gxh2N8B0uRYcGjcRqaep5OgNuXAyXX8PJ+m2aZxJLugV
	 IWs3d4pDNbyCn4iQT+8wMgwpwn0hypGGd6QFscmoH9qTHQf97KDXc0Xpe/TZj0v/S3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795708059;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=2xIF5XxIhl5l+zw+CgH0/aeYSsf28TpfhXRIiUCDpt4=;
	b=tW+IBfM/xy/S+IQXHf9quwM1ApOPjOlC736rH5czSOlninQI+YNJV/meHAT6nEYGDbR2
	 iJQkTsnLLyyc5Jf0Yr0tLL6ZCiF11IExCmFmphuIkIGGO7Aa6jMHv1X9YRraQJLshVd8O
	 HmtrLhaHEepD2d1nxYw0lcFMEz5VSd7dnFRNihwnwMfMwB6Rp6Zh44oMM3VtMMF2oT0xq
	 L1E1DuJZFdFiuwXF4NpzofTvqQuJ1nwkXyxTaqabAMgHEq1SX1CDhrgNOUjJ3KWvuv0fC
	 yCE5+s2CEnpIbiIoS0+U9fLLsEJuJWWFeIy14fii1u+n1z6yC1UOhVfLjc2vdKv9vlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p+mHPDha;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F0D606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:47:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7F0D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p+mHPDha
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so92506785e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795708057; x=1796312857; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2xIF5XxIhl5l+zw+CgH0/aeYSsf28TpfhXRIiUCDpt4=;
        b=p+mHPDhaIoGEcPzaL5EAcJWQZDuUCZ3Jc2V+Mpr2erGg/K3yoQKAiJ89fR6Dkp7r+/
         5NhXXi0/x1K2M6j9TWGidkVZnWAbuVf6DO6g5vTzbbV25kGPrkrUhaPtVjgDmjnIrGR5
         6OW6cDC/7cww0DYtbXW4KpBFSduNNm41BHcYS+SeLwf9gqMOFkaC7nPH5/3iqtQDAjh8
         8Ip3B8Oem37/D052Y4rpsAndKUTZszimgScdNEYUTOOH8cUO2MEaSsd94DzX9Bi+rNvZ
         1RTomtnfra4ILAB0b44SiMoeM1KuXIenDFnYucDXzTqJXzV148BphI0o+w1QwWFV2TLG
         rONw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795708057; x=1796312857;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2xIF5XxIhl5l+zw+CgH0/aeYSsf28TpfhXRIiUCDpt4=;
        b=12vdcFQLRP/VGwJODbWBfUSUcCeZJqrqMJhidhP8owPZ5Qc6SddzC5vYPOToCut2mp
         8Q4lgTkvA8mE1aAn7K2Qj8i9LqJLJaCzRhXQm3orrZpwjqDc4gvcgjmuEiKpbwztbF1o
         n3mMaZH0tKEPoF0t62YQSWa3JJWKVTA8o7XWbbS0O7fXtKNNjScc90DXPM4UPp8rpyZa
         4HPrH7DTMfQ7oYOeSV4OGDocbKfLHNhvyp/Lug1J//VgIgUFzOth19JTz+tzR5BfxL3J
         n7N/Nky/b7XvWg0U7UASqmY7M51n/PdC/bahGUcUPBRihi6x4Zuq+0DSkGXfMimg3UZj
         bt1w==
X-Forwarded-Encrypted: i=1; AL+hErHVPl88WsiFkkrlmHD9EzliPIcw3azIBN6ws2fp2/3uCgOXpsImjjWpRj6CWZMgMWA4NWoBtL3ZFtYAebU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TIjiepCn3F4c7cPnPMqnTHVLuEW0warFdsTp94ZKaD6izIMbY
	59MI5M3SzfOCYEUNfQCun+EwA6kMPqkN9lPuYhpUW0ttOfu/2IyFVD8Q
X-Gm-Gg: AZFdTZe8TXOqcU1rWVKD5InfAMRh32UFgHhWdvuXTsVKyZYNdEkYjPzB3lTIkzsEx8O
	g8TH1cF4n9ySYPCX7/hXSWpu4XGNlLrSM5YCKvhMwS8SvlONUH31bdAhbZ8XKI5oHWjQbXlwsBB
	ouJ92+NofMNAO80PxzvEe+gD3stV8GKs3aHVFhmVepAlgdOLFdixBiwC/0cY4dOWY2Sh6CZYr4r
	wNLvxAcf6xfALpynrUGNEpvXpJYSgI36LuRAHFJFcrHCHb/YuUiiegBOt3oHm8fBZoorXbtgGgJ
	wro3ZwQq5n6dvQIo2IVmh3dpk5k1KWmNwsHKN8D9vC1NUh4tZ8sPVvqWbw2MGPqGkUzmpJSxdz0
	8M/FafabfNM+t7Z9cknbSKa/tI6GCkubbnmy1qf5KWM4QFBH6fDuMfjn832RidsYaw70NXyr6nL
	Td4NuqnAJmW9wJrcpIR1b8XcqClg0TSlF/QJ6jLiYsYWLgj85RWZWSIdy1FfJYCo2KI7dxJXJ/6
	S0Xmg65aejzKuPIyLkQnb4Dp6S2hTVNuvzkJOYABSneNtRmSTQswszoC++BOJxMp+f0MJR4yiuv
	tXLJnY6gsaiBM2iVWN3fJ91aM05PeB8xpMrKog==
X-Received: by 2002:a05:600c:37c6:b0:4a1:88df:8a2a with SMTP id 5b1f17b1804b1-4bb88812a84mr432463315e9.13.1795708057162;
        Thu, 26 Nov 2026 07:47:37 -0800 (PST)
Received: from [10.56.169.198] ([95.179.249.152])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b3a7sm683201895e9.3.2026.11.26.07.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 07:47:36 -0800 (PST)
From: Oarora Etimis <oaroraetimis@gmail.com>
Date: Thu, 26 Nov 2026 16:47:08 +0100
Subject: [PATCH 2/2] drm/vkms: copy a full-screen frame straight to
 writeback
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
Message-Id: <20261126-composer-fastpath-v1-2-aa7458d84a7b@gmail.com>
References: <20261126-composer-fastpath-v1-0-aa7458d84a7b@gmail.com>
In-Reply-To: <20261126-composer-fastpath-v1-0-aa7458d84a7b@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Melissa Wen <melissa.srw@gmail.com>, Oarora Etimis <oaroraetimis@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2

When no CRC is armed and both sides use the same 32-bit format, copy the
frame straight into the writeback buffer.

Signed-off-by: Oarora Etimis <oaroraetimis@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 63 ++++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/vkms/vkms_drv.h      |  5 +++
 drivers/gpu/drm/vkms/vkms_formats.c  | 26 +++++++++++++++
 3 files changed, 91 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 4e2dd568bc3e..7ecd8b459ed2 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -581,6 +581,49 @@ static bool compose_direct(const struct vkms_crtc_state *crtc_state)
 	return true;
 }
 
+/**
+ * writeback_direct() - Can the frame skip the line buffer?
+ * @crtc_state: the state to compose
+ * @wb: the writeback job, or NULL
+ *
+ * True when nothing needs 16-bit pixels: no CRC, no LUT, no colour pipeline,
+ * same 32-bit format on both sides.
+ *
+ * Returns: true if the frame can be copied straight into the writeback buffer.
+ */
+static bool writeback_direct(const struct vkms_crtc_state *crtc_state,
+			     const struct vkms_writeback_job *wb,
+			     const struct vkms_plane_state *plane)
+{
+	const struct vkms_output *output;
+	const struct drm_format_info *format;
+
+	if (!wb)
+		return false;
+
+	/* The CRC is computed over the 16-bit line buffer. */
+	output = drm_crtc_to_vkms_output(crtc_state->base.crtc);
+	if (READ_ONCE(output->crc_enabled))
+		return false;
+
+	/* The gamma LUT is applied to the 16-bit line buffer. */
+	if (crtc_state->gamma_lut.y)
+		return false;
+
+	/* The copy walks source rows, so the plane cannot be rotated. */
+	if (plane->frame_info.rotation != DRM_MODE_ROTATE_0)
+		return false;
+
+	if (plane->frame_info.src.x1 || plane->frame_info.src.y1)
+		return false;
+
+	format = plane->frame_info.fb->format;
+	if (format != wb->wb_frame_info.fb->format)
+		return false;
+
+	return format->cpp[0] == 4;
+}
+
 /**
  * blend - blend the pixels from all planes and compute crc
  * @wb: The writeback frame buffer metadata
@@ -597,7 +640,8 @@ static bool compose_direct(const struct vkms_crtc_state *crtc_state)
 static void blend(struct vkms_writeback_job *wb,
 		  struct vkms_crtc_state *crtc_state,
 		  u32 *crc32, struct line_buffer *stage_buffer,
-		  struct line_buffer *output_buffer, size_t row_size)
+		  struct line_buffer *output_buffer, size_t row_size,
+		  bool direct)
 {
 	struct vkms_plane_state **plane = crtc_state->active_planes;
 	u32 n_active_planes = crtc_state->num_active_planes;
@@ -612,7 +656,6 @@ static void blend(struct vkms_writeback_job *wb,
 
 	int crtc_y_limit = crtc_state->base.mode.vdisplay;
 	int crtc_x_limit = crtc_state->base.mode.hdisplay;
-	bool direct = compose_direct(crtc_state);
 
 	/*
 	 * The planes are composed line-by-line to avoid heavy memory usage. It is a necessary
@@ -674,6 +717,7 @@ static int compose_active_planes(struct vkms_writeback_job *active_wb,
 {
 	size_t line_width, pixel_size = sizeof(struct pixel_argb_u16);
 	struct line_buffer output_buffer, stage_buffer;
+	bool direct;
 	int ret = 0;
 
 	/*
@@ -690,6 +734,15 @@ static int compose_active_planes(struct vkms_writeback_job *active_wb,
 	if (WARN_ON(check_format_funcs(crtc_state, active_wb)))
 		return -EINVAL;
 
+	direct = compose_direct(crtc_state);
+
+	if (direct && writeback_direct(crtc_state, active_wb, crtc_state->active_planes[0])) {
+		for (int y = 0; y < crtc_state->base.mode.vdisplay; y++)
+			vkms_writeback_row_direct(active_wb, crtc_state->active_planes[0], y);
+
+		return 0;
+	}
+
 	line_width = crtc_state->base.mode.hdisplay;
 	stage_buffer.n_pixels = line_width;
 	output_buffer.n_pixels = line_width;
@@ -708,7 +761,7 @@ static int compose_active_planes(struct vkms_writeback_job *active_wb,
 	}
 
 	blend(active_wb, crtc_state, crc32, &stage_buffer,
-	      &output_buffer, line_width * pixel_size);
+	      &output_buffer, line_width * pixel_size, direct);
 
 	kvfree(output_buffer.pixels);
 free_stage_buffer:
@@ -858,6 +911,10 @@ int vkms_set_crc_source(struct drm_crtc *crtc, const char *src_name)
 
 	ret = vkms_crc_parse_source(src_name, &enabled);
 
+	spin_lock_irq(&out->lock);
+	WRITE_ONCE(out->crc_enabled, enabled);
+	spin_unlock_irq(&out->lock);
+
 	vkms_set_composer(out, enabled);
 
 	return ret;
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index b7eb7033fb4b..69f12cecd2f9 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -220,6 +220,8 @@ struct vkms_crtc_state {
  * @lock: Lock used to protect concurrent access to the composer
  * @composer_enabled: Protected by @lock, true when the VKMS composer is active (crc needed or
  *		      writeback)
+ * @crc_enabled: true while the CRC source is enabled. Written under @lock, read with
+ *		 READ_ONCE() from the composer worker
  * @composer_state: Protected by @lock, current state of this VKMS output
  * @composer_lock: Lock used internally to protect @composer_state members
  */
@@ -231,6 +233,7 @@ struct vkms_output {
 	spinlock_t lock;
 
 	bool composer_enabled;
+	bool crc_enabled;
 	struct vkms_crtc_state *composer_state;
 
 	spinlock_t composer_lock;
@@ -325,6 +328,8 @@ int vkms_verify_crc_source(struct drm_crtc *crtc, const char *source_name,
 void vkms_composer_worker(struct work_struct *work);
 void vkms_set_composer(struct vkms_output *out, bool enabled);
 void vkms_writeback_row(struct vkms_writeback_job *wb, const struct line_buffer *src_buffer, int y);
+void vkms_writeback_row_direct(struct vkms_writeback_job *wb,
+			       const struct vkms_plane_state *plane, int y);
 
 /* Writeback */
 int vkms_enable_writeback_connector(struct vkms_device *vkmsdev, struct vkms_output *vkms_out);
diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 7f1f29b589e8..8bbd517092a5 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 
 #include <linux/kernel.h>
+#include <linux/unaligned.h>
 #include <linux/minmax.h>
 
 #include <drm/drm_blend.h>
@@ -681,6 +682,31 @@ void vkms_writeback_row(struct vkms_writeback_job *wb,
 		wb->pixel_write(dst_pixels, &in_pixels[x]);
 }
 
+/**
+ * vkms_writeback_row_direct() - Copy a composed line into the writeback buffer
+ * @wb: the writeback job
+ * @plane: the plane the line comes from
+ * @y: line to write
+ *
+ * Only used when writeback_direct() returned true.
+ */
+void vkms_writeback_row_direct(struct vkms_writeback_job *wb,
+			       const struct vkms_plane_state *plane, int y)
+{
+	const struct vkms_frame_info *src_info = &plane->frame_info;
+	struct vkms_frame_info *dst_info = &wb->wb_frame_info;
+	u8 *src_pixels, *dst_pixels;
+	int rem_x, rem_y;
+	int x_limit = drm_rect_width(&dst_info->dst);
+
+	packed_pixels_addr(src_info, src_info->dst.x1, y, 0, &src_pixels, &rem_x, &rem_y);
+	packed_pixels_addr(dst_info, dst_info->dst.x1, y, 0, &dst_pixels, &rem_x, &rem_y);
+
+	/* compose_direct() guarantees no alpha, so byte 3 is padding. */
+	for (int x = 0; x < x_limit; x++, src_pixels += 4, dst_pixels += 4)
+		put_unaligned_le32(get_unaligned_le32(src_pixels) | 0xff000000, dst_pixels);
+}
+
 /**
  * get_pixel_read_line_function() - Retrieve the correct read_line function for a specific
  * format. The returned pointer is NULL for unsupported pixel formats. The caller must ensure that

-- 
2.56.1

