Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108253;
	b=KdPnM8Ll22e4zfal9wRCW9X4b3+EKAPcTdNmV/CGLH1CA2O2krIVxH05WO1aB1zph6a5
	 Jt5te9ehdQHVb+fjWiaw3ct4EWwvRHOK2w/z7/fVdDjQw6iTOJ5S9gz6Tvz9EjSAVPqAQ
	 nh7D228hwAfxAzI+FHIOTcyuZahQXuVCMjzCZBxN5iqYCHxEDTnImBRkFzw+plJYaD3Th
	 tnuI9tr2dO4Q2hUnT+CVK35C4vzWmhB0CU+n3UjOHxKXnD0G9vvPFGAgBkfdTPVrBFe0W
	 xbwnii+CwY/UXSOl8qBQevgd3TypKmf9PQGxnXxbyArZ/gUdTQLdxW7ENGGMoABt1Fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108253;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=UgCYURNKZXvnpxT2x6kH2Yd3H2eYME7sOBjpX93BA1E=;
	b=oE0aFOOaaVILyqkZnbpSjSPv3oZAss3uoSc6GURcjmJVla6PQY5sZVFQYVTzNZQh1CIf
	 gXNfzOr45dNmfoycVPMOyq2MDoQSioWTi63LEpzedk6Z5az9/19NKO2h7EoSLtVEFyNpN
	 /9uX7On0xZPBpRAFlX3uO6C1LVQN2YWJrkOJPTeUKHocnm8Nwdp9CLPqKD36mAgilGQrA
	 EWfMWNoPcaPZpklcSf7dT6KwglttnIY23z6/mRh2sV+77EXU5Hxn9/JGvExtlELc1UoOO
	 FZbTBZbnttGWXXpVP/D2EOVKQ32Kutux9UP974foZgtRts2jX4c16SigA7MRV9FKYAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mG9gi0mV;
	arc=none smtp.remote-ip=209.85.160.70
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB96606A62E
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:10:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EB96606A62E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mG9gi0mV
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-45e83fd0663so36305fac.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108251; x=1795713051; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UgCYURNKZXvnpxT2x6kH2Yd3H2eYME7sOBjpX93BA1E=;
        b=mG9gi0mVOhmiIBP/3pgBNO492dK6aVTffHRtReNQ7WB7JaI9vKdxZordBybyCgYi9A
         zHlzeJxPxphp9kXbZLUbimVG2STDS139JM4lY3nWIEIDtJ1WYFL74oMGqtaEqHse/c5S
         xVMbTDAjwRhjfSUti7+Bvv8ufMOp6qxOjG6Nldh8XeAG4DVeHoxZ8m2lWPya+dSR78B3
         Z98raV0qXLFy7qNzKkmWZEyQEoVRe8Mgy5ge5uj9HPDTVwx2fyMgcgIE7uNGMZ0bTRKy
         LXBmdx6fKdUb89TsXuHbPvV91OOtl5YQ1QGdTEw2yfd6YBebaihJgs2LrBUiHrOo6Gfj
         j0Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108251; x=1795713051;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UgCYURNKZXvnpxT2x6kH2Yd3H2eYME7sOBjpX93BA1E=;
        b=ST1GoqEok08Aid7we1qbqj1O11RkeyRVifOYn2r0fAM2Br74xie1lPEFj1uF5QvxJc
         bGoJgBfx5Qsav888434mhKbND3dFKHzKgGSiqEsK+Pjbl4hxV8orMv5VnKSfSVnV0Xlk
         lUBiM5wypHB/p+GnEkn674Q5OCetGfpr2IkbggeetHHPAIhsbHwuj/gMmgh7VDpO0Nlm
         4xa5HJO/uaqKXaADcZmUFp3x/r8mIm5ww2NrNWF/Fy1iyVhI/I+hcum+14Z4EchGU7LK
         3dDAgUp/C6Tu2twf1GS8OJx5L15yIZ9ux0LWCgUtsrHooGIOYVibpxf1jwB6B/RkzXuX
         Q+dw==
X-Forwarded-Encrypted: i=1; AL+hErE8eDoVhwbMZlb8SjuXbT2zZRZsdDfJalnJiKXqLvH0f/zltHYM9JyyGKpitZFBa5kkxOhVJEGinW78NDA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8R5P+ZaNfG4sgcLlhSHWVqEyQM8ghvUFAHYhhjG8W/I75JbTbl
	PO2P7dCaHuG6w2QKMXMPwLLn302uyc6gnbnhTRxuvbLxl1diH80KVtlOF5g+ZdB7hvYfNHzIEpw
	qq2qvJf86Vw==
X-Received: from oadxh9-n1.prod.google.com ([2002:a05:6871:ed09:10b0:4a7:1cc1:e72])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6870:b14d:b0:4a2:47f6:3cbf
 with SMTP id 586e51a60fabf-4bc7d56ee04mr238017fac.8.1795108251216; Thu, 19
 Nov 2026 09:10:51 -0800 (PST)
Date: Thu, 19 Nov 2026 09:10:46 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119171046.1536673-1-irogers@google.com>
Subject: [PATCH] drm/msm/dp: Return MODE_BAD instead of -EINVAL from
 mode_valid callbacks
From: Ian Rogers <irogers@google.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

msm_dp_display_mode_valid() and msm_edp_bridge_mode_valid() have
return type enum drm_mode_status, but return -EINVAL (-22) when dp,
dp->connector, or mode->clock is zero/NULL. If a mode with zero pixel
clock is validated and pruned, passing -22 to
drm_get_mode_status_name() computes a negative array index and fires
WARN_ON().

Return MODE_BAD instead of -EINVAL in both callbacks.

Found via Clang -Wassign-enum on an x86_64 allyesconfig build.
Verified by building drivers/gpu/drm/msm/dp/dp_display.o and dp_drm.o
with LLVM=1 W=1 (-Werror) and -Wassign-enum; not runtime-tested on
Qualcomm Snapdragon DP/eDP hardware.

Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
Fixes: 05d001352733 ("drm/msm/dp: use the eDP bridge ops to validate eDP modes")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
 drivers/gpu/drm/msm/dp/dp_drm.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index c0c150e2c575..51649b584573 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -759,7 +759,7 @@ enum drm_mode_status msm_dp_display_mode_valid(struct msm_dp *dp,
 
 	if (!dp || !mode_pclk_khz || !dp->connector) {
 		DRM_ERROR("invalid params\n");
-		return -EINVAL;
+		return MODE_BAD;
 	}
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index c1e4147bfef1..dd4e8426cfe0 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -251,7 +251,7 @@ static enum drm_mode_status msm_edp_bridge_mode_valid(struct drm_bridge *bridge,
 
 	if (!dp || !mode_pclk_khz || !dp->connector) {
 		DRM_ERROR("invalid params\n");
-		return -EINVAL;
+		return MODE_BAD;
 	}
 
 	if (msm_dp_wide_bus_available(dp))
-- 
2.56.1.708.g77570a6a1d-goog

