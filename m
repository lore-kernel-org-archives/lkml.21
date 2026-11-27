Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774468;
	b=xB4XDTCHOGJjo1OCKIwaCTZS7zGSjGxtIHqk7qPYJ89flfb7QnSqdC2zLT87fjRHoCA8
	 DLuCEll7tymIrlMWhUaT2hVwletzfT6h+qQdwmI8YkoGnj+3XXQ4x0ANs3BKcluczB7m2
	 cXLgRb6J1G59Gn4aoVhYcHTT4v9raHUkPswgjT39y3QfqYAZqt3uYNEzZwB3xzJ/EgS70
	 GG2b3Ek4mb6wezRhYTEHns6cgsqmSYA2T576J0t6Gi2j0KFTSfSO1ty0I3B+8AJ++F6A3
	 D908D3Yb35BvjBawzwmmjAas0R+b4krM05BfRMlazjGz8KT5tY//yl2WI97hPjtbp2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774468;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tA+J6mGbIT9WLOmGI7WGSCcbG+FEuLz9DTzxi1U99nI=;
	b=QqbRMxcpNpUpD8rxWGup62t7z77xPVqlqNznM/mzFTcz6ZKN0SNmNkLYZrbo9OnsP9V1
	 Z5WHxk7sd+545/AmvP5iK1NVF4l0e8av0rhcyFsKYLy6o6TJnuvCbYdzd8W9OxS0IRtYh
	 bECb3BLjijJh/elTqSe9Dg4EdrEennDpmpcHr/mCjiN/QyCp7CbmjJMKo5XYz+XNJGrSI
	 YmJCNsJcTbGMIpNZfKuqKJiKhGbaO8HRzO+tLFH5J3lNyd+aMJFsZp98gQfVvs+L6wv1q
	 Tq9ZluNPLKD+ZvS5XCuTu3S0r5x9EQC80QaGIoPUDKoBqWsekia3r+nwnnvIHPoNY/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DROkTdgs;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922A36076C1B
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:14:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 922A36076C1B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DROkTdgs
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4a42b34e930so6928422f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795774467; x=1796379267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tA+J6mGbIT9WLOmGI7WGSCcbG+FEuLz9DTzxi1U99nI=;
        b=DROkTdgsIXxvIEfby6vSOcPU3NgZLmXOd3CwmJz0216FnmWA8Lf667aB7N/zKVKTpp
         vteBHX4RpS7u7y5UAxiOrY0tatlv+JpuWDO4R49gDD2M8T+Nm9RHqsVemylmyi+9Y8Iz
         DkkWLfUFPn9sE4wZ+mZ88ftD8dvDrgaQjVmBCt9nEbIKlLXpZAdNsmLxoXoPemWnRHP5
         l/NzPJYIzGSka/2bynBrfkXsv7+A52vARD2zwjKB2I+Lyo8wNqYgTUyEa3gdVV2OOysq
         dwgp5WNlWiaKvXIDuk59jAVswjN0zvYnsq4auphsPB2Q6dWWXlaPR395cww1oA5sMjvJ
         WKCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795774467; x=1796379267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tA+J6mGbIT9WLOmGI7WGSCcbG+FEuLz9DTzxi1U99nI=;
        b=wWuuCSy3CQQXAtTQERWJiWBzegkblTZ0XXyOKli/M/XGih8M63peZSD9FHQpV49HOJ
         dzK2yhGPNM8I0MbcguJWJL1+KfuxewAgD5O/B+unbflxNq7oOzvH9ppj5G2NdTem5hHd
         j44L5mmrG94lhn/S+mbtbFZ0RfW1yybil7/hW2T9y6lyfvwX4cYvr/v+NAbbDnbvTDzS
         kFG4RQfFmVKgnZLmhJZj9G9I52B1oeXAft7JFWhlFKB3qCd688fijAyBpIrW6msj9hX9
         PpL9UVFGFdR7p1ZFjNH4PDYfq5LiIybKf7bNHK1vOzPduXC7VzV3q9HrVBPpjC2Hayzx
         HuAQ==
X-Forwarded-Encrypted: i=1; AL+hErF91pdvNLJj79sU8YGEubQPPRZ+laOTz6cx99D/Qf278BlwzrSbDM38jgDN6sKVnssei5VER+CmHCHJXM8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9m0TIoEt+1k4xGnsSGKy5HL2PieHd0cEf7X8Jkt/9GhQ6k9v+h
	02vwIZkpzS8vsCdMexSEKY/56975mMx9O4/PrH1lLEr6t/0lqyLMGNM=
X-Gm-Gg: AZFdTZdFQRhCaVq0HPWCnPgiZD2uTpN/vwOjAolHtpUp01SE2ICN5kIAdLduwf8dVQH
	5Z7paN4+BcNFsLCdayDW7pd1aWhTJ5ArVy5hwqb7YRXrPlWaS6YebGoCBY73XDNPbhlByg4Vcvh
	g4hn0rPnNiQE9BydGv5Ro6BoK/M7N16I6opqDHkEF93VuBDgDzuXu3RcJBzbVK4yqDLJh9F/RJ5
	W0mzh3nVjk1srWO9WZJRqx5rIF4PDFjSuHvDx2GQ+oc2526tiuipY9wx4B+kRTyaaBFYnm7c99Z
	60XlSXItvRAq/xV9KM6L5Hh05lOfYbV1qtR4JzGCblJMYSZDmu6FzzKVwupqJzsDFMo3ebzennC
	hdYPgQctBEpVJyIrVT37X+goC6yi7DSt5t+puwmWD9tCYFIiMTcYOBYInQ561CaREuLURdNXapQ
	0x+ElvUi6a4elUxos9S9QuE0NyuyZOaixvjAGjUZLi7Fas5yFiKL50o+vydwQfDZzG+mDqW4Zge
	SFcb44CBJuPQZOMICG5+Xf+u1oABuokS3F7ySqH1tVYRTnYALSkpIEhehTmP3Fwsw2AeAKWI1NL
	KgsS8dIWI/+enVS0uJ8IhtPW9qclpXPqoOY+E/DRYn69DgQDcWGnJcUY16WSaO1Abrg0cMS7wHu
	sByRCM4fKu042FdGzE0QTplESmOKKLJe0if+Jv0GsD3/WzdJzqJnUVumTKHo=
X-Received: by 2002:a05:6000:4014:b0:4b7:ae36:5493 with SMTP id ffacd0b85a97d-4b7ae36567emr25594210f8f.12.1795774466728;
        Fri, 27 Nov 2026 02:14:26 -0800 (PST)
Received: from localhost.localdomain (host-94-89-17-99.business.telecomitalia.it. [94.89.17.99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fec7sm43651234f8f.26.2026.11.27.02.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:14:26 -0800 (PST)
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
Subject: [PATCH v2 03/10] drm/msm/dp: keep training pattern active until stream video is ready
Date: Fri, 27 Nov 2026 11:14:10 +0100
Message-Id: <20261127101417.24303-4-gianfranco.mariotti94@gmail.com>
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
Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz> # x1p42100-lenovo-ideacentre-mini
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

