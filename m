Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774474;
	b=aUP7Lqm4GZpHOvJ02C1Jw39989aA3eXuJc09RKnCWzbLe1IUfb8w410ITgZExOYicwXA
	 4NOYMaIo7x3m/jCamSuZfC4cBI83E/6BF6ENNMNmSfSmFqwVjHafcoLBw7cM5WFSY43RX
	 mSnsHUpxWRWD4eW50EGiwpBGVY6XN8rZ7PsJAqMio9Svf3Dd7iyR1IIs90fH+FVivmZvF
	 CVCN/OhRpbFyLwtTm2uLqxWaRj4I6wcNVWJEHJAOCEOOIBQhzmvSitQrdbTDoWevwVf3+
	 EkeWMhAO7ObeQeFHJV6qu3oNCmFPrBKhD5CDftZIGIX6ua7/W4qIBg8GkXzMfRaYnBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774474;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rdDl7Q4foQHYAjSl826AE0/syYoFqrpNAcvwAyqjlxc=;
	b=xt+OUtXApAXx19IYL+beFVH+9fnTtzNTAypzUgx3uYu13S7Cca9OcM9y7p1ATLR6aAcW
	 xvjzn/jloxOSstned3OW7Fa27GHLnWr+WxKy6DE3i3qmKCMnhZ4NWt5YcEtIWGkQoe/ZV
	 MYmXruYWUUW1QuJ2d1HRBI0f8C1el+ai14ooFDK8HfoVo4pb1cOb8klYD+soMnPUWcTKQ
	 OJkDkNZn6jP693rmMp0fKvBu4qYWN5eVG8rTJelzb1rclTXTZojpOuCR9+dh1upoYhTwp
	 pAUcSKhaNDVE2amUhGNSvnbs8doRSE3d2rgHtNhducK0WV5IlHEXd35E4Vmmp8wPXgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UfuyINck;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6516076C05
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:14:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE6516076C05
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UfuyINck
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so6545658f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795774472; x=1796379272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rdDl7Q4foQHYAjSl826AE0/syYoFqrpNAcvwAyqjlxc=;
        b=UfuyINckwgc2hPjGbLkcbnYhUtHN/BJ7AsmfkJrwi6qUFYw6/UEG4eU0tXYu5gd6me
         avs+XWJmLKo8wbUvTXZB0JeD5WcC9YlfQtJ/Hetujggt+RsqvJpdLKhsxp+11AFhGaxr
         3A/jf8Cr9eoMggZ6DXJR6jCPiJ0tzrt+zO0Vasec8v63ARyeDWDCc9YAWBc/6VND5Y0e
         wr52ICxqcet5uL666PY+8L7wWbWCZAu4dCAODVp2ROADy/98+FNsNIX39GfB4UXXqED6
         k/5opcriwUD8CNqp1kzRImuf59pJwVifJU6TVMSPSyx3M0rOrqJxztkqGT4L1ePvMJCZ
         FYHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795774472; x=1796379272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rdDl7Q4foQHYAjSl826AE0/syYoFqrpNAcvwAyqjlxc=;
        b=YaCTK1p+Gm8IA1/6DPLDmHcu1jKCencgeeOjjdnmERAbsPxIl9iu3D5T64q+0l+r36
         UQuaWtNMsivSqMt4Fob4PedrxhxnSMwWzxLMm8Ywmz+XGbH18J+qRSpGeS4h3MeZF9oB
         9aho//EmIsBIXejAzngrq4j1XQ9oPC78UOArJJl0ZeyZhVv19A68CkcRZfS54g3sUlrQ
         iADpxY95ke4I6BRy/AIbsrOTq76vs3G7EoIpPXKcdvs3EI2QnIAj1EbssUzRM9p8o61c
         6SlsBPRds5qP3p1KpvSRHQPcoXCsviIuACIj8Iv20XdWYVv0Zo0KYIs0Rae3ErSfRBaW
         1j3w==
X-Forwarded-Encrypted: i=1; AL+hErE1np+NKDnHLs6IkDvt37SZeEl91WaAYYpC2dm+8ENFb+NSGnSDWzZapICmF7wUgztW5F3tpADaCkzvjiw=@vger.kernel.org
X-Gm-Message-State: APuU4Z949DFTJT37KgpAf3xiAYaAWomCQRUaquHIzmKr/DxkO1IqHfR0
	lobJI84GaAI9GmXmo5W0X64vxICloItGb72ZKLJmLCktndB9GyhScdo=
X-Gm-Gg: AZFdTZen0UBny/EjFHeVUZgm4Vr3oPObkWbZ3zPEmweqAlewiy8UnJqsdUwQIkhGIJk
	2RZ7JW9nEVsCOnntJf5Hlpu3L9i359DU7Yyyv/hycl6JgcD8xTmec+sCL8iuqMn4t/3dofWO1P7
	ilxs6o93FBPhTMV5f2r+xnrlj9mstV1Xo4UbC3RB35az+B+c24zcdw3nLhDnkFT4AOu+q6cEkYT
	e5x12n4UuGqYK7a6IZ2SQDgFpaznQkXPqmYcXZ4W4jdrlWbwmClfbB0DBJz8mNakgGMNVjZb8Ns
	0Pa4KEUwjJlStmRU8CE66XWjKHkgvVF8zwuE4xqC8DFoxekOSVlm+oa5N1DwWg774VYkkFmVCIb
	iPBhIGXfyEQgsrbG8PgZUqmK8oO7cdfZ9Q02DX27alWgPQvYGSVTPDcoVZfUertHZUMCUJySzXd
	stMF/wVqDkjDjloy/shcwMRyavZtYVpUGqaWXDz0gKqq0LssGB2rchnnAj0Bh0N0fSD3H+Okkkb
	Ts/m+ZaJc+UslqpqMX3EmOyYxghUedhs6665tOKV790E4+vc740RlT8plsABVKg/u3k1V68G3Dk
	Fn6Ylgq0t0G8HV2pGBc42QmLrwilQxXhwOY0AWL3/XmpldLmVkRpdD8A1b2J7tL/kEZPZjMeXKb
	dVbOOwt0+8EcL5s6Rb5kDj/l8NzGJdpkBGc0GSRXAF61xzzAOBxHIVxFM1qM=
X-Received: by 2002:a05:6000:2607:b0:48f:bb92:c5a7 with SMTP id ffacd0b85a97d-4abb0c5d665mr47747367f8f.9.1795774472210;
        Fri, 27 Nov 2026 02:14:32 -0800 (PST)
Received: from localhost.localdomain (host-94-89-17-99.business.telecomitalia.it. [94.89.17.99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fec7sm43651234f8f.26.2026.11.27.02.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:14:31 -0800 (PST)
From: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
	Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
	Dale Whinham <daleyo@gmail.com>,
	Stephen Boyd <swboyd@chromium.org>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
Subject: [PATCH v2 07/10] drm/msm/dp: fix HPD plugged, AUX gate, and runtime PM tracking
Date: Fri, 27 Nov 2026 11:14:14 +0100
Message-Id: <20261127101417.24303-8-gianfranco.mariotti94@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261127101417.24303-1-gianfranco.mariotti94@gmail.com>
References: <20261127101417.24303-1-gianfranco.mariotti94@gmail.com>
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

Keep dp->plugged, AUX transfer enablement, and runtime PM reference
counts balanced across hotplug, detection, and link preparation:

- In msm_dp_hpd_plug_handle(), return early when dp->plugged is already
  set, unwind AUX transfers, PHY init (if initialized by this call), and
  runtime PM on DPCD/AUX failures, and keep dp->plugged = true when an
  empty branch device returns -ENOTCONN so downstream hotplug events
  remain observable.
- In msm_dp_hpd_unplug_handle(), avoid clearing video_test or disabling
  AUX transfers when !dp->plugged.
- In msm_dp_bridge_detect(), stop mutating priv->plugged (leaving
  ownership with the HPD plug/unplug handlers), disable AUX transfers on
  exit whenever !priv->plugged, and unconditionally drop detect's own
  runtime PM reference.
- Serialize msm_dp_display_prepare_link() under dp->plugged_lock and
  require dp->plugged before bringing up the link.
- Preserve dp->plugged in msm_dp_bridge_hpd_notify() when detect reports
  connector_status_disconnected for an attached empty branch dongle.

Fixes: 3ea2d1c3d154 ("drm/msm/dp: turn link_ready into plugged")
Fixes: 5043357e75ba ("drm/msm/dp: rework HPD handling")
Signed-off-by: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 71 +++++++++++++++++++----------
 1 file changed, 46 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 7831dd13b067..a48f42a17365 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -408,8 +408,9 @@ static int msm_dp_display_handle_irq_hpd(struct msm_dp_display_private *dp)
 
 static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
 {
-	int ret;
 	struct platform_device *pdev = dp->msm_dp_display.pdev;
+	bool phy_deinit;
+	int ret;
 
 	drm_dbg_dp(dp->drm_dev, "Before, type=%d sink_count=%d\n",
 			dp->msm_dp_display.connector_type,
@@ -417,6 +418,9 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
 
 	guard(mutex)(&dp->plugged_lock);
 
+	if (dp->plugged)
+		return 0;
+
 	ret = pm_runtime_resume_and_get(&pdev->dev);
 	if (ret) {
 		DRM_ERROR("failed to pm_runtime_resume\n");
@@ -425,9 +429,16 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
 
 	msm_dp_aux_enable_xfers(dp->aux, true);
 
-	msm_dp_display_host_phy_init(dp);
+	phy_deinit = msm_dp_display_host_phy_init(dp);
 
 	ret = msm_dp_display_process_hpd_high(dp);
+	if (ret && ret != -ENOTCONN) {
+		msm_dp_aux_enable_xfers(dp->aux, false);
+		if (phy_deinit)
+			msm_dp_display_host_phy_exit(dp);
+		pm_runtime_put(&pdev->dev);
+		return ret;
+	}
 
 	drm_dbg_dp(dp->drm_dev, "After, type=%d sink_count=%d\n",
 			dp->msm_dp_display.connector_type,
@@ -435,8 +446,8 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
 
 	dp->plugged = true;
 
-	return ret;
-};
+	return 0;
+}
 
 static void msm_dp_display_handle_plugged_change(struct msm_dp *msm_dp_display,
 		bool plugged)
@@ -458,10 +469,6 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
 
 	guard(mutex)(&dp->plugged_lock);
 
-	dp->panel->video_test = false;
-
-	msm_dp_aux_enable_xfers(dp->aux, false);
-
 	drm_dbg_dp(dp->drm_dev, "Before, type=%d sink_count=%d\n",
 			dp->msm_dp_display.connector_type,
 			dp->link->sink_count);
@@ -469,6 +476,9 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
 	if (!dp->plugged)
 		return 0;
 
+	dp->panel->video_test = false;
+	msm_dp_aux_enable_xfers(dp->aux, false);
+
 	/* Don't forget modes for eDP */
 	if (!dp->msm_dp_display.is_edp)
 		drm_edid_connector_update(dp->msm_dp_display.connector, NULL);
@@ -497,10 +507,8 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
 			dp->msm_dp_display.connector_type,
 			dp->link->sink_count);
 
-	if (dp->plugged) {
-		pm_runtime_put(&pdev->dev);
-		dp->plugged = false;
-	}
+	dp->plugged = false;
+	pm_runtime_put(&pdev->dev);
 
 	return 0;
 }
@@ -641,13 +649,15 @@ static int msm_dp_display_prepare_link(struct msm_dp_display_private *dp)
 	if (msm_dp_display->is_edp)
 		msm_dp_hpd_plug_handle(dp);
 
+	guard(mutex)(&dp->plugged_lock);
+
 	rc = pm_runtime_resume_and_get(&msm_dp_display->pdev->dev);
 	if (rc) {
 		DRM_ERROR("failed to pm_runtime_resume\n");
 		return rc;
 	}
 
-	if (dp->link->sink_count == 0)
+	if (!dp->plugged || dp->link->sink_count == 0)
 		return -ENOTCONN;
 
 	if (!msm_dp_display->power_on) {
@@ -926,26 +936,22 @@ enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
 	DRM_DEBUG_DP("aux link status: %x\n", ret);
 	if (!priv->plugged && !ret) {
 		DRM_DEBUG_DP("aux not connected\n");
-		priv->plugged = false;
 		goto end;
 	}
 
 	ret = drm_dp_read_dpcd_caps(priv->aux, dpcd);
 	if (ret) {
 		DRM_DEBUG_DP("failed to read caps\n");
-		priv->plugged = false;
 		goto end;
 	}
 
 	ret = drm_dp_read_desc(priv->aux, &desc, drm_dp_is_branch(dpcd));
 	if (ret) {
 		DRM_DEBUG_DP("failed to read desc\n");
-		priv->plugged = false;
 		goto end;
 	}
 
 	status = connector_status_connected;
-	priv->plugged = true;
 
 	if (drm_dp_read_sink_count_cap(connector, dpcd, &desc)) {
 		int sink_count = drm_dp_read_sink_count(priv->aux);
@@ -958,18 +964,17 @@ enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
 
 end:
 	/*
-	 * If we detected the DPRX, leave the controller on so that it doesn't
-	 * lose the state.
+	 * Leave AUX and PHY enabled when the HPD plug handler already owns a
+	 * plugged sink; always release detect's own runtime PM reference.
 	 */
 	if (!priv->plugged) {
-		if (phy_deinit) {
-			msm_dp_aux_enable_xfers(priv->aux, false);
+		msm_dp_aux_enable_xfers(priv->aux, false);
+		if (phy_deinit)
 			msm_dp_display_host_phy_exit(priv);
-		}
-
-		pm_runtime_put_sync(&dp->pdev->dev);
 	}
 
+	pm_runtime_put(&dp->pdev->dev);
+
 	return status;
 }
 
@@ -1598,6 +1603,22 @@ void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge)
 	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
 }
 
+static bool msm_dp_display_is_dongle_plugged(struct msm_dp_display_private *dp,
+					     u32 hpd_link_status)
+{
+	u8 rev;
+
+	guard(mutex)(&dp->plugged_lock);
+
+	if (!dp->plugged || !dp->link->has_sink_count || dp->link->sink_count)
+		return false;
+
+	if (hpd_link_status != ISR_DISCONNECTED)
+		return true;
+
+	return !drm_dp_dpcd_read_byte(dp->aux, DP_DPCD_REV, &rev);
+}
+
 void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 			      struct drm_connector *connector,
 			      enum drm_connector_status status)
@@ -1626,7 +1647,7 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 		} else {
 			msm_dp_hpd_plug_handle(dp);
 		}
-	} else {
+	} else if (!msm_dp_display_is_dongle_plugged(dp, hpd_link_status)) {
 		msm_dp_hpd_unplug_handle(dp);
 	}
 
-- 
2.25.1

