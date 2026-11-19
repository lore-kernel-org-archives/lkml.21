Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076790;
	b=O7gS5qHngr5O15+wXruPSBiF/9frfzXM7VFsFa9JVj054QHM8DrN0rAnmZe73EPGZcdF
	 iNTXroAxXR9lBeYN3RAWcljhDRJn3WYBi0GGvWOVB1pXJm4FpiG89Ib2Q713OxbAhiY++
	 3UPTkuN5YO2XoBnQg2Yxt2fyep00hvnqgdZpCqwBmosGdDJuUdEbR80b2JjFB/Kt2+jKq
	 DZjRPziw+sel2KI1zqVmlhwddfB85zRNs2QpEJZNrh+ySt4J2+7LRug/5YMPWc527Ygvz
	 /RJnOz6f5aO7HDTPya7b0i3/dYSa9xsqI4uu8iqMAf4fzapKqYuWc2u5YxQnTSVEJ2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076790;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pPO9UzZPVsaDzgbO+XFBnwFaiT4fUA4lzXiiqyQTXJE=;
	b=XWdMnDx6LY8k49C89TtKjVaVQdYI9113XO2vT12xa2/tlkyf8A+Xy2mTRyPItwPvFEsE
	 KvsuBYsKgIXRfjjPN1dOA41Rwp7SxtTwdH8X/g885x+9yOFOBlx+wiiMgBRDOuxJ1MG6c
	 r66Zty9zZ750ym/7DCyMQGVui0Wr6FqZjYPNlNz2asFEGT/Jq4Sw/5kxxya1c1XgB82uM
	 /k2dv11Xq7eWmZwbnTce7Loy96psF7MoHty2+nGXjTwdX6Rx6TuqkWVMrzEC7XFWHJjH0
	 h0+1Uo63jqzPGS3wBEMvrZb2H/1eMmxpuBacQsgWJXGPgLcAnlNkSwfU5IxWka40WpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RcTMoWPh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="UM3vpBd/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C505E606A332
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:26:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C505E606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RcTMoWPh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UM3vpBd/
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6vWox330674
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:26:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pPO9UzZPVsaDzgbO+XFBnwFaiT4fUA4lzXiiqyQTXJE=; b=RcTMoWPhevrzXQ2A
	HZi98H71JvUb5Fn73XVIjDhDKkGeIZKYGFFoz4d0i/ROiSXYOQ1bdRPALv8gSLqM
	gR3u4YmHAX2RPVPItL4hSRE0q1DVlpEK2AIeDPhcJYAdsf86yURk0j/uUfQHkNP1
	pEZGgmrRhoC6Ut6Q4a4q6vgB9pvYJdrPJ3Gc0DR59nYPlsAZY6joME3eRPTsIGxK
	GRgJuOO0fNV15HrY1VSoX91GC0ZUw8wL5olc282r6nWmzC35HQqhsJdztBY88ixI
	/S8Uh2EGThZ+KX5FozGYwAlRDt/dCj+DMRzVv/DEcmnGpdfm2gr+HX0TGe6xfTI2
	0YgJ7w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1fpnkgkq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:26:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94961ed97d6so144671585a.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795076788; x=1795681588; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pPO9UzZPVsaDzgbO+XFBnwFaiT4fUA4lzXiiqyQTXJE=;
        b=UM3vpBd/vRZvDyjD+ctFDMPHfma9QEg80OKqEl3T69GqiN00RzJUmqLvlAtoHIM+KQ
         siLIi+ol1JlTM173lPR6c67MGznvsXdhYyMIgEdolLCA+BQfWbFu2h0i/rgzkqVSzTDl
         E/nH09DkHJD8ry0ae18zM6omajORpIcDMxqp2X1SSuhBuf5tMdihkA3dBGzhM9T3cxTG
         rqrAuu/coFNuUx+7EN91BovRYWi7BNfwybYhnC8pDOW4TFBENmQmur/Ge2tKG1LpL/O2
         82nNyjz29tOgZwq3sLAyO7JT/NcxGV9q9X5vx2ygZmqEYVGkGfXhdq/4b88I9Ekf+InG
         v+DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795076788; x=1795681588;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pPO9UzZPVsaDzgbO+XFBnwFaiT4fUA4lzXiiqyQTXJE=;
        b=v2Pwf7sR7WrZWhNMfBIethxzb7bG4O/Y7db7J2K+OaSzBwJyAFKtBC+K6a8QmZE8+t
         JTyyREsPnCuAj7IwTVzA4XdeE4OSr5CdpKCTzd+l+fWXyX079Jw4MK+/PkX5CnTK8hrC
         mW1kgGJ8Xnp18myBiRnAzzmZAvYgVPkmC0Q15/Pb7zC3mdCsbiMPDr0miZLs75DDlL3h
         9Dzaa9faiR+eUOtdngGWpgzOVWmb+Vnb/nKAfx0Y9thpnTlenU33/v9lM/JZAdLAIEoN
         iHhpAlPD6hsYQ50RomeR0D7yH64bpR3IKHTkz1U1CEtxM0h0wbWtEhRnKNeFHFhLZis1
         tA5w==
X-Forwarded-Encrypted: i=1; AL+hErGofcz6UssFrRJ9djBySN4oKgIq/9N/CFAfos2/vL/3D705kpWjDl8cAvhhBr2Qy7EF2XGZ4GFZdpPN4IY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+W9ZorOs4ZTfQ+2pObCcqLaeB3367lx8AukvP0quq9OWTizrv0
	iunOezWIpfKb4DS02xGy84s6xQOWJ4dOganCBGEBxYSb/LR6ecnHBUCRj87o3f/75BYRy9nVJ/U
	eaZAif47JpeceFraHXLSRDOdfd9jzW2aQYqUIGJB0BLYgWYaAwRos98X8j+/P7qJcLYH6eERChh
	EUwQ==
X-Gm-Gg: AYBFou0yskhLnRTsuq+43dT9QcB80KKho8rUJODohWfAei3HqFQGFwl7gRqhUEGaDUY
	RYI/KZE1sn/3omyoUXZFwUWhkCeG0Elyjb9WeP1YYp5vo/cnkoRSOr0K2qBkWRbr/0CmgkCZ5yh
	zFFPp6l27BaoT66ISAsJROyWcDbFl6WVeoJoTGaoFyO+EKvrNGFR+vteLdqEcRrBRSnBqAF1hWZ
	urU8DuMUyIXI3LU3RauPeCchT+ztg96q5VL5Z9q3asszBubO9b4DOliLb2cwaE63M/76Dies8fO
	pI2Agf93mtiKYQBc7ueG2pHmbJ+/vyed+i9OSQQxUy7WKrV+KxHpvyealHCdogRPMEvK0Pv0Iew
	IOS00bkyT3iY9soptJLHNENAYQ291Yyux6q3Spexih6cH5pcxdD3inuNwcwTvO/CaZlO7jmRq+J
	+GhEAB65XUcYg9wg7yOo9oAFJEllOYJ6959KA/
X-Received: by 2002:a05:620a:1714:b0:93e:7ddb:4ee1 with SMTP id af79cd13be357-949b34d2748mr63530585a.31.1795076788017;
        Thu, 19 Nov 2026 00:26:28 -0800 (PST)
X-Received: by 2002:a05:620a:1714:b0:93e:7ddb:4ee1 with SMTP id af79cd13be357-949b34d2748mr63527285a.31.1795076787363;
        Thu, 19 Nov 2026 00:26:27 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b721861sm388465185a.11.2026.11.19.00.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:26:26 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 16:24:25 +0800
Subject: [PATCH v9 23/29] drm/msm/dp: mark the SST bridge disconnected when
 mst is active
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
Message-Id: <20261119-msm-dp-mst-v9-23-ca61be4edfc3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795076662; l=1111;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=Ky+XcbutFyz/cXz6z0Zw3/ezOmjUUoQaMdosLPDLKBs=;
 b=nP/fS22rtyeubTiHMyxRIV97lTbda48vdtxjL7JIoGUxRD2Ku+jhLfwSeN76QcaFlfjcYF6VW
 4woXV4WT9JlAnlZeo/FSZjsjB8nFzoAoph2ghO4kf9S+utvW+kTHxcN
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: 2NfmrpvZ1UlEuuqu_JtMYm_2yMhS8iFG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfXx1JoQD6boZoj
 4nMLte7u4u896PxFGyhzGk/HoSuYwEeQPXGJXXVSmPqCDYZ26WKaaUAVxKznC5WFQUYcmu/ik0N
 HxyGhce/egwP1bcqeivY+W3Si+bwchiUHRpDAHK00qpDKZZ8GYCKxgTTnxPOkifq/T7SJMFoaaP
 RaJrwGRAsjS0iOylnTUxcf8Sq4PGBrqxHlbsqEi2YkVXJxFAYjslmU8ygQ0sF6C5KeLbYj0wmbF
 cVqbN1AWouNSLgU9GRQsHxdapYtw96i2qql56sA0EcLS/hi8utl9z/b3yWyC4vj1fSeNmOC21k3
 F6DdVUgwnffgE5xczONYsAvC7aVX7qUQIvX3JA/DkgID7k+iFWzvfUDm32lHdUqlWCXBLbHVkYh
 iVkgslWORXHIzwurXqSZneLRY6l8qC5SsnoSpm7BAQCCLhBLdVHclJtSKpMVnKlILpyhD2e7Mbx
 hiujHZ3AFWsMYeNgZ1Q==
X-Proofpoint-ORIG-GUID: 2NfmrpvZ1UlEuuqu_JtMYm_2yMhS8iFG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfX55waNY4DkEIi
 RiNPx6OAQPru74UKhPMyQi5aNDF3hTi3zrjoZ8CL5Rg9MTJZ2DpA4bBn996F14eGOjMi/PcTKTV
 todKlMXNa/Fh6+8/rj8OMfYk8HqfmxU=
X-Authority-Analysis: v=2.4 cv=PJ6aavqC c=1 sm=1 tr=0 ts=6afeb2b5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=ao9NmXljvuVdf-BuN7wA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
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

The bridge detect function is only applicable for SST. In MST mode,
connector detection is handled by MST bridges. Skip detection for the
SST bridge when MST is active, matching the behavior of other DP MST
implementations.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 75eaf739b86f..17487a7900d0 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -976,7 +976,11 @@ enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
 
 	priv = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
+	if (dp->mst_active)
+		return status;
+
 	guard(mutex)(&priv->plugged_lock);
+
 	ret = pm_runtime_resume_and_get(&dp->pdev->dev);
 	if (ret) {
 		DRM_ERROR("failed to pm_runtime_resume\n");

-- 
2.43.0

