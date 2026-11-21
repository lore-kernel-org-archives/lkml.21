Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795297282;
	b=vGybAWYVrRD7TKoN0UgYC10LgOUrcvMr7wFb2+sEW0N0UuySZu2pckmrkbHIox3WdAaE
	 86q1yHvY5dH8rEtShY620goQS0GqCatP98TiLNpOzZi+gwvBsRTJSHAoahkguTBJWJRJ6
	 9BNEE6nl6wTox35ByAdOSXZwmsXST52S+jLrlPjpvAmXhzuHu/fccgXXDA4lKGVMhgpVc
	 oEfWAGS2uEl0afYh3kcGPAbeJAfyBq1Cs0D83rVrnnlfNslcfIDFxe/E/Ng+s2Lq6Zmrb
	 GadPO86FCPg4R1L2TU1y+FVl6rMRKOkv0o+sg4AoJ/+vbfPRTwu4GCIpJbNMEJ2QnxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795297282;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ti/nEM5Oev2zA4xOj8Dvky3xyrMI3QYm2yjdgLO6vuQ=;
	b=jJLI9tD2gaj3Q1BaxTFaFGj/ha0PB4Bm9gqi6hIwsKR37+xBMz4jv7KcovO5v4ztZBuK
	 0ZUqyv+usqLm8QaIPzMbPY+U67newjMZNxOV89z+EvvOD5hKjMDAdUargNbRTfFtMNJHJ
	 LtS/S7Sgt021T/nsIKEtn6kgktigmVS/3nZlNFkOmzu7n0F69O7xRgJoWM9sTq7wwxbnk
	 UqcUsWIfB6slDh+yuvmg8cUnerYFEyDQ+2CY7OGE+uVX8h1eYsDWDPRoUORfMuMCJBn1x
	 B/RMEG+YrvTNXnspYITYVJlc8bFB1NJNmF0uX1+cXXCYISoy7Smtfr34fGJmsKWGFsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=letoMPww;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FBF606A33F
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 21:41:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2FBF606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=letoMPww
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so17497345e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 13:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795297280; x=1795902080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ti/nEM5Oev2zA4xOj8Dvky3xyrMI3QYm2yjdgLO6vuQ=;
        b=letoMPwwDeGLKyc5HvD0m8wd2OjA64tloDcoSrrDfVAAA2cJu4sdNKZjk1HATb007b
         vwl0uOrxNj+FYuEp5JuAlchsGdMlQjFfpy2HxPFjq0lTWKp+DUJiolOJuH2Pz596fZYn
         ymzBmjQVwtJEDVp4ZEmtFReKZdY7j6JIxzrRkwToepUqDUoeLQiZZo7bd5lHVB7gkk1G
         DJgEODZsNPEDZ8JNcAWL2YkWQKdCI9mQbAtOR2NgiGemIdQpz4hpiAlq6HHUX67UHR0o
         wPcPs90W1TYJuCvihevmv++WJTw+mewJWdv1Vd01c/CkOdbnNqqbwo3uEJmiYzLznF/J
         IDAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795297280; x=1795902080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ti/nEM5Oev2zA4xOj8Dvky3xyrMI3QYm2yjdgLO6vuQ=;
        b=rfkpwIAqZXLGFjLIi648Tq4sBI/T785+7Gku6GiJ0oYGns5YhJk6pjEMs+btgnqHFF
         W1FGLMEpQLIKmTgldxzB6u9d8qB3UTAG2H2SVjHrpKM3Q3YGVgFPlESxlxeeQ5W6NKhz
         VMWsIhJl/30DWuQLXHfOV+oM80NLfWumZv7xKPu+BvKcyIKp0iIX74XgWJ+H7d/G0QGg
         SNjif/lEiE36sfTjPglgI7wvHlLqP5+xUkwDJJfiyWIqag1nkyzEo6SP2XYCnhFPbxQu
         HBkIymLwi0szIomtQBRJqLvDPvzKCewaOtNbsf0dfKN3h3bkIQA+Xo3TbOszXt1NRrR5
         ex1w==
X-Forwarded-Encrypted: i=1; AL+hErF8fS52fkF2M3jmZoTeFLlttZ0IuFJtsw2LSPqhltrFcx9xgKIo6Lr10Mrmvlh9DKz7e5l93TQb80XmHx0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hMVbTUZuV99ux8aYkfmG2DW3GRy8LwjNtUOzPrGaz6J1WBOPt
	565der8/vZvlifHy5UErxuKjKjcetIr5Hs7UQqHDSlSshOjOB1rukAc=
X-Gm-Gg: AZFdTZcydSZ1ROI2d6nMauG+0Il1BrJvmFjNRfznzWziOeUrNu/0m3qSfxPh/gc8WtM
	0vKhbr+uy4cfkqjUk3Qjhfj4Ce7TBWvLZvNUshY6hQbzco10IzuGvaCdgVwZtKzG3yeqfTHab0a
	xsOsEMKC1jSkWk9CygzTIN2OIjPn5nL1yEMeOjTL+bdhdrb3D2xMSfkkv1cIlSsI0clgltEKl/i
	bDMwIsrXdIil7UJd0Ci+kVTuW7ven93mUSaoOX/JYIeox3INI3oXDAYolbSBs06A0eANSOwplnv
	RlXmUxmL8fuqrX/jTtDnkYLoWEyk9JrfdzK51HZ/tzumZZygDw0cPEyWnBMVBDnEBeqzI3XwSYC
	CLd3mZ2NgfHs+oVmnNVSGWnO+sGFbv2nzuL7NMYsv2P6m5NR+/Ah/+DlUQkyDtHrkK26mip2Jjh
	DhNQed6N51sfDQqEk930lgDwxKZuwBVK9Nu+ajq2b3WqSF33kvZfxEvnLsVKkn+NzUE6wXlHW+H
	oL0uZ47A9Gy7v/OKpfL6TKXsqxJJx34ao6sksq63scMqOcbbdDp4hc4z3eMC6gxPftdBFfBnQld
	4rrXRjWzAOfXsx5mcPV+ep8euIXg7ppANqr1ugg=
X-Received: by 2002:a05:600c:3ba5:b0:4b0:a307:46f8 with SMTP id 5b1f17b1804b1-4bb8880f29bmr174211755e9.10.1795297279908;
        Sat, 21 Nov 2026 13:41:19 -0800 (PST)
Received: from h7015t.. ([193.207.113.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067a0e6sm54580645e9.4.2026.11.21.13.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:41:19 -0800 (PST)
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
Subject: [PATCH 1/7] drm/msm/dp: configure voltage swing and pre-emphasis for all active lanes
Date: Sat, 21 Nov 2026 22:40:59 +0100
Message-Id: <20261121214105.32596-2-gianfranco.mariotti94@gmail.com>
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

msm_dp_ctrl_set_vx_px() only populated voltage[0] and pre[0] and left
phy_opts->dp.lanes and phy_opts->dp.link_rate unset when calling
phy_configure(), leaving lanes 1..3 unconfigured on multi-lane links.

Populate phy_opts->dp.lanes and phy_opts->dp.link_rate from the active
link parameters and program voltage swing and pre-emphasis across all
active lanes.

Fixes: b4745f741e79 ("drm/msm/dp: move phy_configure_opts to dp_ctrl")
Signed-off-by: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index abd3dcdad03c..b896196cf244 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1374,13 +1374,18 @@ static int msm_dp_ctrl_wait4video_ready(struct msm_dp_ctrl_private *ctrl)
 }
 
 static int msm_dp_ctrl_set_vx_px(struct msm_dp_ctrl_private *ctrl,
-			     u8 v_level, u8 p_level)
+				 u8 v_level, u8 p_level)
 {
 	union phy_configure_opts *phy_opts = &ctrl->phy_opts;
+	int i;
+
+	phy_opts->dp.lanes = ctrl->link->link_params.num_lanes;
+	phy_opts->dp.link_rate = ctrl->link->link_params.rate / 100;
 
-	/* TODO: Update for all lanes instead of just first one */
-	phy_opts->dp.voltage[0] = v_level;
-	phy_opts->dp.pre[0] = p_level;
+	for (i = 0; i < phy_opts->dp.lanes; i++) {
+		phy_opts->dp.voltage[i] = v_level;
+		phy_opts->dp.pre[i] = p_level;
+	}
 	phy_opts->dp.set_voltages = 1;
 	phy_configure(ctrl->phy, phy_opts);
 	phy_opts->dp.set_voltages = 0;
-- 
2.25.1

