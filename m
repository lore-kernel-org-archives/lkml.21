Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774466;
	b=vH2kMn+HwVU3Vx0XSIJ1ZiNdP/KGq0PRDq5JjDBxN5qGnHvzLbdVfCdY7B2tiF8Ap3KI
	 g8r7UQjj+Io3B1dNicvg9OLQBVtw4iTTmH3+fIytNAhquF+CZZlSLGZfqHgHx70K08qMO
	 /K8M8y+uAO4hkVeXsACj4HFmIqV5S5GonpoA8LbVqi66OyZhoow3g7GCBVJe31jhFISxz
	 H3xdj4SWdpY5jynLau+TEUjDXfcpoD2qjaQ6mTmr0EO5POkXjlZYFIi8xziDoLSIiRdV2
	 EkXUZSQCkqLGGL7sHWWUkDiv3U7d+Y8GgdUFAmPrgPY2Eqvvl3k76sTUMssdi1KSf6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774466;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mLyO4AhRjnRtKKiwchzwSdvyP2jX085GcQOLd7xPquo=;
	b=n0325WD+jvAO3O8zWAoV7qACtBNHXSfRwNcsA83yIaeRST24hqPaDWhYiet8/88JfT70
	 xFflo5tjU6W+eaZlz6zqQtHOwOqFAwk0rOGRPkLYUPTFwVeDPg2M+B6m69s4Iwv/iNsbV
	 KDzHSguqT+rq5UNoJ99kCuYtq2gs5lP9yO/Y1Ig+QCClKyrNIvU6LDLSr/SRIc8Y06OLN
	 q6z40mycnTNdH+taQM7WBNnUqyD5V9+y7lMVEZC7WrAq0v5Z/SziLYZF1jfxa3vsGu0kS
	 G+SDMhOkiterSz8tV3lJrjWkjdFU9kNd+8REqapSRvGZNA1DYqD+aLdQqRr+MZnTX+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Uw7NnkGR;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A056D606A681
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:14:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A056D606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Uw7NnkGR
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4a357b1c649so4559296f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795774464; x=1796379264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mLyO4AhRjnRtKKiwchzwSdvyP2jX085GcQOLd7xPquo=;
        b=Uw7NnkGRkLh49953F7eE1v7yBLfV4URKaGKqNm+8ZwSGyjtZJgJk/mOnvMi9aXzarC
         4LCZWbGi2zaNQRRVI4qbR8eyi+w7ewRwBqVgE9W/XsrGsOleq4WO9MJjl5BBHcitY5O6
         QVImHQ9MYlgLndgxNMbIQtufvb2tRdaX+05OYqYTnkRbUxGFlNd+MdzD0oZjWf8Uyo87
         HyJK7dHL3HXgx/NBrjJz49C/FFSefMirzHoj1Bx6yzCAHIkCRZytmLAPqsbYYCLurXQr
         HQ+UNkdqqxfYwGQN02jaGLjSUlXCS/0xnsRVcfJA4ZvbC+9YnQOWI+v88BQbPwdja2YJ
         E3hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795774464; x=1796379264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mLyO4AhRjnRtKKiwchzwSdvyP2jX085GcQOLd7xPquo=;
        b=em2A3/NePmeNh8q+bUpdqMu6Cg+r2wQWf/sogrOHbS0XL+72r0jALm/shw9qnE6Iz8
         ZF1davftNTIHaggmvGaEkGbnIZvHHZTsfeX5mTWm9JwPpJRCgcfm+1XeEOvyCMzdS9S6
         78nOIhx9LEgYBKtz/Ln5/sIT87+23oX08EVkgDCyOuclTmJoWwE3jktbvMfZZqXUQ8XX
         oBg7Xzt4OGH3PUCwnwXtnunhjpU0Xs/IDVSLB8NCHw3+lMjlS6gpRwqetvWVNG6T8EBD
         i/M253SoOH6dEjBLhKlBSr0wv94+JgsZ7LA2YlgchGQ7wQZVJYmX2oMWxASzbV1sRNBq
         9TmA==
X-Forwarded-Encrypted: i=1; AL+hErHjPlo264CufJQ88r06wbiuZPkwKf4fOPR0DjtuLcK7hd7yqZN6VT287zJAQsVSM1aKahvf1FlBjT2Sfcg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8a8IknuU+4n2R8cnn1aN2N6PXTv/eKE43rc9rWGxqge8uIcMCR
	HUDeatnYFWCXzWGBjQZyLwCnWuqyH7ecHO1LkvrnwVlaBdQFySVX/Co=
X-Gm-Gg: AZFdTZcxExalMmrPMhJ4mrATmC0hXZRFAh0evHSPMzfv2Q8/bgos0Qrsv0sCUKohrlo
	V6otn802z2vvK+flYaFcyOQiKRIUrxyzTeEABiiMREgpoeSzmamiSruVE9+SLOgojaP50mw4Xiy
	VuM3NXHZQl1qWsyte3YlJMSt2dshSDuwFnrOHKgCxrmos8WgXIM+kO2/LlrGJ1eDBB/GalP4xso
	/Oa+b1tlPoDrKqwv8SHhF64e41HAWejbAHWp1EhK/wcrfV0Xa3qeINnKC8fBcUnRMaOU7x1dbsA
	l4XZcuvqc9/4GljkVUxLgl+j6/SpIkFiHESDjQXG06IgsYH5UnpBWBBMsvtjZQgQPl0zJB8rRfJ
	yqNauBgpL4DIlvKeoWfaq+1Ld39Zyt/MmifIymeNCEpzjLu3P4ZlglkquUwj62sh179iF7FqfFC
	74JV5WahGRhoWM6BcggkTKs85D+BRHp2qCSgMMnjbg0oiRXFBBX5yx8MMrTIdnP0SNvo71KwwmI
	N+6j5LFDrFrLIyvwFNcR7MMtXiBOGIHdR1rfH9RIeDruqm/uvLvtFyl5p3e0yLL4EetuCQnCXno
	OtbIKs8GZl98l6nPk0YJPx4QAYckPhsoXFUu/kU7nNpvJK4naupr+SdHqPwxMlrfX8x/nAtYkMG
	DVQlFIBnx7Vs8gFItk+BxUKLX4XYoNqjHd85us6Xa1WRAx999Hqjx1oHv5qU=
X-Received: by 2002:a05:6000:299c:20b0:4aa:2bf2:4d98 with SMTP id ffacd0b85a97d-4abb0f3b4b0mr35473305f8f.29.1795774463951;
        Fri, 27 Nov 2026 02:14:23 -0800 (PST)
Received: from localhost.localdomain (host-94-89-17-99.business.telecomitalia.it. [94.89.17.99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fec7sm43651234f8f.26.2026.11.27.02.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:14:23 -0800 (PST)
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
Subject: [PATCH v2 01/10] drm/msm/dp: configure voltage swing and pre-emphasis for all active lanes
Date: Fri, 27 Nov 2026 11:14:08 +0100
Message-Id: <20261127101417.24303-2-gianfranco.mariotti94@gmail.com>
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

msm_dp_ctrl_set_vx_px() only populated voltage[0] and pre[0] in struct
phy_configure_opts_dp and relied on phy_opts->dp.lanes and
phy_opts->dp.link_rate remaining unchanged since
msm_dp_ctrl_enable_mainlink_clocks(), which leaves them stale if link
parameters change during link maintenance (e.g. DP_TEST_LINK_TRAINING).

Populate phy_opts->dp.lanes and phy_opts->dp.link_rate from the active
link parameters and program voltage swing and pre-emphasis across all
active lanes to match the generic PHY DP configuration contract.

Fixes: 937f941ca06f ("drm/msm/dp: Use qmp phy for DP PLL and PHY")
Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz> # x1p42100-lenovo-ideacentre-mini
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

