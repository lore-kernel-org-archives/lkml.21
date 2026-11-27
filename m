Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795764067;
	b=VcgNauy2calFJ2/EO7UtayU87R/NwPiYesZe4kiY7782/of73LAOmQgOv8EwyIKD2t6E
	 cS6y0N3UsPop/OmUeTJN4PhMvqO02hhOV8gEu0r/t18/5ibzjBnEPabIpvTAvX5cHg31H
	 6fJ45bC2Fz4pcKiqtKO1wvJsM352lgHVC1TRWC9aU/cwD5Adb1AfzDUQGPCT66r4bB/MF
	 7MKH9AGLkMy7tVZXsyrpkmqtWJNsFCr1mGzS3lELgEtql73GnHgfal3FHkJWHZOn8pvdh
	 ZqqmMeZHUsOTQMsUBO52/I7OAdvCy/wbhpHg4fh6RySCFBLkxXMYqNpGsvtS20e4r/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795764067;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=N3VLZRTg7atUql7jaIGh5aZOxd3g/n+lT3J7hkQbOcA=;
	b=xdhLQ7avYsnt/YG/Ql+jhFqiub1WbfwSbPkyudq7nxVnU3y9fmGNSBmWS33kpedzASoW
	 u6HfazZMm0YuGdn61eNjH1clsutNcC/SwYOXABOLmbStToq7tmXq5Hu3e7xjKYRqCGM17
	 vZmbzZzKC9iWpzb3kDRChkB4He4tRjYvJ7cewdzuKW+dRh+zp29HY9hLBfOWne1pwDnmu
	 ykuzfOpkRoGAlX3YpHjah0ipbgJNUT6S41ZDPL1kxFYV41YS+eWL5BZSH2N9CN0s1pOvA
	 46gqKq09Nga7X1PJHWkqy8KXf55igyYB0STP4e89+tgxfSj1My0jmzXEsoAHPHsL0jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Uxgz6/6p";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OtVdThmU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49946606A327
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 07:21:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49946606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Uxgz6/6p;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OtVdThmU
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7Ggrr3759136
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 07:21:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=N3VLZRTg7atUql7jaIGh5aZOxd3g/n+lT3J
	7hkQbOcA=; b=Uxgz6/6pnNeKE67TDKi364JDz/B+3zojGUUYDXMGM2XQxJXf6IU
	CMa/C3fHW4w5Qs6peXQMgZP/CbNKI85e1jnpBwx94OCnOGNigvfs/Cqs+2YRlSgH
	e5KPlbXfI/Qaoohu8nygcMOftwiocECvRhc/Fj9DN1Qz0XBz/CvqPiNLliyRUzDd
	wYKlBSj87DMD0M6Z8biq/f0oXISh/n+T+bTpaP91GyGxvJEv7lwKlwkWln8JNEjl
	YDRJx+8SL1FEEdhotWQOcHMOc40TN3xknZlab0mmPGgU3rRIDRtk+bH+pIqyy0T0
	M3ZDQmxrxaEs2rSqVEa54tkBQUDNzTq5ymw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74g6r6xk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 07:21:06 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a0592d4539so8612948b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 23:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795764065; x=1796368865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=N3VLZRTg7atUql7jaIGh5aZOxd3g/n+lT3J7hkQbOcA=;
        b=OtVdThmUwYUEg4cHkEkTblKpouSUM+9kNPMStReXfNcO5N2RboVN9au0lr5t6F88MK
         oasd1Ypkses6Nh44BoXjHPqNeWX8X4iujLpCtIeflnTY0Lq6ba5KUuNfThMq1a29Xgrq
         +YaUoLq6aTfOT1K50CVYe9LbfCpAI31nyDwyrV4+3Rn+TFJ511uDgSlC0yoqkkOoIbrJ
         IVwfM0g9ogSzhi6TacVWhCBw8MapeBNEt9rVzvYxQn8e5N+ob7PeLT68Ld/oMrQOtImv
         HIa7C2VvQcjXOtV0nqdfGshA1ga5b+KwDTHRwv1HGy/B7/V2RlFSvQZDmAHtuTm0br7m
         5+Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795764065; x=1796368865;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N3VLZRTg7atUql7jaIGh5aZOxd3g/n+lT3J7hkQbOcA=;
        b=Qo6c6eDBa3xe2Oeg6SLvi+dkFZPN5appMF1rhmLSh8wTSV6e+HS7QriIAWoie6bHGN
         FGqzjYAHp5ujFNZXXIaXaaTHLhlf7Nhd732fKXfiZX2IdCY2adlC12h+wf2fx4qzoMWm
         IMoNYEO6YHxNrmN5DJnYvjtexroCInrI61c5F/M63XwOM2fFGc3ZJ8HEJyjtFTA7uTFQ
         o3kgYDdleoNS4/CIkoZR2Nk4q+E+lo4kMC6Ovqm7JB4lTSrzHOsUjZPShyfTBztYIlNC
         GJbjE5ZQiEitOtJqzpMe2cygf0Gqz0jABNN4QBqYpyGTrjcQlrRvA4u+r4GwzcsYPSFg
         OS0g==
X-Forwarded-Encrypted: i=1; AL+hErGHoc0fb9SNp8TreaFf7aUnMCUWvFbndi8v40g48PCx+T9+5zOVO/cVgNXkvnhiswkaf98g59ZeU3w4+s4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MfzJEZJWVl7HvVXXyoubbwnbbFH148MO1+pIJ8PVXK27/dfTN
	lvp4WH/zVKtw1cba2MfNRngpQuNq9lCVDah2RuxNYgpck3mgq/kwcbmTl6mWPImQYifYgryJYRp
	z7W9K8eZNiX4/W96x74H6DXroMOvW7sf1/n7w+76eNyNwJqP7DCBtvQhpVlBAJ9RgNL0=
X-Gm-Gg: AZFdTZcdPJ3riDOjIrNI1Z4R8CT+ttAwVCFpNxUqJRUGl3MNiQKg0U9FbS4qdYIOMZ4
	TfzFErlZGbdmgGkPCq9iAly1henFUN1JvOLvGd67iFcBwqFvlM46jvuj5ahlYdDkVerYIXG9FNg
	UjPsbxTQIMkkBTd8rSV3L0BqI6k6lxe7Nla5XoNLjdFq2X0tQSCzv2oqk7/1T/mOoityEJn6+ku
	MAlk6OJx2pUSpubXSGwYtYYDnREGmuu/9lqmuzNiPmJXe69+rUVs8pG0ziescq/3L8zc6ffrTl+
	f0q2je2R/A0mjvFg6bAVLUr07/tCBhYbx0lJZomKzzQJKn6hPOBSefIKgBiR4pLzjNtrO6rFJCt
	Db4fK72Zy5k2h2vecXxdwRGUuGwoU3jIx3Q4pPWpjjVC1OW9IKnD8YPzxItwDESldav4V2LKhmQ
	==
X-Received: by 2002:a05:6a00:39a6:b0:89e:f8e9:205f with SMTP id d2e1a72fcca58-8c87c76a3d2mr22911766b3a.32.1795764065154;
        Thu, 26 Nov 2026 23:21:05 -0800 (PST)
X-Received: by 2002:a05:6a00:39a6:b0:89e:f8e9:205f with SMTP id d2e1a72fcca58-8c87c76a3d2mr22911748b3a.32.1795764064687;
        Thu, 26 Nov 2026 23:21:04 -0800 (PST)
Received: from hu-vnama-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87343f83dsm12028947b3a.39.2026.11.26.23.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:21:04 -0800 (PST)
From: naidu nama <naidu.nama@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch
Cc: naidu nama <naidu.nama@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, quic_riteshk@quicinc.com,
        quic_vproddut@quicinc.com, quic_mkuntuma@quicinc.com,
        mahadevan.p@oss.qualcomm.com, saurabh.anand@oss.qualcomm.com,
        yongxing.mou@oss.qualcomm.com
Subject: [PATCH] drm/msm/dp: Skip IRQ_HPD handling when PHY is off
Date: Fri, 27 Nov 2026 12:50:52 +0530
Message-ID: <20261127072055.2144407-1-naidu.nama@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-ORIG-GUID: vNV6Z29oLMxc97J9yMgzK757djOT_pb9
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b092f62 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=oFY2QqT7UXJjKgy5amEA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAyOSBTYWx0ZWRfX8vbGZyEJ8GbI
 PecI0E6UJEHeaZpzmYG4n3/N0i5tB0cIHiJjVtJUibu+XaELemlst3lMa5klxPB9WV/xZFvFIYG
 5yCgTIL46zRmTgnYvS2U7WiSzDDY92w=
X-Proofpoint-GUID: vNV6Z29oLMxc97J9yMgzK757djOT_pb9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAyOSBTYWx0ZWRfX/ZW9GABFhGgM
 oweVE7N680+u6X6ZAuBnMigbrtp+taEs1ON5aE7XBeUgg7sMbDf9LwcBhDGK91u+4J90HCnwH8h
 A8M4OxACmA3/yqQSNzPuxS8VbeoLScqeuj19IZ4nMTWkjDhOJj10I5pMhPQwllNRIi85wpb7naS
 3ZwU6ArMIrKGeV6RbriuOPfMFklVbS0dtAfzm6IemxMAj4tlxG7FjLTigXAc755aOSS37Qyy/Bu
 v+R7+CRcmu5DC5t9tYbLwLk12dLch+d7LadrOYdLqGnJNbdtsOEGnz6LxKJ8YPiH7lKNe1zciYp
 s+XsnYuP5M10QY/Ne+nbTdmVJFiCxVVP+YiyRGIuZzwwiPV+Q3MHTSIi5pW+eDGHFs8a1v+JdcO
 pnM1ziROYDbdkZM3MxKpnHTWsFYOX6KI3pM1oBPjC8w3N5VV1HbpvK2wKPuNorR6WsPX03465Yn
 co9MohSgUw8shHz1row==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270029

When DP is plugged, IRQ_HPD is delivered when PHY is in uninitialized
state, In this case avoid runtime-resuming the controller and
attempting AUX access for an already-plugged, while the
PHY is uninitialized state.

Signed-off-by: naidu nama <naidu.nama@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index c0c150e2c575..79169c1f95a5 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1607,6 +1607,11 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 	struct msm_dp_display_private *dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 	u32 hpd_link_status = 0;
 
+	if (dp->plugged && !dp->phy_initialized) {
+		drm_dbg_dp(dp->drm_dev, "skipping IRQ_HPD in an inactive state\n");
+		return;
+	}
+
 	if (pm_runtime_resume_and_get(&msm_dp_display->pdev->dev)) {
 		DRM_ERROR("failed to pm_runtime_resume\n");
 		return;
-- 
2.43.0

