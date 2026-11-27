Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795738013;
	b=cwQqQnDvbaqb308HkKVMjyLWkdY96DrEuHbG6wGtQutMgZRuD5i4S1vfF+4jjPY1H/MF
	 BBIUQJvJ/kpX1ycLtSR/U8XkkZeGDfg+KfPz7g6jehIdThoNk5Iw4qcHaGQdZac8vqN16
	 YTN/SU/18HQv0Bl+Oo6GZBfQ6uCwvSBr0HmBtdqWjMxZJ3o7a2o8EuqhEROvscalmDcqL
	 JGuuEIsoYzDgJJ+vaHln6//0r+BctE32Uo4BSVNT5SZRU5dSWuc9zpaVxODzGWVsHmXHX
	 FF0C119qMXUqW9sWdr6hYTwEefyxj1ndUxVU4/IzruqIfXNzc4Xe++hk+4ZY60qZe5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795738013;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Content-Language:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding;
	bh=JHqtsUs0ik0BieRJ8Sc/408xRW33ZRqGcrC9WKJdgzo=;
	b=JxacVuJGC0fRJc/Tpk3tN4Z9Kg0yGzCcEi2VjfJRdt12HjDi8g9Lwy8vRoQGZdKFiDeS
	 /kJht80/n9p+tmAkGAURmU9ft3ze55zvmOFb3SSY2mT9bNvMoS3Dy++5PW7h8FBM6FqDt
	 W9uW05F6lzcpLC+6TlRWVZaMdBtOb6aLA7eBtDQxxajwz0uQ141umoccu1rBxwlemOl36
	 F7DeXyfME0nxzGa4DX9D9TuK6rWTRFR5dl1PUBr/8XdXRq9Jf3vYYbuDhOXnJkyQAEtsd
	 IA2Za6bLTwt9WC8/WeSWfU/tSSlXAn/ewtrVbcVVfmH7MhkLqTyuHC0sowhUHyGy+uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZWwaX2+7;
	arc=none smtp.remote-ip=74.125.225.72
Received: from mail-wr2-f8.google.com (mail-wr2-f8.google.com [74.125.225.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E94606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 00:06:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47E94606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZWwaX2+7
Received: by mail-wr2-f8.google.com with SMTP id ffacd0b85a97d-48df4afd489so1894880f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795738011; x=1796342811; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JHqtsUs0ik0BieRJ8Sc/408xRW33ZRqGcrC9WKJdgzo=;
        b=ZWwaX2+7knnSf6gqOs/CRMa6UnjvPEZVk2LeRHDhDaCeihSDirr9SwYF4i/tbGU+Vx
         NUzMTYpztY68nE5fxvkG6/VxLvhjw+LbAgLzdtrcpRIBFMkA8xRi2NcrSyEXTPTvarC1
         hhAcYLjGGiaoi9NpZ21n7Jh+G+gZi82O9J9EDJ1rlN9iWZBsy55V8xMMPmJIlBVOs2pW
         HeRRrIdr27MGala7oZ3geUnEjiG452fyXSxRVJmPl7OAjD1e4QOQMbFMYEAnldzLYbB7
         gQWK7Bk8K1K/+pWZtvmcqTTI+kd6p9YEBlrPUE2TuSSY2GLFJZGr/1f608tlnLkl+jFu
         KE0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795738011; x=1796342811;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JHqtsUs0ik0BieRJ8Sc/408xRW33ZRqGcrC9WKJdgzo=;
        b=ZNlPL0luhzBpROdVdRDvq5oze3DxGi0vGrPaEgtQMkvDDy1I5CBavef8O/Ctp4rGpq
         I1vQ7NIg0rZzR4aixVh5e15M8ytbQidTkfgFuZNj67CaDdKuuU4te/RQWHYI1ZeZzrVH
         IOqKnI1bmzYLWSe68RtpTIxrrP8EPmWemIvzPd/9YLXcEDmn5Sq2BgqRRHNAvhXszwCr
         3xxSipHO2+BUUBddTiznFW+SXYEsS6aSMWJcLJRI+Wa8PPCHR/hiI5mDJiV/UjSrtb28
         +IQiMUJ81IyehgCLWF+csVz36mP7nUf1jT4oPL5DExqgDbb39tycbA0B803wo2i4JJ2T
         YOBg==
X-Forwarded-Encrypted: i=1; AL+hErG7ExShBAL77TTLNLSNJPpOV/SLMEzpIODVQ2fcKhFXIXammhwLl2hFvknUH9OyGCzHRpobEZ7HrrAh+ZM=@vger.kernel.org
X-Gm-Message-State: APuU4Z92PH1PtYxB/pM2n6vro3cAnyau9kOvEIGKdq9mu8NOgwdIxL1N
	sINf7qbdZXS9R/ZPt3mfhp2VJZ/BPeilbguYcASAAoEXeiYMfbH1FEfV
X-Gm-Gg: AZFdTZd25kJBBba2JTppqyWdjv1xBYZqq0zuhykmKafTg5zKnv6wpbeteEJiQrHUat9
	U4Rn3mb9xT/ZbxFCBgHAGvGYUwTCjpXoKil9abBPo+sr1qSh8ZPL+1y7DoFW/GAsdOgUU8LrtxG
	GdwLUN4Nt4C9HMOcFcQ9Nw6fonO9IwjB23QlqZx4w3iaiqbUVqmjRN+lBaanfckj9mYLKGGXQWc
	sZSfMFqXjQ0vNEvxFHWwWVLdLue9SqYjkKV36KUS2OlbxyfsAhCuVCVDsdtEcX9Ux+QGDF34QrY
	HSbPfoOErulyfz8HYPV2i2hAr+A6V+fqewmXMEql0TPB2iLGF8fvbRO65W7iYJGlVNE5OkGkrx+
	67Y2n1PQxjnBuaw11jxBCemcToIupNFwNprOA38Z9rpQgb4Q0KnWiT6ezAcy9TYwgrkY+2TuvUb
	L1ICkfvl/RMk4FLBnSqDb3bTjaAZqTSeJhjMlERpT0OQaSFL/KasKJ6TYJE6qKJpJb2fW/GHyCq
	vWDUD0UMGspQK3uhBhedt+34gXyw2IA8EuJAbzaDfcgc5rjGm4i7gvxFhfrY4jxw1GlKVGyRcaQ
	tEm8E/akH0ZQQmgHKbxTc4ChMlqtfNyVy7gaHH4ALnszQZI7Phq+C+bcaQ==
X-Received: by 2002:a05:6000:4381:b0:4a6:5a2a:f5a3 with SMTP id ffacd0b85a97d-4abaa9773abmr47659974f8f.3.1795738011470;
        Thu, 26 Nov 2026 16:06:51 -0800 (PST)
Received: from [192.168.1.11] ([31.94.68.154])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf61e8sm45145550f8f.11.2026.11.26.16.06.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 16:06:49 -0800 (PST)
Message-ID: <59629f46-5add-4fc8-aefc-c9e02b4d59d0@gmail.com>
Date: Fri, 27 Nov 2026 00:06:48 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Richard Lane <richardlanedev@gmail.com>
From: Richard Lane <richardlanedev@gmail.com>
Subject: [PATCH v4 3/3] drm/amd/display: report synced displays to PowerPlay
 on DCE <= 10
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On DCE 11.0 and 11.2, bw_calcs() computes all_displays_in_sync via
resource_are_streams_timing_synchronizable(), and
dce11_pplib_apply_display_requirements() copies it to
pp_display_cfg->all_displays_in_sync.

However, DCE 6, 8, and 10 (including iMac15,1 on DCE 8 and iMac17,1 on
DCE 10) use dce100_validate_bandwidth()—which does not call
bw_calcs()—and dce_pplib_apply_display_requirements() in
dce_clk_mgr.c, leaving pp_display_cfg->all_displays_in_sync unset
(false). Because PowerPlay is not informed that the streams have
synchronized vertical blanking intervals, SMU7 prevents MCLK switching
at idle or causes modeset underflows.

Set context->bw_ctx.bw.dce.all_displays_in_sync in
dce100_validate_bandwidth() using
resource_are_streams_timing_synchronizable() and copy it to
pp_display_cfg->all_displays_in_sync in
dce_pplib_apply_display_requirements(), matching the existing DCE 11
flow.

Signed-off-by: Richard Lane <richardlanedev@gmail.com>
---
 .../gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c  | 3 +++
 .../drm/amd/display/dc/resource/dce100/dce100_resource.c | 9 +++++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c
index d891b3bfe2a1..1dd302ad19aa 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c
@@ -320,6 +320,9 @@ static void dce_pplib_apply_display_requirements(
 {
 	struct dm_pp_display_configuration *pp_display_cfg = &context->pp_display_cfg;
 
+	pp_display_cfg->all_displays_in_sync =
+		context->bw_ctx.bw.dce.all_displays_in_sync;
+
 	dce110_fill_display_configs(context, pp_display_cfg);
 
 	if (memcmp(&dc->current_state->pp_display_cfg, pp_display_cfg, sizeof(*pp_display_cfg)) !=  0)
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dce100/dce100_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dce100/dce100_resource.c
index 97ea22af5d2b..0d25c2ddb661 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dce100/dce100_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dce100/dce100_resource.c
@@ -888,6 +888,14 @@ enum dc_status dce100_validate_bandwidth(
 		/* TODO implement when needed but for now hardcode max value*/
 		context->bw_ctx.bw.dce.dispclk_khz = 681000;
 		context->bw_ctx.bw.dce.yclk_khz = 250000 * MEMORY_TYPE_MULTIPLIER_CZ;
+		context->bw_ctx.bw.dce.all_displays_in_sync = context->stream_count > 1;
+		for (i = 1; i < context->stream_count; i++) {
+			if (!resource_are_streams_timing_synchronizable(
+				    context->streams[0], context->streams[i])) {
+				context->bw_ctx.bw.dce.all_displays_in_sync = false;
+				break;
+			}
+		}
 	} else {
 		/* On DCE 6.0 and 6.4 the PLL0 is both the display engine clock and
 		 * the DP clock, and shouldn't be turned off. Just select the display
@@ -900,6 +908,7 @@ enum dc_status dce100_validate_bandwidth(
 			context->bw_ctx.bw.dce.dispclk_khz = 0;
 
 		context->bw_ctx.bw.dce.yclk_khz = 0;
+		context->bw_ctx.bw.dce.all_displays_in_sync = false;
 	}
 
 	return DC_OK;
-- 
2.55.0
