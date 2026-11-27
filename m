Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774467;
	b=tMd8gHx3lssObjMyT2HfAsCYQR2CpVLIqQCt4o+34stZIsyPqT0qLzmP3/TbcBTykMAc
	 4k+pDWumQoRih850xcSDRXkgtmSVWcluFUM/vWs3s480NfG4dIF+xg/8qWJeMZNnrHmBb
	 UN2xSX49w9fhMRf2umQoLS3h9GlHCT4Jtg0mHezB/BoQSCc1+bRr+oQxOC4vkjwdwY6dN
	 ZVjhQzqlNSS3OZIghfoKXI37ztP3WKOS01zdxl7u2db0HlZhx8EMkQp1Ep4K9sL4Jqze/
	 1LRRw7HwDg97+A/uQWvhqXh18DH6nrM0T9s9/CnHrIW1qB84KYgtlE+YmvecFFMkiLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774467;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=K+81Uiocp4dxkgsx2JTIwt2UK6FDgoo8FjodVxd3QpA=;
	b=5lJUMq6p+y+Uo9y6J/Q6mOxY89g9b/6KfJUuRG4DhUnPAP0xWDlg8c/mxdzkqtQIoJ4H
	 EyvnqYL7d4m3aOwcgIK/Af4BshFX66pus1ZjH5JuKB0Mk3Z/U8MdlJCwM/+cTs24CgENP
	 B8YelqDqVQ8tzZ1s8BqK0RDXozfQFW2kgbTCKrSziVaoCQpvMBY/IYPHwbh1ULGAPZhBd
	 QxDOpBGO4zXXzAhtnicJdbdlaW4kaB0L0TLyKbS9kQyf7GvDA09Gamvc0+8O1BIqNXhdZ
	 VFmRh3zuZuHoc1LKb8IIiDXG6rpTaLFRpf2XuHPJ2O04T4PpFbTWkSrQXb9iJ8/5kPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yr2qcLJG;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC5A606A6A6
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:14:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EC5A606A6A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yr2qcLJG
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-49412eb1474so5205158f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795774465; x=1796379265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K+81Uiocp4dxkgsx2JTIwt2UK6FDgoo8FjodVxd3QpA=;
        b=Yr2qcLJGWt90C913ZTcfquLL9V1ErCVRN2Q9iByGp/xXDu4kOTiQ4za49q/1r9+X5H
         LUuyKJjbq9XNsoZPwPvbPOk8eRy4N+SUg6v2Tk8MlQnCEjWsMZQcCoGYZFFEu61qKJ57
         yHs8PiAGCxnflWvLqcTduOHw615SH75yv6Qhv+HEwLb2YnrYeKfprlpUIpnlT+jyCzz7
         4cPJZ0GcCSeYME5VZ/fGjdIO8RTMW2PzMe6zqE/J+SMZ4gjVTHWHb3myvz2kv8sUpmwn
         l20qWPJN2UIdMYgx0N/aVLIpAQ7letKegMjBCm2+p2CSb8tOUbPJbhiPxZSol+ldFJP4
         MM5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795774465; x=1796379265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K+81Uiocp4dxkgsx2JTIwt2UK6FDgoo8FjodVxd3QpA=;
        b=QyO5qyEkQ3Pi3bXVDgQuUine0b9M8O1Z+vOF/jRmFp2tG0tLKPl0LX5GkeZ+vPFTzN
         r03kIROvKH6oGPF167OjB7C3WI2PjAT22aTXQ8qJ9V0DRLvmaJTkXYEbjSVw4bZOQDhE
         PF4pEt++ybFnmarf3MBqfBL+kRb94PVuXOFuWwkCXPasjP1L4Q8K/FnON7rqoVRwOMcV
         xLmS4WTY1FVz+IICxssRFydBnvBDuxt/n4Bq2znaQ+ERL8y1i8lsep3DAaLYk6tbosQw
         LOMx3tB1u5c1xeCAn6JZCqn/GguOsQb9hf7EYUl5AoKav4SKaUvrCZDl0ffa0Q5U4TTX
         TEqg==
X-Forwarded-Encrypted: i=1; AL+hErHMoRIxKan2w/2Ai/L9ymarzlRM97zpGiZqgzUhlOxEdsohVuvlpzYBUFUhdMI5q67kY9vifQvo/Sf4M4I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xcqfvXUYnkYxs6OFuwyLGArbfLw+cHMcEOYDul8SPMqvtXB4p
	TZvkqTJvUm71pL0cNUWT7Y4kyb7ULbqWZ7V24NPLZaTAqIOpYMZEuNw=
X-Gm-Gg: AZFdTZeMoIETAT9BrClIGlGQ8m0LJBjO7woeYjL0pstcjmBK9Xt7FEUlIMoTmaysyi8
	OJjud2TdRl9mGXLeJhkGogiw0OqHG9Xz3Z6EjKCMP0nBFnFe4W+EV2xSBTXhpuqqNjmHsJWBCzf
	Z85jeryOfvlY4OTUFTQIVWqllG3iwVAxVvE+K7EXLqsdxPPFjGdykIvI6zATc01x9842ZY/2xcJ
	Dy5VNANHo+sODHN60U7wI5cEg+dnOIuorwizBtLVl8fp05iM4+zd30SrwMo4IaGORg50s//ERG0
	DxwqeyLdSMCx2zsTwA8snUoSmMpt/LgCLbDx1NBwJ5A+HanKcB9r8iZi2jFU+msMbPoz54IZdsD
	qpO1Vu7qpkoBLfRflI9xJruLCJrPH/omgfrWP8A009qrGttOQc9pSPbJVpyxYfsE/ZY4J2kQjLN
	pecSfmPwIfBgg9498nZK8DtyC92jAZmA+e7SI6fHahDerfDk00q25y3j8k9P1iU7Gv94yECARCW
	FCuPnyUuvDE2At+U5PLUYH3nCMXjAhZnY2Fcr+7+NM09QkxYXKWxQ+scqziUF3bMvb8ftFp5YBp
	sFJP/afUp0N2EuUQw8cCh/6zTv7Qbj9BE0Pz2Eepg/DYY5km0esVGslMX1waRgYnLrvsALCoJcB
	NLrFjEhjVQRjMy1A44dwZp1pHSABXzFtIpMT1zDktP09FiO26ybyIt/0zzvE=
X-Received: by 2002:a05:6000:188b:b0:4af:e519:ccd7 with SMTP id ffacd0b85a97d-4afe519cf33mr36813384f8f.3.1795774465333;
        Fri, 27 Nov 2026 02:14:25 -0800 (PST)
Received: from localhost.localdomain (host-94-89-17-99.business.telecomitalia.it. [94.89.17.99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fec7sm43651234f8f.26.2026.11.27.02.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:14:25 -0800 (PST)
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
Subject: [PATCH v2 02/10] drm/msm/dp: reset cached link_info before reading DPCD capabilities
Date: Fri, 27 Nov 2026 11:14:09 +0100
Message-Id: <20261127101417.24303-3-gianfranco.mariotti94@gmail.com>
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

Commit ed100aa239be ("drm/msm/dp: Enable support for eDP v1.4+ link
rates table") guarded the drm_dp_max_link_rate() fallback in
msm_dp_panel_read_dpcd() behind if (!link_info->rate) so eDP v1.4+
SUPPORTED_LINK_RATES entries take precedence when present.

However, link_info is not cleared across hotplug cycles. Once a monitor
has been connected and link_info->rate is non-zero, unplugging it and
connecting a different DisplayPort sink skips the fallback and reuses
stale rate, use_rate_set, and capability flags from the previous sink.

Zero out link_info before parsing DPCD capabilities.

Fixes: ed100aa239be ("drm/msm/dp: Enable support for eDP v1.4+ link rates table")
Signed-off-by: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
---
 drivers/gpu/drm/msm/dp/dp_panel.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index d3468b73fdc3..e633afdf2b47 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -195,6 +195,7 @@ static int msm_dp_panel_read_dpcd(struct msm_dp_panel *msm_dp_panel)
 
 	msm_dp_panel->vsc_sdp_supported = drm_dp_vsc_sdp_supported(panel->aux, dpcd);
 	link_info = &msm_dp_panel->link_info;
+	memset(link_info, 0, sizeof(*link_info));
 	link_info->revision = dpcd[DP_DPCD_REV];
 	major = (link_info->revision >> 4) & 0x0f;
 	minor = link_info->revision & 0x0f;
-- 
2.25.1

