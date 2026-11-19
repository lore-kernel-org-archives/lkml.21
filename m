Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076816;
	b=JIfFPLy9ytYRujglAVq8GIyY14XWzUxPzkBwrlQzsyCIHPEwTD92z98dajlkhqPV5Sut
	 ABYuybjehFu7uezB6fpB/rqXwzoF9w5Py9GNBJKz4P+qG+oDVay4ZCqwgjb5HDMrOpz8Z
	 CybadQDrgnk1yU9RvZuIkyrhJFLIFAeAnrLY4rCbyQPQvBEChniIREWKJ94wRIX0Yfo3F
	 iKEpQzKVwNxN32dIw6ZaOP3ccXJZYjEaJ/WzUYMicxZErjcA50zWiRXHO4TrcVMVcfLdM
	 YvXXIZtCx04VJtVjJ3DTF8R6Fy41F/4y/Gj6em7zkUVN+iRuBHM9w70YgeYPu+clU0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076816;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=muxNDysd90MgalYm4n1sorfJFmdorJypzxqVKfslRuw=;
	b=BpcjnRttdB3BO8rA6z0cGJjOzTWR9FMxQmPfaZfTxDM3WXPOMvTqmrflRUEz4WMZhKO2
	 l8DF+3WDzEwM2uDlYZf8nAgCFLKmSbya6UTxhrfiudtIE0RJhiTWpJ4xVf7IOXY7osbfi
	 aC4+U4ebML+5gfOKhNj1Hq3gkoG6PjrIQbfMuicpt1y7btBh68WUZ/FS/qnq6oM0kzVct
	 hXXajca4MD08RwEcREC2T4JLPjowty45rr1d4It4FZluKAdEX94pWbdUJzRZlwjC/DBD8
	 0k7Z3uL5IF81RdqZquNOiG0UcUvD+8V2Or6Qc5sfufXH5+h+5wekrEw8JJ7vyJwNICA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JxyhOMs7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Y/yTqXN7";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2796606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:26:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2796606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JxyhOMs7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y/yTqXN7
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6v5Yc1962395
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:26:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	muxNDysd90MgalYm4n1sorfJFmdorJypzxqVKfslRuw=; b=JxyhOMs7fwsAiMuP
	aRpYah+EYN026Dj9VYZ6xFSXh+an/l/erM3Eub9SnPYBWAmBCtkHFcKqztpgMYpF
	qMMqz4JM5UMOk0jy4c8rbK1dus3L+Cd4SA+I6XtfjdRU5mFnReu9b8+evAClP4fS
	lJKa7MqQ4I8BVGiPJ2/fTnowgqtA6Ih+1sW8Ld3zM2YJgzEEDjyiHGouafxYGjGI
	YNoGHcln6Yeaqp+1/AI3A86lgn7qmVXmu2RcGru60Jo1eVhnstH/8XYyRLadn/dl
	FI7AjZ+MObrOxGLOhw2kZRqBZjI4OfwkMYbeT0CSda3NDwCY3zXOkaA44t9b0Urr
	wfCf0w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1gxcu954-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:26:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f37c94ceeso126160885a.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795076814; x=1795681614; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=muxNDysd90MgalYm4n1sorfJFmdorJypzxqVKfslRuw=;
        b=Y/yTqXN7N6d1/XLGb+IyZDAtrvf6D8BIOYUktALTHMUMWCoMfJnCC0jdxeWNgZfz6m
         dKvCKsbTbu+PkTXR2YeMyWVOse55jsiVnlYTZLb8j4aOtljaIasbrJn7w2NBLXNX+WbF
         2de91VYpXI/pX4MHHUS1Ynmmn67S4yE+z3WEAbUgXaQP8Uqw/uOFmaVeyN4R2OnbBuqF
         YeucY2mj7tZSgLFd087/h3OJqyw9b+B816m1ylAfFU1DNNbVTNG8gRZ6d8DCr+7w+vwk
         nvf1lz7EDPlqsyEBwGNNBHGDq+yghs6ohuWG/meL2qTDcIJkXUU1syzf7iRg0j8ta1d1
         u+Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795076814; x=1795681614;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=muxNDysd90MgalYm4n1sorfJFmdorJypzxqVKfslRuw=;
        b=Ha/cUi0qnGlUxjB5SZwNZjWwh8EjU2Zkw/eP818KP9YFB7kL9XmXi9kaMMGcMgdmLq
         f3Gsl+Yp7FRGpDnM9gYrM2I++H2CieCzWzCHgSnVGGdmzZdv6FjpvPwFZlMOkuamAjhO
         Hd3mQW1zsDJhU+arjX2uYZgGmMxVZxF43iutVENdM8AtTya/UKw9wnarTa5wnMUsqNDk
         km4Tu1g7VVyvcRE0N7iuGwBcYJwPNaQqVYQWNV1y2YH3FxOKjsKO+i0V5uFaEF5TiFQU
         LRuy4uRslnj55omxMCg+HGOFfd+HSHCQYjqictnGDzXKLhlXentmHGpIhl8b+bMItw9S
         nk3A==
X-Forwarded-Encrypted: i=1; AL+hErGpfT169rkUV3uXRjWNAIolEhaj9yOh/9GdMQPIJcXlA5hbiuJHtwDfqNCuHDk2+0lYmNGeZtQ6VtI3hHM=@vger.kernel.org
X-Gm-Message-State: APuU4Z90ikARH0Ve2YcVHkXiL5OuNiDiiaupjMcLWjTYZPLmm79v5pVr
	82EJO0def/BBFlDJQ5t5Q1fAPQNWe+1uiRg8lEX1VXDGJdf1WknGiOuPzJBAgkHyLuAldnC2hvs
	H0KwS2rtRKK013JbPV9BpkZgPjbkCWFc8hX2wcS0Fg+5p6hsN8DJzLeCN6Ssuy7Jaeqc=
X-Gm-Gg: AYBFou2L/lp6cy9Hv2JhdI2gm89NAgou75pEqw+YEs8qk/YKy0Hc/U7XTOMvvL0qwEu
	SkoR75wiE4T8VmiYajRAkjt+4bQe+nk3b559MFIONYgcQocLM/MJABm+ClNTkZDzuxDk5g1RUoR
	wQ0zx5aLgpDdETnkomOu1f4RJGT+XoCELspYrFIcYylSsokhoHUgIXW1wcbwwOBH/U+u9F4/ktz
	lUTaVolrT4Fqb7wnaHeFaorceWGdIVPmqiYXxUGrcFBXPJ28zVie1WKmT4lAbW3TAJw6W/VqHQy
	oPN45TKLUQwDkWwnqtSULopAi3diFHOlxlfxTsK0aPMcfRhjXwwlG3on6sW3aydvSHG3l4k16Bk
	d9OKn6AytDIyNKDUrDTICs6upvzZX4PQ3qqzvzl1pVs5FbknKP826O4DWvbOX0ehCDetmez45ql
	g3jG/NS27ateG88LlMTSspqZwrO/8ejqmLJPx1
X-Received: by 2002:a05:620a:4142:b0:93e:5534:e63 with SMTP id af79cd13be357-949b341d736mr55715685a.13.1795076813815;
        Thu, 19 Nov 2026 00:26:53 -0800 (PST)
X-Received: by 2002:a05:620a:4142:b0:93e:5534:e63 with SMTP id af79cd13be357-949b341d736mr55712685a.13.1795076813048;
        Thu, 19 Nov 2026 00:26:53 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b721861sm388465185a.11.2026.11.19.00.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:26:52 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 16:24:30 +0800
Subject: [PATCH v9 28/29] drm/msm/dp: select MST stream bpp during atomic
 check
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
Message-Id: <20261119-msm-dp-mst-v9-28-ca61be4edfc3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795076662; l=10659;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=d6VZv6VSnLlkoweiz4xAD64ra9RSZWWxEBNveN4I+Po=;
 b=QEVcW+Q3Ywj7Q2/PYaDNZY6JANxiCADyIUZKwPHMTYYBlH6DPngfdZa/AbsmoliVD0aCjy51B
 7xR2VO99jiaCS4LGAQunUuso37Ko7ugsmbRlplNdt8CebA168PkGo8J
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=LZapeTfi c=1 sm=1 tr=0 ts=6afeb2ce cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=JPqAu_mP4Hh-pTAkM0kA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: foqpW1EMOKQLuFC4LStTUW3PMQ-4NnKR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfX4CJkoa17f/ZY
 fKwSDCkLIQ4DTNsTx0bDy71qKUeRHUcwlCntfrDOJUwENcH4HlCNmbufDK67Cujxt2DlY3KdqNT
 yht4oGzV6FgUsbhUlNCR+mNMEOwqa8dbnc5iVRxhZfzYXbZrpaobycVLlGgt8dwrFgyZ6z1B/wx
 E/Z6vUrwzrGNixTY8Z8gbPu+JsxXLvL9tX5vzBHvc9rXu3/Pmf6QtFCqMZJ/XdJouBo4u+q45XU
 wJneJPlNAB3xNyjMqqONKH9erpIkfidbvkuzSRrGi81ve1m12+Ico3Ui+8xViKibjLTTulpKT6M
 NNm+/0VT6fHkzY6vxwlJldfIiwgFn3njKWoAViQOG23xkT2AvU3FgnxpoBWcX4kJIjajcaNXVrX
 /TCle2jdHduOJHr2Ukvan86Pv0TfLVYdCm1ttOKOgZyO2wXP/rTSDQwJfY02i+DoDTKGrFhXzL+
 lHbSb7oiCmmCaajZ9uw==
X-Proofpoint-GUID: foqpW1EMOKQLuFC4LStTUW3PMQ-4NnKR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfXx/rtEtCu6Rx1
 91rrpqv7tnsV6yQmPpxwhunCJoc9BhcgF1AU1/VHCa2r2whoW49POWaKkEkAueLVZYmdv0OzOwy
 sDVfFqwrBFfhzsoaAPv1ncwGsFympzE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190033

MST streams share one link, so each stream reserves a share of the
link's time slots during the atomic check, sized from the bpp the stream
will be driven at. That size was derived from the sink's bit depth,
without checking that it fits the bandwidth of the MST port or the time
slots left on the link. When it does not fit, the modeset fails rather
than driving the stream at a lower bpp.

Try 30, 24 and 18 bpp in turn and take the first one that fits. This is
the sequence msm_dp_panel_get_supported_bpp() already walks for SST,
where the whole link belongs to a single stream. Carry the selected bpp
in a connector state subclass so the commit programs the bpp the
reservation was sized for.

drm_dp_atomic_find_time_slots() only records the request and does not
report a full link, so compare the time slots it returns against the
ones the link has. The aggregate limits are verified later by
drm_dp_mst_atomic_check().

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c |  22 ++++---
 drivers/gpu/drm/msm/dp/dp_display.h |   3 +-
 drivers/gpu/drm/msm/dp/dp_mst_drm.c | 116 ++++++++++++++++++++++++++++++++----
 3 files changed, 119 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 69d5ec4e175e..8825437a41f2 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -693,17 +693,19 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
 
 static int msm_dp_display_set_mode(struct msm_dp *msm_dp_display,
 				   const struct drm_display_mode *adjusted_mode,
-				   struct msm_dp_panel *msm_dp_panel)
+				   struct msm_dp_panel *msm_dp_panel,
+				   u32 bpp)
 {
 	struct msm_dp_display_private *dp;
-	u32 bpp;
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
-	if (msm_dp_display_check_video_test(msm_dp_display))
-		bpp = msm_dp_display_get_test_bpp(msm_dp_display);
-	else
-		bpp = msm_dp_panel->connector->display_info.bpc * 3;
+	if (!bpp) {
+		if (msm_dp_display_check_video_test(msm_dp_display))
+			bpp = msm_dp_display_get_test_bpp(msm_dp_display);
+		else
+			bpp = msm_dp_panel->connector->display_info.bpc * 3;
+	}
 
 	msm_dp_panel_init_panel_info(msm_dp_panel, adjusted_mode, bpp ? bpp : 24);
 
@@ -1604,7 +1606,8 @@ int msm_dp_modeset_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 int msm_dp_display_set_mode_helper(struct msm_dp *msm_dp_display,
 				   struct drm_atomic_commit *state,
 				   struct drm_encoder *drm_encoder,
-				   struct msm_dp_panel *msm_dp_panel)
+				   struct msm_dp_panel *msm_dp_panel,
+				   u32 bpp)
 {
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *crtc_state;
@@ -1614,7 +1617,8 @@ int msm_dp_display_set_mode_helper(struct msm_dp *msm_dp_display,
 		return 0;
 	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 
-	return msm_dp_display_set_mode(msm_dp_display, &crtc_state->adjusted_mode, msm_dp_panel);
+	return msm_dp_display_set_mode(msm_dp_display, &crtc_state->adjusted_mode,
+				       msm_dp_panel, bpp);
 }
 
 void msm_dp_display_atomic_pre_enable(struct msm_dp *msm_dp_display,
@@ -1626,7 +1630,7 @@ void msm_dp_display_atomic_pre_enable(struct msm_dp *msm_dp_display,
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
 	rc = msm_dp_display_set_mode_helper(msm_dp_display, state,
-					    msm_dp_display->bridge->encoder, dp->panel);
+					    msm_dp_display->bridge->encoder, dp->panel, 0);
 	if (rc) {
 		DRM_ERROR("Failed to perform a mode set, rc=%d\n", rc);
 		return;
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 62400547e01a..7a50367c36a5 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -57,7 +57,8 @@ void msm_dp_display_atomic_post_disable_helper(struct msm_dp *msm_dp_display,
 int msm_dp_display_set_mode_helper(struct msm_dp *msm_dp_display,
 				   struct drm_atomic_commit *state,
 				   struct drm_encoder *drm_encoder,
-				   struct msm_dp_panel *msm_dp_panel);
+				   struct msm_dp_panel *msm_dp_panel,
+				   u32 bpp);
 int msm_dp_display_prepare_link(struct msm_dp *msm_dp_display);
 void msm_dp_display_unprepare(struct msm_dp *dp);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
index 2b96e003225d..a452b3d2ba22 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
@@ -23,6 +23,14 @@ struct msm_dp_mst_connector {
 	struct msm_dp_mst *dp_mst;
 };
 
+struct msm_dp_mst_connector_state {
+	struct drm_connector_state base;
+	u32 bpp;
+};
+
+#define to_msm_dp_mst_connector_state(x) \
+	container_of((x), struct msm_dp_mst_connector_state, base)
+
 struct msm_dp_mst_encoder {
 	struct drm_encoder *enc;
 	int stream_id;
@@ -51,12 +59,51 @@ static void dp_mst_connector_destroy(struct drm_connector *connector)
 	kfree(mst_conn);
 }
 
+static void msm_dp_mst_connector_reset(struct drm_connector *connector)
+{
+	struct msm_dp_mst_connector_state *mst_state = kzalloc_obj(*mst_state);
+
+	if (connector->state)
+		__drm_atomic_helper_connector_destroy_state(connector->state);
+
+	kfree(connector->state);
+	__drm_atomic_helper_connector_reset(connector, mst_state ? &mst_state->base : NULL);
+}
+
+static struct drm_connector_state *
+msm_dp_mst_connector_duplicate_state(struct drm_connector *connector)
+{
+	struct msm_dp_mst_connector_state *old_state, *new_state;
+
+	if (drm_WARN_ON(connector->dev, !connector->state))
+		return NULL;
+
+	old_state = to_msm_dp_mst_connector_state(connector->state);
+	new_state = kmemdup(old_state, sizeof(*new_state), GFP_KERNEL);
+	if (!new_state)
+		return NULL;
+
+	__drm_atomic_helper_connector_duplicate_state(connector, &new_state->base);
+
+	return &new_state->base;
+}
+
+static void msm_dp_mst_connector_destroy_state(struct drm_connector *connector,
+					       struct drm_connector_state *state)
+{
+	struct msm_dp_mst_connector_state *mst_state =
+		to_msm_dp_mst_connector_state(state);
+
+	__drm_atomic_helper_connector_destroy_state(&mst_state->base);
+	kfree(mst_state);
+}
+
 static const struct drm_connector_funcs msm_dp_drm_mst_connector_funcs = {
-	.reset = drm_atomic_helper_connector_reset,
+	.reset = msm_dp_mst_connector_reset,
 	.destroy = dp_mst_connector_destroy,
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+	.atomic_duplicate_state = msm_dp_mst_connector_duplicate_state,
+	.atomic_destroy_state = msm_dp_mst_connector_destroy_state,
 };
 
 /* DP MST Connector OPs */
@@ -142,6 +189,42 @@ static int msm_dp_mst_connector_atomic_check(struct drm_connector *connector,
 	return drm_dp_atomic_release_time_slots(state, &mst->mst_mgr, mst_conn->mst_port);
 }
 
+static int msm_dp_mst_select_bpp(struct drm_atomic_commit *state,
+				 struct msm_dp_mst *mst,
+				 const struct drm_dp_mst_topology_state *mst_state,
+				 struct drm_dp_mst_port *port,
+				 const struct drm_display_mode *mode,
+				 u32 max_bpp, u32 *bpp)
+{
+	static const u32 bpps[] = { 30, 24, 18 };
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(bpps); i++) {
+		int pbn, slots;
+
+		if (bpps[i] > max_bpp)
+			continue;
+
+		pbn = drm_dp_calc_pbn_mode(mode->clock, bpps[i] << 4);
+		if (pbn > port->full_pbn)
+			continue;
+
+		slots = drm_dp_atomic_find_time_slots(state, &mst->mst_mgr, port, pbn);
+		if (slots < 0)
+			return slots;
+
+		if (slots <= mst_state->total_avail_slots) {
+			drm_dbg_kms(mst->msm_dp->drm_dev,
+				    "[MST] bpp=%u pbn=%d slots=%d\n",
+				    bpps[i], pbn, slots);
+			*bpp = bpps[i];
+			return 0;
+		}
+	}
+
+	return -ENOSPC;
+}
+
 static struct msm_dp_panel *msm_dp_mst_panel_from_encoder(struct msm_dp_mst *mst,
 							   struct drm_encoder *enc)
 {
@@ -204,6 +287,9 @@ void msm_dp_mst_stream_enable(struct drm_encoder *encoder,
 		drm_atomic_get_new_mst_topology_state(state, &mst->mst_mgr);
 	struct drm_dp_mst_atomic_payload *payload =
 		drm_atomic_get_mst_payload_state(mst_state, port);
+	struct msm_dp_mst_connector_state *mst_conn_state =
+		to_msm_dp_mst_connector_state(drm_atomic_get_new_connector_state(state,
+									 connector));
 	struct msm_dp_mst_slot_info slots[DP_STREAM_MAX] = {};
 	int rc;
 
@@ -212,7 +298,8 @@ void msm_dp_mst_stream_enable(struct drm_encoder *encoder,
 	drm_connector_get(connector);
 	panel->connector = connector;
 
-	rc = msm_dp_display_set_mode_helper(dp_display, state, encoder, panel);
+	rc = msm_dp_display_set_mode_helper(dp_display, state, encoder, panel,
+					mst_conn_state->bpp);
 	if (rc) {
 		drm_err(dp_display->drm_dev,
 			"[MST] stream:%u set_mode failed rc=%d\n", panel->stream_id, rc);
@@ -311,9 +398,12 @@ int msm_dp_mst_stream_atomic_check(struct drm_encoder *enc,
 				   struct drm_connector_state *conn_state)
 {
 	struct msm_dp_mst_connector *mst_conn = to_dp_mst_connector(conn_state->connector);
+	struct msm_dp_mst_connector_state *mst_conn_state =
+		to_msm_dp_mst_connector_state(conn_state);
 	struct msm_dp_mst *mst = mst_conn->dp_mst;
 	struct drm_dp_mst_topology_state *mst_state;
-	int bpp, pbn, slots;
+	u32 bpp, max_bpp;
+	int rc;
 
 	if (!conn_state->crtc)
 		return 0;
@@ -321,9 +411,6 @@ int msm_dp_mst_stream_atomic_check(struct drm_encoder *enc,
 	if (!drm_atomic_crtc_needs_modeset(crtc_state) || !crtc_state->active)
 		return 0;
 
-	bpp = (conn_state->connector->display_info.bpc * 3) ?: 24; /* fallback: assume 8bpc */
-	pbn = drm_dp_calc_pbn_mode(crtc_state->mode.clock, bpp << 4);
-
 	mst_state = drm_atomic_get_mst_topology_state(crtc_state->state, &mst->mst_mgr);
 	if (IS_ERR(mst_state))
 		return PTR_ERR(mst_state);
@@ -334,10 +421,15 @@ int msm_dp_mst_stream_atomic_check(struct drm_encoder *enc,
 						 mst->link->link_caps.num_lanes);
 	}
 
-	slots = drm_dp_atomic_find_time_slots(crtc_state->state, &mst->mst_mgr,
-					      mst_conn->mst_port, pbn);
-	if (slots < 0)
-		return slots;
+	max_bpp = clamp(conn_state->connector->display_info.bpc ?: 8, 6, 10) * 3;
+
+	rc = msm_dp_mst_select_bpp(crtc_state->state, mst, mst_state,
+				   mst_conn->mst_port, &crtc_state->adjusted_mode,
+				   max_bpp, &bpp);
+	if (rc)
+		return rc;
+
+	mst_conn_state->bpp = bpp;
 
 	return 0;
 }

-- 
2.43.0

