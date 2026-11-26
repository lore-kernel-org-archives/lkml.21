Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795712375;
	b=sgcsQM3Rx8mgyB+dkX1ciEaeD9nY8D1EZAUW65Z/E9IWuA6A0C41yZ8Qd05mL3bgZCu2
	 TTgXloDDlisN9Wd3d92W5nWJhp/gL0PgNdCX4hvYeMw3mTFyJmym8WjJYWO/0+iFP44SI
	 Ro/Ik9NdmJzGmL2svQF2LRSQgBfXDOLuUxqA+Cl7NYhmCINH1c0jKesWuII+5fZOlheXT
	 dpfRGzdYnthVgX7CXSWM29FIKRRQy1cmtq8No+eWNoFTyciy/HlhsG0HYKvMvlmFpydqF
	 BN+tqu2Fi5A2V+GU/V9VPNdMHDha9pYdh+AhfIF/0Ti7L9gJwjTVNhk/7S5Sj/qCC4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795712375;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=UNGA/1n2bWHLcGx1c23w17fck2ByGOHPPmEA+8qZEVY=;
	b=Mb/oiaAP+Hra3PVdwsRrsYDYQim5UZHtpSC4GWZKF501rzIj+UVnZpZ6T3K1ir7nC60E
	 9e+gTc6zWcIEhDjsCmNPO5f6QRbt1ps4sC3RU7+qg5BnErplBXkv/7/sm+sm9wgR8TXsr
	 4zrYGu6RtzoZb/9Y6ezNxv3F3wIJnrZHRw1s2VNZdei7DcgavQDb2gdajNts4x0VJDUjM
	 BU85lAaIJkxVXrQzI9aPzTzATcAGbU3cUCeKOGmSVdEnywOv8JlforihcjBGSMb9DQdgV
	 C6eJo2qWsHsQdG+LpJlLUepdoBFFjmKZvm/C/B9AyqcXURS17hnEya6GCDTLOdFPSWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0hln6GmB;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE22606A329
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:59:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FE22606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0hln6GmB
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so4541210f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795712373; x=1796317173; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UNGA/1n2bWHLcGx1c23w17fck2ByGOHPPmEA+8qZEVY=;
        b=0hln6GmBbcaPHpNoZIV+ih9Td6vkB6LewnBL6DODibcBPsWuLKTLJe3R38qnnAukBw
         JCVkSo6il2AJEc4wgCRVgWWe0KKdD8nAJFj3vOfaqU9dP/IxpMhDc+Z96UeU8gCsF/h/
         nutY1OPVQLeuZCAE/Z9e+oXbxyJfTeDcXZAXsPb51KfZmXUHsP2WbGWrSOZsDTrLxk+3
         F/DgzfYNfL9vmEaNdcCUUCmkfQXsgkO0rEzrNvNUD2lRxGluomLH4Gl4Gx2kpd2fdjdo
         HsUnhvZILRV+eZhWjQYJKP4QpS6ejGsmZdzsiYdxua9WK5CorFffKFd7hq3gBZ80QXxV
         GjkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795712373; x=1796317173;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UNGA/1n2bWHLcGx1c23w17fck2ByGOHPPmEA+8qZEVY=;
        b=GwiXkVHktY2BUTHoxeClgmaS+mnBrVl8IxQ7iH521XIooXuuCbgMBKzru16+AZReLP
         AvabWEZ8WQJsvp2WgEa1xKu8hDvQAYz1qhHD9gP092ZFCkoAnlvY+PCzWiMg6TmnwQ0F
         xFeER3ULKmFGdbjAll93Mft0RdspKS5DOE83+u6I2FpsFlprYwRBhAuGNkb6jGGgDom3
         orXsF4sSNv2H57/yEmli+I3nmXXAg6TimKXSb6bj47vFmYadZjr5+6QoFtxTKBmY4LDr
         p5SFx3LHnRMFhxzseWefcKv6tYs8KJRUcPsk1M6LFJn+0DF2M7yXwxGHisZ37Y9iho8B
         4Yew==
X-Forwarded-Encrypted: i=1; AL+hErHUikMYV4Z5dWW6vr+WB5bhfG/r14olt/psMB4pgbZ6ocnR29d9b7bkuMKSCY2agFVzB4srDDUTwt7m914=@vger.kernel.org
X-Gm-Message-State: APuU4Z+wboscgz2fr5lVPAcaZQ/DrCD4QZKLZKLT0LR1lbUh0NIbuwD4
	5PUSZx4dmWz9wFqEk35XZDtnqFk3kN0XzeOPq7T6BWCg7ho+XA96Tu20
X-Gm-Gg: AZFdTZdKm0j5tgTUVsRXlGLUh0DW1qJp9kl/2CZszxEpWj11sfcavVh9t7heEXakmUk
	GveQKP7v/qISExL6x8diJMmURE4ABBYUY82GGnZ3LdyqtVAWd7LH8/plTjfYqZxbJqkXKcXtHMV
	/6dPRgUn06c+wG0oDGXcvsIDOLQwnFlpmlezcabUUdWmR86i4Ytrt+4weF/dtPIrhPi/7fBYoJW
	kgunoP+Zs9s6+0oYEX4PNIRgQIArsQmOXEUXlHgu9CvSNx8cSNfuTyI06Da1EWMfCnmzIpv2UVK
	EqRibrS8h2tXr3sGxQELPgnflLXUJRo2Icj1Y7vCeD1Hk3gPL89IHrEN7hnOPdyAokCkAkqTE0H
	RjBoA3Y3FQsgFy27hylzcPtoN3Zyx1GgwXtdnG6/kbt5ghJVKb7fMea5s5xFtSzymC2dTHQDZyr
	q/HKH5nWE+JYZzdpUTcxAhxvJNEuy+k2sKi3xx3a1RFDVbMhokWVMJnMitrOHvPRJL0wwe4M8TV
	CwS5CFVt62caZjx3J5LJkHPLZuvVvNQEjb/Y28WN1atdJjcj4UhxINKnOuVgOhqqlSmsCEvwJQ/
	BEW8f7ITAbr6yPLh2/tqZqLxQhZtgStwDAeFyA==
X-Received: by 2002:adf:ef06:0:b0:4a9:5848:3640 with SMTP id ffacd0b85a97d-4abb5db79e6mr34143975f8f.55.1795712372601;
        Thu, 26 Nov 2026 08:59:32 -0800 (PST)
Received: from [10.56.169.198] ([95.179.249.152])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b70c05b9desm17700731f8f.54.2026.11.26.08.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 08:59:32 -0800 (PST)
From: Oarora Etimis <oaroraetimis@gmail.com>
Date: Thu, 26 Nov 2026 17:59:04 +0100
Subject: [PATCH v2 2/2] drm/vkms: copy a full-screen frame straight to
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
Message-Id: <20261126-composer-fastpath-v2-2-292ed6d4c4d6@gmail.com>
References: <20261126-composer-fastpath-v2-0-292ed6d4c4d6@gmail.com>
In-Reply-To: <20261126-composer-fastpath-v2-0-292ed6d4c4d6@gmail.com>
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
 drivers/gpu/drm/vkms/vkms_composer.c | 82 +++++++++++++++++++++++++++++++++---
 drivers/gpu/drm/vkms/vkms_drv.h      |  5 +++
 drivers/gpu/drm/vkms/vkms_formats.c  | 26 ++++++++++++
 3 files changed, 106 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 4e2dd568bc3e..239fdaca2926 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -581,6 +581,47 @@ static bool compose_direct(const struct vkms_crtc_state *crtc_state)
 	return true;
 }
 
+/**
+ * writeback_direct() - Can the frame skip the line buffer?
+ * @crtc_state: the state to compose
+ * @wb: the writeback job, or NULL
+ * @plane: the plane the frame comes from
+ * @crc_on: whether this frame has to produce a CRC entry
+ *
+ * True when nothing needs 16-bit pixels: no CRC, no LUT, no colour pipeline.
+ *
+ * Returns: true if the frame can be copied straight into the writeback buffer.
+ */
+static bool writeback_direct(const struct vkms_crtc_state *crtc_state,
+			     const struct vkms_writeback_job *wb,
+			     const struct vkms_plane_state *plane,
+			     bool crc_on)
+{
+	const struct drm_format_info *format;
+
+	/* The CRC is computed over the 16-bit line buffer. */
+	if (!wb || crc_on)
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
+	/* The copy assumes the padding byte, which only XRGB8888 has here. */
+	return format->format == DRM_FORMAT_XRGB8888;
+}
+
 /**
  * blend - blend the pixels from all planes and compute crc
  * @wb: The writeback frame buffer metadata
@@ -589,6 +630,7 @@ static bool compose_direct(const struct vkms_crtc_state *crtc_state)
  * @output_buffer: A buffer of a row that will receive the result of the blend(s)
  * @stage_buffer: The line with the pixels from plane being blend to the output
  * @row_size: The size, in bytes, of a single row
+ * @direct: true when the plane can be read straight into @output_buffer
  *
  * This function blends the pixels (Using the `pre_mul_alpha_blend`)
  * from all planes, calculates the crc32 of the output from the former step,
@@ -597,7 +639,8 @@ static bool compose_direct(const struct vkms_crtc_state *crtc_state)
 static void blend(struct vkms_writeback_job *wb,
 		  struct vkms_crtc_state *crtc_state,
 		  u32 *crc32, struct line_buffer *stage_buffer,
-		  struct line_buffer *output_buffer, size_t row_size)
+		  struct line_buffer *output_buffer, size_t row_size,
+		  bool direct)
 {
 	struct vkms_plane_state **plane = crtc_state->active_planes;
 	u32 n_active_planes = crtc_state->num_active_planes;
@@ -612,7 +655,6 @@ static void blend(struct vkms_writeback_job *wb,
 
 	int crtc_y_limit = crtc_state->base.mode.vdisplay;
 	int crtc_x_limit = crtc_state->base.mode.hdisplay;
-	bool direct = compose_direct(crtc_state);
 
 	/*
 	 * The planes are composed line-by-line to avoid heavy memory usage. It is a necessary
@@ -670,10 +712,12 @@ static int check_iosys_map(struct vkms_crtc_state *crtc_state)
 
 static int compose_active_planes(struct vkms_writeback_job *active_wb,
 				 struct vkms_crtc_state *crtc_state,
-				 u32 *crc32)
+				 u32 *crc32, bool crc_on)
 {
 	size_t line_width, pixel_size = sizeof(struct pixel_argb_u16);
 	struct line_buffer output_buffer, stage_buffer;
+	const struct vkms_plane_state *plane;
+	bool direct;
 	int ret = 0;
 
 	/*
@@ -690,6 +734,17 @@ static int compose_active_planes(struct vkms_writeback_job *active_wb,
 	if (WARN_ON(check_format_funcs(crtc_state, active_wb)))
 		return -EINVAL;
 
+	direct = compose_direct(crtc_state);
+
+	plane = crtc_state->active_planes[0];
+
+	if (direct && writeback_direct(crtc_state, active_wb, plane, crc_on)) {
+		for (int y = 0; y < crtc_state->base.mode.vdisplay; y++)
+			vkms_writeback_row_direct(active_wb, plane, y);
+
+		return 0;
+	}
+
 	line_width = crtc_state->base.mode.hdisplay;
 	stage_buffer.n_pixels = line_width;
 	output_buffer.n_pixels = line_width;
@@ -708,7 +763,7 @@ static int compose_active_planes(struct vkms_writeback_job *active_wb,
 	}
 
 	blend(active_wb, crtc_state, crc32, &stage_buffer,
-	      &output_buffer, line_width * pixel_size);
+	      &output_buffer, line_width * pixel_size, direct);
 
 	kvfree(output_buffer.pixels);
 free_stage_buffer:
@@ -734,7 +789,7 @@ void vkms_composer_worker(struct work_struct *work)
 	struct drm_crtc *crtc = crtc_state->base.crtc;
 	struct vkms_writeback_job *active_wb = crtc_state->active_writeback;
 	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
-	bool crc_pending, wb_pending;
+	bool crc_pending, wb_pending, crc_on;
 	u64 frame_start, frame_end;
 	u32 crc32 = 0;
 	int ret;
@@ -772,10 +827,16 @@ void vkms_composer_worker(struct work_struct *work)
 	if (!crc_pending)
 		return;
 
+	/*
+	 * One read for both the direct-path decision and the CRC entry: a frame
+	 * must not be queued with a CRC that was never computed.
+	 */
+	crc_on = READ_ONCE(out->crc_enabled);
+
 	if (wb_pending)
-		ret = compose_active_planes(active_wb, crtc_state, &crc32);
+		ret = compose_active_planes(active_wb, crtc_state, &crc32, crc_on);
 	else
-		ret = compose_active_planes(NULL, crtc_state, &crc32);
+		ret = compose_active_planes(NULL, crtc_state, &crc32, crc_on);
 
 	if (ret)
 		return;
@@ -790,6 +851,9 @@ void vkms_composer_worker(struct work_struct *work)
 	/*
 	 * The worker can fall behind the vblank hrtimer, make sure we catch up.
 	 */
+	if (!crc_on)
+		return;
+
 	while (frame_start <= frame_end)
 		drm_crtc_add_crc_entry(crtc, true, frame_start++, &crc32);
 }
@@ -858,6 +922,10 @@ int vkms_set_crc_source(struct drm_crtc *crtc, const char *src_name)
 
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

