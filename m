Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795297288;
	b=MtYE6MLFBxZbNJklpYLRaLIAKehr2+8/dn8zRgH35jesFObhUSJUfCE6QAzzNBwBulQe
	 DzpOq9bvNaVdy9Ed2la2qNn15LBaROOzaBLPSOqNCY1z7MCJGy4rHEobHtZzhY4x1v4q0
	 LhFBrZoGyFLQT/SB9HoA6HAE7GYVz9EYonqKaaXKn+xu16D2HpabD3f36IqzZ00GPkUXQ
	 e4IukiMfKg56DdMWXFHXZaHmqsgHeMLcJM9+U1O0Tk9Q06NW2R/P0TeY4iFamPwCtW9Ko
	 OCTwneeSlN6/4wJ3jyAdDovi9eq0ww18Ik5cBmGvCxclfakW8x1r1G3MVq50nv2SX3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795297288;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/I60O6m+DFQriN/q4lolCJJt5ab8WOxlO2aTwkK9VZE=;
	b=TM2LjfKt+16YIm2RFEg8me7xSoI0oOoQTk7IJt0/XqFU+Ngi0TcCH6Hwa9hRvHTmI53H
	 +M8hYLtodrwh35syqu3T7r51QOFxPVNqtSo+MoqOUPlA+rM67RYzMIga21hpt9hJvbUVe
	 gp9/mWRyPLjKFv0Nbn2+TbCN/KHiwkxoBkqXcUNW+2XSvyzVKqvX423gUeAHtd2ctNUKD
	 FEjcNUYMxvN0MCCru/Wp3ZQvxDK4NHdwZlP/ATJa89GY+O8AKeejiVw9XTcAv+H0vzhR/
	 Q3uafFMyDEQxSKfVSTX04ppiGpDG8kuWUHcpfoyS2FgXjZObRWj07bmLUHzEiXhhaTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Uy6YUXOK;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D84A606A330
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 21:41:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D84A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Uy6YUXOK
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so12773915e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 13:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795297286; x=1795902086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/I60O6m+DFQriN/q4lolCJJt5ab8WOxlO2aTwkK9VZE=;
        b=Uy6YUXOKot9d9pujQ/L3tSdPnWAQ6p/To+Ky2j8VKWwF8ITWHGbEAzGXKKtnJzTfGv
         DV6kmg8QCT1JLHKjA/CUmlXMyD8aK9LdYPkcnE86a6+DuG4rT7amEq5ZRS9DKDhX/bjt
         Knq1GEY5Pi/dAofXoFYx/174Qe2iMk9REWfLbYoLD98vEfsD1PoRgEgQMzbGJE+25i3o
         hp17i34Z0mafsDLw1vI4TxDy2dCbe2NdpfyFmLTlbJPj0LHaWY0eCOBvQ2EuvNEDbgiw
         HqK6ILrk0RHMQmtKCcg0AgnlqfueUKBqoJJ4NRtyzoqIepbLbdmrZJ7n7Cz1lEEblvIZ
         zmgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795297286; x=1795902086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/I60O6m+DFQriN/q4lolCJJt5ab8WOxlO2aTwkK9VZE=;
        b=pDoiRqCBATYuG/PZlAjDHXZFFKZhtYRAz2Lmk/I1yFCItM2oq9uimP1uJpu7TIaach
         U8IIJGLfBAnTzZF1boBUpqD5om02PD1HCcLxFJWAmXe7scpyNloJxPPorV9vR0wESD35
         7bES3XfTF10AOz3q5NL8w0ot+H0uOeA5yur63Mfc8O2cgIK4EswU1cLLjM4UzFNkP+ix
         uvo8ztk5aJCvTGk/TQRvvHh/CmuuZmwOWjKK9a13ijE02gSlIQ7ECOCB0wOs+cy/77OE
         RAGrXi6QUyXGsFsmoqHqSwCK6xY+YL5g7SWWvhRTz7DQMQn2R+r9vF5hKtaWotRuLP+n
         cgNw==
X-Forwarded-Encrypted: i=1; AL+hErGI1gTsr/Is7tbFMnnEEe80BanuHiuxSltaLylWFbCbeQ/LbhD2Cy8fxEct7+sAALoGV2ZKfYYMaTp4d6s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ThELhDdzRlU4k/N5LSfXXVFHMkNUEDpY9OsS66R5ScGH8N9gK
	ym8eoXubzKnYqu72Ex9LJ0ONI/HtzF8EfoxoCCaCh0ZiQGcXyvS/MJA=
X-Gm-Gg: AZFdTZf8sXxNj+vZfwC+gKy6IxuZUr9IJmrde8P+IgpLytHI1q7msL2/eLyviSKROEc
	rAp9w+d6jV7INpKeCDneW1Sd7lVIdX04qDwEzewWUCeTDMgwDBKlLLO6M+Ic0bZJ7L3reMDU9k6
	sdBwfCd2kWxeAfXZoFmWTDAnI9771P0poUzvil/618C/NiD2UwJ418YjQkqCQNbMo37y8UNqqh7
	EpG3NXTbAsdKR/3v4NAmOM8fO1AxHXDFfyyv7T/SL2RDWmQIMzTHqTh12raG9z8h/J6EztmKu/8
	hK+foq9ZR0yY0pAOHBEpxghrYfvHk4X0+i/qG9swB48mcXluguqMnvClipv+cZS4zPtLnHXLOQk
	KdFvLACktewdqKvdBGSEtA9gEo02sqjlWzW76up79hN50Ze+nQHFs/h3WXEsEyNqEpyuj01v++Z
	Qu9hlAz5EkYhqfKyBsYGuaPYjxgaTr5/KWFwUsCRzhxzp77SIsbqO78gEpAHA98Lpaf1eVzRKgw
	nNreh+MKTjGNz0fUCEyIcn1X+9kH0/4kHudCilVRgJaDOy9SAgsYTxu+sRYMVHq+mWStgieFbVp
	TmHAG00SWfR0ATluHl3xdMMkHfqQJy6GRiq1+vs=
X-Received: by 2002:a05:600c:154c:b0:4bb:6a78:7c42 with SMTP id 5b1f17b1804b1-4bb887c3428mr161230565e9.1.1795297285984;
        Sat, 21 Nov 2026 13:41:25 -0800 (PST)
Received: from h7015t.. ([193.207.113.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067a0e6sm54580645e9.4.2026.11.21.13.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:41:25 -0800 (PST)
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
Subject: [PATCH 4/7] drm/msm/dp: restore source params and reinit video_comp on link maintenance
Date: Sat, 21 Nov 2026 22:41:02 +0100
Message-Id: <20261121214105.32596-5-gianfranco.mariotti94@gmail.com>
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

In msm_dp_ctrl_link_maintenance(), msm_dp_ctrl_setup_main_link() calls
msm_dp_ctrl_config_ctrl_link(), which resets REG_DP_CONFIGURATION_CTRL
to 6 bpc without restoring the active stream's BPC and format via
msm_dp_ctrl_configure_source_params(). In addition, ctrl->video_comp is
not reinitialized before waiting for video ready.

Reinitialize ctrl->video_comp before retraining the link and restore
source parameters via msm_dp_ctrl_configure_source_params() before
switching REG_DP_STATE_CTRL to DP_STATE_CTRL_SEND_VIDEO.

Fixes: 0a19867dfb8d ("drm/msm/dp: split link setup from source params")
Signed-off-by: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 779f743f9418..0904893bd529 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2094,10 +2094,14 @@ static int msm_dp_ctrl_link_maintenance(struct msm_dp_ctrl_private *ctrl,
 	ctrl->link->phy_params.p_level = 0;
 	ctrl->link->phy_params.v_level = 0;
 
+	reinit_completion(&ctrl->video_comp);
+
 	ret = msm_dp_ctrl_setup_main_link(ctrl, panel, &training_step);
 	if (ret)
 		goto end;
 
+	msm_dp_ctrl_configure_source_params(ctrl, panel);
+
 	msm_dp_ctrl_clear_training_pattern(ctrl, panel, DP_PHY_DPRX);
 
 	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
-- 
2.25.1

