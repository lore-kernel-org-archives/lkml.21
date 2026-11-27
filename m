Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774475;
	b=POtiX5ClRiBr1ifWF3PkWiAzaPJBCFIk47N9RAA8cujCXSHNNXvFtoNxu2D52eyqgQ8v
	 pQXX7mQeyr/Fc7FvPCy23AAm66XO96lKT22cP0jFgbl01EZTShVtwxpKH0MDzXQusLR+b
	 HXKPuMK9GnQJPHBZy8yDey0MibEek7VNasAYslKOP48rb6i4qttgzwxnHTzWmA8Eprl6K
	 6m1PhTjHpA46crRPbYNn/AxYp5Ky3GVeYHFtf3vW00vJYoEhVGqk8uJ2hDG2HlJsZa3zV
	 kFneBXzjuiyMLIUVSJxBdTfHXKyPyJK79gfwcaokip7gU8sVVN3pCu3rCL6nQnpvJlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774475;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZfuPsc7xLuv7FveL7LRtKmIlOFCOOjMPi+YwZzyG6OM=;
	b=jFkLYesaLTdpXYEIMfPq4N7GhGRDdmdUhJ3Dq3WvCGse42IqDxvGpbTJYBPUpNTQQtIa
	 6CapMaM3vuPFg7e5zpOnNNNCIFgvSMStBy3F1j+9JCmIbA9hT1mWOUoRmoGA25iWVeq/W
	 1mVCZ5cQs5CbHs4a5FVwCPvZd+ff40TAXO5Y/oNAb3fNoMAmUNeCxzLiKPw6EBl+v1rYX
	 cABVCfzjUU9mvZNmfu1tlUl8qu2PCukUiOe2PrZ9cEELkk3m2POz8WzAaYBhMDIgXI+jH
	 7CVntgXIoppvZ6YSPpeDUAP4KjksZpg319WR64TFHH9h2UFdhMXY3A0UY7HvWbdTHUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X+iKsD6g;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEA960A5BE3
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:14:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DEA960A5BE3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X+iKsD6g
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-49a92144733so3962190f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795774474; x=1796379274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZfuPsc7xLuv7FveL7LRtKmIlOFCOOjMPi+YwZzyG6OM=;
        b=X+iKsD6gkrlerHvrXktIyubXchqylq33XM16vx9ulS+Sm50x8mKPK1SMioelnl24Ha
         6+2gyJrlu/jYKuDDQ5Hq9WQWocSm8seUt3Lad7/65czR9xLndmULyOThxeMQkuv2OwN/
         svN1r01hTKW06Ult382XUal/Rv2h0Ol6MFGYP9mGjI9wqQyAvNmqHwKD53shRH6mIF1k
         yw2B3faf47+nZjQBo2d60FoO0OyoL1KmTsMHCWzFCPFWwZWGn4oyferIJ/sOkcScYNM6
         +WVGutkgaCejViF7vwcGl2qF4eqngx603yuiuqj8iDbfCQVCBg/ukz1y+4t2Dmj66uyn
         ZW5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795774474; x=1796379274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZfuPsc7xLuv7FveL7LRtKmIlOFCOOjMPi+YwZzyG6OM=;
        b=qJIk1pqipgrwsb8iTRhn60sLklaBUxTZ+pLY0AsoB2DhU3CGb+8PI+h6kMpUILi9Vu
         nGmk4cGo0Rwe8jnblKh8e7nlxtysMchgh1tzDSMIoaCM4Xltehuq1dydXyXNHTzkGg/y
         gSYMhCuvLeN8nciJ0zCZgHtDYZUJp1OCoYefwo0Zf94tPjY1x5ICAAW23kxjbBKUaj8B
         +DWl5dFizE5VkkrkYQfkSWIwLvz4PXApgG+7SY6gmP1ua4adWeZFxqDEsO/33DyqhAnl
         BqJcsQF5vUuKw62axkyJFzdsCUcOsjCtrDfewZK+LlHX/p5oMyABZaPtZ+1M2+jBgQKa
         QuIw==
X-Forwarded-Encrypted: i=1; AL+hErEZyGBbUn6CJYNP3fFzdyvWdQV/4ozxVqhBrXHjLoGyy2eN7AZPn+O22aWqhY9LDqZ3PaKZF+fRBKkdmgQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dWQiGF+igIzM0azDRXIOecVKSmr3KWwRfokuuE9xqsgZZRh+R
	C1JObonlay5BKceqsgJi3VxJEVRQkIrg1NU5jQ0JAh1opXr6bDm5Dkg=
X-Gm-Gg: AZFdTZfWuncMmeDzdKQ2tVBADTTODKEBE1myBfSFB6XDwhszR8nakG4CPo0bhIhBY3L
	N4lQk/2P+J5wlZe1Jllw4SKzU2okuxpx2OHeef8qZ9sQdph0Y5OfLhFmQERAQcd2dThNVftT3/z
	jZOLsQe9iLqJC0h/Z09S42qeFyO29tkRPOroev6UlManWwyLuSWsZWxcJNCSzDVTJO6POqJtBt7
	0+6Qr9P125DtPaE6SDKnurorJ0AZqCVr4FGJivnEgr5G/BSCC4MITPZ+m7Yn1AigYnSUrTWuuOX
	aRog/gEg9tYvGqkRhIKcG+gKV3Qtucbr73DkrjfuxzcA14cZRRHFeGRvON5Z9geVi0MdSHMCyU9
	uj6YvOIUj3z9imjDyv2M31x0bNBrf5jueAYNip1Pvb12uZIPqEGyNHuaZpkF/v1wOOKNE7JJX9b
	YgmZYDnS9AaBs6HuW4XZMkMIObYE+xJOrBPK7EQORN8KVSlz63IDB5feAZJCp5+PWKvfxVSWcZo
	mZ4kfmjStBm/DUyigrbnDEqqXCa/t7nvGZOqfNUv2J7wO+4EIwgt18YmZ90Vh6v4eKpqMRHuRLi
	LknS3HbPPSZEZIe5Fm/52+pPScqXg0DbQYYxmk11P3Fk3taZ9EnZiiYQeRV3V3XfhQYX0jBrILw
	g9zbGiO3jnyKr+u3UTUl2EuPY9ip4HQ3YTKO5iPNfCy/70pxxI13t9YFaQdQ=
X-Received: by 2002:a05:6000:1789:b0:491:971a:c568 with SMTP id ffacd0b85a97d-4abb3861356mr43995162f8f.10.1795774473594;
        Fri, 27 Nov 2026 02:14:33 -0800 (PST)
Received: from localhost.localdomain (host-94-89-17-99.business.telecomitalia.it. [94.89.17.99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fec7sm43651234f8f.26.2026.11.27.02.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:14:33 -0800 (PST)
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
Subject: [PATCH v2 08/10] drm/msm/dp: keep PHY initialized while plugged across link unprepare
Date: Fri, 27 Nov 2026 11:14:15 +0100
Message-Id: <20261127101417.24303-9-gianfranco.mariotti94@gmail.com>
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

When a DisplayPort output is disabled while a sink remains physically
plugged in (e.g. DPMS off or connector force-off),
msm_dp_display_unprepare() calls msm_dp_display_host_phy_exit() whenever
sink_count != 0, leaving the PHY uninitialized while dp->plugged and AUX
transfers remain enabled. Subsequent AUX transactions (from IRQ_HPD or
connector re-detection) then stall and time out with -ETIMEDOUT. For the
sink_count == 0 case, msm_dp_ctrl_reinit_phy() bypassed
msm_dp_ctrl_phy_reset(), triggering spurious DP_INTR_PLL_UNLOCKED AUX
interrupts.

Serialize msm_dp_display_unprepare() under dp->plugged_lock, replace the
sink_count split and now-unused msm_dp_ctrl_reinit_phy() with
msm_dp_display_host_phy_exit() followed by
msm_dp_display_host_phy_init() whenever dp->plugged is true, exit the
PHY in msm_dp_hpd_unplug_handle() whenever !power_on, and balance PHY
exit/init across system sleep in msm_dp_pm_runtime_suspend()/resume().

Fixes: 3ea2d1c3d154 ("drm/msm/dp: turn link_ready into plugged")
Fixes: 1bda647ce61b ("drm/msm/dp: move link-level teardown from display_disable to display_unprepare")
Signed-off-by: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 13 ------------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  1 -
 drivers/gpu/drm/msm/dp/dp_display.c | 33 ++++++++++++++++-------------
 3 files changed, 18 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 7201b7b513a3..1b2ab7db28cb 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2679,19 +2679,6 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 	return ret;
 }
 
-void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl)
-{
-	struct msm_dp_ctrl_private *ctrl;
-	struct phy *phy;
-
-	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
-	phy = ctrl->phy;
-
-	/* aux channel down, reinit phy */
-	phy_exit(phy);
-	phy_init(phy);
-}
-
 void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl,
 			  struct msm_dp_panel *panel)
 {
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 80d9258501b4..ea3a42e9b624 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -56,7 +56,6 @@ void msm_dp_ctrl_core_clk_disable(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_enable_irq(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_disable_irq(struct msm_dp_ctrl *msm_dp_ctrl);
 
-void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl);
 bool msm_dp_ctrl_stream_clks_on(struct msm_dp_ctrl *dp_ctrl,
 				enum msm_dp_stream_id stream_id);
 #endif /* _DP_CTRL_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index a48f42a17365..d3f4b5a9e723 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -483,8 +483,7 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
 	if (!dp->msm_dp_display.is_edp)
 		drm_edid_connector_update(dp->msm_dp_display.connector, NULL);
 
-	/* triggered by irq_hdp with sink_count = 0 */
-	if (dp->link->sink_count == 0)
+	if (!dp->msm_dp_display.power_on)
 		msm_dp_display_host_phy_exit(dp);
 
 	dp->link->has_sink_count = false;
@@ -1330,10 +1329,9 @@ static int msm_dp_pm_runtime_suspend(struct device *dev)
 
 	disable_irq(dp->irq);
 
-	if (dp->msm_dp_display.is_edp) {
-		msm_dp_display_host_phy_exit(dp);
+	msm_dp_display_host_phy_exit(dp);
+	if (dp->msm_dp_display.is_edp)
 		msm_dp_aux_hpd_disable(dp->aux);
-	}
 	msm_dp_display_host_deinit(dp);
 
 	return 0;
@@ -1349,12 +1347,15 @@ static int msm_dp_pm_runtime_resume(struct device *dev)
 	 *
 	 * for DP, only host controller is enabled here.
 	 * HPD block is enabled at msm_dp_bridge_hpd_enable()
-	 * PHY will be enabled at plugin handler later
+	 * PHY will be enabled at plugin handler later, or restored here
+	 * across system suspend if a sink is already plugged in
 	 */
 	msm_dp_display_host_init(dp);
 	if (dp->msm_dp_display.is_edp) {
 		msm_dp_aux_hpd_enable(dp->aux);
 		msm_dp_display_host_phy_init(dp);
+	} else if (dp->plugged) {
+		msm_dp_display_host_phy_init(dp);
 	}
 
 	enable_irq(dp->irq);
@@ -1533,19 +1534,21 @@ static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
 {
 	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
 
-	/* dongle is still connected but sinks are disconnected */
-	if (dp->link->sink_count == 0)
-		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
+	scoped_guard(mutex, &dp->plugged_lock) {
+		/* dongle is still connected but sinks are disconnected */
+		if (dp->link->sink_count == 0 && dp->plugged)
+			msm_dp_link_psm_config(dp->link, &dp->panel->link_info,
+					       true);
 
-	msm_dp_ctrl_off_link(dp->ctrl, dp->panel);
+		msm_dp_ctrl_off_link(dp->ctrl, dp->panel);
 
-	if (dp->link->sink_count == 0)
-		/* re-init the PHY so that we can listen to Dongle disconnect */
-		msm_dp_ctrl_reinit_phy(dp->ctrl);
-	else
+		/* Keep PHY initialized for AUX and IRQ_HPD while a sink remains plugged */
 		msm_dp_display_host_phy_exit(dp);
+		if (dp->plugged)
+			msm_dp_display_host_phy_init(dp);
 
-	msm_dp_display->power_on = false;
+		msm_dp_display->power_on = false;
+	}
 
 	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
 
-- 
2.25.1

