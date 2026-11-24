Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795506077;
	b=XCJNhW7kQcjXw8BSJYhtZrovW0ru666h4l7WvaYwlPAMsm2F3o48dl6SZ2zSGA+rMpJP
	 1IjcxFbPZOI+4LvgdZ8zqX2Wcd9qhBOZI/G3lmG5TQUW/LSnpOpUPpGGPaD54Z0C8olNY
	 xbcaGGCR/d1scixCejK8OT/JmwkCt4nlpC8xZC9eROM+BwsgkeU2Dl/vQ9ZpP+nFG8H3n
	 OEdeV4iLn494owfLNjbbyrA+bB3lGuPO9qOSypGHC8B8ni8mOiWSyUW1yWyOSWIGlS0Zn
	 fIIy+noEEmQKLWRAgQhGregvTcJY6PZFjA0anx59Xwb7c5kbXzgnyMJh7RPF85rIu2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795506077;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=74TXVSiLNJEh4EdaGe7nzkm4UiqpR2QLi5goWWiHysE=;
	b=WLzymU5XUaZYSw+aqEheUND+0wVbQqa+LBrUwRX8JCarufxPPRoMl8+1nC4224YoyK6a
	 RDhfjjoc2eM5+NKqh/RdrCmcmnK5xnQiBLL+qmX9uBGbCdgQYsavadTBYTKPNEiTWCiGR
	 ps5Ob1jyp3PkeQDL6umuRjCnPlzo3HvPSQe+0Gy779Mf2eX5dUIrwzHKcIiNU5C+oai/A
	 /rlbISyvHXPFrbVUIpUVQu8KOvsxq1GC6cj58ncLMPTgg4IyFT9qrc0f1THz73UG3suAn
	 QaAFXD9QPrFLOqY/DQjE1rn6bvFevNrr8E6DZIzezATXaEMgS7TQh0I+Me0G7HnBf+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=CN9Vv02r;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C36606A326
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:41:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75C36606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=CN9Vv02r
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ae7626d14aso2015532a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795506077; x=1796110877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=74TXVSiLNJEh4EdaGe7nzkm4UiqpR2QLi5goWWiHysE=;
        b=CN9Vv02r05Mz/TSWqNI7Oyvwf0XCyVFM5ONbC4kPbLVaFolWLbn3Jft+H+eaVG2Pau
         H/dn7qS23EnetP+fSAD8D+TS7oR+cwN4mRDyxuKJVnLbY9tiZMprtJc03PGuAa1oJgzQ
         rwSTReb4JRcF9sDjwcnB/iSjmppfa2Bgogbgk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795506077; x=1796110877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=74TXVSiLNJEh4EdaGe7nzkm4UiqpR2QLi5goWWiHysE=;
        b=mzhyx77e+fu8twlG0tQYHB0NrO0rU5dyAo0nNW00h1WySio3pppOQC/09WG4Pe43t4
         KG9Fnf5GCkITfXugfvcyVCLrmzOU0/0A8i8TNuT+dooLEHAyAAq0rSYGwcwVXUlgiJTv
         B9fqhOGkKg+TVrqIKYjFQVyj0kKk1LnJWFSzeDHSORgLLk6GXG7cJb2Y1QTMW652gnxj
         mAuQ1XJULwG/q7wMZG9M4or81QUVNRVZ1ZfqeZjG8Wqwn7zknAOANru+inHhYLAohp2g
         QXrp1nxMO5GZXmGU5U+7s6EqkCOlAr/vaxQfXV5g//JUQWfT4j73L9rscezvtwebT30Q
         nNGg==
X-Forwarded-Encrypted: i=1; AL+hErEZpfmUIIj66U8OBjUtx2tLh6HDBXrmqgPq1ylD/ZDw4LudvO8MzEvKskgPZEC1BA/95fseRADAoBdZw1M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lPGLfTjFGM6/+EnQVzSWf+uIKVobCA80jr2i7ltohOzbEmZ0R
	CcY47kDJKHJvz8p75OTUnRLC4ud663WQGtXa8ANd2XdMBMHww/tk1QKPhSt95jUPoQ==
X-Gm-Gg: AZFdTZfXxt5M6RhnjdPDQkJnsWrP+4rE+EQIUk156K55MfrEPQBx33BTfchWg/So9mR
	GJPwgpjU5oac+2VdTDpTufG/U2d9VHw6L+MIKbQOTg8iuaw6+mt5VmjA9c7MJZ/rgjJyXmAhCWg
	0IiihKKyf85OJOAwTM40Foi8JfcQQhgzBTJy5bY3IyeIXkYHOzpGrQobKJ1SSJeTKlbzUnPmhHm
	DnbI6JRUjKwk0TG0AoPysnwXCfjGLl7FLC9DYhE2H0XuqenNyJDETH+I/5EKvXVoW115Q3ur3rI
	ZfBAep6rEgbJZe0E7y1e4p98S9y18doTlN9wPkHScbO9GGfqvcV/WcaBZL9+AhB7+w74XLtQde2
	+nDl6E+tJvHMz/RGVrphLqlJNj8SQGm0Iqi8MKIBPqNILNeJFRKVPli03CiYzhSeJ/qLrQfbfrr
	/lcUqhfzb9LxuVk5VsLlYxnYlHARB7kXcvjQX8Y4IxsUjz9Q4YqHzXemEzbtuy52cHsrf1R2RJx
	u+EcGWrQ+v49sIQCN/BFO3JVM3oc9Ozz8h80yCVb+NPlv5MZgmRFAZSm4WrQFp2uxsjowQv1J/9
	aD2aaQODWja0ai2A3Fj+JKv6JmWfh6fIJSMRClIRLsbHJX/CerQcmIRbvdYy
X-Received: by 2002:a17:90b:3d90:b0:3b3:ff70:4d0d with SMTP id 98e67ed59e1d1-3b41c8d49b7mr11902997a91.14.1795506076825;
        Mon, 23 Nov 2026 23:41:16 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:8f32:8910:4727:ea03])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3b44b7a8c64sm9100767a91.3.2026.11.23.23.41.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 23:41:16 -0800 (PST)
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
Subject: [PATCH RFT v3 4/5] drm/imx/dc: plane: Switch to drm_fb_dma_get_gem_clipped_addr()
Date: Tue, 24 Nov 2026 15:39:32 +0800
Message-ID: <20261124074041.115251-5-wenst@chromium.org>
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
2.56.1.809.ga0b61035b5-goog

