Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795506084;
	b=ST7HwZ7JOQwBgrfLW4hOr62vhpPqhJ/WEYlmSuKGImUJZh30L90ALiWuTTZFm5yuGkoP
	 IK5nWEz6WflPioT/gs2A+ZzBJ3QeQxfhUZyA9gZorEwwcYIDUSMNyM/T9qqz0xRGhVFvT
	 6RLwBejwMwVN5O5m3WF/kBAXwN+GOicpjCRtLFssExPdXZGZse1tQkZHOdJOEUKKrXhp4
	 ZDdu6Xmk0BZ0EtTqXoO7WPqRXLuUCbXQsrOQjVosjKhYc2e4vD93lIp6AMoCMV8C5WV2B
	 vDF4w2F57Ut3SjkY8/owggVGA744d831VF2IVv1mkD6y2fv7f8nCzCFWbDEbNtmN9sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795506084;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=h3c2lWC29hGMhiXznbuXjidfPs4Wpjz3u2lyu3ifusU=;
	b=FO989z/7oXOrdxsxxY0Q090sKfW9/RO+NWBDlZPlcIHa1YRS72/mwD+BT87bG2/xRKx0
	 GZ5Ww5s+r5mUeRfcQnGHP07bqbUQcZOb8xUTbokkabuGiLKa5AUqDpAQkgsPDooY5GVCv
	 SCHPz9maCWR9gLHnqjQeGPxOabbM0DXe+EAwckXdY7QBOJRn6lU5AFcG0n9ERHQvEdk+D
	 vkLlUj/XHp8KohQ1ox8FKh4Lb4lOPQbVl9ZJmLmQiLv3s/Zd2VCAh8wwluteqJu2IR2LS
	 zfBdNjICyFhX70cLcRogS/oQdU2lAcvG8VzeW1iTsoc14Po0L9Don+ehCD5bitjSZmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=BrsbclA3;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C11606A322
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:41:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24C11606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=BrsbclA3
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2f04b676219so22116125ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795506082; x=1796110882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h3c2lWC29hGMhiXznbuXjidfPs4Wpjz3u2lyu3ifusU=;
        b=BrsbclA35y0a7HfK/8PlvEImvA518RJ+ikk3XR9xaYy9vLRhojBptQZNnm+BaP9RWv
         1n5YPUfugbaV+9X8S/DTa0CF1tdAcLQpW61YtTWk9bHS+CpZxzZ6A133z30hr0XuZG4P
         RiMm/QwoZaWQ46Bb24DCNLc1yP+AO7zS5h3ys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795506082; x=1796110882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h3c2lWC29hGMhiXznbuXjidfPs4Wpjz3u2lyu3ifusU=;
        b=zkjRbCsgFBJUye+sY/FVcPewgCdAnH+y73us6xXogjXsqINEf3PsH/pm6vhqEH7gpR
         8Pyp7Htegj7tLWwOAas8VuHfFPHOFXMaix7XiEzofDetzjQIeBDllVe8jopGgRQ53fQQ
         gnMcyJhE8+tWmStRbEdoRu6V44xgihWlFEhWnZuG9f82T1bcAgspD/Z4uQWt9To35Coe
         hprDIOabwjs0qpkQyzQsDm5q3OnG7gqX2gWPgqcZuDzDLM34IE0RFJ6aimX2sVAkPAmb
         7TTOSG+EHCXVmfwyB3GXt3FIxYs8s/tfPq2EffJtFk7zPRYgUyMyHvtJ0UpJlaQUPohe
         Dp7A==
X-Forwarded-Encrypted: i=1; AL+hErHoSMR/pt/QUwsMmTfrQj/T9h2Qb6EPDm3Qb3IIPW0Q4wNHXTM/zr9mifCy5RfMof7e126ODEHjur72zjg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+R6dZ5cP0Ljf90kvSYRGNNMg56D7zqwRtYRqDKzRqzZonoVate
	4kB8UvenjrBzNGAkGRyiFUvWN8GKavVjdRzzYCXdZm+2Hh+2xw2AiKpiwujktEv8iQ==
X-Gm-Gg: AZFdTZcgU7KUN/VMBb3cNCFdX/UVxhSXZa04NDkRgY8kxQoBlDikwokdy2SU/IXTsSz
	18K2WYKg1A50pJGFgwCnOCr23pWyr8JUcwj0QNS1SCD0NWWWFBG776DZw7XAiKRlM5viTZm6jlI
	ATr2JwwQfc/KvPXJvgOaEpXrOw5cwxbelLLY2ZYPrnx7T6xCTftrm7PbpK3z5zYbcIkzn54JVAI
	C59I/Ee50WO+CeHOOqhUgALPt1HOIN6GPp3HWCrWyDhi3Vt7U47bLrhgelKz/Nx9JM/gwRug4hN
	3oSMT5jcNXX32DKQVNdfEI1ZUhTXewWUyJkOElsapAeNpfuNcCxvd0R3hLEHtV1DowaP81gtQmv
	IyJnlBK+scdU/cvA58Db6CEWthvDSoKOfAfL5+MMhSewE1A3ZgTz0aut3lLc+7SUQiAGrh2RRGJ
	15+btXFeT9XqDJLjFZmKDXTnm9K79LGeYSls8AKzlOJFPS0MnrudHFLIQu6uwMVnbEu7IVJw6d7
	duBFXxL0j8CWlwXsARxdNbJNps1PSg2O7imydSY3Dtbg/kQBHd1cHToerAea8AeoLxvTbgC+R2f
	pOGXzTYmo1mAj7+QI5lFIeaqM90sDJdCL3iAToDUuVgyCRrnxEzxq/q8g3mr
X-Received: by 2002:a17:903:19e7:b0:2ed:b7e4:f5b with SMTP id d9443c01a7336-2f03f18a7d9mr127037815ad.40.1795506082519;
        Mon, 23 Nov 2026 23:41:22 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:8f32:8910:4727:ea03])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2f03f120830sm64742695ad.61.2026.11.23.23.41.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 23:41:22 -0800 (PST)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH RFT v3 5/5] drm/imx/dcss: plane: Switch to drm_fb_dma_get_gem_clipped_addr()
Date: Tue, 24 Nov 2026 15:39:33 +0800
Message-ID: <20261124074041.115251-6-wenst@chromium.org>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
In-Reply-To: <20261124074041.115251-1-wenst@chromium.org>
References: <20261124074041.115251-1-wenst@chromium.org>
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

The i.MX DCSS driver is open coding drm_fb_dma_get_gem_clipped_addr(),
with only a slight difference of rounding down the X offset for the
first plane if the format is packed, sub-sampled YUV. This is likely
to correct the buffer address to the first pixel of the 2-pixel group.
Otherwise the hardware will start the scan-out from the second pixel,
which leads to the U/V components getting swapped around, and the
chroma component of the next pixel group being used.

Switch to drm_fb_dma_get_gem_clipped_addr(), and offset the address by
a pixel if the X offset is odd.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/imx/dcss/dcss-plane.c | 34 +++++++++++----------------
 1 file changed, 14 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-plane.c b/drivers/gpu/drm/imx/dcss/dcss-plane.c
index 303e93fd036c..580d9cfb4053 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-plane.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-plane.c
@@ -219,28 +219,22 @@ static void dcss_plane_atomic_set_base(struct dcss_plane *dcss_plane)
 	struct dcss_dev *dcss = plane->dev->dev_private;
 	struct drm_framebuffer *fb = state->fb;
 	const struct drm_format_info *format = fb->format;
-	struct drm_gem_dma_object *dma_obj = drm_fb_dma_get_gem_obj(fb, 0);
 	unsigned long p1_ba = 0, p2_ba = 0;
 
-	if (!format->is_yuv ||
-	    format->format == DRM_FORMAT_NV12 ||
-	    format->format == DRM_FORMAT_NV21)
-		p1_ba = dma_obj->dma_addr + fb->offsets[0] +
-			fb->pitches[0] * (state->src.y1 >> 16) +
-			format->char_per_block[0] * (state->src.x1 >> 16);
-	else if (format->format == DRM_FORMAT_UYVY ||
-		 format->format == DRM_FORMAT_VYUY ||
-		 format->format == DRM_FORMAT_YUYV ||
-		 format->format == DRM_FORMAT_YVYU)
-		p1_ba = dma_obj->dma_addr + fb->offsets[0] +
-			fb->pitches[0] * (state->src.y1 >> 16) +
-			2 * format->char_per_block[0] * (state->src.x1 >> 17);
-
-	if (format->format == DRM_FORMAT_NV12 ||
-	    format->format == DRM_FORMAT_NV21)
-		p2_ba = dma_obj->dma_addr + fb->offsets[1] +
-			(((fb->pitches[1] >> 1) * (state->src.y1 >> 17) +
-			(state->src.x1 >> 17)) << 1);
+	p1_ba = drm_fb_dma_get_gem_clipped_addr(fb, state, 0);
+
+	/*
+	 * TODO fix address until helpers know packed, sub-sampled YUV format block size
+	 *
+	 * The buffer address for packed, sub-sampled YUV formats such as DRM_FORMAT_UYVY
+	 * need to be on the first pixel of each pixel group or block. Otherwise the first
+	 * pixel of the next pixel group is read and the U/V values get swapped around.
+	 */
+	if (drm_format_info_is_yuv_packed(format))
+		p1_ba -= ((state->src.x1 >> 16) & 1) * format->cpp[0];
+
+	if (format->num_planes > 1)
+		p2_ba = drm_fb_dma_get_gem_clipped_addr(fb, state, 1);
 
 	dcss_dpr_addr_set(dcss->dpr, dcss_plane->ch_num, p1_ba, p2_ba,
 			  fb->pitches[0]);
-- 
2.56.1.809.ga0b61035b5-goog

