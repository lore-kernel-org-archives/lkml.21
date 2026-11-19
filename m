Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076759;
	b=yzPqJwnf92f1tvGUkT0TUzEGPB9Sdn6D8OdFcxERb9qfMwvJHCy1bIIxQq/g01RCVdCU
	 +GPW8MeYjqNXoMWqUPs0Aur8m2prAYuUiEk+yZEml0oKwpsNb0GaKoMjfEQvlhI0arh5m
	 DfuD9CJwPdwfU/S+ydnLZkwXAAy/4nh6YQO26Gsmc8UAXwq4CHr2for0ebORUqNyO1SyW
	 hf9XQN+VSRlvfaww5G6iKoXEz+7eg65ErQRQzKwnN0oUFCCIGqI39YYh5RYHMZtO5fToL
	 He+ZpNBQ4O5K7ljeU7AlAb4YktJfqQw2SY2WileTt3Q6eQFlEk7RiGkeKka9D1NP1Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076759;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Q/EinRp8UttIgi2kUwInFnCWJclpjROqDyYnmr5zIvs=;
	b=G5J03y3eR5+JEh05UCPXkigOC4D4xjX8V1MkIMXHEXAFN6//my+JaVNPNVAw9Z06vm77
	 o1jb2BrVqQ8eYkI/DHaGRZj1AsclrgjReg1utGMwNhgEpykZXx4GPImLSeRoof+UzRDHF
	 5hgjsndwNtpo5cPNHYJI3asZ/QZ9wizjWLxtPbHYJulYlkfi37ht7c5q7BXlnp+aT2TcT
	 JGGrDg9dP4c7pOJmHmSKWuMJ9o4swUTUA9maN61MmTfNO4k7bVfe0SiKf93xMxQk0eqL5
	 wE7bt/SejbVTAXKAohgKZeGV8bqYm8e7fS/URwdlUPGblZS2V7CcLsyllVe1F9vSszw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KgXqGxJo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Io/fYAcP";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19EE2606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:25:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19EE2606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KgXqGxJo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Io/fYAcP
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6v6VV1962432
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:25:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q/EinRp8UttIgi2kUwInFnCWJclpjROqDyYnmr5zIvs=; b=KgXqGxJoIsD+AR7q
	0oVzVALOLuzhbVk2rQAmiJOutyrHLcABYC8bUUU0aI8lFnh8x4HCHkReo6hw5eP9
	hu7W/AjH/47aGhARfMNb1mwpnm0Rp1y91Ree56L8Na10u0J58vQfUtL9Ydg2b/J6
	WATC39UASwU0b4hgjcUYquSLsxTWo0sfmi8hsTl+bXLDz4u2GwrECQSvENsfHeZJ
	y6qcc0LRROXDLtVmz1oIZBe0YG9J0IohHsT9JgVC5zZ7NZzoRREjFYl7B3aBgLKI
	Jnf4HNceIdVg9YVJHWAjgaD7qlDrk4xhMe/wKNmMTSydf3Aj9SER+eddbEeGatYW
	4VJPGg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1gxcu8w2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:25:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f5844e383so359979385a.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795076757; x=1795681557; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q/EinRp8UttIgi2kUwInFnCWJclpjROqDyYnmr5zIvs=;
        b=Io/fYAcPoLf1tMJAEtaWlsfgRFH92hbf1/HuzYqmeFGyg0QShqGZTHaNTgz+9TU0SN
         l1l8xdtJzGB+0Cgt95x1QrlztFYn3I562Is4Lx2j5WhHFAn/26WSNDtcvPSRFVL8I/5b
         aP7cS0C1Fvlom03AQngdCFCgRQLt/6yWC4YaEA4swKCHFAxaDygw3JawNT7IqzIs8uqU
         gmjLgbwnbG7jUnThLM4PUyNAJ2qKG8LpgCMfjmJBiplHm0i0DsAK04itUy8B7DBawvjO
         s27yH0vqX5t+aJd4pGCJrh324+BuhOGcMs6coPejMXTgdf12JKjAHIcZ/o2B+5aTSNHF
         va8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795076757; x=1795681557;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q/EinRp8UttIgi2kUwInFnCWJclpjROqDyYnmr5zIvs=;
        b=pMQQzDx2jG0GpWU5m9NOrOuMl4No0M7VNHN4pCcaIfKn8iHIWGWdGqkxsm0Q09HBM+
         RrXURawqXQ2PJPU+Ow8meSM8afCn2ZL6vGk30cjBR1Ww7sOsAe/x65mYoUDOrGhIT47b
         gATfSgyYlesweZ0tfgsdCLdVWzSAAz1VfIqDu/JYjx0PofGLrq26PDLhMafH+hqdaIDQ
         2hg2AdO7hfBQUetQXdGkQ9fakEhBX94gwpEgQwbrhFGWsfZ5VjybkwIjRN8HDAEVJNbf
         unv1jAfraumfvHN3E0gOcttdibxKJL2m8yCFn5ruV1yVNSmSmxtW/vtRbu1T+6eOsaRn
         r8wA==
X-Forwarded-Encrypted: i=1; AL+hErHRGWTDwchzSsHi8bKo8JY0k4pmP+KmtEpNUqntzoBxbVAjVVtmUbCXCtemCd/IPRF5BZZZtmu+u+EQNU4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ve/qFtom8RB3+e8BPj63amkchJlRu1knX/tN67P/kHs/KtsZN
	xL0ddNx/C7UA1E+Gwx02rvjEVwKvGKtW4nkHWCJnlqrFHSjzOkBG2BOvt2cJtQoQ5Or6QF5fzyO
	kYJhHN6QWLkzV/c9ybiIztvVcrUAxQOpOLnPiIcYA+jK6MWSByWthZ3WbDIHYhRX3mK0U+UmrUM
	Oxzw==
X-Gm-Gg: AYBFou1DHWROxkYF1HwEyDFvqXMz2WdS/VuNyr2kVeU37jAzZkglaykAozQcN5kquYW
	BiMBhI3i5kk/up/8JT1nhd2qv5DWq6Ow4PYkZeGimkUFW47rE5sXKIxNvM2Ws1Nh9x8kYN5dEAq
	F65dmOMnLpo/yRBKSFjZ5ddrwoKeIHHLzPX7TNgN2GnyqXMzgu6whQrNmtSwvWJUf6FCwhn50Gx
	t7eXqxZN19UfRm+NZzMkY41t9CMQ2R+77ToaUPvrJqECqOJFRvZeosfcqTXvDXzN0pWiKIkiqYg
	BfN31SLKav4wMpYbVaM0JwAwaAqHdWbXkNSq6TCo7ueuexGQFevTf/AXZDzczxrkdGCCEGjlT8u
	6VVg52MrwMsPH1TfURYOslYS4Eohf1K1LH6XBIeTNpEAqzaGpnrjEmo8nhUbanyVlFBa/KAYL1W
	vqNbsBXnsluN1mCL2O42sLhvUNJgkKqe7mWCNQ
X-Received: by 2002:a05:620a:4397:b0:940:d8f2:b459 with SMTP id af79cd13be357-9499962b816mr982132485a.79.1795076757243;
        Thu, 19 Nov 2026 00:25:57 -0800 (PST)
X-Received: by 2002:a05:620a:4397:b0:940:d8f2:b459 with SMTP id af79cd13be357-9499962b816mr982128785a.79.1795076756621;
        Thu, 19 Nov 2026 00:25:56 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b721861sm388465185a.11.2026.11.19.00.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:25:56 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 16:24:19 +0800
Subject: [PATCH v9 17/29] drm/msm/dp: move link capabilities to dp_link
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-msm-dp-mst-v9-17-ca61be4edfc3@oss.qualcomm.com>
References: <20261119-msm-dp-mst-v9-0-ca61be4edfc3@oss.qualcomm.com>
In-Reply-To: <20261119-msm-dp-mst-v9-0-ca61be4edfc3@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795076662; l=8895;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=p38vQ6JCbh37ZLM8LN3FDw+VHaho6QXNRTsNE5uWmKg=;
 b=rl1ww9bZPGkyz+8hIljb3lVy19K6ByLezNwkbjFp4jKkH4LwVv7UbLS4j3aF6zLXm2DM0guOc
 jufYwVafXDiCC5CdljO5FFe21U9rhW4cdVfmvnh3B7T2wiThR0DTrzO
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=LZapeTfi c=1 sm=1 tr=0 ts=6afeb296 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=_PXc0LwuVPefzUNtRYsA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: sS6qm2Bmzem8xcz-nKtKbvRWqBCz01ru
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfXyL/fmD51+nZU
 6BrFhIP7gMx5jJsZ2+i4N4ToXwnZPYqZIL5w6cZqmNUD5N1n7OxScHIS1abPjZpnMlNOc1oeB12
 bQ3er9BMQ0UtYSZktuBX9nRDTyVDYkFe37HiJh2rWOaQYoaRd+hRpWH/OjgzyxIrmH67vWv+MaK
 IALm63UKGA7/oE7I1q/WhuzYTrGE9EpQ8v+eWkjqcgypN5VWtWnLBfivNcDufB5adkJszQxAm2Q
 TRP07g4ECKZbH2c5B21rmHvOFH+pTI6f9/hAO0ccS+XvHUOA1Qxx8H14zEMVMK9lCUVHDIkULAe
 IQsC/AuyGo19bZdF1CxTA41ZiD5uTNDzJ2m9v5wRe9k1DNmH0HoLXABWinv2vQm0ubJPI8B/6JH
 0/iMceBVKbEiVVEzr4zlb+zidHeWusjLeZfcpDaW7BxEASfS6crMgMJIRdnDiw7ZGDsQOEQFZaP
 UJVTtIa80Va2/1EHgIg==
X-Proofpoint-GUID: sS6qm2Bmzem8xcz-nKtKbvRWqBCz01ru
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfX3/l+MPLD55I/
 hUiBkVpEWPdgM99uXNJwoxKGo+1IOAXWR2O/korR+Onv2VrOxmL8wa3XMv8ytn3X9VycEau+8w/
 G2Hl5xx0c8CG1Ieo3wyC5yiYCWYEshs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190033

Link rate, lane count and VSC SDP support describe capabilities of
the physical DP link rather than an individual panel.

While SST has only one panel per link, MST creates multiple stream
panels sharing the same upstream link. Keeping link capabilities in
struct msm_dp_panel would require each stream panel to maintain a copy
of the same link state, mixing shared link capabilities with per-panel
state.

Move the capabilities to struct msm_dp_link so that SST and MST use
the same link state. Rename link_info to link_caps to distinguish the
link capabilities from link_params used during link training.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  6 +++---
 drivers/gpu/drm/msm/dp/dp_debug.c   |  6 +++---
 drivers/gpu/drm/msm/dp/dp_display.c |  8 ++++----
 drivers/gpu/drm/msm/dp/dp_link.h    |  2 ++
 drivers/gpu/drm/msm/dp/dp_panel.c   | 22 ++++++++++++----------
 drivers/gpu/drm/msm/dp/dp_panel.h   |  2 --
 6 files changed, 24 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index e3ca0dfcfe9aa..8012c3d477113 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1749,7 +1749,7 @@ static int msm_dp_ctrl_link_lane_down_shift(struct msm_dp_ctrl_private *ctrl,
 		return -1;
 
 	ctrl->link->link_params.num_lanes /= 2;
-	ctrl->link->link_params.rate = panel->link_info.rate;
+	ctrl->link->link_params.rate = ctrl->link->link_caps.rate;
 
 	ctrl->link->phy_params.p_level = 0;
 	ctrl->link->phy_params.v_level = 0;
@@ -2553,7 +2553,7 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl,
 
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 
-	rate = panel->link_info.rate;
+	rate = ctrl->link->link_caps.rate;
 	pixel_rate = panel->msm_dp_mode.drm_mode.clock;
 
 	msm_dp_ctrl_core_clk_enable(&ctrl->msm_dp_ctrl);
@@ -2566,7 +2566,7 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl,
 	} else {
 		ctrl->link->link_params.rate = rate;
 		ctrl->link->link_params.num_lanes =
-			panel->link_info.num_lanes;
+			ctrl->link->link_caps.num_lanes;
 		if (panel->msm_dp_mode.out_fmt_is_yuv_420)
 			pixel_rate >>= 1;
 	}
diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
index 00fb1a7ba40ed..2a9ce77843bba 100644
--- a/drivers/gpu/drm/msm/dp/dp_debug.c
+++ b/drivers/gpu/drm/msm/dp/dp_debug.c
@@ -38,11 +38,11 @@ static int msm_dp_debug_show(struct seq_file *seq, void *p)
 
 	seq_printf(seq, "\tname = %s\n", DEBUG_NAME);
 	seq_printf(seq, "\tdrm_dp_link\n\t\trate = %u\n",
-			debug->panel->link_info.rate);
+			debug->link->link_caps.rate);
 	seq_printf(seq, "\t\tnum_lanes = %u\n",
-			debug->panel->link_info.num_lanes);
+			debug->link->link_caps.num_lanes);
 	seq_printf(seq, "\t\tcapabilities = %lu\n",
-			debug->panel->link_info.capabilities);
+			debug->link->link_caps.capabilities);
 	seq_printf(seq, "\tdp_panel_info:\n\t\tactive = %dx%d\n",
 			drm_mode->hdisplay,
 			drm_mode->vdisplay);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index fb72b77e9c95e..a77a286a24629 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -315,7 +315,7 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	 * set sink to normal operation mode -- D0
 	 * before dpcd read
 	 */
-	msm_dp_link_psm_config(dp->link, &dp->panel->link_info, false);
+	msm_dp_link_psm_config(dp->link, &dp->link->link_caps, false);
 
 	msm_dp_link_reset_phy_params_vx_px(dp->link);
 
@@ -813,7 +813,7 @@ enum drm_mode_status msm_dp_display_mode_valid(struct msm_dp *dp,
 	}
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
-	link_info = &msm_dp_display->panel->link_info;
+	link_info = &msm_dp_display->link->link_caps;
 
 	is_yuv_420 = drm_mode_is_420_only(&dp->connector->display_info, mode);
 
@@ -821,7 +821,7 @@ enum drm_mode_status msm_dp_display_mode_valid(struct msm_dp *dp,
 	 * YUV 420 is carried over DP by signalling the colorimetry through a
 	 * VSC SDP, so a 420-only mode cannot be driven without VSC SDP support.
 	 */
-	if (is_yuv_420 && !msm_dp_display->panel->vsc_sdp_supported)
+	if (is_yuv_420 && !msm_dp_display->link->vsc_sdp_supported)
 		return MODE_NO_420;
 
 	link_pclk_khz = is_yuv_420 ? mode_pclk_khz / 2 : mode_pclk_khz;
@@ -1653,7 +1653,7 @@ void msm_dp_display_unprepare(struct msm_dp *msm_dp_display)
 
 	/* dongle is still connected but sinks are disconnected */
 	if (dp->link->sink_count == 0)
-		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
+		msm_dp_link_psm_config(dp->link, &dp->link->link_caps, true);
 
 	msm_dp_ctrl_off_link(dp->ctrl, dp->panel);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_link.h b/drivers/gpu/drm/msm/dp/dp_link.h
index 76125e9c07e9c..80116d5c58be1 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.h
+++ b/drivers/gpu/drm/msm/dp/dp_link.h
@@ -75,7 +75,9 @@ struct msm_dp_link {
 	struct msm_dp_link_test_video test_video;
 	struct msm_dp_link_test_audio test_audio;
 	struct msm_dp_link_phy_params phy_params;
+	struct msm_dp_link_info link_caps;
 	struct msm_dp_link_info link_params;
+	bool vsc_sdp_supported;
 
 	u32 lane_map[DP_MAX_NUM_DP_LANES];
 	u32 max_dp_lanes;
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index bc7bad5ca3b18..dd650b3dc9172 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -193,13 +193,14 @@ static int msm_dp_panel_read_dpcd(struct msm_dp_panel *msm_dp_panel)
 	if (rc)
 		return rc;
 
-	msm_dp_panel->vsc_sdp_supported = drm_dp_vsc_sdp_supported(panel->aux, dpcd);
-	link_info = &msm_dp_panel->link_info;
+	link = panel->link;
+	link->vsc_sdp_supported = drm_dp_vsc_sdp_supported(panel->aux, dpcd);
+	link_info = &link->link_caps;
+	memset(link_info, 0, sizeof(*link_info));
 	link_info->revision = dpcd[DP_DPCD_REV];
 	major = (link_info->revision >> 4) & 0x0f;
 	minor = link_info->revision & 0x0f;
 
-	link = panel->link;
 	drm_dbg_dp(panel->drm_dev, "max_lanes=%d max_link_rate=%d\n",
 		   link->max_dp_lanes, link->max_dp_link_rate);
 
@@ -308,13 +309,15 @@ static int msm_dp_panel_read_dpcd(struct msm_dp_panel *msm_dp_panel)
 static u32 msm_dp_panel_get_supported_bpp(struct msm_dp_panel *msm_dp_panel,
 		u32 mode_edid_bpp, u32 mode_pclk_khz)
 {
+	struct msm_dp_panel_private *panel =
+		container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
 	const struct msm_dp_link_info *link_info;
 	const u32 max_supported_bpp = 30, min_supported_bpp = 18;
 	u32 bpp, data_rate_khz;
 
 	bpp = min(mode_edid_bpp, max_supported_bpp);
 
-	link_info = &msm_dp_panel->link_info;
+	link_info = &panel->link->link_caps;
 	data_rate_khz = link_info->num_lanes * link_info->rate * 8;
 
 	do {
@@ -346,12 +349,12 @@ int msm_dp_panel_read_link_caps(struct msm_dp_panel *msm_dp_panel,
 		return rc;
 	}
 
-	bw_code = drm_dp_link_rate_to_bw_code(msm_dp_panel->link_info.rate);
+	bw_code = drm_dp_link_rate_to_bw_code(panel->link->link_caps.rate);
 	if (!is_link_rate_valid(bw_code) ||
-			!is_lane_count_valid(msm_dp_panel->link_info.num_lanes) ||
+			!is_lane_count_valid(panel->link->link_caps.num_lanes) ||
 			(bw_code > msm_dp_panel->max_bw_code)) {
-		DRM_ERROR("Illegal link rate=%d lane=%d\n", msm_dp_panel->link_info.rate,
-				msm_dp_panel->link_info.num_lanes);
+		DRM_ERROR("Illegal link rate=%d lane=%d\n", panel->link->link_caps.rate,
+				panel->link->link_caps.num_lanes);
 		return -EINVAL;
 	}
 
@@ -770,7 +773,7 @@ int msm_dp_panel_init_panel_info(struct msm_dp_panel *msm_dp_panel,
 		!!(adjusted_mode->flags & DRM_MODE_FLAG_NHSYNC);
 	msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420 =
 		drm_mode_is_420_only(&msm_dp_panel->connector->display_info, adjusted_mode) &&
-		msm_dp_panel->vsc_sdp_supported;
+		panel->link->vsc_sdp_supported;
 
 	drm_mode = &msm_dp_panel->msm_dp_mode.drm_mode;
 
@@ -837,4 +840,3 @@ struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux
 
 	return msm_dp_panel;
 }
-
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index 9f34cc9010d38..7cb9eaeb34c7f 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -47,12 +47,10 @@ struct msm_dp_panel {
 	u8 dpcd[DP_RECEIVER_CAP_SIZE];
 	u8 downstream_ports[DP_MAX_DOWNSTREAM_PORTS];
 
-	struct msm_dp_link_info link_info;
 	struct drm_connector *connector;
 	struct msm_dp_display_mode msm_dp_mode;
 	struct msm_dp_panel_psr psr_cap;
 	bool video_test;
-	bool vsc_sdp_supported;
 	u32 hw_revision;
 
 	enum msm_dp_stream_id stream_id;

-- 
2.43.0

