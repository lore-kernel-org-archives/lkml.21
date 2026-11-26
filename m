Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795677235;
	b=N/aM/+eAyQs2rCgjmk30AinFospCZGBhkc6swwHmomNW/7JveKoc6QJFsaqlFSuJHAlc
	 zop1ZQtd866Y62dK69p0i5yoYfDGOsGkBVSDNKHgtj9bBTdiXSm+9HwJ17LbeAsa3jkd9
	 Zgs0/fx87drlK4iMxvn5V73FbL1/oc4su7EFo3RRbMlEomae8N6W1hksDJ8Rham1YxG+F
	 FY2/5k+37zXZSe+F271cHUMZPKH3VSBrReeEpM/wqrhMFihk+DVkGzSjLRYxjbgE2k5k/
	 /J/L4YpfTWqhDK+hFOZFulwsIbTNJgPidhA52LYehNoJo1mHTZjvzWkXj9JWf7Gbv5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795677235;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=J5KKQj+Grt6zgozyhH1Cn99N5gjYRol48Ra+q72Y3/4=;
	b=pt+lQV3MfMfv1bh4Hkuza2NrLefN9yDM+0BhSu/CyG6/b7rKgh9KX3Fjdi7tYZFEsoXw
	 /BYHO0Y8exW6X0kC1Cz9HawJD1YONMBO7kXxlufwUm3jgkXhFJIWv9wu0+P9ppGmisRC2
	 VTpH5fSgJK4QlstsqQ5Sh9Y0tjBrQB9/Un922qm9QokmwRa+uTx8a94v0REWTiwix2TAa
	 rFZ2iXVOmdJP7tT2rx180WE5B6lA/Zkpo2lvbCaACnM2FOhyLWPBl2DNO22vr4tXGoxNt
	 ICH99/54xKyoUQ2SINNZi6AvNE6NTPfKkx7xQuWcO3pbH3gTBZii+OkT4Gq8LdPrOUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="dw/TJmVi";
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C68606A32E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:13:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85C68606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=dw/TJmVi
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2f05b465cd1so36778685ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795677234; x=1796282034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J5KKQj+Grt6zgozyhH1Cn99N5gjYRol48Ra+q72Y3/4=;
        b=dw/TJmViaPaGPD3IZw+BbAdkABWz4AnzojGU8K7hK3Tp0opmlbnCZ/eEQFgQEA8sn1
         GxnORmGFCo2g9neol9fW4e6sJbqrzfiGnjVvr4pkvN7OCXBr2QZY7T4jO+96GhLs+j1l
         VykUQrCya+CqiWLP4iqeeNBV8aiReeMY3jb54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795677234; x=1796282034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J5KKQj+Grt6zgozyhH1Cn99N5gjYRol48Ra+q72Y3/4=;
        b=pAkcBozz20aEXLtEvoD6IVdvCd/Kse+JUMTvQFe7wbPriSXrprj19LRf86oKuZZeCW
         mGJLa4Pfv93Fe/FCng9c6M+wfNwlWpwna1xxr6MnCdkD6kTbk2QEYnlAd2cs67UKS4Qb
         zdyHzsWS+CJlBCy3EYRgaQ93kjsABIemx2OwZ0HRVwU/bclNzcU8sOsDcpeKpJh5gBDD
         MH/rved059ffWAF2TIAhIp5nGIQCa3DyFqSHRRGiqAxlDBWwgnnP74/txVSWyQNHB2a5
         tzH4Gd3nGz8bPIr/xlVD4XZDQIuXyzR1qUwxiawY46aqXQLy3GQ1wH6mbzp5vGT/oRRO
         T5BA==
X-Forwarded-Encrypted: i=1; AL+hErHCgT50g/NEFb3UvzBLZ3uzH3stb7JS8w5TzkRvBZGrLJuV25UMUbtGUJdENiSpFi/kEqW5/jqfcmK9RSU=@vger.kernel.org
X-Gm-Message-State: APuU4Z88VPUztpSRCjsGaN4Vz7PSeBuLTmnUkidkogjenab6CdY1SJXc
	uvuyCEnmxvbtzcnh0f+TcbO+Gv2Hh5HqE3Z6mqRMYiL6CdOvDW1bgD2tmVHx23dT2Q==
X-Gm-Gg: AZFdTZdvn6kWEsjBZbkoeVib98vg5c+dGMP3/omS93heYcG6QLd942SqE+ZFoTxSM11
	avtvkI0+KEu6sLW2bDGXmd8xZaskvAX6ppvP4RkahggGNcweKiSlXtdCnHSVl2/kE7WfzogvGLV
	/jNxyOUJ3QWdN0PBLtrhLv+3ZEC6Ix5Lo1KyISyt2Dfoh75rTSyrBoKI9CJAjp2ZdEJ91NAKtKo
	lU1p+x47n5pWMPZHa1D+78Kh8ZtcRYiLlAFaBNq6uIGLd1aCSGFEZzubPdI9ZvAQ4QPxemQrKc/
	eUcn0IrJF01LchI9yovW43Y5xOFfdKXOw3xQ+zNklOk08lWn+9t1UqXMoMF3CV2Xp/Gr/7N0xii
	CL/0bZAvW715D8aviUu/TMAtjwxXfcPOX2VC0mfy19a/WsbpmIqGXENufbWouO8JJgppEA6+/NH
	3Up3PB/Nxb8CY2NT0AZ+3YhC7tvtDZ7KxKqDgHm9IxT7R4OfdKBQjY60FVcyFX/whTidcMtSFVr
	Ow5zdJkJP0hyo49qQqj0jtnU5AWn2yDWWSyJ4oxhWfTGE6R0rCcwT4GcH6d4ctv8dAGVZTr0g8S
	qFjxgdZ9Z9N5KpMHlmQcfenv7deXJCdLv2zcFjWK2/7HyZ76xT92cpNELQbZ05bi8jYmMU04iJa
	2Y/BI2g==
X-Received: by 2002:a17:902:f545:b0:2f0:585b:8d8e with SMTP id d9443c01a7336-2f0585b8e12mr169849155ad.60.1795677233916;
        Wed, 25 Nov 2026 23:13:53 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:418f:e7d0:882d:ceec])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2f0bc695f31sm41539205ad.49.2026.11.25.23.13.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 23:13:53 -0800 (PST)
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
Subject: [PATCH RFT v4 5/5] drm/imx/dcss: plane: Switch to drm_fb_dma_get_gem_clipped_addr()
Date: Thu, 26 Nov 2026 15:12:53 +0800
Message-ID: <20261126071314.253890-6-wenst@chromium.org>
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
2.56.1.839.g22a8290db9-goog

