Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076794;
	b=oYuRHSAIa1++0a2qqqs58Dv6FBiyfgA4o8uPNsgTfiNKB/Mp9disZspP0H4BbhHf4sZy
	 xoB3dvdTc4Pl9P8uj7v9LaziIPFQCwE1iYBrcZf1/cHLauh9Oyh7Jnf7A5CA7KS0tYn06
	 cceeqvfRg/9tTpfLdCdNxiJMdzZ3Y5W+ctqP0Ru1GxdmIdpAojqYfJTBmdkvMkfi/Kha3
	 qWywWRmN10vpZoSxPQ/H+4wk4VXO0Bnz8GIUFYG+9YRRXJvRrcxXmmAiZzL482pXy1OHJ
	 3m7n5bxQuiPD92IEZhJ5Omw+9Mx/BWUOs6OspUM5shZZoN9g3d4JEhGr9+k8RzMhzMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076794;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=n34FtriDPHYhRtxzNpwH6VAgPvi6RZa1jFcD39Mu3wA=;
	b=oB1zFGthNk+FzNbNX2Ds9c4N1tH7MoYgVrYbw0VUnPLC38HvnksD18aymqEWquHd0JtC
	 yDg9fgmp3wWanVfXslf/gU+nJjhsuMPV4e1x/D4Tg3nrEOZuCt4u81jUlx1Cq4n0zAkQz
	 bTcbeMKFbLxzGvFmOAgrh6aNyxWcRrkI3ohRJNM6FcgYOkufsnvW6sYoC9jPfbHrN3Or4
	 foSHzzrUGrI2+bnRRXF84mkNgn9qDY3hZg/ji9e1u9PuxDlEZeys2TN7DN1ivmNHWJgEQ
	 h3Nt0J7c12K8v9nsSis5W5Ah/7ClRln+ZCZoBZRlzOE2thKBj7HTwIJlanM/sFL5fSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EfweNC6o;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Tuj/u5C2";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCAC606A336
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:26:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DCAC606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EfweNC6o;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tuj/u5C2
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6vQ4g2194745
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:26:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n34FtriDPHYhRtxzNpwH6VAgPvi6RZa1jFcD39Mu3wA=; b=EfweNC6oJZAaaHpz
	0VCmHLel0dY2fa5kB7bjUKnnz8WAd1qMaxGoFM83BdKHxjnx+BGfDKNts/oI0Pvh
	lfcoapfHf+71cPdDCSo7MKO5ugJadRN4zXdlW5ZmUiXQej3r3d4Nch5SslOHkNo2
	91qyCHpGyMz/n+ELzSmQE+UwHiXV/ad9AOmYlQkDPKvxuOLCL8tk6TdLocimzrH7
	9+dK7HnHpDNu7DNyGlxUgadQWkkaOSauMfwvFGecYh9cqIkF0zksgyhiZ6Hw/zaQ
	+xFd1g1/tykEFQuKFC/V4VjZt9AjKWzLQuOxC2O0ynpwwyVm1dSW5pk6KdNbfhFc
	REc47Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1e5qv06j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:26:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f32050e72so520083885a.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795076793; x=1795681593; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n34FtriDPHYhRtxzNpwH6VAgPvi6RZa1jFcD39Mu3wA=;
        b=Tuj/u5C24P24C2LTOvhyTiHZX3CI3JTNumj8DPNkrKkbXemlcjKy5q3mEpGbVHqk84
         X713sW2iGLoQiN6ILPiuOYU4XwC5iGlgtTSM7v4bZYunc1204A5YugWKuosXsscRT+QR
         Fv6zNZzGpBung6Qwgwpbn7TkdtG9BDAlQpqKBJhuYssh3uxRBmVD4U/gPeJHk9ZiHLZV
         MQSu8TmqGiVU4lxcniVJj/qDHb2NBoVVtOvxr3gE1qebvHr3BNR4RgciWX7ITZkxisQa
         AtlYXdYrozb1W1Xd6IYeMdclIZrBqKCuemtBi7gSZ3fvQBV1A5BdeVGLBUXjg9jd54gi
         ku9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795076793; x=1795681593;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n34FtriDPHYhRtxzNpwH6VAgPvi6RZa1jFcD39Mu3wA=;
        b=E/yRVg7ESRAKDwJzYn7C4M0x+N0+ve4a8x3cBFSguZthicji3ptaVeEhkm4vybYx+9
         svU1bj3Ah0vQ4pG9EaaX4PPS6ecPW4XpnerXWiFGqf70vtjmiN/FXcDlxpjV9VCpSp9E
         fCRWoGj81AUlarddfbofDusFuarJlpqXxDHz6hQ5l1UGFbVEhofEQTYJ5AlQSV0etmA7
         JqGOmima0RXaYFfh+eq2Ku7Eko41rPUkLjBZYL94cyUP5nI1Mkc32irT0FVs7ilt0J47
         y2zS1BFZZ7k1lwI1rFBBJXQUYrSKcJc+i+qgpke4xFvTW0AVO3lWpDb3wsehsuExFUhR
         PEQg==
X-Forwarded-Encrypted: i=1; AL+hErH3lZ7Wcx5s+4dgcNXTrE2448sr6UVhBPmSkKjma1BYobETJqsjTdFT3sIuKeH1bkXN0fayh99Yb4R9CZ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vvnwVx9UlMxsQZyumjL+BkfR0xLNywi5XbrYqa9sq2au68IFx
	gW1aD4IGunrKCItE8B1MbMnRwgbt3R7iF2ZkT535uGKgGs5VHoh+n3rfWyLAq403BHSQSAnBi/R
	3FfpNYjoBPVwz0Gy+oY584nCSVbEkvPzs6k5SZKxZpqmFvErB9vabJuqP0I9y5cmYiJM=
X-Gm-Gg: AYBFou35QxDaY+txL1T69/4A/ABKdDB0zlX6/wZQfnaqLjVGveyItCgl4TW6768Th97
	iEOtt5Ra+cyvd3SfK8Dq7pWgPr07Io/Dmosegr+2CfMe43SRFcIllah0+buvFjhK1MwC6vtdAmM
	H7NEtu/1rguWC9LX/1VX5GCEfpnWe8diR5ZEVhvpRL/VGlkSwob60n/RiBu/xn0gmlUkK58s4oV
	RuKV5OTW6DwtmfufSfSMTCJo2uW5+0kq0LM1ljHGtHY7yyPAE+9iGV7+H0tAi4de3qvvyZMdHne
	jbwdNR/40U7eAeYwcdxO3zGFAW+TZbwsnNZYUpU+lrmL5RbcM5rAljxIdGXxuUBj3PP94pGs3sa
	a1Us1jZBXueUN7SYfC37+f1WMv/RZ9GjBr+RnLJZsRng04X3/wRVCffAd/7Ioow0VP4DHtE0I0l
	4wxCdUmEKPpHMSHy8+OWzYNcDm4Bdi4RzBRSDR
X-Received: by 2002:a05:620a:8386:b0:949:733e:dde5 with SMTP id af79cd13be357-9499962325emr939524785a.66.1795076792878;
        Thu, 19 Nov 2026 00:26:32 -0800 (PST)
X-Received: by 2002:a05:620a:8386:b0:949:733e:dde5 with SMTP id af79cd13be357-9499962325emr939521785a.66.1795076792363;
        Thu, 19 Nov 2026 00:26:32 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b721861sm388465185a.11.2026.11.19.00.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:26:32 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 16:24:26 +0800
Subject: [PATCH v9 24/29] drm/msm/dp: enable MST on capable sinks
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
Message-Id: <20261119-msm-dp-mst-v9-24-ca61be4edfc3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795076662; l=5632;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=UT83fDXKlWwm08ocOdb7kKRx0cJWpAsCm5S/klxYgoY=;
 b=NSehnPPBju7XZ1sx/gMv8QWcAwSI9xaBAhcvHRHDG82cIRQdRNgsCp7u3a5ZcJiJHTsjpmAW2
 HB5xIqw53JXA1VaY0/kbMV2B5ooSV5yIjmVIPDYb9WN3bPsS73x2/SA
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: -J41COA4kKK0F4-GrjY7i4FJWeA9_ZV9
X-Authority-Analysis: v=2.4 cv=c5Q+0h9l c=1 sm=1 tr=0 ts=6afeb2b9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=-w6CXN-5EBmt9i3D_LUA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfX22xb9C/dUJDT
 YQTDXkqFK2v/uATesNQiZZThBURzuaXbFiPzEiRfPNKZuyms0pvXzaQL5TSF18YB6lAX7e9YoL1
 lVYsx8NneDX+A+FOwCYBrnOgrCgY8Ps=
X-Proofpoint-GUID: -J41COA4kKK0F4-GrjY7i4FJWeA9_ZV9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfX6JEZv78yJqw3
 3D/L/NFs5ehVW10CeXt6FCmy7fGa7aGohqwLnzp2Sdlz/recZ9/C19jvS4aTjCGLh1EChUSmzzt
 OUeq5PA7LLW5AsNyhWGaepULiJJKtkYnOo6w95Pc84XyY+wm8cCiHDQ4u+luqEWffAQElaAcB6V
 mfRCsyLkMasDRZiaWjGrcwPbBhngvqFJFIFZOrBt+zUBvzsa2MOOx2Vwd8kLpcdw3DL9DvcDs0t
 NVdi4ZMmafcdoQBDfOohEs6X13D8Ew40KNMFIz91F04l5z0nVCfhnKhRUCAJa5fQNh49HRIOcmm
 4j/RHxkSWF8lwv1F/TrqDCkQCVK3bUDEUlpwn/g+2rZr8ujmWOCVfi7BDQFfjtr+1i3wjXO+RId
 caiKyP/AIvcFIkierEpQvfiX6qLgxUaa17fcLksp2vcy8BK/O3fkNpf5MdyuhFjm38ys0K9B6um
 LKxU6w/arPFweWJi1Jg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190033

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

MST topology discovery requires the sink to operate in MST mode.
Enable MST on sinks that advertise MST capability and are connected
to a multi-stream capable DP controller.

Once MST is enabled, downstream sink discovery and EDID retrieval are
handled through the MST topology rather than the primary DP connector.
Activate the MST topology manager on connect and disable it on
disconnect to track the sink topology lifecycle.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 52 ++++++++++++++++++++++++++++++++-----
 drivers/gpu/drm/msm/dp/dp_mst_drm.c | 15 +++++++++++
 drivers/gpu/drm/msm/dp/dp_mst_drm.h |  1 +
 3 files changed, 61 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 17487a7900d0..7f5247cbae03 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -14,6 +14,7 @@
 #include <linux/string_choices.h>
 #include <drm/display/drm_dp_aux_bus.h>
 #include <drm/display/drm_hdmi_audio_helper.h>
+#include <drm/display/drm_dp_mst_helper.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_panel.h>
 
@@ -270,10 +271,34 @@ static int msm_dp_display_lttpr_init(struct msm_dp_display_private *dp, u8 *dpcd
 	return lttpr_count;
 }
 
+static void msm_dp_display_mst_enable(struct msm_dp_display_private *dp)
+{
+	struct msm_dp *msm_dp = &dp->msm_dp_display;
+	int ret;
+
+	/* Clear any pre-existing MST state before enabling MST. */
+	ret = drm_dp_dpcd_write_byte(dp->aux, DP_MSTM_CTRL, 0);
+	if (ret < 0) {
+		DRM_ERROR("failed to clear DP_MSTM_CTRL, ret=%d\n", ret);
+		return;
+	}
+
+	ret = drm_dp_dpcd_write_byte(dp->aux, DP_MSTM_CTRL,
+				     DP_MST_EN | DP_UP_REQ_EN | DP_UPSTREAM_IS_SRC);
+	if (ret < 0) {
+		DRM_ERROR("sink MST enablement failed\n");
+		return;
+	}
+
+	msm_dp->mst_active = true;
+	msm_dp_mst_display_set_mgr_state(msm_dp, true);
+}
+
 static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 {
 	struct drm_connector *connector = dp->msm_dp_display.connector;
 	const struct drm_display_info *info = &connector->display_info;
+	enum drm_dp_mst_mode mst_mode = DRM_DP_SST;
 	int rc = 0;
 	u8 dpcd[DP_RECEIVER_CAP_SIZE];
 	const struct drm_edid *drm_edid = NULL;
@@ -288,14 +313,19 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	if (rc)
 		goto end;
 
-	drm_edid = drm_edid_read_ddc(connector, &dp->aux->ddc);
-	drm_edid_connector_update(connector, drm_edid);
+	if (msm_dp_ctrl_get_stream_cnt(dp->ctrl) > 1)
+		mst_mode = drm_dp_read_mst_cap(dp->aux, dp->panel->dpcd);
 
-	if (!drm_edid) {
-		DRM_ERROR("panel edid read failed\n");
-		/* check edid read fail is due to unplug */
-		if (!msm_dp_aux_is_link_connected(dp->aux))
-			return -ETIMEDOUT;
+	if (mst_mode != DRM_DP_MST) {
+		drm_edid = drm_edid_read_ddc(connector, &dp->aux->ddc);
+		drm_edid_connector_update(connector, drm_edid);
+
+		if (!drm_edid) {
+			DRM_ERROR("panel edid read failed\n");
+			/* check edid read fail is due to unplug */
+			if (!msm_dp_aux_is_link_connected(dp->aux))
+				return -ETIMEDOUT;
+		}
 	}
 
 	msm_dp_link_process_request(dp->link);
@@ -317,6 +347,9 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	 */
 	msm_dp_link_psm_config(dp->link, &dp->link->link_caps, false);
 
+	if (mst_mode == DRM_DP_MST)
+		msm_dp_display_mst_enable(dp);
+
 	msm_dp_link_reset_phy_params_vx_px(dp->link);
 
 end:
@@ -502,6 +535,11 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
 						 dp->panel->dpcd,
 						 dp->panel->downstream_ports);
 
+	if (dp->msm_dp_display.mst_active) {
+		msm_dp_mst_display_set_mgr_state(&dp->msm_dp_display, false);
+		dp->msm_dp_display.mst_active = false;
+	}
+
 	/* signal the disconnect event early to ensure proper teardown */
 	msm_dp_display_handle_plugged_change(&dp->msm_dp_display, false);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
index 15405080107f..2b96e003225d 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
@@ -362,6 +362,21 @@ int msm_dp_mst_attach_encoder(struct msm_dp *dp_display, unsigned int stream_id,
 	return 0;
 }
 
+int msm_dp_mst_display_set_mgr_state(struct msm_dp *dp_display, bool state)
+{
+	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
+	int rc;
+
+	rc = drm_dp_mst_topology_mgr_set_mst(&mst->mst_mgr, state);
+	if (rc < 0) {
+		drm_err(dp_display->drm_dev,
+			"[MST] failed to set topology mgr state to %d rc:%d\n", state, rc);
+	}
+
+	drm_dbg_kms(dp_display->drm_dev, "[MST] set_mgr_state state:%d\n", state);
+	return rc;
+}
+
 void msm_dp_mst_display_hpd_irq(struct msm_dp *dp_display)
 {
 	int rc;
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.h b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
index 3bd3e66b4eac..84de7ca0c689 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
@@ -12,6 +12,7 @@ int msm_dp_mst_mgr_init(struct msm_dp *dp_display, struct msm_dp_link *link,
 void msm_dp_mst_mgr_destroy(struct msm_dp *dp_display);
 int msm_dp_mst_attach_encoder(struct msm_dp *dp_display, unsigned int stream_id,
 			      struct drm_encoder *encoder);
+int msm_dp_mst_display_set_mgr_state(struct msm_dp *dp_display, bool state);
 void msm_dp_mst_display_hpd_irq(struct msm_dp *dp_display);
 
 #endif /* _DP_MST_DRM_H_ */

-- 
2.43.0

