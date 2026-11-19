Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076729;
	b=140QTBV6a7NGcG3oJ20OcR/SShk6/7Xyne6WEnFpFFJlsvFwUIwb6RL8N0DEXN9shLkV
	 wBmJ08MQCRn8EaZwN3cEMHFaGXTD5JUL43ns2a1C+AICpyzdAQwv7nLDasDBLX9rwglXH
	 Z66SbS6hhmuz2MvhGeN+SNeUXc62X6qUgVyIB0XKfim53pRPuzxzkJBIFjvB7pt/mo+O1
	 Za3rLcKH28Nmzu0I2RH/+LS8ff6FZ290wO1Jef75mW7e7EFTixavGBxFy2MUBaN40uX+Q
	 9NC+yjlTk+pUhLHl8x2Nn1pMUcGnrxcMCW2hkJJ25e5yz1K+cgPkzBN8MSg/WI6n/iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076729;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=o7qUy0HvlvFPx895X7DXakonDGCAik9Q8QwzBTv5YkI=;
	b=cErMGrsAMTqq+6aLBBtyMjPdlItMOs+AHwrUphErMU2JXd4Z7GKBIyl4lZvsszqdPp9Z
	 XlO8t1fQWFQx+8iNll+LsLCY7Qx7sfnA1jYFON1L3amQhBo1Fkm+WQNOBIjGEunqUhL/X
	 ELgW2h5t5s9/YhGUvtaaA6KiV3omrUEaD2zcaac+b78VaQhCd3qRNjHHrMlCptGaac+i+
	 2Lr1V49e/4DxWZwa9sTxszRbNiP7ZNEizx8WzxC6WCu/VvXNR9IG92Pr3AfkIj4xD1RHM
	 iixUwwJaypjzBGYpdjXbzBUtszqxL9z2e9S53wX7Je+p6dza3eetO80asiUg+ySic2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LhLz8bQm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VM3kHo2t;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC19606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:25:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AC19606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LhLz8bQm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VM3kHo2t
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6vQAc2671922
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:25:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o7qUy0HvlvFPx895X7DXakonDGCAik9Q8QwzBTv5YkI=; b=LhLz8bQmSBppmM2B
	A5X1ak2qE7N7akZeCFoKRbbOQj7EuR2/uMqO98rp0clczIUEE+89XZenbHdGkXlJ
	nfLev7K7C9PFGBAUi2AnXZINQ6A2JDGMps/9x3OT/NG1f82Kl3exscmhfd+ZAl6W
	46HfkMqtSeBS4s97UeLPuMbmRQzHa+wCKEEFvPrkdxbxFa4IdsyZ1zrd1Er3FqTi
	QegFPZwDWfk9ufUdLOJqAIs/pTCgeQZu9g7tw1Tn5R+Vn33rlpRJb1WU7RvVYWwr
	dZ/swSlL001N0kQasiYk7yS3JGD1XIrRe7hKzm06gal3tmYa2bpWvXitqsbYccEP
	lbnz0g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1g9p3fs7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:25:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f6f4fe531so323026885a.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795076727; x=1795681527; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o7qUy0HvlvFPx895X7DXakonDGCAik9Q8QwzBTv5YkI=;
        b=VM3kHo2t7zIdneyQSSVYE0dN13F+i2jxG20o46IVvvIW41UEhqI186EyO9ZsZq1raA
         fQi1eY93BbNWG5L4Ge6j3VnhiJmlxbjNrX5gI2E9Z1I4pcnuA86VG0q2flBrU0QLcRwh
         LYHXRlHhyYecPTccbuc0iuFTPSc02H2gC51QMoKBreOqpK3r6qTUlal39tuT/R4XBOew
         WFQZRNhfu2duKkXF23f0XsQ7xZdvhsXu6RjTaociKcUnyxs8KVKua6d5SDxBp637rCNR
         rXey1F8Nzd2l4SQT7q/ncCDFBYO0b1XfSOPdKuleEyg5eqkSExnID5mt3J2QF2bjaMWa
         l77w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795076727; x=1795681527;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o7qUy0HvlvFPx895X7DXakonDGCAik9Q8QwzBTv5YkI=;
        b=Paw+qk7fvyDjj0gT6ew9Pv/K17oPiEETJp5GpdGeJ5BTZYsvzqv+ahGcVrupc13Qt/
         TNLWt5liTAup0pWubTCDTzVypwfiul0IKd+WzSoEXjGUEeZ29gop3wusbbEAOppT/AML
         dup0kNx2KSyF2GCSFZ8ZJ2LMUv5EOs2y9yQTxVs6yPlDPhDCa+KK921OsaF4vFqzGn2T
         CFv6u/xJOL7inHF6dr7B8OSA3wTCkEgXadLIXwbiekHjkHYTSIrQ16EwqDUqnTycXjMM
         VvHLwIOihUKwUa+3Qma25N7NbygS84KI6KayONo479tKg3HyBMI+JGxJ14BczUoZT8as
         2TyQ==
X-Forwarded-Encrypted: i=1; AL+hErG8M9RygdhpEVvw7MoKyNFnemRV8gau52oEjKfP3UzcFZiKdi98tLFOY5KBYGcYVcOftzAOmLRwUmAp8KE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0k9lgm0v4UOymOWkFC29JdBtAFJrbyQBGSxt2nyuA5B/MGdsY
	qJHR3IEV8vwqpIdrwJZi2gsNXfxkpFcsJ16JuCup2nA8I3YyQjNWhJurFw4JnZRTyJTTFzVuAdP
	V+sXJqYhjL2wFJihS9ECWk4LXes7fFkDQ8iML0ChwjUUSSdDV/3AqL7nrL+5+g77XFWcboHqx+W
	yilA==
X-Gm-Gg: AYBFou1mxhC6oMU8YfOIy9IRNPzDfkjfxSX3OqIJkdbTJhWFp7O+mAku+cUB/TlKTs9
	/EQFVf6SMxf2/1mk9Q/hslDp2xDVxk47rMmsyMVCj2pkzGazrqSruSXXs2CecJ2GYdo260X7Pgf
	tRfC1hGZDfoLBR0PqN0Umd/k6Mno059IyYzIYQazPZaiPcvDqpGb/ZsAE7KhAHKTOGRlNcO69e7
	j5FzbZY3UDyPvFxHzd+ekAQH47H6TXe6y05+VGXaa03NCvnWNGuPU0aO4XklTP3/x9X4NYHJFMw
	uxPq2pGuhdlpAjX5Z6o6+R6NnFaCWe2Oob4k8NRPifivcFTf/8I8AHhR6N5j2i8Z1AjucL9j54K
	G+sG+Biu0R/YPP7YzEbDQENX6aRdfjcV+nKA0hWSsqlx1sgr5Jkdg7ZyTwrAx8rbE42H5aKtOTP
	+SyrUMYj9t+oQ6XiKaDP2NDkSptMJG5T+5n9cB
X-Received: by 2002:a05:620a:28d6:b0:949:664e:e3e8 with SMTP id af79cd13be357-949997274acmr1001046285a.34.1795076727265;
        Thu, 19 Nov 2026 00:25:27 -0800 (PST)
X-Received: by 2002:a05:620a:28d6:b0:949:664e:e3e8 with SMTP id af79cd13be357-949997274acmr1001043185a.34.1795076726825;
        Thu, 19 Nov 2026 00:25:26 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b721861sm388465185a.11.2026.11.19.00.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:25:26 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 16:24:13 +0800
Subject: [PATCH v9 11/29] drm/msm/dp: add msm_dp_display_get_panel() to
 initialize DP panel
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
Message-Id: <20261119-msm-dp-mst-v9-11-ca61be4edfc3@oss.qualcomm.com>
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
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795076662; l=3825;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=8dXh7kevZYuIf/EU/BTs/0N8fVWktZ9YOwTAYB0jJQM=;
 b=Qnzn/Crmjsg37VxiYwfrU/Elr3oFWpLhpq3Pbi5cz8hI/ttX4qzrstwHcMSUZhj2bcKkei9fn
 f2trFg2VFfTChoEu2WETS1ZTB/cjJC8j8WlIAtDEC4GurgXO8n1rX/T
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: nAUBd0bt-ExSa0no2WfRaJlMlcUpY-3I
X-Authority-Analysis: v=2.4 cv=LooHWXdc c=1 sm=1 tr=0 ts=6afeb277 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=kCKOgzAXqFYlHSlaV6AA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfXz9BHVifiWizp
 9rdZmV630+qQBJrLuVeUVnbDAv4dJ6Mx4i6JDrgCwFimMHHkirGRpUN+gaIQIRUC7DC0zr3ZtSz
 cpQfPeLYsYyvZGErwRinDrugktYqx9+5oBZyHRB6vm9P7i7z9oi7VK4QEVJmB0kzHl2IBeqBC99
 DBpFJKXwDRUKClnNkN9KWMabzGQSDPERT0vGMfKBQPMDAXUBstnYeAWfAIAJiwRL3uC+A1G/fgS
 Kd4j7pNdWQwFAstIJ5/Ks1Sq0b85Og+6oko/XZ4blM63x2MAnIdLzR4HZJsgbiDWY/HyE+qaDLu
 FpNunRpQbyl9wDCnidwHLB5cqunPMPH+Xijtw2PX3t6xw0rfi+CNEQh6sFD0QCBJCg+iZEydInv
 0ScRRIr0yqcVDZpedrUYDnnWlG6ebU6IVrcKByPgNZdq07YknbGaA0WT7wqiW0FSCl3MYP/FdDs
 //tjWlKTSsbB75LJcLw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfX0B5AXqQ6xfb6
 +zkiiyOspmpEiv1p7NRKccO7lKHTHnr6JCizwRR1++/E39aa1Z3XwlITOl4yETh9ISjQfm1YVA4
 ohotT43XnwtYosKGGF0mo2Az5ABpdNU=
X-Proofpoint-GUID: nAUBd0bt-ExSa0no2WfRaJlMlcUpY-3I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0 phishscore=0
 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190033

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Add an API msm_dp_display_get_panel() to initialize and return a DP
panel to be used by DP MST module. Since some of the fields of
DP panel are private, dp_display module needs to initialize these
parts and return the panel back.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  9 +++++++++
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  1 +
 drivers/gpu/drm/msm/dp/dp_display.c | 27 +++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_display.h |  2 ++
 4 files changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index a9d0956a9751..e3ca0dfcfe9a 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -3129,6 +3129,15 @@ bool msm_dp_ctrl_stream_clks_on(struct msm_dp_ctrl *msm_dp_ctrl,
 	return ctrl->stream_clks_on[stream_id];
 }
 
+int msm_dp_ctrl_get_stream_cnt(struct msm_dp_ctrl *msm_dp_ctrl)
+{
+	struct msm_dp_ctrl_private *ctrl;
+
+	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
+
+	return ctrl->num_pixel_clks;
+}
+
 struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link,
 			struct drm_dp_aux *aux,
 			struct phy *phy,
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 9478f127c6d3..8db5f714519d 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -61,6 +61,7 @@ void msm_dp_ctrl_disable_irq(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl);
 bool msm_dp_ctrl_stream_clks_on(struct msm_dp_ctrl *dp_ctrl,
 				enum msm_dp_stream_id stream_id);
+int msm_dp_ctrl_get_stream_cnt(struct msm_dp_ctrl *dp_ctrl);
 int msm_dp_ctrl_mst_send_act(struct msm_dp_ctrl *msm_dp_ctrl,
 			     struct msm_dp_panel *panel);
 void msm_dp_ctrl_mst_timeslot_setup(struct msm_dp_ctrl *msm_dp_ctrl,
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 544b76e2c6f6..d3d798a1da1a 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -536,6 +536,33 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp)
 	return rc;
 }
 
+struct msm_dp_panel *msm_dp_display_get_panel(struct msm_dp *msm_dp_display,
+					      enum msm_dp_stream_id stream_id)
+{
+	struct msm_dp_display_private *dp;
+	struct msm_dp_panel *dp_panel;
+
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+
+	if (stream_id >= msm_dp_ctrl_get_stream_cnt(dp->ctrl)) {
+		DRM_ERROR("invalid stream_id %d\n", stream_id);
+		return NULL;
+	}
+
+	dp_panel = msm_dp_panel_get(&dp->msm_dp_display.pdev->dev, dp->aux, dp->link,
+				    dp->link_base, dp->mst2link_base, dp->mst3link_base,
+				    dp->pixel_base[stream_id]);
+
+	if (IS_ERR(dp_panel)) {
+		DRM_ERROR("failed to initialize panel\n");
+		return NULL;
+	}
+
+	dp_panel->stream_id = stream_id;
+
+	return dp_panel;
+}
+
 static void msm_dp_display_deinit_sub_modules(struct msm_dp_display_private *dp)
 {
 	msm_dp_audio_put(dp->audio);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index b0b7570cb16c..96be45c3dc92 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -59,4 +59,6 @@ int msm_dp_display_set_mode_helper(struct msm_dp *msm_dp_display,
 int msm_dp_display_prepare_link(struct msm_dp *msm_dp_display);
 void msm_dp_display_unprepare(struct msm_dp *dp);
 
+struct msm_dp_panel *msm_dp_display_get_panel(struct msm_dp *msm_dp_display,
+					      enum msm_dp_stream_id stream_id);
 #endif /* _DP_DISPLAY_H_ */

-- 
2.43.0

