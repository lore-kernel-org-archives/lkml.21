Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076682;
	b=ADvhHxQ0L0VDaUmZCbSEZtMtDGyzicuPa66f7blxgoZq/Qvkvfc1/3/kEJgTTjyeT3Cc
	 J5jHoj93sKvyLe0SrYUefDoD5tec4ZUdwhjcA0EN3/kyCIEOaHmRJmm8wocyjxumg9mlH
	 kxsJqaWfswP3542o+vkiZet0mvjKacxq6me/CH014yDtcO8+Ai+MEmripND7l4s/+ExqG
	 tryeOSPFkUEP8MNmlFbzI1Snob4jsIfmoiCeyndmmGtGBR3z6K4UDX6QjsziphOote275
	 pESp4IFgMOe/f4m0j3bhHVj6vwcHGkgcnY5rIjW4cq3ZRL0E7TuUt25J+hwjdpUOylA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076682;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZH8g5O7xKZ8B/5uGCTIRgFSOntIBxLOYrFe+k+/F1Kg=;
	b=0EGIiot0PKThCarfY651t1Z+jOJkx9eXZBySm3MyFktUjPGsCBxTtUE07wqgURh3YCVi
	 9nc/WiQdVqIBqGDCl7ohdfXbsjz/xXUamOOjHBDEepewpWnN2i5Cz3+1M6iOn56IVi5B4
	 YfBKC1m7vWeOWeU5x8xXX9B0g8zPVBndf/f+pe43X9ool9S/tn//OV9zvaiLbC+zOApnt
	 ELCk0KHBdg8JjE7bNzlXsv2WltUD0JL+ZDp6FJ+wduj8tRxm0VWXFh24T3XF3Byj21sBk
	 AVYkTHMeX06yEHMr4zIqT+cupqACTstwTM+GiGZUYEB1LLc1X/d99U+fahblyv/zUkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PQhDaIx3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b85vQg2M;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF09606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:24:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BF09606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PQhDaIx3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b85vQg2M
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6wJox1007300
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:24:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZH8g5O7xKZ8B/5uGCTIRgFSOntIBxLOYrFe+k+/F1Kg=; b=PQhDaIx34f5igQzz
	fb/racrc4Kj1eUdohsR4x//9ypXftx+cPyuy3Q3O2Ov9rs1iERD7/+W+0kySR16n
	2NondoLpQq/n1PZIWt4GaM4Lqw5mBBzsxczIjIHjgVkQOavxFIBkNMogR4izdYfr
	AEd8uRsO7nYBZCMh7h+xigFdMIImxhh3bzm3sIKpBMnlKLjHvrT0/dBHqORwpjsp
	nfxxkpLZQ6q1ruDxlb4WSCfcPzCmqEjHyc8tvL6Hmt79lR/+1OeQ6tsBOkRkV78g
	I8je17vf0jl3LM/QsiIQo4hpVcACXj4a9wSv9JdSbjbLfmsTyzdP3tVPZIMHqp+f
	eVxa8w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1etnus6q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:24:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9308eafb465so454858785a.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795076680; x=1795681480; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZH8g5O7xKZ8B/5uGCTIRgFSOntIBxLOYrFe+k+/F1Kg=;
        b=b85vQg2M4nQmlMi5eQHK7V/Mp4Fo8i7vn4XCjXTjtHywvV6g7LGMMVGRuGd+U5z9uw
         +Mub2pdlJPMsp/LnNejgNaC9nHYxStNsgRSxr109dFvWaTIt/smMmGe47XGrX7zhBgp0
         1MiHSEbA6q5hOsPBd7IMcmWXh0ulCoPqa/tO1ZoXKGKR3fHy+dfKN599cXkW/Vzmq9/o
         0v7G8Ex3tbVbMjiRqf2Uf5wlFTdZqL+WzYcInIi2SfbjQ0wvHm0G73ngLCH8j9PdmvBW
         PZfvhMfKRrx0tSWEy0FHMsNYRaUfAAdvjciViMXoHWfOXG3O98Ywin5DNh9k5h6qI0f6
         bdzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795076680; x=1795681480;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZH8g5O7xKZ8B/5uGCTIRgFSOntIBxLOYrFe+k+/F1Kg=;
        b=rmVW1PN0YcXrfABpVkQMgx7ua5iBfO10lTts9TqyDxrD2pXq2/iMKnCA0/J7dm4Um1
         sOi8ZY+Tt6143WJHXESr6Fm7XFNWyNXHSKli1aRmsPMtQjw7TfFyAp/EVzxshNH8zbIW
         FottRhTtpfVXiFcWK6Tsnc+o+mQAhYktp5cqqlLCl7xmRGfGTBiMoey2qGXdavsDZyxi
         jD+5wRMSJCBW7rzNy/rggJQVjKpTnyBZHFGTJRjPnLibk+fYqfeKP/YajEJIEPKpfrss
         mfaw7kKXIy7Dz7wlX9UYo4UbiScke3hK2tviHf+LxRT9rdaTlaSj/a5o8ylZ6V3Q+IkJ
         uGOg==
X-Forwarded-Encrypted: i=1; AL+hErEMMVSU8+OejhBAjp8nEi/HYKE6UjGDtAleG9vpmLo2ceJzZ/RzZuxEq+AcdmRGTXOpZtDaPYnngfttF8A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8VSFUBzrnpmRRvbCcF9riWNGK0zfB5g2w/e24ktJHRcDsv8hcV
	hGuZXcoLgs2JcHpKxZP9F3Ic2F7Qp1eqkq+lctN5iTh1RIgm02cQdQrYbhDVGzmUtghkpoFRvC8
	OyNhz/cszZu4mix1vp6RC59fxD3bJD0z3SC/ZnduOf3djz20CDRPDlhtbgC+LtJPlod8=
X-Gm-Gg: AYBFou2lbwQCTEkwE84q4dlrSfIvh35/DdtOq4LEdX57X4/VevWC/rCf9nKO43pf2/S
	XNYj8BowlbTszOv0eS7cn1cb4dqPWx27lZN3m6K6VG3c7i6mKMNPn4BksWP4kkE6LWG/fVsP0hY
	hAdTq+zWbNTEPg0ljngiX3fkBKDEn2BOEVvH5zH6uV/oLNDviu7sx7x2jdI+QCOVbix10pPxRVu
	OrVdrVMaDfPotqmjT1x+zfkEIV+v3FmfuNHf+k3zhG8HI94zljlrfAxBBz3zef3zhLah2K53apR
	/MiBDWho5+9lRtHgdjhH4OQyS7QintHSMiou0Ks3oRnlsS9sXB1OB6HEkSOYna2fT06KN4NNdFV
	5lAD+zLUhH9Nrkzppr27mAAuOD6fYQOA4kmKhDIMy/KxEESNRiGdHS4M9S8FXzbdqv5vsgRtoSV
	hg0mpgjd95EXNZaQBttGAVK1/DSz+gXYp3pgbI
X-Received: by 2002:a05:620a:199b:b0:93e:bcbf:4ad with SMTP id af79cd13be357-949995b3038mr899388285a.33.1795076679633;
        Thu, 19 Nov 2026 00:24:39 -0800 (PST)
X-Received: by 2002:a05:620a:199b:b0:93e:bcbf:4ad with SMTP id af79cd13be357-949995b3038mr899386085a.33.1795076679178;
        Thu, 19 Nov 2026 00:24:39 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b721861sm388465185a.11.2026.11.19.00.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:24:38 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 16:24:04 +0800
Subject: [PATCH v9 02/29] drm/msm/dp: add support to send ACT packets for
 MST
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
Message-Id: <20261119-msm-dp-mst-v9-2-ca61be4edfc3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795076662; l=7052;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=54CLADPkO1fN9/Xb9//dtv4gcTRKYDDXr98jRbYT/UY=;
 b=dvdCGqSL4JZFf/15f9H0YK8YhldT1R8jO1ne+Jsnl2+I+Hog3BfOeIlGhMPwGL2MpakJsBqIy
 p8kWVSJm661DekOtyK/HTwPPDSDlkBpNN1BSceuyVLawoFOGHYd34B1
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=b8UncdGx c=1 sm=1 tr=0 ts=6afeb248 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=F2S7ry5v5sxRTjZyeP4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: QPsIaESsX2lIf1PMShmJWBH4ZZOkI4nw
X-Proofpoint-ORIG-GUID: QPsIaESsX2lIf1PMShmJWBH4ZZOkI4nw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfX+tfwNnMq4Axr
 +nAZBXNE4HFUY+j6D+NlKkDFVjMliT2AGnl9vazmJlRreUzLh0LtBnkzIKGcCQ7+jvSNrjbgocv
 5kL/W99e5FBYCp7q0PwHsPBUOxKu7KE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfXzoA6d6K9XNzT
 MfO9Pa6SWRE9oOxIGOj8rmndTpn+4RXwtKSN/S53gpVmzjvoAVYx3A3SOrv3AV3YY6IoXcqvOMa
 be2vr8/EK3KSSm6Jmqub+lsxRIIsvxIulKFfGKq9ydxXOIriQfVDbZoHSu+v/7X1hC88OMvp/HJ
 0qZ7JAvLfzCQy0qiQbKfOPAGw/x26vvrYwqKDN3c8raZ8/jrOMwcyCfe2gK1au8z08llARr6kAe
 Or1UF3HpaMVV5Cw4nqdiONdmScESg1w9ePJDmQ+2bQ7hrcgJCvjMSLZgyhjFLflEH+2dQLJ7Ai3
 tSkEgjv97BK9nhBQMLbUuPOsAKr8DXTITCiWa2U6X0KuO4KerUkdUO6wSvHLQ+PedzGe8k6ml1z
 OMPEw3HepLRdyMY0dip04NnfD/6NtfqEudwBLXmdagS6Qmb18F4ysetsbtLtvrum9F1yT0P0ky+
 Hee92n9Y7nf+luw7Kiw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190033

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Whenever virtual channel slot allocation changes, the DP
source must send the action control trigger sequence to notify
the sink about the same. This would be applicable during the
start and stop of the pixel stream. Add the infrastructure
to be able to send ACT packets for the DP controller when
operating in MST mode.

Add REG_DP_MST_ACT, the ACT trigger register used by this sequence.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 50 +++++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  5 +++-
 drivers/gpu/drm/msm/dp/dp_display.c |  3 ++-
 drivers/gpu/drm/msm/dp/dp_display.h |  1 +
 drivers/gpu/drm/msm/dp/dp_reg.h     |  1 +
 5 files changed, 56 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 32d4d5743eb36..1b4aaaca0ad99 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -142,6 +142,7 @@ struct msm_dp_ctrl_private {
 	bool core_clks_on;
 	bool link_clks_on;
 	bool stream_clks_on[DP_STREAM_MAX];
+	bool mst_mode;
 };
 
 static inline u32 msm_dp_read_ahb(const struct msm_dp_ctrl_private *ctrl, u32 offset)
@@ -244,6 +245,37 @@ static int msm_dp_aux_link_configure(struct drm_dp_aux *aux,
 	return err;
 }
 
+int msm_dp_ctrl_mst_send_act(struct msm_dp_ctrl *msm_dp_ctrl,
+			     struct msm_dp_panel *panel)
+{
+	struct msm_dp_ctrl_private *ctrl;
+	const struct drm_display_mode *mode;
+	u32 frame_time_ms;
+
+	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
+
+	if (!ctrl->mst_mode)
+		return 0;
+
+	mode = &panel->msm_dp_mode.drm_mode;
+	frame_time_ms = DIV_ROUND_UP_ULL((u64)mode->htotal * mode->vtotal,
+					 mode->clock) + 1;
+
+	msm_dp_write_link(ctrl, REG_DP_MST_ACT, 0x1);
+	/* make sure ACT signal is performed */
+	wmb();
+
+	msleep(frame_time_ms);
+
+	/* Hardware clears this bit after sending 4 ACT headers */
+	if (msm_dp_read_link(ctrl, REG_DP_MST_ACT)) {
+		drm_dbg_dp(ctrl->drm_dev, "MST ACT trigger complete failed\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 /*
  * NOTE: resetting DP controller will also clear any pending HPD related interrupts
  */
@@ -2623,7 +2655,8 @@ int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl,
 	return ret;
 }
 
-int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *panel)
+int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *panel,
+			  bool mst_active)
 {
 	int ret = 0;
 	bool mainlink_ready = false;
@@ -2635,6 +2668,8 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 
+	ctrl->mst_mode = mst_active;
+
 	pixel_rate = panel->msm_dp_mode.drm_mode.clock;
 
 	if (msm_dp_ctrl->wide_bus_en || panel->msm_dp_mode.out_fmt_is_yuv_420)
@@ -2666,15 +2701,23 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 
 	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
 
+	ret = msm_dp_ctrl_mst_send_act(msm_dp_ctrl, panel);
+	if (ret)
+		goto err_pclk;
+
 	ret = msm_dp_ctrl_wait4video_ready(ctrl);
 	if (ret)
-		return ret;
+		goto err_pclk;
 
 	mainlink_ready = msm_dp_ctrl_mainlink_ready(ctrl);
 	drm_dbg_dp(ctrl->drm_dev,
 		"mainlink %s\n", mainlink_ready ? "READY" : "NOT READY");
 
 	return ret;
+
+err_pclk:
+	msm_dp_ctrl_off_pixel_clk(msm_dp_ctrl, panel->stream_id);
+	return ret;
 }
 
 void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl)
@@ -2703,6 +2746,8 @@ void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl,
 
 	msm_dp_ctrl_reset(&ctrl->msm_dp_ctrl, panel);
 
+	ctrl->mst_mode = false;
+
 	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
 
 	phy_power_off(phy);
@@ -2882,6 +2927,7 @@ struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link
 	ctrl->link_base = link_base;
 	ctrl->mst2link_base = mst2link_base;
 	ctrl->mst3link_base = mst3link_base;
+	ctrl->mst_mode = false;
 
 	ret = msm_dp_ctrl_clk_init(&ctrl->msm_dp_ctrl);
 	if (ret) {
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 80d9258501b49..41a69447001cd 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -18,7 +18,8 @@ struct phy;
 
 int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl,
 			struct msm_dp_panel *panel);
-int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *panel);
+int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *panel,
+			  bool mst_active);
 int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl,
 				  struct msm_dp_panel *panel,
 				  bool force_link_train);
@@ -59,4 +60,6 @@ void msm_dp_ctrl_disable_irq(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl);
 bool msm_dp_ctrl_stream_clks_on(struct msm_dp_ctrl *dp_ctrl,
 				enum msm_dp_stream_id stream_id);
+int msm_dp_ctrl_mst_send_act(struct msm_dp_ctrl *msm_dp_ctrl,
+			     struct msm_dp_panel *panel);
 #endif /* _DP_CTRL_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index ed899fcc91891..4862d0b42f290 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -679,7 +679,7 @@ static int msm_dp_display_enable(struct msm_dp_display_private *dp,
 		return 0;
 	}
 
-	rc = msm_dp_ctrl_on_stream(dp->ctrl, msm_dp_panel);
+	rc = msm_dp_ctrl_on_stream(dp->ctrl, msm_dp_panel, msm_dp_display->mst_active);
 	if (!rc)
 		msm_dp_display->power_on = true;
 
@@ -1525,6 +1525,7 @@ void msm_dp_display_atomic_disable(struct msm_dp *dp)
 		return;
 
 	msm_dp_ctrl_push_idle(msm_dp_display->ctrl);
+	msm_dp_ctrl_mst_send_act(msm_dp_display->ctrl, msm_dp_display->panel);
 }
 
 static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 83117e7619f31..472429d092009 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -19,6 +19,7 @@ struct msm_dp {
 	struct drm_bridge *bridge;
 	bool audio_enabled;
 	bool power_on;
+	bool mst_active;
 	unsigned int connector_type;
 	bool is_edp;
 
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index 265da58e064cc..9263e61c794c8 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -330,6 +330,7 @@
 #define MMSS_DP1_SDP_CFG3			(0x000004e8)
 #define REG_DP_DP0_RG				(0x000004f8)
 #define REG_DP_DP1_RG				(0x000004fc)
+#define REG_DP_MST_ACT				(0x00000500)
 
 #define MMSS_DP_BIST_ENABLE			(0x00000000)
 #define DP_BIST_ENABLE_DPBIST_EN		(0x00000001)

-- 
2.43.0

