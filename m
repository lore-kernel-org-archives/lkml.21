Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774477;
	b=OH8rN5TemxZoL1L3KgkubcG/91Ef/3ESArLy4vSdQihPu5N0POI+W8dMa+YAu9OxiatD
	 moKXwkFHakiurm3uImtnFLhBEhTaomGh1yxSkIH8KKElSSiUZHkhgyKGJJbM6cXRYjWBi
	 RukWw0LYR9eSbxG2J9Sn05iucqKqMZ63BZhFxrmDrYw2kj3Fyej1al+0Z1Gn0zlPkKZG/
	 OJQ6zMp0KXJnsi1HJCSCgupFoKOqGbYEZVjRzvtn1/gKNbPXjwhp/BimqssvporI2bgVW
	 4KtNHkiUiZM1yShfT0lD1OsrGdReuWVcIMGwBTiZahgs289/lIVVf05YpQ+Y2BlHDSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774477;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=t/dAbzSvsstuhujmLiw7vlm0P1E43aM9T0PU2JqXZ2A=;
	b=Td2Czce3dBLf5xz7vRaZ+ZhLZ8kkRq7cx04SP5/RUfq06zlORCKqcWyJQYhdvAysAhYb
	 zIq+Cjhy1AogmdsjCgAH10llHWfyVE1/GvQeDL3FTVxch+PegwW8/kPgrZmsltNg+okme
	 61y2tFpLJKFD+zy4EczZWEQbJxGiyphtyCcByEyj5LoV1NiNAfnlsmFBVsZ5NszyBNsNC
	 /c3alofxyYWWInI+QsBSnLTGCwqZVCBcTfi1vvtXylVmn2s/VqYXIxV3YtG5WDYUSMRW8
	 SKx7XLyxK7pGdkkDuK/iguNAPIrLxfaQhxZiizHNIhiKItz7QxfpOWq3GxTGkXTUFhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Va3cve+c;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7BC606A69E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:14:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C7BC606A69E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Va3cve+c
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-49a92144733so3962204f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795774475; x=1796379275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t/dAbzSvsstuhujmLiw7vlm0P1E43aM9T0PU2JqXZ2A=;
        b=Va3cve+cF1AIfg3mCnD+fkbzmAm9PV2NRBVfKCjTMolZD+YHkE+VfDVXna/4BJBcyS
         Byd7drVEw+YJIp8Fg2DNygPdBOFByl/nh+OwqMKpwH5ZLYINMoFbQixVd03boz42vlis
         Zf3o2LwXFKaiadrhhWUJoacWLenY/7LjGlBW2fCxgYH+2K/YGdFSdacerv9tRM5QUPzy
         IuhnC9dUK6M+BYCxDdY/0qj4uIdjzH+5CZb0qHPt+Xt+rLSkmrjRacFOFZ2+lhVuvYLn
         lL+rslGAcvRb4mbTkodr13asmFIrtSZK71osjHd3JmGgzpOx0vYazm/GZbyOjoeAgGAd
         RouA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795774475; x=1796379275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t/dAbzSvsstuhujmLiw7vlm0P1E43aM9T0PU2JqXZ2A=;
        b=sXSPUbVwe6tjrns5z7mZ3ocKWsaSzRv8+N4OcLULl0GhNJpKoWJBHMV4wvCZA+Y7B4
         iCAQWQu+Ouj8sSVVD3qigXoy4rpWD6AX6wREKJwDpr9b2UgrjM5TXWXvNag191UAuYJD
         WeVgF7Zj0OUf8+B1hLPPqkr/xTAXjZRDmRtzlYJu0dPcnU+wXHdUkJG6ilbB2Uxnsh60
         yRgWjj3AOUcfGELrj8ax30li/35YV/bGMc5e0bBf7Hy9LmRvlhQRy1YFZ5q52gQ25dYm
         Fxiz3fGQZ/JK5Gy6ZYway2pkb+x01X0LM+Ru+xbnZoeNn3UK42FlKQnz0vIwSMkKiVnF
         2VXQ==
X-Forwarded-Encrypted: i=1; AL+hErGFTesFSWKvcDajQU2Si79n9ONsaeCBDZFDSX3f6wvXA+a8cmL3oCmchAnxEMOnJV72prPWZbsBFzE0jaI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/q1WKe/EpCE8J7kxR+EBtmVp2j++LoUCxIzbGkodFUlWcaPKHa
	C8ESEWawCepPdHnHLuyBWLoLBfr2dfS4WMk6Uf/CQ0KG+MvmsdvJeCE=
X-Gm-Gg: AZFdTZf9ed4FVJ9eE0wPf6+SSD80JK58NOF4e+rAAyJZCQ+w0AnAZbhindmoFgFKU33
	UHKpeNOk3Z4HWLaG9aO5l5mMtCE1NZANQP4ZiSPIAucC0E12Bq423G64iif1iR8nqxB5jLSRtsP
	SaZ/KFpYXeDrjYiUxoZ0DDSYb89zKrLogi0aoIawoBpDXLOn954pLSHdtUwmLLmZOK5gec97m/t
	W9Bvh2j0KECvkcmWb5+LI2hIeUR2qIqzA2ZXfv/Swn2uKZm1kwWHqR4Mh+7R9WkJku8Gnw0raXQ
	3oqHoA6f0tjRKwQ6uU/b0bJiNOGZqT1iCrcPYgXhWlTMgm08+XOGQHqTxSBuEq7fZzb1v467UdP
	8kSiMPVaB7bwPfIGBz8mEwsnUFCyfF0jhh8UWljZu0jWW3SMLj+SeiWITnhtDcKsSZ7HnXF+sv7
	n97C5p1kDwiXm4SKmzMX/eU/9IA0CqrTHC3VfDY//xrriBEYUMN/5SPx15Eanx1C2TDJzqd73t5
	3LpwrINwiSOEPLih8gP7grmoK9FUKeT1L4iOto8t94x25NIJbkqjBOxaSB/yJHiKcIZYBQNnAup
	zdNw8kCCsuF27blD/BlepMDQyAQ3YapPaXctYPGpOQWZE+hqdHLIeJmNEk3m33M1b6Zlf7fNLm6
	KvK1cUyXKNY8Ix34G2QtIwL/Hz48LruOMZ0gYKQrIBP7HugcvY8wJTAIPmpk=
X-Received: by 2002:a05:6000:4809:b0:4aa:842f:5f78 with SMTP id ffacd0b85a97d-4abb759e947mr44997485f8f.46.1795774475027;
        Fri, 27 Nov 2026 02:14:35 -0800 (PST)
Received: from localhost.localdomain (host-94-89-17-99.business.telecomitalia.it. [94.89.17.99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fec7sm43651234f8f.26.2026.11.27.02.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:14:34 -0800 (PST)
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
Subject: [PATCH v2 09/10] drm/msm/dp: re-read EDID on demand in get_modes when blob is missing
Date: Fri, 27 Nov 2026 11:14:16 +0100
Message-Id: <20261127101417.24303-10-gianfranco.mariotti94@gmail.com>
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

When a DisplayPort connector is forced off (DRM_FORCE_OFF),
drm_helper_probe_single_connector_modes() clears
connector->edid_blob_ptr, and drm_edid_read_ddc() returns NULL if HPD
plug runs while the connector is forced off.

Since commit db6f98b9515f ("drm/msm/dp: remove cached drm_edid from
panel"), msm_dp_display_get_modes() only calls
drm_edid_connector_add_modes() on the existing edid_blob_ptr, so
re-enabling detection without physically replugging the cable falls back
to 640x480.

Re-read EDID via drm_edid_read_ddc() in msm_dp_display_get_modes() when
a sink is plugged in with a NULL edid_blob_ptr, and suppress the false
"panel edid read failed" error log when connector->force is
DRM_FORCE_OFF.

Fixes: db6f98b9515f ("drm/msm/dp: remove cached drm_edid from panel")
Signed-off-by: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d3f4b5a9e723..fd9d5f176329 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -290,7 +290,8 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	drm_edid_connector_update(connector, drm_edid);
 
 	if (!drm_edid) {
-		DRM_ERROR("panel edid read failed\n");
+		if (connector->force != DRM_FORCE_OFF)
+			DRM_ERROR("panel edid read failed\n");
 		/* check edid read fail is due to unplug */
 		if (!msm_dp_aux_is_link_connected(dp->aux))
 			return -ETIMEDOUT;
@@ -810,6 +811,7 @@ enum drm_mode_status msm_dp_display_mode_valid(struct msm_dp *dp,
 int msm_dp_display_get_modes(struct msm_dp *dp)
 {
 	struct msm_dp_display_private *msm_dp_display;
+	struct drm_connector *connector;
 
 	if (!dp) {
 		DRM_ERROR("invalid params\n");
@@ -817,8 +819,21 @@ int msm_dp_display_get_modes(struct msm_dp *dp)
 	}
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
+	connector = msm_dp_display->panel->connector;
 
-	return drm_edid_connector_add_modes(msm_dp_display->panel->connector);
+	guard(mutex)(&msm_dp_display->plugged_lock);
+
+	if (msm_dp_display->plugged && msm_dp_display->link->sink_count &&
+	    !connector->edid_blob_ptr) {
+		const struct drm_edid *drm_edid;
+
+		drm_edid = drm_edid_read_ddc(connector, &msm_dp_display->aux->ddc);
+		drm_edid_connector_update(connector, drm_edid);
+		msm_dp_display->audio_supported = connector->display_info.has_audio;
+		drm_edid_free(drm_edid);
+	}
+
+	return drm_edid_connector_add_modes(connector);
 }
 
 bool msm_dp_display_check_video_test(struct msm_dp *dp)
-- 
2.25.1

