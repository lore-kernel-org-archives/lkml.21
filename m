Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076773;
	b=ONGEzojf0Ig/HMHe8CrNNFvlUsHeyriGo+ccnHKPMw9bJRDTu4sMQM5pDlUMCxyN/OrS
	 YUtrkMhncOyauV+rIhYGZbm8zTC90r4SCBHkELeU/tkiGDBA2MvXWpxFgwTJaVodYea2e
	 0ZFdXx5XGv5M/Fl+0elXdTsaea9XxWgZ/86Ye+f03QSNJgG1yQRNy5arQXU6LOJc8KcxR
	 rJqjHBcH4hqUGGDLM/ZJuLnPoDg4SZbOoqRzn/lhQxcyUO6Daefl7Paaq9xF/3i4jNfY8
	 zry0sqhhdxCygHJFeum6Mi1aai81J5QCXii6Ag9uOoJ94f/jRjG4rWAUIKK4HESvGnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076773;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=m+p8Z+9cYwy8buXbdgXCX158UXxIYvSeJYw1+9vLHUw=;
	b=wYykWCER141+Fp8Nwt4Q1G2jEScNKZbyHm6siVuHWlectttpErV+1F1s8jkOCOce31w5
	 6SjXVjgxdcbbHRAQgYRG64m0oCz+q8p/IBhXyttBHeaZ7OybKIV/zrWo5ZNiqbQEyNFge
	 Epeg7+8zBF//ICg0P1aoGjmAziGHbOMe/rvf8PcJIh5XbcPj5wVeMcotEQOkaO8mpedqC
	 lJt+N3aqJH3YovlxjIcKKsnDqQTl+bmRFDp2xnCY2RXu/LUR0KB+Ky58q0WX4A/RhIYba
	 iPKW00OR9CqIm0bBa+mR6p47upKGjO+FEwO6BATl/WMLjYQNnfr9+WvBWiEPtsdZI2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CHGbaHBI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V79FCYFA;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772FB606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:26:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 772FB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CHGbaHBI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V79FCYFA
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6v8d31962490
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:26:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m+p8Z+9cYwy8buXbdgXCX158UXxIYvSeJYw1+9vLHUw=; b=CHGbaHBIokjSX0Ka
	xtz4C14FRoBGNSwLdsdqRhbovXQ6KGRSWFWBTIT/te/ybSIcli2IFMnS3QPefB8o
	ydGfRD1pk3ToVJYCbLu0ckffuKT3H5gt+fA/3Hc+yljf2k8Uvo/dVhaZyuRGNNFJ
	2o5p9mBCi/3Wa9qr0xpu6SlK2qXNJ7ba3fmreafiSrYcT6sh4r8OheN4vJdko4b6
	AEqNorsx4TvJGOrcJCeHaLg07jnbeSx2zUfhsdc7I0pFR1OxKhrcemPPr4mjKPRa
	VyWy4poSdyLsGXeQrcyHaNe8/qIW6DU1b6Lv/cKX+c6Gnu0RMkl3Q1L6EvTQFwoA
	7gsuuA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1gxcu8xt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:26:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f6f4fe531so323109185a.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795076772; x=1795681572; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m+p8Z+9cYwy8buXbdgXCX158UXxIYvSeJYw1+9vLHUw=;
        b=V79FCYFA+/GlxJxr3SSJHsOfg/r0+bxlx4HR0wPaJv9N9S8MMBbUJJa1ToJ1/sk5E3
         r393CE0uLfBfvj9Xzh4e30ZfMxnspOH1qnNX0N9IqU6fktzJm9pbPh0sM6POvqd1ZG7D
         yJcL6eQStrKCQta2h8Nx1njPAose3Sics3oW3YxXidFFEpPc1uFaVak0ERKyxQQGelJT
         KmCwnPZ+Yivy7k2sZjVAbzJ4zbuKNadV+aMOla5KdN7E3KkOYOi+yhk2608IVTvqrnjL
         5o7nQfIJRMUfRxku/mgwslG0SVujBYxfOA3KOHicmStWUtfMlmS5crAniKsd+X7Ch+Bq
         SbWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795076772; x=1795681572;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m+p8Z+9cYwy8buXbdgXCX158UXxIYvSeJYw1+9vLHUw=;
        b=BcLAgDXxshI28D7Mrfyk3swlynmwg4Lz5QBP6S0RXCnxLVcUfeSqqFCh9zjDU3rDFW
         LjPycHZyhuEjgnICmLD8nBUCsZi9yomCKYUNhscs8end3/P+X5l68OzPeJ3o17wxVf2I
         d85Y5om/AeGwbgnGhyMe73LHRB1nSxuMi8n74//ZiNZei27utVGq6Sm1TUDSHsosHCXR
         nJrKGLiZ3wapv2NMBdOYnsgeXsQ8nQMYN/W7m/7I2R1JrGkvhHthUetxYxdHqQzu213q
         uHWq7u5zIElRLkQWN4lN3tgcHqsU55LXXjh5M2XC/UyRFrlievIAK8/ocv3oxhCme3Eh
         C4Lw==
X-Forwarded-Encrypted: i=1; AL+hErH9afvUyOtObw06Xy6zXJWRqoG1ZZqL0ByfhiieV0nVXmhnv/ftuEo9TwIhDk5UMiacBMiodkT8k8VZvUQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/K25b4cb2MvpByI0j2ynR5xhXQGOxdKkJSNM6ISNN07tpjUMkx
	BN0h06NSCSw7IJryN3DFBnjQsy0aQnOpFjRzks6SCSz9Nt/QlRV3whb27tGpNOw3WoQ4/f2QndT
	stE/ELwwwnOSrurhmV5OG0mD5Soc5VgFrSGXyWXhn4YF5/uNvrS5YR0sLp80FfK/reWI=
X-Gm-Gg: AYBFou2MvpDcIdPHLvg2oZEDOK4MBSv3zzXLFrB3WmF0HbUsg0SohpKsunH/qMTFxc1
	0H8142g6XK88P7ayDpI12b96KkOUJCAeXJqIJRjhfhH96sKdczNKrnVIX7oHObWhadDXjO0KLUj
	jLaFw3pky4MV5wcQS5Wesn2L0k7gC2LnCGlloirU1R/nEUcEh+sNGfjLcKngjFCQI69Ia1S8hIy
	C/PuTaY0Z3PbsztIM7ZKVyCisFAfu+mXpKhLt6KPbPeAGvOkzgKTlaBYIy5PorNBbQBnUldnoXB
	nV249wIov+j+OfdqMNkhaKOWdA8awkIeU3Aog6M8doKRiA6gZQqVlcekikJ+Z6Ja9eSoovGV49l
	N45de3mqBKtenmk/XSZMK9rLmWRqTqXWSjrIT2WfdOmlOZH+MUAV5YjjQg1uDoJBh94mx8WLB1U
	dRPO0nTkMAnH/OCaIsiu0d3TtecSZjL9JCwdt9
X-Received: by 2002:a05:620a:28d6:b0:949:664e:e3e8 with SMTP id af79cd13be357-949997274acmr1001220985a.34.1795076771969;
        Thu, 19 Nov 2026 00:26:11 -0800 (PST)
X-Received: by 2002:a05:620a:28d6:b0:949:664e:e3e8 with SMTP id af79cd13be357-949997274acmr1001219985a.34.1795076771656;
        Thu, 19 Nov 2026 00:26:11 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b721861sm388465185a.11.2026.11.19.00.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:26:11 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 16:24:22 +0800
Subject: [PATCH v9 20/29] drm/bridge_connector: avoid detect-based HPD
 notifications for DisplayPort
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
Message-Id: <20261119-msm-dp-mst-v9-20-ca61be4edfc3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795076662; l=1626;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=0BzSJVy5hCHAkX2oiDIpRZW7mGbTKWmnfn6hw/d2uWg=;
 b=WT2ZHw/Exms3N6Ny5DojIlbfnJonYmXUGvFt1rEmkvbknaPOYX081PQFTO2u35tS87UdRFGVX
 /bbVhhp5pDVAaCM2xdJFrBDVfuziqWCmGSjfXTMks5Wvk7kpW4wvK+9
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=LZapeTfi c=1 sm=1 tr=0 ts=6afeb2a4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=c5AeteMbgwRpADRefSEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: neGkdPmVqAYU8tBbNjZAejZ_BIkE2GON
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfXxerYlUgFvoku
 u4hxFlf0xxDOifxpMBYPq9GqDngScrjmwgHYMCbgX7XHroDqzzVGeZpPDPxr2RklhRIHEMcb7Kd
 2ptb38qYC/DBvgwt+xERAEH5Fw4C9j2Nc+rspizB7Pntp9j12zJxYiPrlJgnb6gcETZCjbRuH3r
 D5y0OwB0IOnRNgRW/k6IOEWkmycaornZmsAK3xdvu/gDuan4Hy8OrjCZpodagnSn806OZyj4Vec
 /CqxcR2SZZCv3EzC61IVa9FJHaty6U+yx7z2PNZqMM16151/jjAGH/7J51Z0UXV6vrIww+F9kX0
 tk1Bq6mitomjH1MgK+ptlOalXiBuWGuX6mXFrkPJrB847bzb5DV+s1UCz91E5wHkbKYPzMcAm6V
 watKg0j7+6e0BrBC0+8y5LuW/Bhg8b703rmjuG7WIFQR2+zlvbDFFijLfTQ3Vh3WM/vLKnDe1GY
 eVfie46kQMPMZQr9LDg==
X-Proofpoint-GUID: neGkdPmVqAYU8tBbNjZAejZ_BIkE2GON
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfX4byYoqrBGcle
 bq+MV7SXH9uKnQEoXFN8RzMhu9LEChanPlKo6YCrIa+DA4apM5xC5NYoTrl60Yhe2l+X77prj66
 76Qoz1EcrYNTaE399dBwLOkDCK4UU+8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190033

When MST is active, the SST connector reports disconnected even though
the physical DP link is still connected. drm_bridge_connector_detect()
forwards this result to the bridge chain as an HPD notification.

On MSM DP, this notification invokes unplug handling and tears down the
active link and MST topology while the cable is still plugged in.

For DisplayPort connectors with an HPD source, stop notifying the bridge
chain from the detect path. Plug, unplug and IRQ_HPD notifications remain
handled through the existing HPD event path.

Preserve detect-based notifications for other connector types and for
DisplayPort connectors without an HPD source.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 1d4502126bff..dbe874d26911 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -315,7 +315,10 @@ static int drm_bridge_connector_detect_ctx(struct drm_connector *connector,
 				return ret;
 		}
 
-		drm_bridge_connector_hpd_notify(connector, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
+		if (connector->connector_type != DRM_MODE_CONNECTOR_DisplayPort ||
+		    !bridge_connector->bridge_hpd)
+			drm_bridge_connector_hpd_notify(connector, status,
+							DRM_CONNECTOR_NO_EXTRA_STATUS);
 	} else {
 		switch (connector->connector_type) {
 		case DRM_MODE_CONNECTOR_DPI:

-- 
2.43.0

