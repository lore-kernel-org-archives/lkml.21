Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795677228;
	b=HS4jlYdAgSQdcJL6/XjlZ8mtECw+ar5C8hV+hIkm0MEJDpagV3PIvJqETaB8+7E2Ij1O
	 lccNeGF7W0j5kCHJmPsiW2Sd1y+wgCFfRcKBrt403/0BCJ+EinwC0rS2jEtqVfYrPNcL2
	 B2HC697UePXVR1pgntb5YSiWgPV9FlFVrkMRsYmaT2I64p4v8Ae65oHeWDgMZydV22hpA
	 zQQ/0pZZeKklLPRycEc8YyV1Um/M4A16YLm1PoqzGNeNw+fZdagOAvTj9w4fGfN/u0iq4
	 zkAsWG/weUR1AGDeDcA+iPsbdio1vBWgv8gIk/BUFpp5HI9XKj6ti1euqGAxsWlmIUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795677228;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=s+aLuJucBwaSWJgFUDaZ/eOjRwoee806v+5/S5Iceo0=;
	b=fzUet9mXpttdvhyaeAtg8vlCRTtJaHvn2YqmaMwRaFMXgBc0pTGe0uTg6PzeaEmFgBd9
	 cKHeRSiSPcbLsQXwvlvBvnZCnF3bWPyxevp4Dw98MqwKL641NwLdd1i1qDoLDhXLSh6GL
	 8atgidM/Rwwl/hqxri8Xm3C5Kqw5few3UD/BsHNHDNbMUz8CHk42r2GN7LH+sDFkci1ok
	 K4Eke4xwfSqnhtZ694CgsfyqH+9u8HMQHO6xXsiCrkbwlQtbp6ur22AV3Atz60OtB95ak
	 4YAnwO+EpPqg1wONR20EyXXIAnMfMy7iy6H0P2wQfXG+9Ya7FpMjH638c8GLB69kA2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="Kvo/lyOV";
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8DF606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:13:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E8DF606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Kvo/lyOV
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8a9f9473029so5104720b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795677228; x=1796282028; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s+aLuJucBwaSWJgFUDaZ/eOjRwoee806v+5/S5Iceo0=;
        b=Kvo/lyOV2MwVQoedJXQyYsL3HvDt5LvUj7RzpWxSWv4x6pKYXRyjbZYTtXIzqRuzDa
         ++vJx3jA9pMmfGQxcfOSO5PdliQmErXY4GFplELU0x//8LevnlIJom44DUtqdRBYZq0l
         L14uPqJ2iAuVl82ASxIPoSqSHRbpftsk1wnR0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795677228; x=1796282028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s+aLuJucBwaSWJgFUDaZ/eOjRwoee806v+5/S5Iceo0=;
        b=JNJOxu3dbSHdxEz9LWwdridvnC9Mr4lMDirNTHDSEl7HT3HxQv8NjGocdv3SG8d4B6
         EcVdmGAfEHMo2WQKwTVTNTDx+8TkyFGHP9SO8azf1cY3MukTkER49qHg29gyj9PvgeiL
         p33MC7o8cAj4A9qqYFLMh+VKtYy/jNU55rK/YnQfwjKf5o3D6xVsMN8EKogiOGMxKHAs
         vOXVEmw4ALNqkcJEp/jujos4FATTSYjpRwGnl1l2gPc2tyUp8/4Vm29zv1miPWPN1lHS
         uGVue7NhoTgTZj98cLpxkU4PLLXsTrjWFNK9u6SCvQx/sZDXzVIJD61ExNgrt1BVif46
         8Y8w==
X-Forwarded-Encrypted: i=1; AL+hErFOTQC/GA97cNojVrz5O/a+ltB17OrR77V5LVcd/gpyM15hjK6FvqFVFzb8OsBJACuiAGklIlpERb3kuMc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/tA6bpnLth/WFZL96APbfrjqEKL8RfHkrq6NqwQnt17Xvg/N4T
	d+Ud0y5/yHPFwTwDTbXzEujAVG/8mvQo84mQP8HAqbHWfGrWynO1gf9rEaODEWHw3A==
X-Gm-Gg: AZFdTZdneqBcDKOTOc27H/r9dC3MypRgS9Dsx0QUVAFgksoKerKriNqJZZHGrA3uc69
	rad7//REs8aWi4GKFwpdLOpU5MtRhVChS5AWDTp5NY8kFrs8IIcmbAHbEthxYc9JEWXa6NYaIIv
	O8mW76Ed97PdYX8BFGaU4LayhbsbvhuGKbmALk7dutJq7U4wxSKZKvGVMu/KVhz4LOJv0M9KusS
	XFcCCNMTETtwj3ymHr4csywq4plMmpduTafdRdJMa2JO3FvltFYuWTjm8m8Taim8vPhbv6rWFZi
	dOWCS0aac2NRwycI7Xw8P5TiYm8+RRK/85iPefArrJaJY6Zqql39AVynSnNPv1Tn0Cy1MSfKUd6
	3PySUhzmiCqEAkhNmP/CYCHLFAbnPCf2H67SV1KpKrTfZnpFR0Bl5qqGiDFiTrWOJ+y152vyZ1Z
	3KnJFZpU9mdN+kdZzZoMycc9Ss+mJq+CoGKnSdLryCnP6fU/xMwH14S8zu7P/mIlTzooqy+Ip7j
	dFxsDIOfSndX73pWgk6Z+qTYnzKlqWslZ9DMbIvujGj2iHN9wU7jSxzv4aG2JucMOQJsChmi+Aj
	zT9akL/aGqh7svvIsKGomxW6JEi8AXdl0qrPIYKe5KDbjGSg6jIUbQ3hmSikUonjGOOkGKHHRUR
	YWqc0hw==
X-Received: by 2002:a05:6a21:3f94:b0:40a:56b8:2551 with SMTP id adf61e73a8af0-40a56b82debmr793737637.17.1795677227780;
        Wed, 25 Nov 2026 23:13:47 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:418f:e7d0:882d:ceec])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-8cdfd2d2fc4sm4664437b3a.49.2026.11.25.23.13.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 23:13:47 -0800 (PST)
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
Subject: [PATCH RFT v4 4/5] drm/imx/dc: plane: Switch to drm_fb_dma_get_gem_clipped_addr()
Date: Thu, 26 Nov 2026 15:12:52 +0800
Message-ID: <20261126071314.253890-5-wenst@chromium.org>
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

The hardware is programmed with clipped source and destination dimensions,
but the framebuffer address is calculated using drm_fb_dma_get_gem_addr(),
which uses the full source dimensions. This will not match the source
offset if the top and/or left sides are clipped.

Switch to the new drm_fb_dma_get_gem_clipped_addr(), which provides the
buffer address starting at the clipped boundary.

Fixes: 711a3b878366 ("drm/imx: Add i.MX8qxp Display Controller KMS")
Cc: <stable@vger.kernel.org> # Needs drm_fb_dma_get_gem_clipped_addr()
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/imx/dc/dc-plane.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-plane.c b/drivers/gpu/drm/imx/dc/dc-plane.c
index 62dd0576fadc..35eb5039f5ac 100644
--- a/drivers/gpu/drm/imx/dc/dc-plane.c
+++ b/drivers/gpu/drm/imx/dc/dc-plane.c
@@ -65,7 +65,7 @@ static int dc_plane_check_max_source_resolution(struct drm_plane_state *state)
 static int dc_plane_check_fb(struct drm_plane_state *state)
 {
 	struct drm_framebuffer *fb = state->fb;
-	dma_addr_t baseaddr = drm_fb_dma_get_gem_addr(fb, state, 0);
+	dma_addr_t baseaddr = drm_fb_dma_get_gem_clipped_addr(fb, state, 0);
 
 	/* base address alignment */
 	if (baseaddr & 0x3) {
@@ -146,7 +146,7 @@ dc_plane_atomic_update(struct drm_plane *plane, struct drm_atomic_commit *state)
 	src_w = drm_rect_width(&new_state->src) >> 16;
 	src_h = drm_rect_height(&new_state->src) >> 16;
 
-	baseaddr = drm_fb_dma_get_gem_addr(fb, new_state, 0);
+	baseaddr = drm_fb_dma_get_gem_clipped_addr(fb, new_state, 0);
 
 	fu_ops = dc_fu_get_ops(dplane->fu);
 
-- 
2.56.1.839.g22a8290db9-goog

