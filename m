Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795110886;
	b=U93gohPqxyTbDEbFWbLfV0iNp1lPTYxpoOyjHSu+rDllqix33ziq/Dmi07uNm8dER+Wv
	 k5AYKriu535fbXep2TBEJ4G8L5GEMGW2DijROIgXFg6cXP05H2ud9LZhF7xeI2l7UKgps
	 ssjoCYNg9ICJOPGGXjkw0G34W1y6p6bkg1nLcc+DERFcOmapJJ6zIud7UZiGBK3MR5k9Z
	 Nn1TWTUu3oadqal/WahldN909pcK7HD1uepJz75aWT7iQTlSf+S70ed8pEkisQMu5TMBX
	 S00FLVZ/tyott/gY0iWJQWHVMnUjL7kNtCcDq0bTz0PgY1JRcwGDg4NbyGBTn7oEezQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110886;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JZeXMm6AAi44BWshE63wgfUA4zyj+3ZnN7hXQLNUFPk=;
	b=uxjk+GFYfZNcu5XvCkWp1OPY5V1oAviXoEe/7cKk0PNPnTyxUpHwTjiy4r2an66GU9BV
	 T+1qavkpD2CyeTju0HD81khjm7k4vD15LRE0+UHaEAhFlQmac1nLcMzfdgfMcwcGZ6CXF
	 zRkzsYqcBuYDNhgRcoRQ43pd3wLe44Rhx2JfBJvSEO7i51kK59NAPvUYt6MTTq/Rin365
	 X7gLOK7vYnWftftL/uTi6weom8fwZZutOTD29WzCdcTdrpW1a04cj2Ib0P3iskgsab/N+
	 2zFKhEyrOnAvqp3+HGjIp5/rI1teutPIa99/QW2uHmOsN8V0xQRrBUATFzy8EvpvXCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D0bF1RMy;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDFD606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:54:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCDFD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D0bF1RMy
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49d05d51553so18639255e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795110884; x=1795715684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JZeXMm6AAi44BWshE63wgfUA4zyj+3ZnN7hXQLNUFPk=;
        b=D0bF1RMySG0igrY+lp6ja8i1eRHHIL3f9FkIKp/XjvghQpY2iw+7/QzA9wyhKPojBt
         dPqm1x+vDf3Hx9rLBRMHXvTBbfMxaUT38hH1PI4NoiKlPOhU2pUWnEUl6InKsNi/MWQR
         ejVhQbGUQ5DYl9N6BIrKlcjajZ9L2Vyqj1v2NHVvm1uFpucD6/Hyg8rPinDWxtIxMOXC
         x4ekNVuUVsB2VqjVanzoAgonjsn14TZgE0UjagZQOhRMuaKiQJ5FMOI/OE2IGc4je8xw
         Hvs0Qf2hQIHMGR8tSDt/jEavgMv+4jCx5ufyksIvSN+RsAAA5jEUaYHVN4BMbuEvkdX+
         +9ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795110884; x=1795715684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JZeXMm6AAi44BWshE63wgfUA4zyj+3ZnN7hXQLNUFPk=;
        b=lToNyGIRI2GsPPHsKz09BS6L/2Cl6j5Hq9oinxVXb7JOA950Q/q+DCZuTWBvinYo82
         TloLstLrhMX0SacL0NgvOjS84XQl8Nesmc0s1mOYy5Aw+74Mkm1Duvk0vJM+b/aZn9LQ
         z7Q/8xsrLbe9SFkOUb3QvwggkSJxdCPqbfQOdTfCmf4lFlFYw+kV4KQCH0SWoaWtCBN3
         RgFSyVjqa8DVpLkWQE6beQc0Yhqs02shkuF4bjQkZfkXxneaDqnhL6ZQuNp6Viz8AVSt
         Xq2a6JLstpEeIrSu0TekcYXN5Ab7+dKFiVX0AmUKFhy2rS1Vv/6dP30cB2w1P1dhAK7w
         Ls0w==
X-Forwarded-Encrypted: i=1; AL+hErFJm6pgoHQ1cqRtat/595ISje4ASfhcbWjPSzH6yRHkJLk/0DL77ZttDq6V4yzZUmWYBilbTS97OQVZXlE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FB+1ykHqAqZvUmCC3Wm9F5ovx3pNzzfwRxMxmwegar7fRP84K
	Ncw58yl4aFh0B+togqwIYHMho1y0maK8JpdwB2OwXKT2pnV8O3cLC5Xv
X-Gm-Gg: AYBFou0D/+hmAWXbPUqUXxh+8JASipadhbBL29K0OhunyqFex/gX2XWEzriXt49e0sY
	yWdiB+fHA0vNEsD/YtNIOE1XLaMaqF/LYk0jWPatRYtNf1hCk/nSL7TbIG6+8Mg5vxJmaAxkRq/
	dCvd4lnq55UM1X6X8yaXNny3Xie+/K/ooLRyyRqjGTHYjVItdZjNUHTxegfTxveVxQ6/t8ZuxBs
	Q9JtKypXwXRyyPXU8HCsZDxcw6J8TDz8oKqa8uv6RrH3CqxXizWrJz+89TQt7TbTO3Mf3mEPZVY
	DTOwqG3J52iY3Rpyj+L/aXqDYb4wiyFHgU5cvZrcaCtiG/nymG5kUb71APkF/qKrzCF+OsMSwjx
	6r+wWJEhJ0VKVCmm4i2tmyYlyxtyAuJ+ZHg4pdbD0JDW5opmEKQguo8G88LFm9t72ZbDA4fnoq8
	9VDP/o4S3n2BMT++1z2UscitkYsG1i6rwEU2nMOVu/q39xE0cvniDlILLR+pexAzVng93aDSjPh
	VZyfOuqECKS0hVn72dzQpnUa+kLRE5NGYlNtkhcDYke6mbSJRMTELsqqufFofkRowqu/ebXvdLA
	VgLT9EOiu/IoFglX/2QHCdxdVbYoJkUHAsDQu3ioOvIbqWzqEb0Y39whp8NWiM6CPAJ5fThB7Fa
	6kxFwT0HjPjQ6CMwDWfuc5vBBxV8qxryueCKVGudunA/sQWYm7JuKWmSD2aVQ2NCcEdqOpikE/F
	LYY4+nudCg7oC7GdcQcvEEONwEYcot4EidUo6GOyf5pIUOrEyEcy9Pn/Ll9g44m0LhCHoLClrgP
	MM4o+ouLeXd0bLgwIN5c/lzci03cmvs62ZWAFHQoOiUUo2Y8IyRLQok
X-Received: by 2002:a05:600c:a08e:b0:4bb:647d:dabe with SMTP id 5b1f17b1804b1-4bb887c3afamr8512525e9.3.1795110884056;
        Thu, 19 Nov 2026 09:54:44 -0800 (PST)
Received: from jernej-laptop (95-143-148-21.dynamic.telemach.net. [95.143.148.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb84e50512sm29390035e9.3.2026.11.19.09.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:54:42 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/5] drm/sun4i: Reject fractional source coordinates without scaler
Date: Thu, 19 Nov 2026 18:54:33 +0100
Message-ID: <20261119175437.2520400-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119175437.2520400-1-jernej.skrabec@gmail.com>
References: <20261119175437.2520400-1-jernej.skrabec@gmail.com>
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

The layer code programs the scaler whenever the source rectangle has a
fractional offset, since only the scaler can apply a sub-pixel phase.
drm_atomic_helper_check_plane_state() with DRM_PLANE_NO_SCALING doesn't
catch that: it only compares the scaling factor, which may still be
exactly 1.0 with fractional source coordinates.

Channels without a scaler would thus have the non-existent scaler
programmed instead of an error being returned. Reject fractional source
coordinates on such channels.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 24 ++++++++++++++++++++----
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 24 ++++++++++++++++++++----
 2 files changed, 40 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index cf66f676824e..f9c7f28f9fa2 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -179,10 +179,26 @@ static int sun8i_ui_layer_atomic_check(struct drm_plane *plane,
 		max_scale = SUN8I_UI_SCALER_SCALE_MAX;
 	}
 
-	return drm_atomic_helper_check_plane_state(new_plane_state,
-						   crtc_state,
-						   min_scale, max_scale,
-						   true, true);
+	ret = drm_atomic_helper_check_plane_state(new_plane_state,
+						  crtc_state,
+						  min_scale, max_scale,
+						  true, true);
+	if (ret)
+		return ret;
+
+	/*
+	 * Fractional source coordinates can only be handled by the scaler,
+	 * so reject them on channels without one.
+	 */
+	if (new_plane_state->visible &&
+	    !(layer->cfg->scaler_mask & BIT(layer->channel)) &&
+	    ((new_plane_state->src.x1 | new_plane_state->src.y1 |
+	      new_plane_state->src.x2 | new_plane_state->src.y2) & 0xffff)) {
+		DRM_DEBUG_DRIVER("Fractional source coordinates need scaler\n");
+		return -EINVAL;
+	}
+
+	return 0;
 }
 
 
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 09d94f7f9977..4d3fc03f9877 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -259,10 +259,26 @@ static int sun8i_vi_layer_atomic_check(struct drm_plane *plane,
 		max_scale = SUN8I_VI_SCALER_SCALE_MAX;
 	}
 
-	return drm_atomic_helper_check_plane_state(new_plane_state,
-						   crtc_state,
-						   min_scale, max_scale,
-						   true, true);
+	ret = drm_atomic_helper_check_plane_state(new_plane_state,
+						  crtc_state,
+						  min_scale, max_scale,
+						  true, true);
+	if (ret)
+		return ret;
+
+	/*
+	 * Fractional source coordinates can only be handled by the scaler,
+	 * so reject them on channels without one.
+	 */
+	if (new_plane_state->visible &&
+	    !(layer->cfg->scaler_mask & BIT(layer->channel)) &&
+	    ((new_plane_state->src.x1 | new_plane_state->src.y1 |
+	      new_plane_state->src.x2 | new_plane_state->src.y2) & 0xffff)) {
+		DRM_DEBUG_DRIVER("Fractional source coordinates need scaler\n");
+		return -EINVAL;
+	}
+
+	return 0;
 }
 
 static void sun8i_vi_layer_atomic_update(struct drm_plane *plane,
-- 
2.43.0

