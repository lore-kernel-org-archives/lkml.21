Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774479;
	b=JZQd1B3bLmlBtS1Nu21PtyR8wN2JDEJqYuxO1C5jqWWOTtbRzzdPs3Yfflbi1vZbq5mr
	 mYbVqWaeCrSi4PBw1a5UOX2LRmEtgOxKQWyEOP+iSTWhbPOzkAPLPIbAe6X5QcFvOX3xw
	 nzMuP/E80v3zn+6R/6Pjn9+ey6SldXL8BQ1FbougdbsZ1Xdb6NiLPIm7SUEKjoSAhY7Xd
	 MB0z/yAs2CSPEgIJCuXSSr1DTmqZVPD9hfG4CDsOME4WqRlfh9Zzbs9gfpoPLGXTL77F7
	 7h1gPawQOuypj2d9svi0J0sZa1i144NFQTRaNmRjelT/7R5fhKGIDI0Ix1S2ycKTlFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774479;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AanAh9kUpFsvj61PDy3xC4hTGFLWOOg8Pq3sgXBBnsg=;
	b=Lz1BxzXc4rWe4QygJZiHRgnLtFyMox5jkAFTzyyEaNIaBxliEZeQaeczdm/++09OBRJX
	 rCJPrnLeGx3vJxWFEfqYhrk+lLoTkhVIRq4kbiK+sYOpeijlxJH8b+LQ867eFUl40G4YH
	 o6HWsBWgY6jV/ddoLON27G9p1gqjBRBdQXNMv6DkjPdxL2MWUm2JKKEx055MKX3yoekxv
	 N+1FjTICDPiEET5sI3WKHde4l7VvFuEYZ8sKMcJjjPEmC0i9VfPquZQ9r7PZPgXwIJw2J
	 qaRPe3RoQpRUghsjwY86mh8mFVt75WN1VUGEAqcm8nGRClCvXCtDa/fHbXxIo87ZXhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SIPyCis5;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204A660A6F4F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:14:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 204A660A6F4F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SIPyCis5
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c50d3ac6b51so1548088766b.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795774476; x=1796379276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AanAh9kUpFsvj61PDy3xC4hTGFLWOOg8Pq3sgXBBnsg=;
        b=SIPyCis5qdcv136S60ThDuZ+SWP+iha/rfTvlyoiQIzQAt+itWw3s11+fVtXS2rLNv
         lo/Au+SVtO72ns0bxn2+NMta2QkZCB7Y5MX40bNnAXXOTjd2PmbG0IGWn0VDUVubEyDQ
         t9z3oyHe5ulouUlNScVGbYrLoUinj4eNN+pB7CFUKpNsUEBZYdEtTC29Ty/KQHodluSf
         N5+3v3R8pwsVes/af5oE/SJgKV0nA8+r+11emt5wDZXA4piFCkbWS7L34m3vFMf8OCtg
         oxgzWb1yGst9PVPGZFUSUh9+iI3+UWo3113K+d1wVtXfDHMEJPgyWrupiwmbQ3tQTe1+
         puTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795774476; x=1796379276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AanAh9kUpFsvj61PDy3xC4hTGFLWOOg8Pq3sgXBBnsg=;
        b=kImb6EnyGc9mKObgh/QYDro5603R2bRHRZ3riJirFdNc72Xotte1RU3FgGeRHVqGUc
         B8Va0eqSbZiWS5hPKIK+L+DQDMS+3IedqJhwbSd4qgDKJHlTGBeDQSkA9TW8KB3kMj71
         Zu8n2HESm3IFPgdaqRDyCNE9RWM4HgSGUpcWG6whwXedjUWHcA/8Zl1650xCxnH2LxnN
         j15YEnBmy9D05fxCvDdthLunOhVOiFG0eBOOsYKWyr6LlQcHxHMpv+W/0JkFDxe78771
         yVpMpC8HjgHyUQmxi12AhLULLwr9rpA72qi9AjMN4rLSZRAaK5nm5gbnt0F8mB4XMSYB
         SaNg==
X-Forwarded-Encrypted: i=1; AL+hErFHI08L+5YlWLy44hsxOHCdo25lboO6K8jEGcv4pRZgwkERUNsJ32tZohbSbREnJoh5niG+jTBIIxcGf7o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Gmtcr1WdSYBJZCgZynWiBBeig2ltpl01oMOK1sBJimVqsz92r
	mFHwjZCVrFXFIKkMpnxh73sJBd/B7XO+pF8nHIfu4/8zZrVErSC7qcIxO5eZ2UJexA==
X-Gm-Gg: AZFdTZdHjNAwUjXObwYRYtddOAxR+gPrK8bokh7Rtk/1Tru+x0vhTMfnp9KMHO8MbtD
	sHIMayHg2SGUyO9D/KS906XyvUILV+RyJ1xPk0d0uc9azQvpw3K8sPEgyFWewV24pDYPslmo64P
	MVa1KHzrwfRl7lwr9LCYr3LE3cJJtPf852AY9j/2u6kxZX/E85CPF7UospyXW8FS7XhJaOExGpm
	HgdY1bCRjVgd7Gb8uxeLg6krINaZ5/67bR1u8R4Sirnl5+WOF15Odh8K6IGc9tnOu2XSIPupv21
	pRKLVh5q3MKEgla6IP86om4a8D5R2ULHEF/mi4d5uuZN6/7DxhNB+qx+MsxyzhM1Xo2cTI3dvpk
	CCyPncl32Ms18LOTLahl/+O4Ep2vR/Hw8bxCtU1dA28ohRguQRkV1VpJIyqB4ImwoZDuy5hHbNG
	yDC/UElZGKWN+8esEhG29nCHW6ZrYxoDOy2OTkKYQ40qPdlcXLp9Kt87SLXH/mELY9fWDhQ2hai
	ga9wajsGUqsPU0kyQP45FAOtx5S0+UhKdz7N5GL0revXbGFpN5Q4puo8sXtz9Wqxi0Z2S3Vmi73
	Er5chB1txlr/WXoZqGhAdVnZ8P0EP1MRiInmdLmT8PwlWO6mfggNQGZ3au6g6rELdmTLO3XLZFv
	npiO6bLMsehnqRZI6OnnmICCdNBQZlIrslbb+eIlE7yt7JlzsccSpztpUJYM=
X-Received: by 2002:a17:907:3f18:b0:c46:9711:e30e with SMTP id a640c23a62f3a-c5131a1601amr2025588766b.29.1795774476374;
        Fri, 27 Nov 2026 02:14:36 -0800 (PST)
Received: from localhost.localdomain (host-94-89-17-99.business.telecomitalia.it. [94.89.17.99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fec7sm43651234f8f.26.2026.11.27.02.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:14:36 -0800 (PST)
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
Subject: [PATCH v2 10/10] drm/msm/dp: dispatch native IRQ_HPD directly to msm_dp_irq_hpd_handle()
Date: Fri, 27 Nov 2026 11:14:17 +0100
Message-Id: <20261127101417.24303-11-gianfranco.mariotti94@gmail.com>
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

msm_dp_display_irq_thread() forwards DP_DP_IRQ_HPD_INT_MASK via
drm_bridge_hpd_notify(..., connector_status_connected), relying on
msm_dp_bridge_hpd_notify() to observe ISR_IRQ_HPD_PULSE_COUNT in
REG_DP_DP_HPD_INT_STATUS[STATE_STATUS].

Because an IRQ_HPD short pulse lasts 0.5-1.0 ms, STATE_STATUS has
already returned to DP_DP_HPD_STATE_STATUS_CONNECTED by the time the
threaded IRQ handler runs, misrouting the short pulse to
msm_dp_hpd_plug_handle() instead of msm_dp_irq_hpd_handle().

Dispatch DP_DP_IRQ_HPD_INT_MASK directly to msm_dp_irq_hpd_handle():
- Guard msm_dp_irq_hpd_handle() with dp->plugged and skip sink requests
  in msm_dp_ctrl_handle_sink_request() while mainlink clocks are off.
- On DS_PORT_STATUS_CHANGED from a branch device, update or clear
  downstream sink state and invoke drm_bridge_hpd_notify() after
  releasing dp->plugged_lock when called from the IRQ thread (skipping
  re-entrant notification when called from msm_dp_bridge_hpd_notify()).

Fixes: 5043357e75ba ("drm/msm/dp: rework HPD handling")
Signed-off-by: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  5 ++
 drivers/gpu/drm/msm/dp/dp_display.c | 86 +++++++++++++++++++++--------
 2 files changed, 68 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 1b2ab7db28cb..2b5e085afbcb 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2329,6 +2329,11 @@ void msm_dp_ctrl_handle_sink_request(struct msm_dp_ctrl *msm_dp_ctrl,
 	}
 
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
+	if (!ctrl->link_clks_on) {
+		drm_dbg_dp(ctrl->drm_dev, "link clocks off, skipping sink request\n");
+		return;
+	}
+
 	sink_request = ctrl->link->sink_request;
 
 	if (sink_request & DP_TEST_LINK_PHY_TEST_PATTERN) {
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index fd9d5f176329..fef758ca9062 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -513,32 +513,74 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
 	return 0;
 }
 
-static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp)
+static int msm_dp_display_handle_ds_port_status(struct msm_dp_display_private *dp,
+						enum drm_connector_status *hpd_status,
+						bool *notify_hpd)
 {
+	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
+	int rc;
+
+	if (dp->link->sink_count) {
+		rc = msm_dp_display_process_hpd_high(dp);
+		if (!rc) {
+			*hpd_status = connector_status_connected;
+			*notify_hpd = true;
+		}
+		return rc;
+	}
+
+	dp->panel->video_test = false;
+	if (!msm_dp_display->is_edp) {
+		drm_edid_connector_update(msm_dp_display->connector, NULL);
+		drm_dp_set_subconnector_property(msm_dp_display->connector,
+						 connector_status_disconnected,
+						 dp->panel->dpcd,
+						 dp->panel->downstream_ports);
+	}
+	msm_dp_display_handle_plugged_change(msm_dp_display, false);
+	*hpd_status = connector_status_disconnected;
+	*notify_hpd = true;
+
+	return 0;
+}
+
+static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp, bool notify)
+{
+	enum drm_connector_status hpd_status = connector_status_disconnected;
+	bool notify_hpd = false;
 	u32 sink_request;
 	int rc = 0;
 
-	guard(mutex)(&dp->plugged_lock);
-
-	/* irq_hpd can happen at either connected or disconnected state */
-	drm_dbg_dp(dp->drm_dev, "Before, type=%d, sink_count=%d\n",
-			dp->msm_dp_display.connector_type,
-			dp->link->sink_count);
+	scoped_guard(mutex, &dp->plugged_lock) {
+		if (!dp->plugged)
+			return 0;
+
+		/* irq_hpd can happen at either connected or disconnected state */
+		drm_dbg_dp(dp->drm_dev, "Before, type=%d, sink_count=%d\n",
+			   dp->msm_dp_display.connector_type,
+			   dp->link->sink_count);
+
+		/* check for any test request issued by sink */
+		rc = msm_dp_link_process_request(dp->link);
+		if (!rc) {
+			sink_request = dp->link->sink_request;
+			drm_dbg_dp(dp->drm_dev, "sink_request=%d\n",
+				   sink_request);
+			if (sink_request & DS_PORT_STATUS_CHANGED)
+				rc = msm_dp_display_handle_ds_port_status(dp,
+									  &hpd_status,
+									  &notify_hpd);
+			else
+				rc = msm_dp_display_handle_irq_hpd(dp);
+		}
 
-	/* check for any test request issued by sink */
-	rc = msm_dp_link_process_request(dp->link);
-	if (!rc) {
-		sink_request = dp->link->sink_request;
-		drm_dbg_dp(dp->drm_dev, "sink_request=%d\n", sink_request);
-		if (sink_request & DS_PORT_STATUS_CHANGED)
-			rc = msm_dp_display_process_hpd_high(dp);
-		else
-			rc = msm_dp_display_handle_irq_hpd(dp);
+		drm_dbg_dp(dp->drm_dev, "After, type=%d, sink_count=%d\n",
+			   dp->msm_dp_display.connector_type,
+			   dp->link->sink_count);
 	}
 
-	drm_dbg_dp(dp->drm_dev, "After, type=%d, sink_count=%d\n",
-			dp->msm_dp_display.connector_type,
-			dp->link->sink_count);
+	if (notify && notify_hpd)
+		drm_bridge_hpd_notify(dp->msm_dp_display.bridge, hpd_status);
 
 	return rc;
 }
@@ -1037,10 +1079,8 @@ static irqreturn_t msm_dp_display_irq_thread(int irq, void *dev_id)
 		drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
 				      connector_status_connected);
 
-	/* Send HPD as connected and distinguish it in the notifier */
 	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK)
-		drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
-				      connector_status_connected);
+		msm_dp_irq_hpd_handle(dp, true);
 
 	ret = IRQ_HANDLED;
 
@@ -1661,7 +1701,7 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 			msm_dp_hpd_unplug_handle(dp);
 			msm_dp_hpd_plug_handle(dp);
 		} else if (hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT) {
-			msm_dp_irq_hpd_handle(dp);
+			msm_dp_irq_hpd_handle(dp, false);
 		} else {
 			msm_dp_hpd_plug_handle(dp);
 		}
-- 
2.25.1

