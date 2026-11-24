Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795560264;
	b=CnJe4Dx7vybp/rF9MApcMUnmFO8XZQUrjZFi7IZVLKgPmAGWbHlZGtTdFprExuIQ8mnF
	 MmJGbyZoNpRoCInoG4NkiVKwgiiiIwvFwjtYS+yNfqqr7u37ngdiSIXxGkiEklDa10aV7
	 TzJAY5tZ7kLSGztXmB3x0KE/Q7TTCzrgOCHEHYN883AENL3o/xZAB/II3ISUV6KU5las4
	 MHuKumrgJp8aZFQAWSAdEy6aHB/2IFiH04uo3sMyhdM1vr0LOSYZhC3TpoeFLr698a4X3
	 xuDRn4vWM4idYfs8HFyUgE4o8f5vRoveFJmCF2XEbhZpxfPGnTe1u0TEnNFz3sXqJOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795560264;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding:X-Scanned-By;
	bh=1bHd46+KpwMQScQq4CkEJ10JCX2sefKaCOj+OZ5ECJs=;
	b=kDXN8uPnCTdq5M5qUg8ADqla20U9Kn6r4nTUukuNjDTj3UH9oYpgDtlwSTKMmaNX5e6Y
	 C8Dk0NVtvVZy6x5/oc4czJuJniANeB2og6DjuhI4FTea7hpwQYTX1T5lBMpk1TuJUSfQK
	 P7khnWuuWKOXZrGZ4xUm6gOXYX1L7r42/dQsYIG+Hg0SCKtTsvs4mKEagxDFaIsUewJMV
	 Ch2BlAzf6F06n4kJHOtnRhEiEmxLjQIkKxkw/VxOQCKvNgHpcwQC7KX+WiIjaLKhlqJoO
	 V5BjfOw0EYBTe2rzV+drRH5+XlZ6UlGOxzx0ohqS2praDQFQN0UE6uPJE2F79sQ3dWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YAqTmJoM;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE04606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:44:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDE04606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YAqTmJoM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795560262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1bHd46+KpwMQScQq4CkEJ10JCX2sefKaCOj+OZ5ECJs=;
	b=YAqTmJoMhImWRknDY0m0SBwwjjtK5oyfRl+JQXw7yjfPULU5UrN7ZkV3yCK7jXssbz9AlC
	grj8TYbc6OyZjzEfr4XllGgrwa9MkbfF11WXadvVRvNKmZ2aMxODj4XG8P8lFPQTiAIneV
	keVbptpiZNoOZ+l7U3GknHX9zDRqUsc=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-161-ko6pDMnROS2WtMpUGbBfrA-1; Tue,
 24 Nov 2026 22:44:18 +0000
X-MC-Unique: ko6pDMnROS2WtMpUGbBfrA-1
X-Mimecast-MFC-AGG-ID: ko6pDMnROS2WtMpUGbBfrA_1795560257
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 28EA51955F14;
	Tue, 24 Nov 2026 22:44:17 +0000 (UTC)
Received: from jfalempe-thinkpadp1gen3.home (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7CC8C436;
	Tue, 24 Nov 2026 22:44:14 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Jocelyn Falempe <jfalempe@redhat.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/log: Add an automatic integer scaling
Date: Tue, 24 Nov 2026 23:42:28 +0100
Message-ID: <20261124224408.728354-1-jfalempe@redhat.com>
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
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

On HiDPI screen, the default font might be too small, so if no
scaling is specified, try to upscale reasonably.
The auto scaling is computed for each display.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/clients/drm_log.c | 36 ++++++++++++++++++++-----------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/clients/drm_log.c b/drivers/gpu/drm/clients/drm_log.c
index 4654091fe11a..7a0db2690b55 100644
--- a/drivers/gpu/drm/clients/drm_log.c
+++ b/drivers/gpu/drm/clients/drm_log.c
@@ -25,9 +25,9 @@ MODULE_AUTHOR("Jocelyn Falempe");
 MODULE_DESCRIPTION("DRM boot logger");
 MODULE_LICENSE("GPL");
 
-static unsigned int scale = 1;
+static unsigned int scale = 0;
 module_param(scale, uint, 0444);
-MODULE_PARM_DESC(scale, "Integer scaling factor for drm_log, default is 1");
+MODULE_PARM_DESC(scale, "Integer scaling factor for drm_log, default is 0 (auto)");
 
 /**
  * DOC: overview
@@ -42,6 +42,7 @@ struct drm_log_scanout {
 	const struct font_desc *font;
 	u32 rows;
 	u32 columns;
+	u32 scale;
 	u32 scaled_font_h;
 	u32 scaled_font_w;
 	u32 line;
@@ -72,17 +73,17 @@ static struct drm_log *console_to_drm_log(struct console *con)
 
 static void drm_log_blit(struct iosys_map *dst, unsigned int dst_pitch,
 			 const u8 *src, unsigned int src_pitch,
-			 u32 height, u32 width, u32 px_width, u32 color)
+			 u32 height, u32 width, u32 blit_scale, u32 px_width, u32 color)
 {
 	switch (px_width) {
 	case 2:
-		drm_draw_blit16(dst, dst_pitch, src, src_pitch, height, width, scale, color);
+		drm_draw_blit16(dst, dst_pitch, src, src_pitch, height, width, blit_scale, color);
 		break;
 	case 3:
-		drm_draw_blit24(dst, dst_pitch, src, src_pitch, height, width, scale, color);
+		drm_draw_blit24(dst, dst_pitch, src, src_pitch, height, width, blit_scale, color);
 		break;
 	case 4:
-		drm_draw_blit32(dst, dst_pitch, src, src_pitch, height, width, scale, color);
+		drm_draw_blit32(dst, dst_pitch, src, src_pitch, height, width, blit_scale, color);
 		break;
 	default:
 		WARN_ONCE(1, "Can't blit with pixel width %d\n", px_width);
@@ -122,7 +123,7 @@ static void drm_log_draw_line(struct drm_log_scanout *scanout, const char *s,
 		if (src)
 			drm_log_blit(&map, fb->pitches[0], src, font_pitch,
 				     scanout->scaled_font_h, scanout->scaled_font_w,
-				     px_width, color);
+				     scanout->scale, px_width, color);
 		iosys_map_incr(&map, scanout->scaled_font_w * px_width);
 	}
 
@@ -206,6 +207,15 @@ static u32 drm_log_find_usable_format(struct drm_plane *plane)
 	return DRM_FORMAT_INVALID;
 }
 
+/* Find the biggest integer scaling to get about 120x50 chars on the screen */
+static int auto_scale(unsigned int cols, unsigned int rows)
+{
+	unsigned int scale_w = DIV_ROUND_CLOSEST(cols, 120);
+	unsigned int scale_h = DIV_ROUND_CLOSEST(rows, 50);
+
+	return max(min(scale_w, scale_h), 1);
+}
+
 static int drm_log_setup_modeset(struct drm_client_dev *client,
 				 struct drm_mode_set *mode_set,
 				 struct drm_log_scanout *scanout)
@@ -230,8 +240,13 @@ static int drm_log_setup_modeset(struct drm_client_dev *client,
 		return -ENOMEM;
 	}
 	mode_set->fb = scanout->buffer->fb;
-	scanout->scaled_font_h = scanout->font->height * scale;
-	scanout->scaled_font_w = scanout->font->width * scale;
+	if (scale)
+		scanout->scale = scale;
+	else
+		scanout->scale = auto_scale(width / scanout->font->width,
+			                    height / scanout->font->height);
+	scanout->scaled_font_h = scanout->font->height * scanout->scale;
+	scanout->scaled_font_w = scanout->font->width * scanout->scale;
 	scanout->rows = height / scanout->scaled_font_h;
 	scanout->columns = width / scanout->scaled_font_w;
 	if (!scanout->rows || !scanout->columns) {
@@ -444,9 +459,6 @@ void drm_log_register(struct drm_device *dev)
 {
 	struct drm_log *new;
 
-	if (!scale)
-		scale = 1;
-
 	new = kzalloc_obj(*new);
 	if (!new)
 		goto err_warn;

base-commit: bcf5c42d6ed136cc407cea896f131d6893c830af
-- 
2.56.1

