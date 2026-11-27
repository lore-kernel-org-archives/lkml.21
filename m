Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795745302;
	b=DCWgA09JYyb/JO1A35OxmXPYVIaaRGzDpWQfN0j1Ud9K4YQ3z7/kLWDx4o2srw06KPJu
	 +sZ5bLfP+yDngOIrC/SikqR7Qgj00nfTxlLYqKLThb/lHvniVAV0jgpSb4eah+5qfUlwW
	 UoP3CYxA4PsH9CUlIEGqmidSwU9R+nDNAXkxHkdQUMaRQMae2Nh50rc0L2sdvfXLPH14F
	 e0V06D62cnxSJfw4d2jIRgofyhkbXovvx45RnSUAx8LVcPI0HELx2S71B1B0SzaAj87JM
	 goq7gGScs9Y0Bx6e17AUah/eu3ylO9lhXeZ+HcXP7hH1CI6g7bEFO8S4ZX0v0jij8rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795745302;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Zyy33FAdfBAAQH0MmIGIDDo6N5QoH0VVbaF8njRBWYU=;
	b=pAiY/laTeB3UUgWNZUtgK7YnyT+jjYsOgBh1xGsolX5c8KbxU1ibfgHcG6WwWWz3L6Dv
	 e5bydH52lt9oiXm3awQhkKFCd0Hjd3lyaZ5vTejB7JzMeZYORqQ7LLSex96T7m49aet43
	 0Y44ciuLrzcZxRPTIYY2DXBYjq+pyYUIpr4RIvTUNmaOpXcGdnhKkMReo8YyoFzBBT/7Y
	 Cj9SA2Sb1T+uyTkRn2LyQKqaDItVV5aYEBhnoB5c6Ycd9niIaMkdilVx/6Kl7k2lrLn/4
	 bqJyu/8Mx0bT4vd+pT9zWLUSChq16HKRBSxBvg+Od3TovUO2xVn18FUqL+yyEnHxQfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gn7nLSc3;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC57606A683
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:08:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDC57606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gn7nLSc3
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4a358881793so3990559f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795745300; x=1796350100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zyy33FAdfBAAQH0MmIGIDDo6N5QoH0VVbaF8njRBWYU=;
        b=Gn7nLSc35VkCyfIZco7EWga20Dmbgc5BvUKpMxR3uTDZ4LFNmycaK859MP1jzlkO9d
         bbrIOEUTYHQKARwJT7PVGmh6lk5lS/PqssTrIdSMTjYbaIRpCFgtoOfsRRhhRPAKKAL+
         Kdt9kX+SNPCsg7cxamL46nnm4QTRTso04B4CQLtmFPg5x9L/f2P9bhuwWgQjInzL9jq1
         od5jBS55dX0u4nENDFzAuEnN74P0LEQaDyMtJdn2s0jLKhDd7hmSHIF9a5KmNXTGYvsS
         0oaMN9dz3okMBqljIdAZX35hvxItOEv56joIUEiVYsUc7jftptlbJJIla9V3iJ6krbx1
         TjrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795745300; x=1796350100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zyy33FAdfBAAQH0MmIGIDDo6N5QoH0VVbaF8njRBWYU=;
        b=NAZqmER5me2+pLVCuqma/A0EjNA+M4AdnjPoj1RBUaJ8/M4JJ/PHbcAoAPFtK7rncp
         +i5cgj3pjZ3Ept6ge4oKlYdG4Ihd5XSGG9f4oeInfPCKn9R+u3r3e4jATmCZpwa2VVdI
         erYbJm2QhOOMO9zStEUqzppgVKPQz43NX5RaePbsWgF64siK3lkcUKd/1UboX8Iw8zIw
         xu+HulSSHmmeYoSEsJMvaVXkKKVljniEK25y+RFTV9StBwTcUGht6m3thCva4fSzTLoC
         MTWR6TflYYZzMWgDXNdbpX9xtEZkWBm8oZM1QbH7dsqAKISRGwj/4GZTULfwWPSl7Hg4
         EsLA==
X-Forwarded-Encrypted: i=1; AL+hErHMAjn5a56EJGl9uoCknnNho0/WGALgXuj3eG+3tdOHLdKB2SwWjreTt53rRpKnPnA7jYXrCmLYxe3Rbnw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZnNZWa1gEertq0ONRk2l48WIajZP30fuVYEk2HbLAPyjmsrvR
	ngw8dRhpWHbEKszIFDerr78plOQQGGd2gE8SOx0iwAYhbdxOYLnaWNm9
X-Gm-Gg: AZFdTZfGcXwy3qm1igNmdv4LxY9V03oon3nEhb/Rfw3XZRPq3G8DhBleykEoCKmOS2a
	jqKY3fSTVOeFHVm2ii71mFmVwbBAnfDiFTaLXhy2FzY0jT8P3StcEfjIEy4bBIwIK066uVBdcEK
	4HZLE9NlEKr7zOMnw/Il9cY4FP76DRJ0DrvsNQ+9sn8lHRKyng3kGr46EpYpiKC7iZTm1L6XS9f
	stFWGFYXfj1JG5/f62qOLRPG1M3Gv4r0h9ewTDNeW8yYO1JLtnYIZvona46kKZ+Qi7DKuoLBchL
	jXm6uPxquFROKfjJFGklE91JEZ7BNc4IOUkWmkMNE+PjJUUQ2kryYbxBA2e277BQvXH4lU9yVXK
	pc112hvNfZdLqD5lLA5OCi73kofZw9IGgl8iIgDlu/yIkKRVUe+9Xc9SlaDt2PRa+VbUcokwb7N
	SPHmwOT4QJ6QPfKxMYXMb7Yu6vnGJ7RGmH4rvLMOG9eOt0orpTbYYrn7ocm/l7BJSZxIj2Y3d9k
	TW2+pw8EXwNQN2mvJP47e68zNwFax1sJ3ffMrBZ8K26OyIoPR4mU56saXJcr3UiTD7T5djWu/qf
	I7DBgdRQiBG0dZzVNlD3nOQZUarYJsD2nGhRvKRdSF3MnQdXPBk4c+oOST3xFCLXtCb1fnvz6vL
	ihk8c5zzSeAoEp0GvYdB3tC0EVX2nTDEhFbeQvhEPCMsHiQ==
X-Received: by 2002:a05:6000:40ca:b0:4a3:976e:27a2 with SMTP id ffacd0b85a97d-4abb5146238mr44410235f8f.34.1795745300251;
        Thu, 26 Nov 2026 18:08:20 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:1432:1241:93b7:7b4b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3882sm43390844f8f.49.2026.11.26.18.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 18:08:20 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: [PATCH 3/4] drm/panel: st7701: let a panel provide its own init sequence and DSI flags
Date: Fri, 27 Nov 2026 03:08:14 +0100
Message-ID: <20261127020815.1621790-4-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127020815.1621790-1-romain.tisserand@gmail.com>
References: <20261127020815.1621790-1-romain.tisserand@gmail.com>
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

Every DSI panel handled by the driver gets its init sequence from
st7701_init_sequence(), which encodes the Command2 BK0/BK1 settings from
the panel timings and descriptor fields, followed by a panel specific
GIP sequence. All of them also run in burst video mode.

Some vendor init tables don't fit that encoding, and some panels don't
work in burst mode. Add two optional descriptor fields:

- init_sequence: sent instead of the generic sequence and the GIP
  sequence;
- mode_flags: DSI mode flags to use instead of the default ones.

No change for the existing panels, which set neither.

Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
 drivers/gpu/drm/panel/panel-sitronix-st7701.c | 27 +++++++++++++++----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7701.c b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
index 31c56eadda12..f288c8c8aab8 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7701.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
@@ -128,6 +128,16 @@ struct st7701_panel_desc {
 
 	/* GIP sequence, fully custom and undocumented. */
 	void		(*gip_sequence)(struct st7701 *st7701);
+
+	/*
+	 * Complete vendor init sequence, sent instead of the generic one and
+	 * the GIP sequence, for panels whose vendor table does not fit the
+	 * generic encoding.
+	 */
+	void		(*init_sequence)(struct st7701 *st7701);
+
+	/* DSI mode flags, when the default burst mode does not suit the panel */
+	unsigned long	mode_flags;
 };
 
 struct st7701 {
@@ -559,10 +569,14 @@ static int st7701_prepare(struct drm_panel *panel)
 	gpiod_set_value(st7701->reset, 1);
 	msleep(150);
 
-	st7701_init_sequence(st7701);
+	if (st7701->desc->init_sequence) {
+		st7701->desc->init_sequence(st7701);
+	} else {
+		st7701_init_sequence(st7701);
 
-	if (st7701->desc->gip_sequence)
-		st7701->desc->gip_sequence(st7701);
+		if (st7701->desc->gip_sequence)
+			st7701->desc->gip_sequence(st7701);
+	}
 
 	/* Disable Command2 */
 	st7701_switch_cmd_bkx(st7701, false, 0);
@@ -1343,8 +1357,11 @@ static int st7701_dsi_probe(struct mipi_dsi_device *dsi)
 	if (!st7701->desc->lanes)
 		return dev_err_probe(&dsi->dev, -EINVAL, "This panel is not for MIPI DSI\n");
 
-	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
-			  MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS;
+	if (st7701->desc->mode_flags)
+		dsi->mode_flags = st7701->desc->mode_flags;
+	else
+		dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+				  MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS;
 	dsi->format = st7701->desc->format;
 	dsi->lanes = st7701->desc->lanes;
 
-- 
2.43.0

