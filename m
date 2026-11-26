Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795708052;
	b=COTN4NqrL8Qkq30HDBSCMyw/sRxu8BQCkCYOyTBatKN22ON1y1E878Y3bGQaGcjDAoWr
	 oU1m3GgQvKG+h8kzQlZCkmRsHTOcC5hZWf4EMJYO9miZE+MBw23feQKnWD3Q5k1mD+xY5
	 lCxH69j2K1s/mhTp/junGA/jpstQ2Mx18WioZaM/gz7n8cM1rkg/Q1OUcbtfUi4SekTlF
	 QXK5I2Fc+qGuJLZAb+X1/FaIZoOhjeslRS6IXUDMmSy9xUDWHkh5Ir6TBeabfr0q+6Lb8
	 HQA86X/+wCeVBf7Wwol27N0fR49WZkHxDoKJWVHXITlasNtoF9+pTsg5hNeEZoOz4NA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795708052;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=b8av+eY3oOx9LPXN2r0kBM2LQdWTcF/2mS6LBsVDb0A=;
	b=aOY4KBw+4F59H3fe42cD61ZYTxTZrRTmzMWT/IqxW+9Jr5p+umRZPl71GG36liX9Zl9C
	 tP/KzYd51hHIVtgKHO/98IpH/gms76CNfhEth2ncviFwdp1G0pqQgUUmvRLCIobPrn4Td
	 hWqMCDUwIFPU1+lnOm5zV8OnaFEzQxw7AO+gVjRnjXXTTnWiS390glIE2wR5ObM3I49LZ
	 ajMPfaBNFHtsBRKRBeqUjtyhE8JpyeW6DNMbLti/iurkjiEXE8BOrxf7zOdDq15OgPYP+
	 trbCe9jGMOUxVTdUWUieHSKs9G2xsK/2xJkcYXZ1rV4HPuUVxAv9W0VfpXoxBEkMzog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MsW709AE;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B23606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:47:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59B23606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MsW709AE
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bba60271d7so17825475e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795708051; x=1796312851; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b8av+eY3oOx9LPXN2r0kBM2LQdWTcF/2mS6LBsVDb0A=;
        b=MsW709AE7DCFt6ZCPdwuiR9NXzG0ktRhRxTSaEAAjniAAP1vLPOEKl8std6LbyIMoJ
         2NgV7pZo3o/LqfODJ2a8oDGgzleXafQsqbCTh33NoE2DBW7tC8FnzqNmcThuWedXTAqc
         0BK55TV++FN8jBawVuPKh7mjz30n7o9I2sSTB16gA5LoR6Sj/UmHc9EQRNYF3WbqrZmO
         IRAX1RRhA8Oy2S9Adofb8r351ynx3APPNqJBdh/6ee4/Ql1iDs2CkAPlndcAKnzWqzVO
         4V/I1OWYXKUkuMtehZRS7Usseu9JmTT/KS5OA797LDzzCFEo092H2nJBND+0NqZ+u52x
         H5fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795708051; x=1796312851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b8av+eY3oOx9LPXN2r0kBM2LQdWTcF/2mS6LBsVDb0A=;
        b=tJ604WiMYwpmjrjVUzmBw4rFsx/OMH4JXwNQxJrkgK7tJ29rIUBm0hS+8cC9AK7JOe
         LP0G2MdaP2DuFfhXrQMekAHOzkQ9WmS1HLbIs5AIEmcPLWBg30K6RnO4N9hazkuLQZ0P
         gORikqBbpwoiTStsv7jicFvgvOZeYhxwGT+JyPRKEgURmhYD1RuTvM4O5emUfn5ec7Zu
         vo79rKzcN6DC2V5ZMcBxMApnxydDNyMTbrhJLTl8FIElyIKKnpSVbbDVGgZz09EE8mW+
         3QtFDtg9EbPFv2IqpFOzy62HKuTDaXxyxBP0VL7sQFiCdao2gD5DEUyZqpxe3UGyLjVo
         hdtg==
X-Forwarded-Encrypted: i=1; AL+hErHmSjjFpSQju/Sl+EpoNMKcFY3GX6Q9zKZDtxeX89utYqxZmmr7u7N6ErNSZ5o8jXRYlyMf9bzCOXwvd1w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9uElzYGgHpBHFXqcbNLqidzPd40v1c2jBZptSAoXsC5+n/YCtT
	R3r6ZBre+dqWW5kXgcTdUcKxk6pG8MNV0vtxc8oRx/O2S+0X4wE7/5zP
X-Gm-Gg: AZFdTZcFM24KsvUP2j7eU8sYyg8DDTEz+N9aBzWEwxS2O+pcMq9NMdpgjvOcMqqRjWv
	H45eaApzOji9LhBOuFK2tJvli2nGsrEL9gV5DiGRgK0SjMRn4t966k9BLZfAVyCbV5lqzVdn5K4
	rVGSnWrEZ0Hifok+DKwwJ1G6zd0HUlMpkzf3d16oYGcBeTY4Ifkn2HTN/TpnsVqSZeksmkPonNF
	5JOQR18zEsonNtiWNIvuXJdKgQqLn2b8ZUIwa1G4aIYm/HNZ1N8fr9m1bF6WGXScV9VHt44FbnW
	CAw3Su8EORw5uLbdCbbXpBiYEyGS5CcMaYSyRKgBo40zUW4Mx5SqGkxkfJ7hMW0lKhwwFKu/CyR
	yQg/8gXRp6mJJHdtYJCezWY8ltOWXz4ieEkxFwRTFYHH7FJqY7jaS6Ir182JvH278yJBWbwPFRf
	/Tta/ntGLT4NLDpApDBeObPe0KnnfqdemUHOV6ekeWwCkQgbGxps61MDzIiXXJvs15jcA5pD4ac
	ljF0A+VtSBeAaIpOmV/TpBA4bFtVuS16jSWsF4V3seqX6c146MePMYzatkzpb+ngiH2ShTXhSQJ
	C6/TXmNrIgWp+T69CPIibOhwfq1vtX3ujdbIrw==
X-Received: by 2002:a05:600c:4584:b0:4bb:5de1:e90f with SMTP id 5b1f17b1804b1-4bb88819bcdmr430968735e9.31.1795708050657;
        Thu, 26 Nov 2026 07:47:30 -0800 (PST)
Received: from [10.56.169.198] ([95.179.249.152])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b3a7sm683201895e9.3.2026.11.26.07.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 07:47:30 -0800 (PST)
From: Oarora Etimis <oaroraetimis@gmail.com>
Date: Thu, 26 Nov 2026 16:47:07 +0100
Subject: [PATCH 1/2] drm/vkms: skip a blend that cannot change the frame
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
Message-Id: <20261126-composer-fastpath-v1-1-aa7458d84a7b@gmail.com>
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

A single full-screen plane no longer goes through fill_background() and the
line blend: read it straight into the output line.

Signed-off-by: Oarora Etimis <oaroraetimis@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 44 ++++++++++++++++++++++++++++++++----
 1 file changed, 40 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 7a6a7875520c..4e2dd568bc3e 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -452,13 +452,15 @@ static void clamp_line_coordinates(enum pixel_read_direction direction,
  * @crtc_x_limit: width of the output buffer
  * @stage_buffer: temporary buffer to convert the pixel line from the source buffer
  * @output_buffer: buffer to blend the read line into.
+ * @blend_direct: false to read the line straight into @output_buffer
  */
 static void blend_line(struct vkms_plane_state *current_plane, int y,
 		       int crtc_x_limit, struct line_buffer *stage_buffer,
-		       struct line_buffer *output_buffer)
+		       struct line_buffer *output_buffer, bool blend_direct)
 {
 	int src_x_start, src_y_start, dst_x_start, pixel_count;
 	struct drm_rect dst_line, tmp_src, src_line;
+	struct line_buffer *read_buffer = blend_direct ? stage_buffer : output_buffer;
 
 	/* Avoid rendering useless lines */
 	if (y < current_plane->frame_info.dst.y1 ||
@@ -542,12 +544,43 @@ static void blend_line(struct vkms_plane_state *current_plane, int y,
 	 * buffer [1].
 	 */
 	current_plane->pixel_read_line(current_plane, src_x_start, src_y_start, direction,
-				       pixel_count, &stage_buffer->pixels[dst_x_start]);
+				       pixel_count, &read_buffer->pixels[dst_x_start]);
+
+	if (!blend_direct)
+		return;
+
 	pre_blend_color_transform(current_plane, stage_buffer);
 	pre_mul_alpha_blend(stage_buffer, output_buffer,
 			    dst_x_start, pixel_count);
 }
 
+static bool compose_direct(const struct vkms_crtc_state *crtc_state)
+{
+	const struct vkms_plane_state *plane;
+	const struct drm_rect *dst;
+
+	if (crtc_state->num_active_planes != 1)
+		return false;
+
+	plane = crtc_state->active_planes[0];
+	if (!plane)
+		return false;
+
+	dst = &plane->frame_info.dst;
+	if (dst->x1 != 0 || dst->y1 != 0 ||
+	    dst->x2 != crtc_state->base.mode.hdisplay ||
+	    dst->y2 != crtc_state->base.mode.vdisplay)
+		return false;
+
+	if (plane->frame_info.fb->format->has_alpha)
+		return false;
+
+	if (plane->base.base.color_pipeline)
+		return false;
+
+	return true;
+}
+
 /**
  * blend - blend the pixels from all planes and compute crc
  * @wb: The writeback frame buffer metadata
@@ -579,6 +612,7 @@ static void blend(struct vkms_writeback_job *wb,
 
 	int crtc_y_limit = crtc_state->base.mode.vdisplay;
 	int crtc_x_limit = crtc_state->base.mode.hdisplay;
+	bool direct = compose_direct(crtc_state);
 
 	/*
 	 * The planes are composed line-by-line to avoid heavy memory usage. It is a necessary
@@ -588,11 +622,13 @@ static void blend(struct vkms_writeback_job *wb,
 	 * algorithm for a specific format, into the staging buffer.
 	 */
 	for (int y = 0; y < crtc_y_limit; y++) {
-		fill_background(&background_color, output_buffer);
+		if (!direct)
+			fill_background(&background_color, output_buffer);
 
 		/* The active planes are composed associatively in z-order. */
 		for (size_t i = 0; i < n_active_planes; i++) {
-			blend_line(plane[i], y, crtc_x_limit, stage_buffer, output_buffer);
+			blend_line(plane[i], y, crtc_x_limit, stage_buffer,
+				   output_buffer, !direct);
 		}
 
 		apply_lut(crtc_state, output_buffer);

-- 
2.56.1

