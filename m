Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076687;
	b=T3A2d4kMzh8dNljWyCvrNMMM15Y4nFkYTQUA1NWvxpMBHioxX24JB3Xl1KuxOhLy27gF
	 9KpmdiZFy9DHcfA1vKfOU4RFzEhsFWyv1h4G3M5+tJmtTWczH9GcOglRwiRNITLPyGMuW
	 8A/91sU6dG8t9J2b1EnBtpzPiVfyuG9RXrgVicuBmh7Dwba+PAJrXJ56LwImPuvNvXqVI
	 jcTU9U5Xe/x7rhOImpPFzJ6Uz/irZ9FyuO07bBwsr5KFLoQz1vRJbbq9m6as7Bs2dykyQ
	 CIBSrbD/Sas+qN/weLqJWT+AFsUW/eujaArdokrn09bmAD7s226mIUCL1timLnRmU+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076687;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=IdfU8FQPwAdn6E5eXYkFX4YWCsIg6Ob6rPzCVbT0A8o=;
	b=HH8SvVszQNDhU8FqvWsAxatrJcBum0ABpK9aqAKwhk4KvSeiTUIjzvn4ErX1gSf56Wld
	 ex8b5koOE+L842gYxApV0icMmvcQ3X7SxTlUf3gCVLaMFne7X4Oo1cg0ENOgPhf3pPvKa
	 tHPMkGS2xISNsKa91gc0eM1yuoVah05B2j6nNAhyAesrpsPg8ClOsRXWkIc8Rsp8BdpSJ
	 SmwoDHMyx00NBGVFhsNZdjBLeYdfz1Xk945LZoRUC58cYTh0/XlBikTM9uuXmqMtHs52a
	 SDfK9FgvmDEhsKwp6WO/4IQODCB58JaM8zrGtJPcxlmznF2fAlgclbJfh2wGs6LKkfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hL02yzLW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AJxDUp5E;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA21606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:24:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFA21606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hL02yzLW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AJxDUp5E
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6vWaH330673
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:24:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IdfU8FQPwAdn6E5eXYkFX4YWCsIg6Ob6rPzCVbT0A8o=; b=hL02yzLWQLQ8t6Ym
	fCgun6qT58zLeLa4SQFqCjQNPASvtjpkn8bq3gbOkjFIKR3EYX7+39lzCTWHo4Vl
	DL0b0pxyIkFlAOB/tx3w5gNWl7Cua7wPNr4JuFxLhm3XJ8XXMR5ENWca40VTcntS
	hgn9q2k68OQisbUZxnG1kjxuC75KTl9uJVqJBXT8OflGZWNnTDw7+H6XL6S2Tnkk
	4y1PqkXIC9yCbupR34J3Dg8+Nmg6woqpaPgUDQiJ1wld1GBacLTLBl8ZVTXt879a
	ciqtlIjoJzj0rqSR4chRndTByFqRigiM9oZ6BVVe0FiGnW2cwI1JrwCCZ9Pz3cuk
	xdkaXw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1fpnkg80-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:24:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9495dd0f07eso393103485a.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795076685; x=1795681485; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IdfU8FQPwAdn6E5eXYkFX4YWCsIg6Ob6rPzCVbT0A8o=;
        b=AJxDUp5EtrkV+zKVlkAJa622HUcY3/X6zs83cd1jOuzL5u2mYAisZ3KN+nOViGxUGq
         CeWXg7Vlt7er3R8uOmIPD+5inb32CB3DfYCaSs67ABY55KBJKfOUZREB9O9BH6MAr4n/
         iVa7KOzcKJ/RvBatqJfHN20hNvo44zxX57z/wYjEYYKaXHNjijXf7IujDVyu34vmqemp
         HbMTjgvXWs+sRKr/rPHFR7jNGoR+A2tOh0D0m63BaFpxfcnb4QzjKZc8k2vMVmP/L2Tz
         s+h4jLSeN2Gkvj0PiCsexwuXF4TGSELA5//ZHe9bt4FV8C6nUT3lAvFUiKUQTOAIxBpl
         QrDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795076685; x=1795681485;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IdfU8FQPwAdn6E5eXYkFX4YWCsIg6Ob6rPzCVbT0A8o=;
        b=nLrxo70yIt/DOC7Ir2XFbu2JulTwxQQWunf60FirUUDw5A2G+WbQ1280B6QxpT5xud
         6xmcQDh6n3ZSndVEsyRflpVDDRC584r9HeGpGwjFfudshvkEc59KN98kDjvE3rzNkGxz
         8BOyxbbFh2BC06GfrrtooZgZTuTVf8ZQT1Lo3ARdzoGZ6HxLx6aYaz0nnC1Ifa/rM4lz
         bUIkA1VCGjjn+PoRTVsm84BSZOXlTUJabKxi3EscOZm0jULUR2+aief5aPsN2O5UTczQ
         AijMyZYV6iH+nftMLnUXqp8gMZXBTLB1AfA5+9uM+jxzDT42YvloWFpN3UU6tdBw8+ab
         AGnQ==
X-Forwarded-Encrypted: i=1; AL+hErHbMMI6tAaChMvVItgRUKl2ou/ZzhHxu0GJ/uBlYdY0i6SeRQrlt+LQrEmTYdA5af8TZgAeT2joC/Pitro=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bQhkJLOgXWOW6+m9HZgudKkb/8v0LFxm2jA0RDVcsYalstRHW
	Yd9jgR/+4lvPWKSnRJa/4gmlWGjs6WHUroHyzX9sjj97PjA3/28PheGOQRDDziIpVK16qPEqq/S
	jklpdqvAnPRAJKemYg9R8t9IX8qokUHqrHEjE+aU6kNbohQgLfXUFKyUFuYxBfuHgvuM=
X-Gm-Gg: AYBFou28dUI6X9VEt0jgTvRcNxYkAfSToKI+rC99IvR4gxAigptJbY9sHNFWqoJGxT+
	FjaeSs1c19HUqtjXO+S/RrOi2E7ErxKMHDQj8VfB73OFkm2+01Q3CBxmlHzAt7y4iq4FlNaFAqf
	t0Ah4KtHxS8qAhymPwhXmCLwEG0JR8mA25dEcA820/c4OlJkKuIjOz4rOIHZQap65pWhVzSi71K
	BjJjbkWgq4+SGutpDm3puMhILfM5Z807rkULvo6xvPtizuq13LHMHqYpSjoXhZ4TQdYUvi0xaXm
	0vy95mlGY1uzgKcRJB5S9LeOQjqXgLeyMfmQlmEqRIN5pL7NSeAcfFbXalz4+rE3Z9RdTTy3ogO
	EBiPdfrJqKQf5ZwhofQQDnRb6Cd7racOSnK3OYpL5uVjEwe62qowWMsob6RT6z/38ruJ2KUAVmF
	oMPOempkaLimqMQ8TvKJOgoS+j66/YJU+su1ki
X-Received: by 2002:a05:620a:31a6:b0:93e:94a4:a97d with SMTP id af79cd13be357-9499936579bmr934125985a.0.1795076684995;
        Thu, 19 Nov 2026 00:24:44 -0800 (PST)
X-Received: by 2002:a05:620a:31a6:b0:93e:94a4:a97d with SMTP id af79cd13be357-9499936579bmr934122685a.0.1795076684327;
        Thu, 19 Nov 2026 00:24:44 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b721861sm388465185a.11.2026.11.19.00.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:24:44 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 16:24:05 +0800
Subject: [PATCH v9 03/29] drm/msm/dp: add support to enable MST in mainlink
 control
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
Message-Id: <20261119-msm-dp-mst-v9-3-ca61be4edfc3@oss.qualcomm.com>
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
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795076662; l=2559;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=SI7t4mGgwxefYt5oEm4+FHizneptrfaRYKYBLcB7QfQ=;
 b=mu7tfErkysXH9unfeTL7MVtpWwREec9rmRChsg5QNEKNPjrg3sK0Er8oobQu2vHUafSrxE6kS
 kGXpr0kJOS+DisNEGmnIl3w0DE+5kG8BEZhbPj/mLP0oJvuM//lPZCL
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: UH49cCYXhlNU1T5nL8DUBQsN0emISfDG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfX4g6mAF6uhkP8
 NP0SE6OJK7mGxVyJ+p+M26m5JhJDVVKlCJqKfr7d0yju7LRVU5UGxXJBVkwWdfQgmKm/bL2DUf3
 iNkBfBBYDg83W/CO6G5oUTGhd/uG+Ci+V2Bjamr8wnP2gYG7pY1rOnIDlEGqaRBwBvVlNmZlWqh
 vr/oUEdLdkpx/a5Li1zTeoyCd92iynYM2Llyt7BSxE7GEkYskTAMShAlTSBHOEaS+xBQ7cJnir9
 +y9MwZUt8BxPanwRuCy3TDpqLLuAJAMuJMpUkfMGoT8jlePVZW+mxlb5CamqKuq9x3OVdIdaD5Q
 BLP1uE18OVYOsE/N9RH+KzCH63II8CKuRz3+zky3ZgBahaUarBbu0zoSNJUXMGSf2VuUS3xJ7U9
 yz8HQGTRTKqIEx1eeSXp25t/dlN7TyJgR/GAgaAkpx6KLjtTyw9Hu5wp43kWD1lwlME1I9uU/m/
 UHO7bkv2CMdlumCgmYw==
X-Proofpoint-ORIG-GUID: UH49cCYXhlNU1T5nL8DUBQsN0emISfDG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfXwU6//eQLfJGg
 U4W1abBZw8eeeCsHEBTL7rRgXb0SIcheIFBftRTuBlG9teZWP3emyLzeQx5/vZkZFpleHnNtmFS
 nFymk1c+UfGsvTZQmQabAMZnQcLjJCc=
X-Authority-Analysis: v=2.4 cv=PJ6aavqC c=1 sm=1 tr=0 ts=6afeb24e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=GJT6Fafo9oTAj6z5dyEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190033

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Add support to program the MST enable bit in the mainlink control
register when an MST session is active or being disabled.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 16 ++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_reg.h  |  4 ++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 1b4aaaca0ad99..41c6536526958 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -276,6 +276,19 @@ int msm_dp_ctrl_mst_send_act(struct msm_dp_ctrl *msm_dp_ctrl,
 	return 0;
 }
 
+static void msm_dp_ctrl_mst_config(struct msm_dp_ctrl_private *ctrl, bool enable)
+{
+	u32 mainlink_ctrl;
+
+	mainlink_ctrl = msm_dp_read_link(ctrl, REG_DP_MAINLINK_CTRL);
+	if (enable)
+		mainlink_ctrl |= DP_MAINLINK_CTRL_MST_EN;
+	else
+		mainlink_ctrl &= ~DP_MAINLINK_CTRL_MST_EN;
+
+	msm_dp_write_link(ctrl, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
+}
+
 /*
  * NOTE: resetting DP controller will also clear any pending HPD related interrupts
  */
@@ -2689,6 +2702,8 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 
 	msm_dp_ctrl_lane_mapping(ctrl);
 	msm_dp_setup_peripheral_flush(ctrl);
+	if (ctrl->mst_mode)
+		msm_dp_ctrl_mst_config(ctrl, true);
 
 	msm_dp_ctrl_configure_source_params(ctrl, panel);
 
@@ -2743,6 +2758,7 @@ void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl,
 	phy = ctrl->phy;
 
 	msm_dp_ctrl_mainlink_disable(ctrl);
+	msm_dp_ctrl_mst_config(ctrl, false);
 
 	msm_dp_ctrl_reset(&ctrl->msm_dp_ctrl, panel);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index 9263e61c794c8..cc74b1ed628ec 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -128,6 +128,10 @@
 #define DP_MAINLINK_FLUSH_MODE_UPDATE_SDP	FIELD_PREP(DP_MAINLINK_CTRL_FLUSH_MODE_MASK, 1)
 #define DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE	FIELD_PREP(DP_MAINLINK_CTRL_FLUSH_MODE_MASK, 3)
 #define DP_MAINLINK_FB_BOUNDARY_SEL		(0x02000000)
+#define DP_MAINLINK_CTRL_ECF_MODE		BIT(26)
+#define DP_MAINLINK_CTRL_MST_ACTIVE		BIT(8)
+#define DP_MAINLINK_CTRL_MST_EN			(DP_MAINLINK_CTRL_ECF_MODE | \
+						DP_MAINLINK_CTRL_MST_ACTIVE)
 
 #define REG_DP_STATE_CTRL			(0x00000004)
 #define DP_STATE_CTRL_LINK_TRAINING_PATTERN1	(0x00000001)

-- 
2.43.0

