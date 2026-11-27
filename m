Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774470;
	b=n2liL1ILefCxIqfcA0eKXcQi+d4J7PyrtEypuwk0KhuAeS4nI1HmWOVRxl1xBFWAig4O
	 ETTy/oN5HHgNrjRaFqhMTbaM18wjNTB03kkrxrGm2HEWfL87Qx8d30AQIjvnzGb58X0GG
	 CaCrZwPiYmHSEMU8hJ6ij5wlAZDtLFv2W7NsxsLOayfU1WQgSnwtOcIuiBj9LVlH01qss
	 dfpA6edtCW9PqxoVewzh8IwJGI1D5hMY/8lV+4R3IW0t+MVl9PrHgI3IcKMEAR+o4iuAB
	 B8OSIZFAFtyF+rd0nQG+U95jeIVQOjV0bN5PSJis0TikG5Mk4g+CQIknUyzJbQgKWEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774470;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Mgx5cNkPMPqWVvWeuCS5VO4HsywH9BFvEOT6o0QcnWI=;
	b=anrJ3QHpDPwsvhy4j2LgE2KetmhkMtRrSa8H6D83F3qsUamyUkG8IDYtcYsqpMLBjfDx
	 JPkvTgDGGZVaENJCR4CTmyGu5ZehUPwq6jZ3v7JRK9e+N1IB1j3HoWSgG0r1EIC0PgWBI
	 R2e1L0zLmsf810iUkEzq+Qa1/TgWIKIw5isv4bhr6sdjx4pd3rwmeFLk3qKk63/ocMwHP
	 KxftEAxSMoudk4B92RTJyo7pPBV74bcJM9kE5VlF7FefmAqrbzpGk16ga5205JbuBg0ca
	 kani+oIkhhxJLVZywhSPBgzNQ5VnzYk7V1YUuxOAaBTssm8AZgsSLGKaYYrP4zY5syQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ArnXgH4K;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8D06076C2C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:14:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD8D06076C2C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ArnXgH4K
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-491846221ffso6954829f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795774468; x=1796379268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mgx5cNkPMPqWVvWeuCS5VO4HsywH9BFvEOT6o0QcnWI=;
        b=ArnXgH4KVgo8ZsjzHE4ZEUcblsNUSn5rGz2IsOB2VH27OS3HwIcZxnKaToB+RtqbJP
         MhJpxb+/7a321SykO+7kbw2lxM01U2LouQn5lvTYs3r6HdWKYVszgvlyq/Msl0ySEzfL
         cl5wZPWiWGiYCkbaBQ3CRKQ1koMVb1bkKWhgiTcHZfTCcytoKcLmDa64x3AmNMKLIMCD
         Z/SJ7QlDUPQMOFVKIycfhGgd/KGX3h5HdkKvbL6dD8RZ9+w0kicnwSq3+dku04tkd6C9
         OWDDqgyy4xvRhzxqwcDY/3yiXzC4UlLPqm1pP3x78psiyEvEqKkA/OqPp1jIlavjnD/Y
         jkag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795774468; x=1796379268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mgx5cNkPMPqWVvWeuCS5VO4HsywH9BFvEOT6o0QcnWI=;
        b=Pb3Yj+7lnMX4XqocqjT9VEXTSkfs8kkOooiYp5UM5++Jv61jrAfhHaDYZozJHEVhxf
         hJhxVyQlW1lhjl9H+s9k82omEJanL0+qSyRPA9hnSoKU0QME1LmNtsCcEaOpoUSEuTJo
         vlb9FvcEyb7hfdDAwfJpS5Y6/NrDBmNSdH1IeksOntSs5UFtPl8wYFbejzsLgizLhZt+
         Zo5Q8UDHeeFytsD79/YgMl90BneXOWX2DX8xReq7EKCBhwbrV18jieW7DTtOdtQaCIiZ
         ZvORcZPa0froqWa6JqgaQxTFQeAu11Dv/eWCtaXCI9p5Efg+C7Zwi5agb43lD61N5TCM
         6bsQ==
X-Forwarded-Encrypted: i=1; AL+hErHMWGKbs/wObXRSqysYU+YoClGq1vLEANl5fu6id7yoDw/ca1HfDJuk9VQERttMPNvb24CAXVUe2RvLl2U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/NUrIMU8tUM/YkBpRfTNLk24AlTkvdKbVDKJNgul6wI9X+OoPi
	HE15B14UKs5lI9xl9JkRST8+Wu3d+eMOGTD39kyG+x9lh2HmUou238s=
X-Gm-Gg: AZFdTZdczT2AjyDCqUfrt0xA2BhTEctRc+5I7/SdQHrCNQ7mo8UJblu+zfPkskS9iin
	grn3irM5QHn3nTk1HzEtT6VxXbPfWDb6/Ed8d7TlvPtXAtiNIzC4zpjbPKrBkQn6Cw0T2BDJxat
	L3wA/EAnGuhzx1IR8eZ6R6OJgkOMLxdi2/dxtCy4rSgdv27rq6+I8Kv41lc/A6YWDshw8vR5yPw
	OqRDqR9hU1bIMD0Ab2CW9vvjKaNJYGyBT1+v8SxzkeQ+NIfo11+zbrZlDjOuoNBH/1SuWboe0hA
	zA7qB3J/d8xyQUOovi2W6d0WIU7Sk8lwcO59gAAf19U0Qlhpl8F0fiqQb8r6+y7ioLigfv+buTy
	NyHeX7INJkWjh0slkanG0q9kN39irgfCsqPnh9MoGC7vjxi8ewMU2QZp79iREozv4XBd0xMquqH
	cZcrse8U5vJSMomif7AWjWhqJAOt/ooHdjZfKdqqDqohKpltz6HVRR34glR3XIIrkz06pEmEUdc
	1Xw4aKcOi6XCltVIRkDw88rt6FwxUDVI3wZophAhwOmIDlTJfu4LcNVnXHoIoaF4mlMTtEBQCet
	liSqIOytiahpesN1A9H0pvxcEkqsrgaty8ubB4lVKu4lwg6x78ETeYNmV7XG4iLqCyaIEj4SDw/
	VepN+clVC3apvjUZF4hM/edziMdP+kNoJyROZ32wZtIeHl6aN7l9EM0Hw70Q=
X-Received: by 2002:a05:6000:2489:b0:4a5:8f40:a644 with SMTP id ffacd0b85a97d-4abb1baa9eamr48914855f8f.9.1795774468069;
        Fri, 27 Nov 2026 02:14:28 -0800 (PST)
Received: from localhost.localdomain (host-94-89-17-99.business.telecomitalia.it. [94.89.17.99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fec7sm43651234f8f.26.2026.11.27.02.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:14:27 -0800 (PST)
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
Subject: [PATCH v2 04/10] drm/msm/dp: reinit video_comp and guard stream state on link maintenance
Date: Fri, 27 Nov 2026 11:14:11 +0100
Message-Id: <20261127101417.24303-5-gianfranco.mariotti94@gmail.com>
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

msm_dp_ctrl_link_maintenance() waits on ctrl->video_comp without
reinitializing it first, causing msm_dp_ctrl_wait4video_ready() to
consume a stale completion left over from initial stream bring-up.

In addition, if link maintenance runs while no video stream pixel clock
is active (for example in the window between msm_dp_display_prepare_link()
and msm_dp_ctrl_on_stream()):
- Driving DP_STATE_CTRL_PUSH_IDLE via msm_dp_ctrl_push_idle() without an
  active stream times out waiting for idle_comp.
- Clearing DP_TRAINING_PATTERN_SET while REG_DP_STATE_CTRL has not yet
  transitioned to DP_STATE_CTRL_SEND_VIDEO re-enables the sink
  descrambler against unscrambled TPS symbols, and waiting for video
  ready cannot succeed.

Guard msm_dp_ctrl_push_idle() on ctrl->stream_clks_on, reinitialize
ctrl->video_comp before retraining, and return early after
msm_dp_ctrl_setup_main_link() when the stream pixel clock is off so the
training pattern stays active until msm_dp_ctrl_on_stream() enables
video.

Fixes: 8ede2ecc3e5e ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
Signed-off-by: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 779f743f9418..7201b7b513a3 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2089,13 +2089,16 @@ static int msm_dp_ctrl_link_maintenance(struct msm_dp_ctrl_private *ctrl,
 	int ret = 0;
 	int training_step = DP_TRAINING_NONE;
 
-	msm_dp_ctrl_push_idle(&ctrl->msm_dp_ctrl);
+	if (ctrl->stream_clks_on[panel->stream_id])
+		msm_dp_ctrl_push_idle(&ctrl->msm_dp_ctrl);
 
 	ctrl->link->phy_params.p_level = 0;
 	ctrl->link->phy_params.v_level = 0;
 
+	reinit_completion(&ctrl->video_comp);
+
 	ret = msm_dp_ctrl_setup_main_link(ctrl, panel, &training_step);
-	if (ret)
+	if (ret || !ctrl->stream_clks_on[panel->stream_id])
 		goto end;
 
 	msm_dp_ctrl_clear_training_pattern(ctrl, panel, DP_PHY_DPRX);
-- 
2.25.1

