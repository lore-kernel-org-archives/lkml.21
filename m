Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795712367;
	b=i4ERFLtMTbUc/qj6jyuPauHzORPf3t84ysnHt3ec77x8gJu/xP9U1g7HOfi/MR1rgq4o
	 nU4Nz+gxPe7Mk1CrV+0D2wtHRjDC9ukFsrkbJULXMfAtinxd7Rw0Phc2xeXQZ5OCcT8z4
	 MadQhJNEQFjvNZBlzmKBydyLI6Si0gaDyrydGQTU/PBH4bsnxsvnnbKk8Impeg9ykAnMX
	 OjoF2T2lBz4LyKLVnvEbJQsgWE7MjoSSc27KyNaXOwPkDUfIZy46dL25+DEa1cIFzj6YF
	 OY2tNjyixegasuYLec+isagxs6WuT4+YKckdhQmzbZ4U3hdjE6H5Jr+w5gEEMMQkfTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795712367;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=b8av+eY3oOx9LPXN2r0kBM2LQdWTcF/2mS6LBsVDb0A=;
	b=zjf4AkBh2vCBL68epKMzXDP/1ydMMHCzD08lI6ngFrRkDHslfGPaiDLUNGr6+ELHc5ho
	 KVPLDLfO1sRjuSwmvFH8l/kx6iklD2l0gDSlSj7SOjSkb4ARyROPPHVg36K+Nxp/y4Q8W
	 toiqF1+DoiKCI3LPxAtSJzJj7pnFbzMWb1Bu2zRgwn5DRZL8MV2madjn9PBEUJMbVXuvU
	 p7FoibFFUkp/JF5BBQns+vGZdMoD6bQOg9+cWtOUuaEDyWAb7+LdcK786Oc6zt/IdDDDC
	 YXo5b9uOnW8KCnT8Sgl2GfDDGMVF9AYlXF5HvRauoVRrNeGCym7Ac7u12r7IEdldQsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TPUDT6Zd;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDBD606A329
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:59:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EDBD606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TPUDT6Zd
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4a358881793so3826255f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795712366; x=1796317166; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b8av+eY3oOx9LPXN2r0kBM2LQdWTcF/2mS6LBsVDb0A=;
        b=TPUDT6ZdIiba7qHj2nH18/HGKFO8QgMPUcj6KVM4ngw5HLCdt336FeBFzeWnasJc/o
         G8f69ayq3p8QEGrc18hXxwTYeZB4wFbVKcjhuVy392zHqYUOWAulCGLHs5ysp57Tq0Bd
         5/ZbGtP6B5m+Mm0BvLSWtcfpA+p02yS5BnkZdlkOCBa8c9GXr5C1HvhQ6B2j9lIJmSTI
         HBF/DRgDvnuwZcErZg/Y58wnvybokyYG0192OvjIQcbApVPMrDPzEpUTZNk6/rFrg30+
         QrBic49i2WGDDHYdah/VpPV8/m1lOyXSRz/4Kl2KcYxsFeRQcsNKEbx0GPhUCjxOclng
         E1DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795712366; x=1796317166;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b8av+eY3oOx9LPXN2r0kBM2LQdWTcF/2mS6LBsVDb0A=;
        b=iZhyUOFeUUc2ll/XiaJz7Y05jmsNSaPvlG3YzVE2QKKzPBz6pFRf3MgLV7iTqGIRUD
         UHLrgNBQIMjm53TowiitBaJxl4Mnojm3x7+rVUGH4L13+1eUrnRUJ622YLEFVcy4BTi5
         oso8Zx18Ij7DLdHJfcE0TSPoJNEE/q5mYxhAzVcI/cj2iEmkAhrLBjeEffbBGhIuYn5M
         Sob4yl26RHBG6wHVahhdMEdiLiBcBxvFu3KcXsys0Op+FEoCiwy32UYWMFr9sCLP/0Xw
         QXQ9ebSkteFeDFqERwcNTl1TFsqqC1SVICyxNQ0jgTrDR0S5mATQYOziQ183I84E+bEI
         uA4g==
X-Forwarded-Encrypted: i=1; AL+hErHLg+eXQGkuMPEsCilR6AhcXYE4KAv84aGf2xjx0azWjU5EY73cdloc+jszsVCtJTf3Dp0x21n9BySVHS4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CCum3CqBaxpuFbSTLdWeCkY/lRp8DCQYOi+CMPLBG2aIQdF6C
	Tx8Gx8Jogj4SuqFb/b/Y+vmZ/vqKEn+2j4fRV/LyiQqfh9evoO34paLM
X-Gm-Gg: AZFdTZfz0pGgAsQS1h5wEAFdh1wpecVJwKy+z+ZuMAPsNYCY2SqYLU4t8n0n6P8G5Vr
	6tlJfmfOrDp8RvCerQ8btR6AziCnUo69PBQmhPtHKuMqMi/Hx7nd9MJ1eRN/gsn/UWeUxk0cIrw
	bOC7hQggRQK44yfJDpfUGVo6mMXoRQzh6mZePOfeAKUs78qgXaR+CBh+9HCyeRAl32AymRK1P8F
	uhjpxuT3PE5KzSVJZhsN5Pf9KfkeRBR3UFzVGQ37ADTRZpS66fdvslqMcw8e6ap8iRYfB4W2Nsa
	EGkkJVl+orQp0tzlA03oaVb2X4Y8RDA5pjML/W8or1VK2y8sQRgnNfZ9MbPiThNli+TmGgZRrE5
	jEvEIKsVIS/gqfoX3P1O+eSHLXugaJbjn6Rks0SqT2JiIyYwFBKN+xLEucoBKedMOO4QwF+R65u
	j62n7Bn6FQDzliuIUDFK6JS4DiJEWnQoPqUt0FKj+J1i1QvelXwG7Pe0Lu+O1aPVNTI1p+mElwY
	g7CVsZkiS3zzOYf0gZLb3cnyJcE7lv0dTg13Y0pvVKYZkQNOa+NpO9ZXWTF0Nuqzm53vkmcD41G
	ucDyIJuPkBFGDR/SU/MYWCgvhvLC7ujKL707Aw==
X-Received: by 2002:a05:6000:2f87:b0:4a6:bc53:246b with SMTP id ffacd0b85a97d-4abb5144ebdmr41390317f8f.30.1795712365536;
        Thu, 26 Nov 2026 08:59:25 -0800 (PST)
Received: from [10.56.169.198] ([95.179.249.152])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b70c05b9desm17700731f8f.54.2026.11.26.08.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 08:59:25 -0800 (PST)
From: Oarora Etimis <oaroraetimis@gmail.com>
Date: Thu, 26 Nov 2026 17:59:03 +0100
Subject: [PATCH v2 1/2] drm/vkms: skip a blend that cannot change the frame
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
Message-Id: <20261126-composer-fastpath-v2-1-292ed6d4c4d6@gmail.com>
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

