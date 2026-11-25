Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795635498;
	b=zijsA639yqFZGxQbbMx/XQ1XsHdDDX4m/KCr8m8EvJRD9JKfCspPyj9jzG0endtS9x1M
	 GL/tG6Rrk+V/q5SyZuv4/EzEa/yGg0ZDlHvOiMd/kC9DNwHbFb/sr/RhE+dhE3ed0SSIK
	 b8P1JVnlfiBHxIelQrZtx0352VxyjGEu4uNGNicprOmkOrvZdN8a5FEn5+fvkMpDf7a//
	 3Hh5o5Yddt4QK666Tg0tZz5kCBSiH55Vc0IWbZHDFbX216XW8mrr+oxzALae66UMDW+YM
	 qfGFs7KwTPXA20vtPL/IJ6j1BgBtZIONgW68zAvZrzRbbALIzF2C2v+gKfm2S8Uf0RA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795635498;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XBqtxBo/Ovy/9j4ojA/2y1YO0FF3mv74qI20iGeveCY=;
	b=JzvxDUwY/EX+1LmUJ/7JsoIxlHUkazKtA9YAR7a128ZN4w4VnSzReKV/SoXX0ZObfrvy
	 PxTk1r1p5In9Q19Bm7fWpUE9rS2IDSP0hxFd7K+z2XCgEFCwJkmBYwbkRxUehP2/DF07J
	 +c2aSJGEib+G2c6YEcw2rj+sdAbRTBaJSmhadhFF0qAYG7GZLDvCeOcOFvMHGxvNgAYGe
	 ldowtnYNxkkaUOMisd4kIFSAkUROF8har7o32M1XlbDbVnjFESBpiaUGnLzI7xTrqXzun
	 HljsAqHZHGKjOlAK2Osbm9ZYey2Yu25AcNPfNqBD2eTARaEuj0+H1UI4skRfrQhwn1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RQMZDvs0;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27680606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:38:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27680606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RQMZDvs0
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso13127326eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795635497; x=1796240297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XBqtxBo/Ovy/9j4ojA/2y1YO0FF3mv74qI20iGeveCY=;
        b=RQMZDvs06YJQkksIC8rYrZ9tb4fF2hXjZFvmLp3+UBSdpFOWa1YUKMw3418PjSXxvM
         tDMZ1aZNqCWeFoZ7BxL/SXmMhdmmktYRzV/W72pCwDqy3By3k3GBAjXy4/7Vq8B6Dp45
         rQ2kGDp3BrfpCBwpw8o+iHpOvW7qG8Fh5xvTf2QOXbvQtbV9VzIvzfLzTT7GGCx0e+h2
         ZWEagNY6PjFo1KW8sIqSsf4Dmhr+/mOl6y1XFj7Jqul1BEALbhwxG1drg1VQBoZTijBl
         0zI+xhWNIKuLOKyjuostMag6wWE/fwRcLpVPBor6dBGVyeScW/2hMhsnOYwfJ19l6Ibo
         Adog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795635497; x=1796240297;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XBqtxBo/Ovy/9j4ojA/2y1YO0FF3mv74qI20iGeveCY=;
        b=T6tPrNSe6fYx8nwIpFeM9TNBlSPL3Si3zj0qgYisBVTn4decTdu8MOGIGCn03pzl2W
         q5dIvvSvsDJZ28VTw/6U5UhZd+A32hCGng0zC8Jhh/Y7jDyT3HEWXSlKmyHOfYrHv3Ka
         WgKTPM3JglopFr/FSstafb3ghMVnscy+DgLSBzWLO44TqAlUsv4rHzUSupuId9P8zXQx
         opSLCia1iTpcHwl1OAhWLg+xoxaYVp6wgkgxxdN67PRMEOSwxkGzHSoTo83x7GhIhA0m
         Ng6HZ0g7MWyVVZSQkl7HMYElptqYqDNzgioqOSR9lhO4PZ1opABUYkeOXFdk0/I4hxet
         zGDQ==
X-Forwarded-Encrypted: i=1; AL+hErEmAMP+QzhIx5Fb6RCWvWfZ2Gl6LBBUOC9ayOyP1aya0vcI/CHH/p+O9hYUPdI7JASQpw7+GVVdK9IwVQE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MwcykegQjVxmXhtSOVP9vcOapUF2hwapy3n/wXadNbzk6NOMI
	j7uPffripB1ihnSwdNvccr/xvfVInWWTB3pHdTaeRBALT86ZUKO0pHinbAJHX2Kr
X-Gm-Gg: AZFdTZcDmALoHYjS+QX6U+31xxuJODfhbAlQOTMX1nvGKbTpVMPGntamMoxClHqUZGQ
	YdCi9WA1lwals31YlgJkwCEjXjqRZf9eRarlLbPPiyRQGc87hwxOd/2diEzqBHmrDkUifBF9y4l
	sHJOBBx4q7OGxLxbIjWGNi2Cng8azEayhsz1kg8oOsH1UAYVI3D14IXn5llK5rfW+JJ8kpSP1q8
	qHcyvnr/oNN1AO3h4LfnpDy0aEptdkblgnq638s68B6yQuF+zssCZgByZ4QAKBSBPJfrDGsgio1
	WcbtzsxgECRDdWP0WmPsk1y593SGQ/0Cf7RMNEfRA/+xR2cp8HzDVflas+1pcbI9IlhvVD5VN0O
	X6cddyI7wuANZMIUKdyV4X4qNmRPv2xcdT1zDeRtCHuMIJw3BclJy06D4xMgzp4rgWGESMGQ83d
	nKkRnnTNrk2uvY5BRklOSjHkrloqS2B6uio3HOvbM8g4qAHckm9Q7vNYO3i+h59P7qP7tfZ1UhN
	LA/F9V4KN0WsV3f7QF1B6kXGJQDRDBH/nCMKZNy0xfWKmj1IzIYqc3VR+XhJrj9m8iBRwv69giQ
	1asfj+sSHFI4cc1qmpVo
X-Received: by 2002:a05:7300:c00f:10b0:36c:a321:9fbc with SMTP id 5a478bee46e88-3856c9a6858mr21963682eec.1.1795635497037;
        Wed, 25 Nov 2026 11:38:17 -0800 (PST)
Received: from a1-free ([2603:c021:8021:f000:0:1865:8c38:18fc])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm63408730eec.26.2026.11.25.11.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:38:16 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>,
	amd-gfx@lists.freedesktop.org
Cc: Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH] drm/amd/display: Fix three kernel-doc warnings in dc.h
Date: Wed, 25 Nov 2026 19:38:13 +0000
Message-ID: <20261125193813.2444470-1-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
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

kernel-doc reports three problems in the DC interface header:

  Warning: dc.h:329 struct member 'max_gamut_remap_coeff' not described
  in 'mpc_color_caps'
  Warning: dc.h:2225 struct member 'u' not described in
  'dc_probe_status'
  Warning: dc.h:3883 This comment starts with '/**', but isn't a
  kernel-doc comment.

Describe the two members, and turn the comment above the panel
polarity helpers into a plain one, since it documents no symbol.

Verification: kernel-doc -none drivers/gpu/drm/amd/display/dc/dc.h
prints three warnings before the change and nothing after it.

Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/dc.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index d3c484f45333..b8b2af988b71 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -314,6 +314,7 @@ struct lut3d_caps {
  * @mcm_3d_lut_caps: HW support cap for MCM LUT memory
  * @rmcm_3d_lut_caps: HW support cap for RMCM LUT memory
  * @preblend: whether color manager supports preblend with MPC
+ * @max_gamut_remap_coeff: largest coefficient the gamut remap matrix allows
  */
 struct mpc_color_caps {
 	uint16_t gamut_remap : 1;
@@ -2207,6 +2208,7 @@ struct dc_probe_latencies {
  * @valid: true if a measurement was latched.
  * @measuring: true if the hardware counter is currently running.
  * @type: type of the probe that produced this result.
+ * @u: the result, whose member depends on @type.
  * @u.bandwidth_mbps:         peak BW in Mbps (DC_PROBE_PEAK_MEM_BW).
  * @u.latency:                min/max/avg memory latency in ns (DC_PROBE_MEM_LATENCY),
  *                            stored as struct dc_probe_latencies.
@@ -3880,7 +3882,7 @@ unsigned int dc_override_memory_bandwidth_request(
 		struct dc *dc,
 		unsigned int bw_mbps);
 
-/**
+/*
  * Panel Polarity Control
  */
 void dc_link_set_panel_polarity_enable(struct dc_link *link, bool enable);

base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
-- 
2.53.0

