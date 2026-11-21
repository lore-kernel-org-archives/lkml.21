Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795297292;
	b=yZvUXcnRWs8UQRq4jaB/w6o/UAzCRRJem3xL4TNMtd4TfJDH4pLTn5bStr4OFBRuvLgv
	 DW0yvXD0NR9rTlW2wHzyuNps5AEIB6GQQDsjgBmXNMLaXQBRzpaTRN4eWFwFVlN5N7Vbe
	 hj7W5AFTfacxLocyDxBgJGrhm48AR0I6vC0+6r/r7rYxaAHl36VMo9bpVM25CqR2Yhust
	 3rnLM3WCd0KamVaPo/UTGAiRSOT3G+kVkEctU724AemK1Q8dz9w5Nw7RNNuaDt4l4qMxa
	 ghE/UwrvFJkmvTs+o6Q9ckOpQPGdwh6fmFGOxp46JOTOjDWHBgOrBrgBIMnjv+cSzkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795297292;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KZJrnhW075oTcwniS/SEMeh1Ea0hVClaPcoOIV/cLoM=;
	b=UukEMKzNXPuy+pXiknwiZzLKpU0kEmgB63xBweSImenn0ooX7mDEMYSo2fv08P747OOw
	 pfevp50pGo8rKQMQ6139aI+tJ/X0hMtZOEjWzHL8fTS/d3PN9b86OrKhB8pp0G6vWyuLc
	 KODH8fmuGhpl5h/DWO0UYHacoMNprGbJdHc5L4Ep/HW7Q2t18BdckazxVXfJqGTDVDSEc
	 LR5/lAh25cqGbein9wF41aHCaG9j34bzVbmMztCcAw/78CEzmiNJGq+8ASKJljTpwGMvG
	 Lp4W2gf2kvKhamLcfp3n9QSSqAYowC4SkrZu9Q+jspxHMOEQ8SLs8ZWKTu2ZCzhyLog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vlIQghui;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E66606A68B
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 21:41:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6E66606A68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vlIQghui
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so18814605e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 13:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795297290; x=1795902090; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KZJrnhW075oTcwniS/SEMeh1Ea0hVClaPcoOIV/cLoM=;
        b=vlIQghuijGYLmXGtu0QLzd4j2TiMm0Wa35pBc8UediEEAGzJzNST/rgdT/kmWROfAl
         BEO36rkOCTDyQcEqsGEzAG8bSVRy/4ljDfMdOrOFEKhSjFdkyTjS5+TafuanLKGbcAbI
         TZ0qKkiM6zgqLyIDGDmDPyzFa6NNg0KLSP9G0ujiG0gUxK03Q9RwAEkD8JuoDdOjUmhW
         ksi5+y0ldwyiaLjELR9rxp0xC4I1kYam/Tutj4Bdml72xq+h1v1JJDnSzGZO73szItAV
         otme12mEh/4aS2qHhaLbGjeFa54BTisS2AkihlKQJ1nQFF4doxe5snaTadMmOFO9k4xN
         dHXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795297290; x=1795902090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KZJrnhW075oTcwniS/SEMeh1Ea0hVClaPcoOIV/cLoM=;
        b=TrLrRGPE+BU28c31mtkGEPcLWoXqGjVtNdAm1Eo08/mJ4x32aHzRTrn59Zr9kSzCmc
         iuJdg3zdJPrnozOxUW4XWYGQPwvSYBYhd0zryKkOxgDc/RK5hUIZ3yPAS4as16Ssx+/3
         YVMIvhcf63TV6d2iBpOjxRgibpxURA3NA365D7PYr70QD9LQOeSpDEUIN/6ZiTospmEM
         bzPWS8webcVZa7ZtItov3Vved5m8HcgPdR85ybyRe+Uwsz3ovCW8EvEVpJuhxyLT/aex
         US7M9GDBL2FU5uJBOM1R/1nypeCFXRDPDxiqJsZMTI8bu8XTCf/XtmJXxqlnNKPLOwsC
         zMdQ==
X-Forwarded-Encrypted: i=1; AL+hErHFQ+IHnHlhRuEESb35xir4pKEpdmgMbOFDZwLdugQ4qCYBFEvOLHNcOe1BupVD5VOTgW2vUpZhn5EU9uU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QqFonYfuaMbUZsrjg/AyXkHsLcMUDL31l7Y/ZtPl4RZ2gTctg
	jrHAsP7/8s17YD7xDNFsvLb4zTpx5nVPs8wY1+mqLIeJpBiWX/GX/ug=
X-Gm-Gg: AZFdTZcDHZqAZLnm5P5JXomMNGZKkqzyvARgLWymVTQN9duoMHSw+2BbHZ9o/3rAzTB
	BlZGdtzlxMWXQjCW1arnQ6oV9A6lcIZMDaUWbqE4V6yWyB0ExVjRS4pXRnq4GB6krXBuCGRbW3w
	vH2uOZo02bFWPQ30LOvSpI5vMtsUXMt96PeoEuT97oSwMafI71Z5iKUNlYMLDAZYY/WStn2vLLV
	rNY0Vyq3u8owf4/wJQkxrGtU9sHHZ6wsGNGKIfAxY3qKkH9T3ec13PXsa5DoT7UZDVe2/VA2M2N
	hmNIhdWD8B+Oyfcl6RdhweNVwaNRcDcK0eTNaqJexGU2XvmYCHxWE0f6zfbHla5ebVNCjXnTbVq
	wqhhtOzaF6KhiAbO9Z1NyzxsWX76H9arRug98FQm5ZopXfdHVDBOJXPzjHfQUPvgcxJK8VpRmK7
	vyjPdd3/wsbgDpKH2V+xyUw4batugK2O3R/xlXBFKV4tPUjJlzWMWeUbppCLyL+45dK8yQLPPiW
	pSUL/VEESeUP38sbW8UBtXHn+/LfE7onzIDstQ08PF2BcQFO4d1eCrifG1tn4jjeN9uWuBfbw/0
	c4qZPOghoV8E/dPWkqhE7NlT/sgEwO4Z4MfK87s=
X-Received: by 2002:a05:600c:4585:b0:4a1:83f0:7c91 with SMTP id 5b1f17b1804b1-4bb8882948dmr155127915e9.18.1795297290174;
        Sat, 21 Nov 2026 13:41:30 -0800 (PST)
Received: from h7015t.. ([193.207.113.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067a0e6sm54580645e9.4.2026.11.21.13.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:41:29 -0800 (PST)
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
Subject: [PATCH 6/7] drm/msm/dp: avoid synchronous runtime PM put from HPD IRQ thread
Date: Sat, 21 Nov 2026 22:41:04 +0100
Message-Id: <20261121214105.32596-7-gianfranco.mariotti94@gmail.com>
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

msm_dp_pm_runtime_suspend() calls disable_irq(dp->irq). When
msm_dp_hpd_unplug_handle() or msm_dp_bridge_hpd_notify() executes from
msm_dp_display_irq_thread() (i.e. inside dp->irq's own threaded IRQ
handler) and drops the last runtime PM reference via
pm_runtime_put_sync(), runtime suspend runs synchronously on the IRQ
thread and deadlocks in disable_irq(dp->irq) waiting for the currently
executing IRQ thread to finish.

Use asynchronous pm_runtime_put() in msm_dp_hpd_unplug_handle() and
msm_dp_bridge_hpd_notify().

Fixes: 3ea2d1c3d154 ("drm/msm/dp: turn link_ready into plugged")
Fixes: 5043357e75ba ("drm/msm/dp: rework HPD handling")
Signed-off-by: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 3a3123dbe417..eddeb972d6d6 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -495,7 +495,7 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
 			dp->link->sink_count);
 
 	if (dp->plugged) {
-		pm_runtime_put_sync(&pdev->dev);
+		pm_runtime_put(&pdev->dev);
 		dp->plugged = false;
 	}
 
@@ -1625,5 +1625,5 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 		msm_dp_hpd_unplug_handle(dp);
 	}
 
-	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
+	pm_runtime_put(&msm_dp_display->pdev->dev);
 }
-- 
2.25.1

