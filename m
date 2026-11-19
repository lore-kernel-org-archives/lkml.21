Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076779;
	b=TPg3O73R8iI73BH18bu8oE6+sxSib2gr3TbWbcNYFSmEdFxdrPmmqmLfanCt/RWKbUG4
	 Y6tIsF4pIrNumBMblvaItkJhb6ae4dzJnbf2Swa9C5c5ciHyWacO3G+6Yw509KBOaJVZ0
	 WO2S2SjlC2aWDjule6BYpoa9v26m5X9ldhVkSgcmh6d4/BE7vjQkuLOZ7vwcHnoN4Wzuk
	 tD7rJUK0EN7YBZmPi5ZIB6kKxd6MIfXqfdVVnjx/pNGNLRUarX6SgiezjZeHzIzPw+1oV
	 xSYyIuTIpqT1Sm+zinn0bHCrC04pmqCX618l+bqwtxkGeuh638GsfTvDJomPLFSUFPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076779;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4eVE8ncFYWRc1l8YtvIlOlgRd2mH+LH7ZL0TkktaXXE=;
	b=slMn7BHcO8wwHp50dShX80UJZnpv+nUhs562rn/qPDLthfbbysCVrIJxfEUYtwHBLsLT
	 WV/bwKKaROORaMTMWkiW5nSHuJ/UhyTsDSraMM+CIm8/2HkC9ObCpWhiCyyCFUNh0kckG
	 oA0FmaxVxinRtn8kPtZWZPg7DA+Zzy/8ypwdNowWowDb/OGiAQWRsXKv9wEELOR714LN/
	 mVZ8AsiMSPBtnxgWgPW9vzqKFq3TLO1bWn6rLd+n1CcXdhoC0N6Z4EAI3biaz+f6XbPmM
	 fbxCQb+STF3EEV6mlP+BMRb68kofP821ANpdttlKGGFJzizwRqfgQcg2oTgSTBpRLMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pp1J00u9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dre0TCay;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B235606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:26:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B235606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pp1J00u9;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dre0TCay
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6vDmu2935509
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:26:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4eVE8ncFYWRc1l8YtvIlOlgRd2mH+LH7ZL0TkktaXXE=; b=Pp1J00u9fA8SJCDx
	ggblVMUXKNxb8ybWFKYkzggI3UNVukysf7YCkcnJ08vZezSGm/6NVqp/6+tBbjAQ
	uAK65K+9mhHzt1a9weB5fjp/OvaOtcFIMKHdQMJeU9lMA+6MEXWY1A1HoJQwN2C/
	ODnMrlRQnm43kGsHZsemrWT4d7hLHnXKom1JhlR7Ljsas86yllhP4LkDwDJHiQqq
	BlFdunlRFLXbFzoyz1mVpT8mMLfZGcsnB025N5NLwkr6XHVQNO9gJrNT1dGiMIxE
	kOA8FLxZxA9qkSPHkmJDBYvcsCzHGCrZi7LnIurlzMA/0YDXTgbAuzGkY28ix6ce
	9YMjrw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1g9ekcp4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:26:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-949b0d322fcso48518285a.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795076777; x=1795681577; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4eVE8ncFYWRc1l8YtvIlOlgRd2mH+LH7ZL0TkktaXXE=;
        b=Dre0TCayyRTq0kWVG2dle/dIPa/j3QWS9fyNh8xJa6ni0PScQHHHzJ0ObiiuJ34j3H
         v6st8bMBkOZfxkY6eS5smiVGhgZpJUWR4bo29kfHe2yd/EC3RhK9TRvNoQ+P/V7Tus1t
         cBnXsq5LsK/d81E4Y+VrAL/cBEAbfAKGRG0zNDPzArmwE+AQY+Rhw1b5b7ingDXeUDA0
         6kUMxeP+C3/O7DR2q+WSqoRJMIdHJB2KYLT0DUJy4gwFBCK0SW3ADKm+5KPO9GQpa3ka
         ENA9stUTQo/SwBnjpkaOIg5OzQqU6MVAzu3tQhsTDKTqHJbworA8MWO6l56z2aa7zLKC
         xB1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795076777; x=1795681577;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4eVE8ncFYWRc1l8YtvIlOlgRd2mH+LH7ZL0TkktaXXE=;
        b=NvIkE3+OA1mANAzu1OSZbVNv7kXppr6YXIPx03JlsKFVgYCIVoggH1cfWvMTa3+Qvj
         wMxVC4f1fCFHlM78jHfXVGC79kMskFI5KpZONekqa93zhGguurbq++zsZjQJcW3zxpkJ
         AWBGaXaFyxSb73o2rcLvrsSk7GOenGS/thjxTFD4AjpxDCaBX1wWTAUHX1o99vQDZ/25
         Woj1WXTt8OBWs7I1Q4gYqlWPN9eo3hIqDBD5/WCDzlBWd2koHNAArS8tHPuJ3+zQCY/R
         GixG2JrcHQcpUpv4l2RBntgkJ8NoEEA09LZKsDtrT+BisUI2vGZurgSEAAK+McDTPvYh
         84/Q==
X-Forwarded-Encrypted: i=1; AL+hErHFimCNw8aAki8Y1Bg90GZZ7jUYaLnYyFmxhO4va6V8HUAV83w4PcTjFo0ILY6RVBRCrp6ZgpKtsod1JkI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8R839fiHYgj9mvpnbkujOs9p7UjJsWyQtAZHErTMTUoULrRDgD
	vXPM8xBdMPB35SFhQdsTjcK/7audq4Dw9qyn/LMaS9xlfdrTOAOJrkqZ/OqvSK9uRINw69uUsvn
	s22OhHEJpKGyeqqXbN4mgxi6OlJNntNw2uQrsVc7LgjsVNa8Rkrg/ByEeAiKXgmCjecU=
X-Gm-Gg: AYBFou14wN2JT9AqqcssdqlQawZE9JdK+4wUGMehjTKZO6ytehcd6b/4x7gaAoVAJfi
	hy5nm7dJ5CwWsyT3dDqPMdKyuVNcLQpDqJpdnJhNGfhm7jb2f3NmP6a1IFloahGdGVOeWI1U0Fn
	xxNIvmeySYN0PJviGO5f5hCk3G+4Sd9cIUnGoRh/pd8/jjUfEsNyF2nZHWK03+z29GUjosHfgq9
	XzrzVAn+BymRTfNOx0TbdzaLoalN/mdEa0BxO+Y4sEw9XBrJb6vylbMtI/MVDWCpnZ7wHdJFx6e
	C5xAhb/LySxNPMQ/3l+gQ4CB8lksIFQUYWl1gXgYKgRsLqeTMfZO6GU+QAHMyucjN4J5XDFlTbu
	W0ZL0WISSGSO16roolonDpiuB1qt81j3T2EuFeNe9zhHCSW0kR1gBcpSHMxRpdQDvPBmvpT5Hkk
	X6fu9HnKhkM3HrYkhIlnuN6DVFdVks1AIjrUxN
X-Received: by 2002:a05:620a:4110:b0:93e:e425:22b3 with SMTP id af79cd13be357-9499965853fmr934792285a.82.1795076777169;
        Thu, 19 Nov 2026 00:26:17 -0800 (PST)
X-Received: by 2002:a05:620a:4110:b0:93e:e425:22b3 with SMTP id af79cd13be357-9499965853fmr934789985a.82.1795076776624;
        Thu, 19 Nov 2026 00:26:16 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b721861sm388465185a.11.2026.11.19.00.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:26:16 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 16:24:23 +0800
Subject: [PATCH v9 21/29] drm/msm/dp: add HPD callback for dp MST
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
Message-Id: <20261119-msm-dp-mst-v9-21-ca61be4edfc3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795076662; l=6603;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=JfZ1P2UeAniFbd+VES9wo/hKrnJLS0BWlRsQ//HuhC8=;
 b=ychOUgCzF83lMbRTysKJ5BunX/yDYM7zPWhrIhx/lngZLovadmrVpwMhmJ1tXkQqHtvbq9vjR
 bsf5eFIZ9ygDcW0X6NNJhNiTqg14usueO7O2oL5ntKzLV061KNf3xc8
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfX9rP0uIkFDCYs
 NSSTQ+gUOFb6mD7e+XZCxeio81M3dlFYWKmX2s/OS22GGrnC0NXxFGfc3UjZ/YHnbRjIlG+HWSl
 ACved6Sg7jiY+OuMQY3m157N7kH8KqfVhh1aSDoixFa9ri9gCivNf8bBcpU9P/1XDltDTOvGipg
 dpaBSCP62kw8hT/DaI+5+V2MvVKQZMZ5p8z6ipf40YE6QgZWJv+lYDWhLRkYfsoBqiVJDSBiXhD
 wkJfLdHIMbpskh7auvlgOPorx+SmOJHmXH7ScbYiTRkTBHyy8sOwZxir+iUlHrLCVnSQPk7t18N
 sx8St+JS7OjuOlpc2asVGIskumPUhlOM00E50J5/UTH3kSRV7IP+mAtdXkUTiPv0VZ6k4Ng8JZq
 /rpQSYU0zPWByEUB59cKplO2OCdO+9VeGVlVrMYAWFAVR8i0xni35FmpDnZvkAp9QYo6IyYLFi7
 KjiDAu1PRG1w6pUDs/g==
X-Authority-Analysis: v=2.4 cv=QO391QLL c=1 sm=1 tr=0 ts=6afeb2aa cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=TC7KtrVTTV83HWuqwI4A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 2Y3QqqDH5OKBJKOtKfJEzuoR3X28bKZx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfX+BOo9ifv/zNG
 HTfoBDpLdTzas6Kna8EXNmszSk3djNHDJrVLZ2RMQrEVY37x/AFDoOrWJqB9KLR+dH6RCCCcECl
 CU/RFdGwWnaND+Drv9S6SY18++2DcT0=
X-Proofpoint-GUID: 2Y3QqqDH5OKBJKOtKfJEzuoR3X28bKZx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190033

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Add HPD callback for the MST module which shall be invoked from the
dp_display's HPD handler to perform MST specific operations in case
of HPD. In MST case, route the HPD messages to MST module.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 21 ++++++++++++----
 drivers/gpu/drm/msm/dp/dp_mst_drm.c | 48 +++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_mst_drm.h |  1 +
 3 files changed, 65 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 7bf24cd2bae2..75eaf739b86f 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -529,6 +529,11 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp)
 			dp->msm_dp_display.connector_type,
 			dp->link->sink_count);
 
+	if (dp->msm_dp_display.mst_active) {
+		msm_dp_mst_display_hpd_irq(&dp->msm_dp_display);
+		return 0;
+	}
+
 	/* check for any test request issued by sink */
 	rc = msm_dp_link_process_request(dp->link);
 	if (!rc) {
@@ -1078,10 +1083,10 @@ static irqreturn_t msm_dp_display_irq_thread(int irq, void *dev_id)
 		drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
 				      connector_status_connected);
 
-	/* Send HPD as connected and distinguish it in the notifier */
 	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK)
-		drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
-				      connector_status_connected);
+		drm_bridge_hpd_notify_extra(dp->msm_dp_display.bridge,
+					    connector_status_connected,
+					    DRM_CONNECTOR_DP_IRQ_HPD);
 
 	ret = IRQ_HANDLED;
 
@@ -1318,9 +1323,15 @@ int msm_dp_mst_register(struct msm_dp *msm_dp_display)
 
 void msm_dp_mst_unregister(struct msm_dp *msm_dp_display)
 {
+	struct msm_dp_display_private *dp;
+
 	if (!msm_dp_display->msm_dp_mst)
 		return;
 
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+
+	/* HPD is disabled by drm_kms_helper_poll_fini() before KMS teardown. */
+	synchronize_irq(dp->irq);
 	msm_dp_mst_mgr_destroy(msm_dp_display);
 }
 
@@ -1755,7 +1766,7 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(bridge);
 	struct msm_dp *msm_dp_display = msm_dp_bridge->msm_dp_display;
 	struct msm_dp_display_private *dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
-	u32 hpd_link_status = 0;
+	u32 hpd_link_status;
 
 	if (pm_runtime_resume_and_get(&msm_dp_display->pdev->dev)) {
 		DRM_ERROR("failed to pm_runtime_resume\n");
@@ -1778,7 +1789,7 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 		if (hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT ||
 		    event == DRM_CONNECTOR_DP_IRQ_HPD)
 			msm_dp_irq_hpd_handle(dp);
-	} else {
+	} else if (status == connector_status_disconnected) {
 		msm_dp_hpd_unplug_handle(dp);
 	}
 
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
index eae82e857c84..15405080107f 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
@@ -15,6 +15,8 @@
 #define to_dp_mst_connector(x) \
 		container_of((x), struct msm_dp_mst_connector, connector)
 
+#define MSM_DP_MST_HPD_IRQ_MAX_TRIES 30
+
 struct msm_dp_mst_connector {
 	struct drm_connector connector;
 	struct drm_dp_mst_port *mst_port;
@@ -36,6 +38,8 @@ struct msm_dp_mst {
 	u32 max_streams;
 	/* Serializes concurrent stream link-state access across streams. */
 	struct mutex mst_lock;
+	/* Serializes HPD IRQ handling between IRQ handler and poll_hpd_irq. */
+	struct mutex hpd_irq_lock;
 };
 
 static void dp_mst_connector_destroy(struct drm_connector *connector)
@@ -358,6 +362,40 @@ int msm_dp_mst_attach_encoder(struct msm_dp *dp_display, unsigned int stream_id,
 	return 0;
 }
 
+void msm_dp_mst_display_hpd_irq(struct msm_dp *dp_display)
+{
+	int rc;
+	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
+	unsigned int esi_res = DP_SINK_COUNT_ESI + 1;
+	int i;
+
+	guard(mutex)(&mst->hpd_irq_lock);
+
+	for (i = 0; i < MSM_DP_MST_HPD_IRQ_MAX_TRIES; i++) {
+		u8 ack[8] = {};
+		u8 esi[4];
+		bool handled;
+
+		rc = drm_dp_dpcd_read_data(mst->dp_aux, DP_SINK_COUNT_ESI, esi, 4);
+		if (rc < 0) {
+			DRM_ERROR("DPCD sink status read failed, rlen=%d\n", rc);
+			return;
+		}
+
+		rc = drm_dp_mst_hpd_irq_handle_event(&mst->mst_mgr, esi, ack, &handled);
+		if (!handled)
+			break;
+
+		rc = drm_dp_dpcd_write_byte(mst->dp_aux, esi_res, ack[1]);
+		if (rc < 0) {
+			DRM_ERROR("DPCD esi_res failed. rc=%d\n", rc);
+			return;
+		}
+
+		drm_dp_mst_hpd_irq_send_new_request(&mst->mst_mgr);
+	}
+}
+
 static struct drm_encoder *
 msm_dp_mst_atomic_best_encoder(struct drm_connector *connector, struct drm_atomic_commit *state)
 {
@@ -473,8 +511,16 @@ msm_dp_mst_add_connector(struct drm_dp_mst_topology_mgr *mgr,
 	return NULL;
 }
 
+static void msm_dp_mst_poll_hpd_irq(struct drm_dp_mst_topology_mgr *mgr)
+{
+	struct msm_dp_mst *mst = container_of(mgr, struct msm_dp_mst, mst_mgr);
+
+	msm_dp_mst_display_hpd_irq(mst->msm_dp);
+}
+
 static const struct drm_dp_mst_topology_cbs msm_dp_mst_drm_cbs = {
 	.add_connector = msm_dp_mst_add_connector,
+	.poll_hpd_irq  = msm_dp_mst_poll_hpd_irq,
 };
 
 int msm_dp_mst_mgr_init(struct msm_dp *dp_display, struct msm_dp_link *link,
@@ -506,6 +552,7 @@ int msm_dp_mst_mgr_init(struct msm_dp *dp_display, struct msm_dp_link *link,
 	}
 
 	mutex_init(&mst->mst_lock);
+	mutex_init(&mst->hpd_irq_lock);
 	dp_display->msm_dp_mst = mst;
 	return 0;
 }
@@ -518,6 +565,7 @@ void msm_dp_mst_mgr_destroy(struct msm_dp *dp_display)
 		return;
 
 	drm_dp_mst_topology_mgr_destroy(&mst->mst_mgr);
+	mutex_destroy(&mst->hpd_irq_lock);
 	mutex_destroy(&mst->mst_lock);
 	dp_display->msm_dp_mst = NULL;
 	kfree(mst);
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.h b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
index 822d34cd6ff5..3bd3e66b4eac 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
@@ -12,5 +12,6 @@ int msm_dp_mst_mgr_init(struct msm_dp *dp_display, struct msm_dp_link *link,
 void msm_dp_mst_mgr_destroy(struct msm_dp *dp_display);
 int msm_dp_mst_attach_encoder(struct msm_dp *dp_display, unsigned int stream_id,
 			      struct drm_encoder *encoder);
+void msm_dp_mst_display_hpd_irq(struct msm_dp *dp_display);
 
 #endif /* _DP_MST_DRM_H_ */

-- 
2.43.0

