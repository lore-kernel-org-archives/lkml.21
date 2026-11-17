Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794957540;
	b=e/f9KUkVwQ8DADXWXWVBuZnB4cJKNcGWhDGMDHGszkhEGOfaZDQIZDQJxzFF5jCE0XUv
	 72ryNoL6e2ZetRFyqsM088FwGCMV99H8r8Pj/EJJ73IxaQ7Diq19oZZ0t7sPxU7ogA940
	 SdTKg3q/dkzyi2J3Q8AaVZCJY4gH90r3hpoKdgFEZxwZ3UpvuP5VxGXIIaES+yqNkewRI
	 Q+n0XxgFA6x7wywdppix1+11oBhOuq+i+qoJ0IPYqVI252rroHDr46PqPdIv/d7wEJpjD
	 NI8bbB7riYROSKiqmz3sXCSo5tpX2AMHvDiAJyUZJ04msk4ayp5qB9zi4ZMqSRDWehQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794957540;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-Originating-IP:X-CM-SenderInfo;
	bh=2XiawxssXXv44CNWTaqQT2qKQdjrgp5aUYtmWBVrWtk=;
	b=AaQ5tvlXYn8c9Y3CB/7saq/OYZIAAnMTPzmQugw4Z6KbqYQkjQ6zRPp/gO0pXgc4qRAJ
	 y0RI0BjvHQEDaFe+6xquYBiBS3D0FClppuSKE3wq9SCLxMkjy/ZcyUMwgbySOjB5dBhCK
	 MssJFk6lqKiMofm+rxkEBnuYKaiZ6P95/QcvTtK7dn4zdVkRoLx+Ekfuq5FSEhaOOaIuU
	 AGvR6eVH+rm/fChcvr93DFVeGPuS/Gf7F+wo8Vwi2Y53kesBmVjsjPna5dKnWERtHkao0
	 N2Cdy5w9H+qIM5Y+pVQP2eh9O214EO7QGK6A4eKDQwGZPQxsYW0L6az6fmTrSYdjpIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b="OYt6b6/D";
	arc=none smtp.remote-ip=117.135.210.5
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF036606A334
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:18:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF036606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=OYt6b6/D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=2X
	iawxssXXv44CNWTaqQT2qKQdjrgp5aUYtmWBVrWtk=; b=OYt6b6/DZuxN9m65Wz
	xbjsou0Q3LqRlvdSX5wGjdw1+9zP57hawgwifC6iUat0xlRH+0ThedclIchtfhrt
	4zV5/HG6GTid5BjPlVPcCRFMrIHEtZxmdFlElvpOJfouw1rGLU3N52r1JgYG89Sm
	LXxmbSyqWwRrL3F1T1qKklOj4=
Received: from SYPC (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgCXyQiu4Pxq15exGA--.55935S4;
	Wed, 18 Nov 2026 07:18:09 +0800 (CST)
From: Yang Siyuan <hsyysy@163.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>,
	Samuel Holland <samuel@sholland.org>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] drm/sun4i: backend: report coverage blending for alpha-capable planes
Date: Wed, 18 Nov 2026 07:17:51 +0800
Message-ID: <20261117231751.264258-3-hsyysy@163.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261117231751.264258-1-hsyysy@163.com>
References: <20261117091932.12063-1-hsyysy@163.com>
 <20261117231751.264258-1-hsyysy@163.com>
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
X-CM-TRANSID:PSgvCgCXyQiu4Pxq15exGA--.55935S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7Aw4DWFyrGF1xuFWrKr1Utrb_yoW8GrykpF
	4kGayUK3W8Crs0qayxAa4UZr13Wa1rGFyIgF9xX3s3Xwn0qFnxC3s8G3Wa9FyUJrs7Cr4U
	tw15WFZF9FnrC3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j4_M3UUUUU=
X-CM-SenderInfo: 5kv152r16rljoofrz/xtbC7hE+cmr84LED1AAA3j

The DE1 backend planes expose ARGB8888, ARGB4444 and ARGB1555, but the
driver does not create a blend mode property for them, so the new
validate_blend_mode_for_alpha_formats() also warns on A10, A20, A31 and
A33:

  sun4i-drm display-engine: [drm] [PLANE:31:plane-0] pixel format with
  alpha exposed but blend mode not setup. Please fix.

The backend blends a layer onto the pipe below with the layer's own alpha
channel and has no premultiply control, which is the DRM "coverage"
equation.  Advertise DRM_MODE_BLEND_COVERAGE for these planes as well.

Signed-off-by: Yang Siyuan <hsyysy@163.com>
---
 drivers/gpu/drm/sun4i/sun4i_layer.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_layer.c b/drivers/gpu/drm/sun4i/sun4i_layer.c
index d65587d..0e6e0d1 100644
--- a/drivers/gpu/drm/sun4i/sun4i_layer.c
+++ b/drivers/gpu/drm/sun4i/sun4i_layer.c
@@ -228,6 +228,13 @@ static struct sun4i_layer *sun4i_layer_init_one(struct drm_device *drm,
 	drm_plane_create_zpos_property(&layer->plane, layer->id,
 				       0, SUN4I_BACKEND_NUM_LAYERS - 1);
 
+	ret = drm_plane_create_blend_mode_property(&layer->plane,
+						   BIT(DRM_MODE_BLEND_COVERAGE));
+	if (ret) {
+		dev_err(drm->dev, "Couldn't add blend mode property\n");
+		return ERR_PTR(ret);
+	}
+
 	return layer;
 }
 
-- 
2.56.1

