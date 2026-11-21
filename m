Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795297286;
	b=1osiTArJEmm6hZ0NIeVBl3CE9qO6WBehujix/R1oyAM4hEh5nd6zJzGy9bH0BdKwKDq9
	 oNltd2owo4BsLCtVYnHrd40mEFFKqg1qFLLo3mjnCsXNwZD14plhogfblyda2/Y7qL4T6
	 EEn67hMopue2UuI5hRlK9ufWyKAyZKTapYEyYnyUfJW1spBhmoiZVMhowsAmfEKnimB50
	 j4iPo78DrT2IOr0520RFLVE+tHDErwxGvcQMhTcqOw98vwwG9eFqxkMk/z86K1DoQmj1s
	 pkvKXLkXio0MCBhdmsxQSoItWlN9pb4ul84xX6fnLONOLpQiP1SoDAHs25cysFeOHOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795297286;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2njdU2P0o0owSxMfoiGpvysc8tEsvleUf6yxLSSSXCM=;
	b=3uxp60J2nxrE9ET+soq4LVOarAJ4rfjn8vkbYSkPtMke10QMFxl6qz4nrSYTr1Mo/eJh
	 5HWxeYIfw58eh1mmboIbe9F+xn51kUrAZoryqhgSLwvk8T1fNwEtGdvhUmlMk4obfYXtk
	 4j2AWUccUep8W2aYYILVDPd9IdmPo+WgjrKROgaLxNwh851b/h3t9kJ9djNvpreTJx5K1
	 +ozc0KHwWMf3YOnWkJ5jf7kJrCoO6g5XEk7F+z8BV5cdRyG66lIS5Oxh/L5skdqqnvKAp
	 ItsrTd35XqeC4L6I4jL5C91efSZtT/08KaEsSiZmKxml/Xy6iiTaQs0gzx5K7n0o5HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0sw0TkCc;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AEF1606A33A
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 21:41:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AEF1606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0sw0TkCc
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso14433135e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 13:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795297284; x=1795902084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2njdU2P0o0owSxMfoiGpvysc8tEsvleUf6yxLSSSXCM=;
        b=0sw0TkCcEve5HC15tE7aSCGs5k+TgF+IqmDqLSrIGuPjkY0IohgPsgQXUA1YlVRAue
         CxjO+ak9gJLRlJAWacPg2xCxx06ZxhxUuPMdcY9WbPqNl1qRd6zLZ82n4KS4I1P1zykk
         BWTFfJNHWYj5HRI/5DtkImzmbMTKaVk2ivIFqXRwGonreIV1E4XzHJPjlUQUldqhtUq6
         B4xf1wtAJp5CziMO2uDfG8T84jLrEQU01wIg2+DAuxl/PDfi0ehzWD1e8zmGd/dFjSTO
         SNneaNksu6jmMQuMFkQ26VPlZmsnf5oaH6iToA1H9C/pppJ5t8l2v+TbRxAdIJcNUAjI
         VLbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795297284; x=1795902084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2njdU2P0o0owSxMfoiGpvysc8tEsvleUf6yxLSSSXCM=;
        b=w/GKMaILJ+mo0S+oBetBVppvperTXcaZ+qw9ZGHia1Sfxf6WlMVWth3ydtzg5ZBEvB
         rZQMBgK51OEulfJ4a0K/h4D6Yxr6Asy7ETWeszOIAvpnY7M3RlShTm24mBx7vRfhMtki
         HMnWaTxYy8y9GQ99Uzw9aGN6ZSnUXjp1Ay2Hw69adwzNzCCG0xwPTj5opz0QzohXbSf8
         oBckD1HaY7CK8J1ZKGu+MZQkrwYCihf5C6dH/X8qCVz87Z4OritYnIRHRegZlv/XWC3I
         gUbQblpol7XPM7sGYv90lfBcz1082Gner698VqeBk2bFwc3TNhdngM6n9u9VrbFmadMb
         2llQ==
X-Forwarded-Encrypted: i=1; AL+hErG8GTOF/pZkzHgXPDhQDlMH/GrFjvdUZWfabAUSyTJxnLwIQnW9jnx24uMemvBnubnzd/xx/Sx1tBDy0LI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/oaBnArSAXv/SmFzIeaSYnSgul35xB4+Oo+lV6bJqm0Fj5kExm
	OxyKBR2jk78klt4XzYkLlqrvAi7sHp88viTLv06A4Ns1JRkCOHHKqeo=
X-Gm-Gg: AZFdTZeYC8LaGhQwZJjCr4Ge7QiEByd96bfhy7E+Q8RvjSMuYgu1ybUdWJEWElD0ra+
	fNZC2OocmFviKwi9tyf+UQh06rK4APAnUp28wwCUmqbJTU8n/a7v6UbaqpTri/kz1ViS78NHj/8
	fk9irTAp+Ge8mG4cUwj9xUfBTfbMgLUCOGw1xxGSgQqyZBLq82YY/1Muduq5D//27bXf7B4K5kX
	zLUzItDlLUaWY6NhWvwv2eA71i2AuGDuTd+iOuSW2aYXdALg9LNLgCXzbvU1Y52A/YVaAj4sh3O
	sXp95YzpKSYJBQx5LPxuvMsV0D7+PeoYSrD8BlJ6Ebh/tn0w9B/HJbisXilo03iL8reYyXxibtL
	CzGyj2WxC1NGIq6WHH8VeVBscx5vuVZth2rIjPQ2Zb0iuf1P6UBpDTouDwUTW1BX2LdsW0jtrMZ
	oN2qkkgLX0yrpTmfFtJeA+R4I9wRA/Dgma4t2IJHhJgpNJUybYfS7EGmhKt3ineKlchFkxaMOsa
	+bKLVxau874QazZW0KMHLIOumaSPEM897QESfSI/olGf5k+Iiq3l6RiHNjVi0oqMloJERUowCHm
	lw7BvFJ8ilXT9Jd+KAc8WV1K1weefct5y8zObF1v
X-Received: by 2002:a05:600c:3113:b0:4bb:693e:4c8e with SMTP id 5b1f17b1804b1-4bb88816a53mr166279085e9.21.1795297283922;
        Sat, 21 Nov 2026 13:41:23 -0800 (PST)
Received: from h7015t.. ([193.207.113.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067a0e6sm54580645e9.4.2026.11.21.13.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:41:23 -0800 (PST)
From: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dale Whinham <daleyo@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
Subject: [PATCH 3/7] drm/msm/dp: keep training pattern active until stream video is ready
Date: Sat, 21 Nov 2026 22:41:01 +0100
Message-Id: <20261121214105.32596-4-gianfranco.mariotti94@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261121214105.32596-1-gianfranco.mariotti94@gmail.com>
References: <20261121214105.32596-1-gianfranco.mariotti94@gmail.com>
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

Commit ca16db3d18cf ("drm/msm/dp: break up dp_display_enable into two
parts") introduced two regressions on DisplayPort re-plug:

1. msm_dp_display_prepare_link() called msm_dp_ctrl_on_link() on every
   prepare (even when power_on was already true) and unconditionally set
   force_link_train = true when !power_on, causing
   msm_dp_ctrl_prepare_stream_on() to immediately re-run link training a
   second time right after msm_dp_ctrl_on_link() succeeded. Only call
   msm_dp_ctrl_on_link() when !power_on, and pass force_link_train =
   false to msm_dp_ctrl_prepare_stream_on() so it only retrains if
   channel equalization was lost.

2. Splitting msm_dp_ctrl_on_stream() left
   msm_dp_ctrl_clear_training_pattern() in
   msm_dp_ctrl_prepare_stream_on(), clearing DP_TRAINING_PATTERN_SET
   (DPCD 0x102 = 0x00, which re-enables the sink descrambler) ~45 ms
   before msm_dp_ctrl_on_stream() enables the pixel clock, programs the
   TU, and switches REG_DP_STATE_CTRL to DP_STATE_CTRL_SEND_VIDEO.
   During that window the DPTX remains in MR_LINK_TRAINING2 transmitting
   unscrambled TPS symbols, causing SST monitors to lose symbol lock.

Move msm_dp_ctrl_clear_training_pattern() back into
msm_dp_ctrl_on_stream() immediately before DP_STATE_CTRL_SEND_VIDEO.

Fixes: ca16db3d18cf ("drm/msm/dp: break up dp_display_enable into two parts")
Signed-off-by: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  6 +++---
 drivers/gpu/drm/msm/dp/dp_display.c | 16 +++++++---------
 2 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index b896196cf244..779f743f9418 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2616,9 +2616,6 @@ int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl,
 	if (force_link_train || !msm_dp_ctrl_channel_eq_ok(ctrl))
 		msm_dp_ctrl_link_retrain(ctrl, panel);
 
-	/* stop txing train pattern to end link training */
-	msm_dp_ctrl_clear_training_pattern(ctrl, panel, DP_PHY_DPRX);
-
 	return ret;
 }
 
@@ -2663,6 +2660,9 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 
 	msm_dp_ctrl_setup_tr_unit(ctrl, panel);
 
+	/* stop txing train pattern to end link training */
+	msm_dp_ctrl_clear_training_pattern(ctrl, panel, DP_PHY_DPRX);
+
 	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
 
 	ret = msm_dp_ctrl_wait4video_ready(ctrl);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index bce641d7d893..b8373740275b 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -632,7 +632,6 @@ static int msm_dp_display_prepare_link(struct msm_dp_display_private *dp)
 {
 	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
 	int rc = 0;
-	bool force_link_train = false;
 
 	drm_dbg_dp(dp->drm_dev, "sink_count=%d\n", dp->link->sink_count);
 
@@ -650,17 +649,16 @@ static int msm_dp_display_prepare_link(struct msm_dp_display_private *dp)
 
 	if (!msm_dp_display->power_on) {
 		msm_dp_display_host_phy_init(dp);
-		force_link_train = true;
-	}
 
-	rc = msm_dp_ctrl_on_link(dp->ctrl, dp->panel);
-	if (rc) {
-		DRM_ERROR("Failed link training (rc=%d)\n", rc);
-		// TODO: schedule drm_connector_set_link_status_property()
-		return rc;
+		rc = msm_dp_ctrl_on_link(dp->ctrl, dp->panel);
+		if (rc) {
+			DRM_ERROR("Failed link training (rc=%d)\n", rc);
+			/* TODO: schedule drm_connector_set_link_status_property() */
+			return rc;
+		}
 	}
 
-	return msm_dp_ctrl_prepare_stream_on(dp->ctrl, dp->panel, force_link_train);
+	return msm_dp_ctrl_prepare_stream_on(dp->ctrl, dp->panel, false);
 }
 
 static int msm_dp_display_enable(struct msm_dp_display_private *dp,
-- 
2.25.1

