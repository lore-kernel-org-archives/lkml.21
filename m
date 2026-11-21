Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795297295;
	b=NwDhaCrKQyCwGKzPD87o3IUrz+OH0Di128ECWmg1qtQ1WBfSHyJUYda2ct+MeECk0HuF
	 9qYqMk4CxRWPAT8t4DDjfF0mQltQVlsevPuAVDj87JegXzZBT9N421MZEZv/LpI4ZVyUV
	 aAxFl5UJa/uN7+tBJU+Z1oWqtSDj8ODiz578+Am3/PWBxGRjqFm3ISCRO6LGAlbXrI7zw
	 HVoEu5tFWV0Pg0Y1PZjx9LCIbU5kzNlqHN/SSlBC9qoPsqBAacf+vd6wdx09rqQIRDtel
	 9X/0nGPr38WQ4ZfIZbO8KeHDZBpA03DXtMP7/Y7nmzDEvPFMkJgb90XQY29Q//sPcHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795297295;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5I2aOpuySiZc3XsYEC1y1yTm/k9Phx8ruM/1Leeniig=;
	b=bIa3IN3tKqGkvQAL5wgiaRwAvjjS5l+CHGLfDcckw21c2kBO4dPus06uC0hMZBGtUb1+
	 vmljJyTa/h+KVzqSA9iIwHumn6jJQdvqYxzwvzUuticrJf0rUlWndB3kvS1rnVttfKF00
	 dtvevNB5Mnf/5yAQfOfq1dKBVdJNLlIgJgiqdx6gYRDheQeGpmxTfXkvJw1mN4auxxM+7
	 o/gttGmzablLvaPK8z65vqN7h8Dhm5plDeJW6f2CYSuhjhr0QUYnyzklcoMi1K7VoQdkF
	 kAwjJWFgr4tbqjyyut8yibfab0+JIGaZ7LuZ5dZmdbMvhF8VlIH07TJuXJmAhbS6+Aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H3hNGtNh;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DB5606A684
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 21:41:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07DB5606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H3hNGtNh
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so17462235e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 13:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795297292; x=1795902092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5I2aOpuySiZc3XsYEC1y1yTm/k9Phx8ruM/1Leeniig=;
        b=H3hNGtNhCqo5UV0LMegPiex9yYlJgra1sYUFExskdnuhc88GThB0OPpD+zCGvcvm5L
         S8SgghGEGDvnW5ZWK/fDMmnJCxaoA1LNr70WKCKXlvgVJFy1olWhoCuw6cWLM3naUlbD
         kEH7Kjra8JIA3c6lewfvKI7lOUrKH1tRsgjoysRYzR7bogJHz6JiUz97LD97bn0XnJ/U
         NXRu/wilCskBqS3yyrq9kdCFJtBDDTnEch6WAHENBGhuzTvcZjgPKIj0m0FJlTQGWV6t
         AosLQVUiZlcOo0B0TrPJuDanByX75hl9eTqxK/I1zLIAfka3ObMUcoXNpQ9kA5OG7s5H
         zTsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795297292; x=1795902092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5I2aOpuySiZc3XsYEC1y1yTm/k9Phx8ruM/1Leeniig=;
        b=HeadAWNNeIB3vC9l9dYouu2fLCFhpc21JuRT75zPee/vv8M8b80mxfTHxj7P1p+jgY
         hUbuEHoZ2PAzue7wvBc+cwLbgODsbvNJvrKOo3m2loJ0APr8+jHsHGhpiD74Kqo5+KZZ
         gK3clH/q98JsFidhitWkR/1OIWQAIiwWnwizUHJBIjocmRiVcvNClhrK6IDKvtoyigvN
         TjOxZ+K4TmjQnnxR+HqPD8EjNeeFMQBs98vBsjomVr8GaH6b22HGIZ/KUxHzPplldB7c
         cjHLS7u1cn1WkdUoqz1OUbibKa3Tyl+QG4lZacmFKlVNkBo9gPm+FMIKCxv54iIkqqCe
         /WJQ==
X-Forwarded-Encrypted: i=1; AL+hErHuXRF1327tUqRtb0LzAy/CwrZpAvUHxt9aSsAfqq03DwczJdISm0yVMKAEo0joli04s6O00Ev/qVflOr0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+eBl9WgNbYNsUCx1MC3UgwmYKrqHZTzguuND90bHPSZAyDb1cv
	XeVkFpKPTJnvwgcMomG0gNoGfCvo6fZo9Ps3ltlnT9iiHgydlWjkb2s=
X-Gm-Gg: AZFdTZcMvU3h7IK7lRYRXRFyCBGV2QlvenUU3T8guJMqf+OCwp3VaKpimC2dzsCMqAG
	SJuDIjkqtLlEG8/O+oZrQMswdpmGrsP6KJzV7ZoeUVOk6gsmbqCxKXRn09w7JUmug92Ir0rjHbt
	FJzcAallN6i/DqdWlls084vg9SQUUwhXTiAQv8tL3Zx/HtYzJlCihFUTbT0vJjRGYm3zCyGpI1Y
	Orvo0xbZhw/eywLMKDMQoMWIKFNB2ow0EY88uRfnNwZND2gDOjVlvHSsJuOJz9Hmum6zVnVqO2u
	3WLCeJkwbgSis26BmXN2qSA3rXcAebBLwoqlQpqhwoX3PrkQL+SQFM/7ECG9AtSEUCKLv8PNifW
	Yy7iQ2JhcbcfdcByveBKT0SkfphINJmM0Cz+doX2hEo8UgxRU+2KlXfZT1d8kO6S3kAhy6f7XUb
	bc2/kUSGssUnwuWckGFXwOLUcTbq1hqNaa12sjMj7SRsp/fjC6GV8LZ/X06pWeiA/kSfQXexD3W
	46lIfsPrNLnufc2bJytnd9YuHqs9MQhNDI99L49wfCb2z709OXfvdBySB+yJ1YOvVgmhFBkDvfw
	+kSoWcYGwEt9zfMzGcDysKJaKFFRi8IQz34ZlG2T6KHHY4X2GOoJJjZk75pS6g==
X-Received: by 2002:a05:600c:c4a2:b0:4a3:59c9:a744 with SMTP id 5b1f17b1804b1-4bb88807d87mr165597625e9.7.1795297292204;
        Sat, 21 Nov 2026 13:41:32 -0800 (PST)
Received: from h7015t.. ([193.207.113.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067a0e6sm54580645e9.4.2026.11.21.13.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:41:31 -0800 (PST)
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
Subject: [PATCH 7/7] drm/msm/dp: fix HPD plugged and sink_count state tracking across hotplug
Date: Sat, 21 Nov 2026 22:41:05 +0100
Message-Id: <20261121214105.32596-8-gianfranco.mariotti94@gmail.com>
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

Keep dp->plugged, dp->link->sink_count, AUX transfer enablement, and
runtime PM references consistent across DisplayPort hotplug cycles:

- In msm_dp_hpd_plug_handle(), return early if dp->plugged is already
  set so duplicate plug notifications do not leak runtime PM references,
  and unwind AUX/PHY/runtime-PM state instead of setting dp->plugged =
  true when msm_dp_display_process_hpd_high() fails.
- In msm_dp_display_process_hpd_high(), ensure dp->link->sink_count = 1
  when a valid EDID is read from a sink that reports sink_count == 0,
  preventing msm_dp_display_prepare_link() from failing with -ENOTCONN.
- In msm_dp_bridge_detect(), stop mutating priv->plugged (which is
  paired with the HPD plug/unplug runtime PM reference), and always
  disable AUX transfers on exit when !priv->plugged even if the PHY was
  already initialized.
- In msm_dp_hpd_unplug_handle(), reset dp->link->sink_count = 0 on
  disconnect, and in msm_dp_display_unprepare(), only enter dongle D3
  and re-initialize the PHY when dp->link->sink_count == 0 &&
  dp->plugged so a full cable unplug powers down the PHY instead of
  issuing AUX writes and leaving the PHY active.

Fixes: 3ea2d1c3d154 ("drm/msm/dp: turn link_ready into plugged")
Fixes: 1bda647ce61b ("drm/msm/dp: move link-level teardown from display_disable to display_unprepare")
Signed-off-by: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 31 +++++++++++++++++++----------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index eddeb972d6d6..80f05effd18a 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -307,6 +307,9 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	dp->msm_dp_display.psr_supported = dp->panel->psr_cap.version && psr_enabled;
 
 	dp->audio_supported = info->has_audio;
+	if (drm_edid && dp->link->sink_count == 0)
+		dp->link->sink_count = 1;
+
 	msm_dp_panel_handle_sink_request(dp->panel, drm_edid);
 
 	/*
@@ -417,6 +420,9 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
 
 	guard(mutex)(&dp->plugged_lock);
 
+	if (dp->plugged)
+		return 0;
+
 	ret = pm_runtime_resume_and_get(&pdev->dev);
 	if (ret) {
 		DRM_ERROR("failed to pm_runtime_resume\n");
@@ -428,6 +434,12 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
 	msm_dp_display_host_phy_init(dp);
 
 	ret = msm_dp_display_process_hpd_high(dp);
+	if (ret) {
+		msm_dp_aux_enable_xfers(dp->aux, false);
+		msm_dp_display_host_phy_exit(dp);
+		pm_runtime_put(&pdev->dev);
+		return ret;
+	}
 
 	drm_dbg_dp(dp->drm_dev, "After, type=%d sink_count=%d\n",
 			dp->msm_dp_display.connector_type,
@@ -435,8 +447,8 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
 
 	dp->plugged = true;
 
-	return ret;
-};
+	return 0;
+}
 
 static void msm_dp_display_handle_plugged_change(struct msm_dp *msm_dp_display,
 		bool plugged)
@@ -477,6 +489,8 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
 	if (dp->link->sink_count == 0)
 		msm_dp_display_host_phy_exit(dp);
 
+	dp->link->sink_count = 0;
+
 	/*
 	 * We don't need separate work for disconnect as
 	 * connect/attention interrupts are disabled
@@ -923,26 +937,22 @@ enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
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
@@ -959,10 +969,9 @@ enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
 	 * lose the state.
 	 */
 	if (!priv->plugged) {
-		if (phy_deinit) {
-			msm_dp_aux_enable_xfers(priv->aux, false);
+		msm_dp_aux_enable_xfers(priv->aux, false);
+		if (phy_deinit)
 			msm_dp_display_host_phy_exit(priv);
-		}
 
 		pm_runtime_put_sync(&dp->pdev->dev);
 	}
@@ -1524,12 +1533,12 @@ static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
 	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
 
 	/* dongle is still connected but sinks are disconnected */
-	if (dp->link->sink_count == 0)
+	if (dp->link->sink_count == 0 && dp->plugged)
 		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
 
 	msm_dp_ctrl_off_link(dp->ctrl, dp->panel);
 
-	if (dp->link->sink_count == 0)
+	if (dp->link->sink_count == 0 && dp->plugged)
 		/* re-init the PHY so that we can listen to Dongle disconnect */
 		msm_dp_ctrl_reinit_phy(dp->ctrl);
 	else
-- 
2.25.1

