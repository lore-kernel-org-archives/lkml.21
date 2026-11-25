Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.75
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795568754;
	b=gpXheCq/3DPelrx+8FrBS+LQ7M46Y/3aBbnw9+sWtAWTqLhTZ15n2To7g+SkFaAwmFIo
	 tlzvQzLtjNmK6UzLhDA6shadDVWB79v/ez4MAwHsOv7fUD4dSEJtd0s/BSjwrMyLp84wF
	 83gFhuYKp8bmUzf4s8Ocqz9oZC1ilAvz4yNB6wQLhNgsvGvE/Vb4udG3ig2TU+xaGIXY6
	 ubd8y4x/wkdYGxKWFEI+2pQc3vGE6j/ey/yBWWVHjtnPCYqiz5A0t1UOxajuxx4wjIN3s
	 1QN4xXVyeCNpkhsmUeJUNSHX5VKbg1FQBQUjSQwcBiTfThz3jhhR0Azs+/p+BQJx6Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795568754;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Content-Language:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding;
	bh=JHqtsUs0ik0BieRJ8Sc/408xRW33ZRqGcrC9WKJdgzo=;
	b=pWn7sHzDrDaSJant/z+5cwgcmbFKf9twSPhLU6qlmpIKb/LbZP16xXiL709SBk49SxsQ
	 Y+wqji+nPyEdue9R07UY9hwuvTeUlk+IarsKw88BuH2PcEmE20xWKGzzAG93HPxG6Sc7A
	 +GIdpCyzujgnYOraznV1vuAbkfmap82LKb7P6CxrakLuyt9EFSIdJ53cz36CtqkFbbss7
	 Tt503J3mKK9PjhbsoqiJGAGOGyqo32OsXZqR+h4OjSb9tWVPeW+yNxbF5cxSgCuUg5kZ2
	 eD2BcZ8NOAjaDitlx/ZJAPYFgKNSoKcWEblPQFslSB8lIUdSY6s5smcLIoI6nZouaPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="MruEF/7D";
	arc=none smtp.remote-ip=74.125.225.75
Received: from mail-wr2-f11.google.com (mail-wr2-f11.google.com [74.125.225.75])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA95606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 01:05:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FA95606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MruEF/7D
Received: by mail-wr2-f11.google.com with SMTP id ffacd0b85a97d-4a4afca056bso1655865f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795568752; x=1796173552; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JHqtsUs0ik0BieRJ8Sc/408xRW33ZRqGcrC9WKJdgzo=;
        b=MruEF/7DoYQU3/ikZ0aJAAQ9tipzBVCzgrFS4CnIRCaHdjxR1PVaMJBvegTsZcM+1I
         2GjtXBmBR4NhMapuAo0yPktfr60P7wz9IcQgzatnf1IEapAo24rMCRjr6dAwSRTxsZee
         RNuXfvEsBCpygl9bPr6g1XGsezcm3fQvm9J96LlG3lS4H1qo8KwHXe2EuhjhYoCNxRjD
         peydfKwT/KFpbwn/hJazk56XDlEcy8WG3dwG59S1ZN3sgXWAE3mlFkuUdSrUyoQSmMW8
         VmqIebyGEBoXkaxHGdOVmXIiev3wJ6ZJYLOhgfe1yIu+1Qoy6+8/8LlDPcwgCCA/kzMw
         LQhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795568752; x=1796173552;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JHqtsUs0ik0BieRJ8Sc/408xRW33ZRqGcrC9WKJdgzo=;
        b=QGPsd02LXJGsuFmiC4V2+65USnosTuB63YQ1Si4sVcpKcewEmBgBVukQc/xMmGySX+
         MWUZF/DLTaF2t7CuuRxkMESR1DK5g5KrxE6E3Uo/P1Kb2Q0hggFxQ3E+2Gd1f/4mxGEg
         29G9Uf0MG5RR53FAEW+PlBHA9eeBQCuraysgoMrJp1/+WzuuqB5RR4AdtkV1cqEURGO2
         a+jg7PJBdwwtjjoqZL4t49KYSMJujg49G+XEIAqPUPSFdYgwhCAduaNdON1SA3rlEekZ
         q7t1tPchgD24CTWvZwaCMQtAZFq1eqo9tXFtVX3lzdjsyxwOzTcIqas4cmOCN4x3E6t2
         dMSQ==
X-Forwarded-Encrypted: i=1; AL+hErGOB4aKx1UPl4PSmqHEE4O7vZlAl8k1QsXSS0KC7p5O5jWTBE0OiUsYIBnffyaoraWuBVBcNWFEC7Vlncs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/gMN2Ur5VcKx/drm9T5H9+OIoSI0L4z7uW1Y27//D+2BKFWGC1
	SMrUXl92QAsX9saqnkboIODboYsPI6kodB14n5Ef1kRulpSyNUDG7dE/
X-Gm-Gg: AZFdTZcklk2xUp6JlNIQXFreqnb6huCBoL2g72sjyfcAyhzZ1MBWl7pkhb99h9rJKgK
	0DRgElxeTKw5h79qgfmW9ZS+Oz538r6sNtzNQ2k6eOoEt9RE7ff9P4kJh7fKZF4U+RqrgLcFgtn
	bNqjI2s5pgU7FupEDizF68kEelZVgyeP320N3cj2zrWmL9CDqVbOyNsVrqg18okoKzoiQdyMlSv
	hlIkHvYK+vSW85nDPDWWSozXsOzu/aJrF2Cw8vBzwNCDT5mzSIAn03S7vMrDcmk7YNablgNDfMr
	DB1hpcYq9xJyt6RW8PRnzgn3nluxT/yZO/oLTCykaGwZ6I5foR3futUxvAvEznZygicYGeEsfTh
	X1ikF/26Z7XmdpTW/VfMEHAmdO/K68/PsWarWOtpGsML4DFfD9UOPPHqJhLIEbLkGYJzf/P03YI
	Vo2e6YQONWraQXFSTEqWuW2KTruu0Qglo2jK8TziV2lHehPWACFXBGmNBTXL07Gg8IjEZZf8Nmq
	/w+CIUVg4x3CxolO9BAnOtw0x3XKgZMc+CjZ2iky+OeVUovCOZhxuFUKzMYWMxhZi3Xmby6Vyh1
	NQWV9bKRmzatwYSNojorOowQ7xpz/g+nZP7w
X-Received: by 2002:a5d:5f93:0:b0:4a5:33ad:871a with SMTP id ffacd0b85a97d-4aba56f470cmr31260645f8f.0.1795568752468;
        Tue, 24 Nov 2026 17:05:52 -0800 (PST)
Received: from [192.168.1.11] ([31.94.68.154])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2052c8sm31176947f8f.41.2026.11.24.17.05.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 17:05:50 -0800 (PST)
Message-ID: <80b65871-aa77-4800-9c0c-8586aaec5c80@gmail.com>
Date: Wed, 25 Nov 2026 01:05:48 +0000
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
To: amd-gfx@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Richard Lane <richardlanedev@gmail.com>
From: Richard Lane <richardlanedev@gmail.com>
Subject: [PATCH v3 3/3] drm/amd/display: report synced displays to PowerPlay
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
