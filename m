Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.208
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448815;
	b=RKwx/k1LZGwBZrshXFJS9h00M6ZBqtJkXn7JL7xvUjaopZx2ljRuuQcg8A/xBPlEJ2vg
	 d/rG0aII1XlW6SJfS902TS5m7hCnBiULg2afb/vWlCpLme6ipgYif0LNcyzSeRkM6lDQx
	 i0LDcUZxFk5ikoLVBAVA0xkvrgeR54am9Eht2cKUw5E1RalsY9rzCJkA/yFVi1qCuutsc
	 Ld3kwhQaIBpktwP1wnRD3xhcFzVVVmWimCMkeMN9MixUEU8WP6Rj6aOco941HnJmIatCr
	 FNBhVowX6LXt63EUZYPxZlT8I2IL9OVFTjgaAKJ2X51Zv23J7YQTQ7ZO6M6GkocsHTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448815;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=6wSM6bJIzLak+GtHusX7AwO8tXLz9YD5NU9wmlcxFnE=;
	b=paLChrEwZDNoEbZ3yVZ4AdcpQBtNmYF6HTCWMCPOCm+D50wem1Lh6l51glxtgA4wwH61
	 IFVgmCjb/Qb/R6bZZvn3l8MhC0AkGzI5KguKf+5Lq5NcASiDGgeT5UdTbTbv8DO7knaBa
	 He0maoXGQAewepYbTKZrL/8ZdHexkT4IrYwLSu3euWkrw7Hl7uWogR+Tc8Whk03EEac5c
	 7Dt3hP7UCRGKX3cAgj1pVOo3I0I8JS8WFN0Z0kZihAIPTvb7ku8k64LEUxauf8MLJzD2K
	 06zgTR2pe3V2UR6U6m8FS3hjztBZPUt4x991VVPQgVA6qupl8Xe+UiGA1K+EwW65J/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YloIXc8J;
	arc=none smtp.remote-ip=95.215.58.208
Received: from mta1.migadu.com (out-208.mta1.migadu.com [95.215.58.208])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2380A606A33B
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:46:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2380A606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YloIXc8J
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=GLjWfJQii4KAeYFmzXoodG7BkLl6SA+3HFo78s9YuCA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795448812; v=1; x=1796053612;
 b=YloIXc8JEdS7m1RiJAcTfH8a7nDSSbRf5WxnUbv5YhCrvanegxAmRS1J7byuMLKxwxlxtZet
 ACy0gfy8Coq/AMGVsR49LgHQqlNylt9fQFDljPppVwcMobb+olm6JORy/U8Yp03i6NJe5w7bt2U
 eN+G0z5RWv0sKa2UlFoj6zXQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d29356c4ea9cf703;
	Mon, 23 Nov 2026 15:46:51 +0000
X-Mizu-Trace-ID: d29356c4ea9cf703
X-Migadu-Flow: FLOW_OUT
From: Ruben Wauters <ruben.wauters@linux.dev>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Ruben Wauters <ruben.wauters@linux.dev>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v4] drm/gud: move format init from gud_probe()
Date: Mon, 23 Nov 2026 15:46:19 +0000
Message-ID: <20261123154638.2298-1-ruben.wauters@linux.dev>
X-Mailer: git-send-email 2.56.1
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

As part of the cleanup of gud_probe(), this patch splits off format init
code from gud_probe into it's own function. This makes the code more
compartmentalised and easier to follow, and makes gud_probe() smaller
and also easier to read.

Signed-off-by: Ruben Wauters <ruben.wauters@linux.dev>
---
V1 -> V2:
- Removed output parameters for gud_get_formats()
- Added gud_get_max_buffer_size() helper function

Apologies this v2 took so long

V2 -> V3:
- Fix potential num_formats underflow
- Skip XRGB8888 in size calculations if emulated
- Remove redundant r1 and XRGB1111 size calculations

V3 -> V4
- Take XRGB8888 emulated format into account when calculating
  max_buffer_size
---
 drivers/gpu/drm/gud/gud_drv.c | 185 ++++++++++++++++++++--------------
 1 file changed, 111 insertions(+), 74 deletions(-)

diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_drv.c
index 680447f426f3..1ffb2a4fc901 100644
--- a/drivers/gpu/drm/gud/gud_drv.c
+++ b/drivers/gpu/drm/gud/gud_drv.c
@@ -435,11 +435,115 @@ static void gud_free_buffers_and_mutex(void *data)
 	mutex_destroy(&gdrm->ctrl_lock);
 }
 
-static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
+static size_t gud_get_max_buffer_size(struct gud_device *gdrm, u32 *formats, u32 num_formats)
+{
+	struct drm_device *drm = &gdrm->drm;
+	size_t max_buffer_size = 0;
+	size_t fmt_buf_size;
+	int i;
+
+	for (i = 0; i < num_formats; i++) {
+		const struct drm_format_info *info = drm_format_info(formats[i]);
+
+		/* Substitute emulated XRGB8888 for proper format */
+		if (formats[i] == DRM_FORMAT_XRGB8888 && gdrm->xrgb8888_emulation_format)
+			info = gdrm->xrgb8888_emulation_format;
+
+		fmt_buf_size = drm_format_info_min_pitch(info, 0, drm->mode_config.max_width) *
+							 drm->mode_config.max_height;
+		max_buffer_size = max(max_buffer_size, fmt_buf_size);
+	}
+
+	return max_buffer_size;
+}
+
+static int gud_get_formats(struct gud_device *gdrm, u32 *formats)
 {
 	const struct drm_format_info *xrgb8888_emulation_format = NULL;
 	bool rgb565_supported = false, xrgb8888_supported = false;
 	unsigned int num_formats_dev, num_formats = 0;
+	u8 *formats_dev;
+	struct drm_device *drm = &gdrm->drm;
+	struct device *usb_device = gdrm->drm.dev;
+	int ret, i;
+
+	formats_dev = devm_kmalloc(usb_device, GUD_FORMATS_MAX_NUM, GFP_KERNEL);
+	if (!formats_dev)
+		return -ENOMEM;
+
+	ret = gud_usb_get(gdrm, GUD_REQ_GET_FORMATS, 0, formats_dev, GUD_FORMATS_MAX_NUM);
+	if (ret < 0)
+		return ret;
+
+	num_formats_dev = ret;
+	for (i = 0; i < num_formats_dev; i++) {
+		const struct drm_format_info *info;
+		u32 format;
+
+		format = gud_to_fourcc(formats_dev[i]);
+		if (!format) {
+			drm_dbg(drm, "Unsupported format: 0x%02x\n", formats_dev[i]);
+			continue;
+		}
+
+		if (format == GUD_DRM_FORMAT_R1)
+			info = &gud_drm_format_r1;
+		else if (format == GUD_DRM_FORMAT_XRGB1111)
+			info = &gud_drm_format_xrgb1111;
+		else
+			info = drm_format_info(format);
+
+		switch (format) {
+		case GUD_DRM_FORMAT_R1:
+			fallthrough;
+		case DRM_FORMAT_R8:
+			fallthrough;
+		case GUD_DRM_FORMAT_XRGB1111:
+			fallthrough;
+		case DRM_FORMAT_RGB332:
+			fallthrough;
+		case DRM_FORMAT_RGB888:
+			if (!xrgb8888_emulation_format)
+				xrgb8888_emulation_format = info;
+			break;
+		case DRM_FORMAT_RGB565:
+			rgb565_supported = true;
+			if (!xrgb8888_emulation_format)
+				xrgb8888_emulation_format = info;
+			break;
+		case DRM_FORMAT_XRGB8888:
+			xrgb8888_supported = true;
+			break;
+		}
+
+		if (format == GUD_DRM_FORMAT_R1 || format == GUD_DRM_FORMAT_XRGB1111)
+			continue; /* Internal not for userspace */
+
+		formats[num_formats++] = format;
+	}
+
+	if (!num_formats && !xrgb8888_emulation_format) {
+		dev_err(usb_device, "No supported pixel formats found\n");
+		return -EINVAL;
+	}
+
+	/* Prefer speed over color depth */
+	if (rgb565_supported)
+		drm->mode_config.preferred_depth = 16;
+
+	if (!xrgb8888_supported && xrgb8888_emulation_format) {
+		gdrm->xrgb8888_emulation_format = xrgb8888_emulation_format;
+		formats[num_formats++] = DRM_FORMAT_XRGB8888;
+	}
+
+	devm_kfree(usb_device, formats_dev);
+
+	return num_formats;
+}
+
+static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
+{
+	int num_formats = 0;
 	struct usb_endpoint_descriptor *bulk_out;
 	struct gud_display_descriptor_req desc;
 	struct device *dev = &intf->dev;
@@ -447,9 +551,8 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	struct gud_device *gdrm;
 	struct drm_device *drm;
 	struct device *dma_dev;
-	u8 *formats_dev;
 	u32 *formats;
-	int ret, i;
+	int ret;
 
 	ret = usb_find_bulk_out_endpoint(intf->cur_altsetting, &bulk_out);
 	if (ret)
@@ -510,81 +613,16 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	drm->mode_config.helper_private = &gud_mode_config_helpers;
 
 	/* Format init */
-	formats_dev = devm_kmalloc(dev, GUD_FORMATS_MAX_NUM, GFP_KERNEL);
 	/* Add room for emulated XRGB8888 */
 	formats = devm_kmalloc_array(dev, GUD_FORMATS_MAX_NUM + 1, sizeof(*formats), GFP_KERNEL);
-	if (!formats_dev || !formats)
+	if (!formats)
 		return -ENOMEM;
 
-	ret = gud_usb_get(gdrm, GUD_REQ_GET_FORMATS, 0, formats_dev, GUD_FORMATS_MAX_NUM);
-	if (ret < 0)
-		return ret;
-
-	num_formats_dev = ret;
-	for (i = 0; i < num_formats_dev; i++) {
-		const struct drm_format_info *info;
-		size_t fmt_buf_size;
-		u32 format;
-
-		format = gud_to_fourcc(formats_dev[i]);
-		if (!format) {
-			drm_dbg(drm, "Unsupported format: 0x%02x\n", formats_dev[i]);
-			continue;
-		}
-
-		if (format == GUD_DRM_FORMAT_R1)
-			info = &gud_drm_format_r1;
-		else if (format == GUD_DRM_FORMAT_XRGB1111)
-			info = &gud_drm_format_xrgb1111;
-		else
-			info = drm_format_info(format);
-
-		switch (format) {
-		case GUD_DRM_FORMAT_R1:
-			fallthrough;
-		case DRM_FORMAT_R8:
-			fallthrough;
-		case GUD_DRM_FORMAT_XRGB1111:
-			fallthrough;
-		case DRM_FORMAT_RGB332:
-			fallthrough;
-		case DRM_FORMAT_RGB888:
-			if (!xrgb8888_emulation_format)
-				xrgb8888_emulation_format = info;
-			break;
-		case DRM_FORMAT_RGB565:
-			rgb565_supported = true;
-			if (!xrgb8888_emulation_format)
-				xrgb8888_emulation_format = info;
-			break;
-		case DRM_FORMAT_XRGB8888:
-			xrgb8888_supported = true;
-			break;
-		}
-
-		fmt_buf_size = drm_format_info_min_pitch(info, 0, drm->mode_config.max_width) *
-			       drm->mode_config.max_height;
-		max_buffer_size = max(max_buffer_size, fmt_buf_size);
-
-		if (format == GUD_DRM_FORMAT_R1 || format == GUD_DRM_FORMAT_XRGB1111)
-			continue; /* Internal not for userspace */
-
-		formats[num_formats++] = format;
-	}
+	num_formats = gud_get_formats(gdrm, formats);
+	if (num_formats <= 0)
+		return num_formats;
 
-	if (!num_formats && !xrgb8888_emulation_format) {
-		dev_err(dev, "No supported pixel formats found\n");
-		return -EINVAL;
-	}
-
-	/* Prefer speed over color depth */
-	if (rgb565_supported)
-		drm->mode_config.preferred_depth = 16;
-
-	if (!xrgb8888_supported && xrgb8888_emulation_format) {
-		gdrm->xrgb8888_emulation_format = xrgb8888_emulation_format;
-		formats[num_formats++] = DRM_FORMAT_XRGB8888;
-	}
+	max_buffer_size = gud_get_max_buffer_size(gdrm, formats, num_formats);
 
 	if (desc.max_buffer_size)
 		max_buffer_size = le32_to_cpu(desc.max_buffer_size);
@@ -650,7 +688,6 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
 		return ret;
 
 	devm_kfree(dev, formats);
-	devm_kfree(dev, formats_dev);
 
 	drm_client_setup(drm, NULL);
 
-- 
2.56.0

