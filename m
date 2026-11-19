Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076810;
	b=LyyOYWo0dfr7rMa4eFQkZbF5KpjYotTBuBj2Eznk/kM5lTQaxDhhtExltRZtOiquOmii
	 YQwspZS6lCWHzMegzeb+yaLFrAOKK7buycnec6bJyYJBCyWlGv1YTQIBG3Ck0eV8dXM+i
	 SgppSTaa2p76Zk6VeZoJBMqrrgUPEuJn2QkkHIgXZxw+0wc3+116xADe4NI1p9V4B6cdZ
	 6q8TbxTkW+z8x2wGkFwqmQ6ZY5Omvj2XHvdwC+O/fAMdBO9hQYfcEsOVGxYAD9BfiFeg9
	 7WmzsUq+9qoVEF6OGyoo7eOUyvir8JflJbgratSH4sbrJwuN8iRqHCXSWYkVmg7vkmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076810;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hRRZQX+eqmNzQk/wsKwwDxPTTQ7ZRNUbWAXYNhs6rpY=;
	b=jyXgGEk4f5SdgoOlwObq2quX1EdLEtgKI4lPoMp2tJCxqlY2X0hmHk451dvoCpFkqPbQ
	 BsQjqaFi9WWi5nrU+wh7Ui1EmKVdfTAu0o6oEs+i8ISIs5n9DCNIRF3QMmnflUtX7jgp5
	 JeUMPVuAivZsvdnA+nvz+ysCmS++qFpA9xjycen1VnMsFUkguneCmSzSfAdtWY5wpSCfM
	 C6Gj59SmipficHWxIem63oalhhPz2yMpUkgH/2aHW1U1rLWu+Bkng2X0VPjokKUQVTzuD
	 yKHxaAKFzeFJHrPntwqgSGTI2nKTPG3jDnCBx2TumGV/ZQIvn9XrOUFCq14TrGmBFow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cx8Su9ej;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TuGQ9qA7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8860360A2601
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:26:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8860360A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cx8Su9ej;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TuGQ9qA7
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6vEAu2935542
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:26:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hRRZQX+eqmNzQk/wsKwwDxPTTQ7ZRNUbWAXYNhs6rpY=; b=Cx8Su9ej9UYA9n5L
	sFyvr4m+ES4lorAtxwkrziULhfrMIObrCYkcL+9KWnYMwTN+IH52Bn04RDr9rwBZ
	FSl8PDMPkYRuFCEovEQv4dn6DagEBtliXyVt6Fv+FpXplhOYadN4JkzB2AgvyWdE
	DTyDzUQrFIryjMN6A1QI8FoQpRySByzkpr/kDTBT9kbTQG3ZunadYPKEw6KevaQ1
	5/pF2T2GYpiBV12oBMsqpaWJGjmOOV6gwD8RzcfhHYF7WaUQw6HobRMWkNtAu9Gr
	yP+3cb5DCphERfXy5MwZYmFP91Pbz8bToTOfBo3xbkCQMC1nGjElgV4TbdZ3Xa0p
	6ESA/Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1g9ekct4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:26:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94960131b4eso375574385a.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795076809; x=1795681609; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hRRZQX+eqmNzQk/wsKwwDxPTTQ7ZRNUbWAXYNhs6rpY=;
        b=TuGQ9qA7ZcSRrMY05HDqdNtnie96VISGrPF0wm/CvsQ26iTy67b3qFnMPMcOBKQwVd
         mwtbVQJWnFubv6NMdb1W/vLuZ5J87hZA1fezidX4RMi3ucFBevpso024zsEeOnn1mjMc
         5i8Z46Rgzzsg80n0JwCMYKbL4Pnp7EpJX0yrLOD9MadFgUu8LsSm8lRTF4fRkuA0qwv+
         QsfdNdKhAFGFwpdKSsmRjWfR65ZR4TPC6UB7n2M425CLQv1iCgRQFr8tBDc+mHFNshkc
         ohLwb98Ic0GEDGY/vNs8lFmFESzx15JetzbvRXJJNq4v909MXp9dE8k400S8f2gPgECq
         Ohxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795076809; x=1795681609;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hRRZQX+eqmNzQk/wsKwwDxPTTQ7ZRNUbWAXYNhs6rpY=;
        b=sI+S6hQ8zDdiLVvacIlrBvmYpEUCs7+onkhkyR5NrfKpxQw0kWhNokkQaSV39TY6el
         qyMzcDRwD4tUYzQwxAttht8CuCQsp5eBEHGBDwIMF9YsmQsf0BUm0GvIUZLTYvqKYpqy
         PFlztOPXrDeflAqxqHiEG63zxYDI4wnQPDdPJVkP+yQx7TrqWxgKnzVQi1zAOO0GjLs8
         dqki/yJxlyyZ+prhkwzkYgjkvWOmbORCnnKKM+7idS8cWh5fvpZrdc9iCqnYJKakTsF9
         BxiZpykbteQx9pBuUbWpH9pIuITax28rxL9InZe6qa0B70FZYbgB/at406zTfPtHEX/j
         UUeg==
X-Forwarded-Encrypted: i=1; AL+hErEsjYB9PtpcoxMkF1M/pZSSAvqim/L0oakokhcsZWaJGBoGVgki8jxUJVTrJoIsF/+rSjQ7rbPegru4Vio=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1ZeEAJbnYkiDejU+6bgqlLlHC/768FUeWJoElFnIbZvrFHst1
	lUmdVCq6lyEXBVjOBT6lPpL5L5blH8/coFhKlppmbo4S8g5EiWG+oHKtPyiM+bqwFEA2mdwwYlB
	dq62466hyPjqEyQcJP9pMCgLxlSqUBCfSJ4HFAyFOYM1cEZhnkHQGLm5EzlYPcfooEB8=
X-Gm-Gg: AYBFou3L/Bfa2InmRVX8V94jfz5+6MmeXJgjdmVJVPllgbl7kaFNLx6HmPfM3FAUW2m
	LgEMUszqlZXAzi2r7Ge388l0OhgZQNNmPGYoQXLfboqie1EwQO/S+W3Ti6BhvaHc+XpR4bv2Gah
	W32oCVsR6pBsaQKgKomtJoqpodb4Ne3swgvpbRKcMSA6LCGANQXck9i604de/ZJHLD9xjBW9GFs
	H9W6/P5v3Lt0OMATlxj7WHZ9FOwMoIjT+wMApjL1k+fCaJfxBo9qm0urOZGppLRSrGckXDwx1hm
	1T4DsycppoSRW8ctfQFXbk+NL0xztSy0dlOJ4L2p+R0/Gh7gJPJKt4esBYbc/WZBIwhnEr3nPmi
	svIh6YiFn5C3/O2EYU4mG7K4FEdIdNKpSwKUAR1qgYJjcP4jFmvyqRLYda2csCqd4m7LKh/UJWU
	b7JqQu15YvnG7UXe7wPfDSp3o+cn5DE2FlMfDO
X-Received: by 2002:a05:620a:170d:b0:93f:2f48:c9e5 with SMTP id af79cd13be357-9499975fc72mr1009161585a.34.1795076808829;
        Thu, 19 Nov 2026 00:26:48 -0800 (PST)
X-Received: by 2002:a05:620a:170d:b0:93f:2f48:c9e5 with SMTP id af79cd13be357-9499975fc72mr1009159285a.34.1795076808337;
        Thu, 19 Nov 2026 00:26:48 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b721861sm388465185a.11.2026.11.19.00.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:26:47 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 16:24:29 +0800
Subject: [PATCH v9 27/29] drm/msm/dp: ignore IRQ HPD latched together with
 an unplug
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
Message-Id: <20261119-msm-dp-mst-v9-27-ca61be4edfc3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795076662; l=1164;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=5iWOkKJwZjnY1MHKdY0LsxV2ilvtdmCr7FzSCJb+B/o=;
 b=+zIMf5zGBx//vypOrS4PVt6cpbzTe3MZDukk6V4mfXDnjTnfRsqMWRgejWZvmLKPaXjq5GNAJ
 ZVSCRiJQu0oALuXQqstiRumWW4q0nXmNbDKwqdZoOL8bBGi/4FXPQf5
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfXyISnWQkFs691
 uRKMknkriMW2JsBQdl+Snci24W3c8533Pd7A9Caod+ZL1Nc5NyofqFcTIIeFilO25ulc8DtZw/g
 TJoFBetM/waZLTDa/edfuoQnUPCa60sGjFeO0Ld30eOVdIJk4OEtbxGbkrs0CFDHgbwzVqT9Kev
 b4XxFYBv/jLxhnpZ93WtWdh3RQh6Cs+9xzNkr7+V3hn/CRbo2iq02f2XhvEd1zExxoq/1ufRpY4
 U66Tn5HYw/FvllzLgtgqq+riZw/knLFQ6J4aK6tHJ6pbHcrrTqlqHDCuCLRNl6IJgb2M2LBLpTv
 XA2ag+LRBXS7sGIfg61MmTuehRNxG6RDnGru7hXY0MrQlN8hlsXxudp9EzMi2eRF6ngxAT8yLpr
 ld9Lwwu3xJ40y5EFCctaWKQQ4kHMO+OuMvUUug08CbEg+yS3q69JBk/XxYXJ22yh9MG4fDgSvzH
 53sbhyo34MtIy2nMxuw==
X-Authority-Analysis: v=2.4 cv=QO391QLL c=1 sm=1 tr=0 ts=6afeb2c9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=GWmhsmQFvB3G8ctGRoAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: EVhUUVvtZ2o1NBxutaaiV4YV_DoS81Yn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfXzM8FJuUUVbZQ
 4vbmLBE92oqLjN+AVL5GgR7M9AYbwX6yk8ztRRlcKf+3DjUkjYYtguZgfO1cjBlrGvqKAcTfxxH
 IClJbfIqTPF6BReGXLPQHU8dNwayckc=
X-Proofpoint-GUID: EVhUUVvtZ2o1NBxutaaiV4YV_DoS81Yn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190033

IRQ HPD can be reported with a plug or unplug event.

For unplug + IRQ HPD, ignore the IRQ because the link is being torn
down and the IRQ may be stale.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index ad8c30a8ea79..69d5ec4e175e 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1131,7 +1131,10 @@ static irqreturn_t msm_dp_display_irq_thread(int irq, void *dev_id)
 		drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
 				      connector_status_connected);
 
-	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK)
+	/* Do not access a link torn down by an unplug latched after an IRQ. */
+	if ((hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK) &&
+	    (!(hpd_isr_status & DP_DP_HPD_UNPLUG_INT_MASK) ||
+	     (hpd_isr_status & DP_DP_HPD_PLUG_INT_MASK)))
 		drm_bridge_hpd_notify_extra(dp->msm_dp_display.bridge,
 					    connector_status_connected,
 					    DRM_CONNECTOR_DP_IRQ_HPD);

-- 
2.43.0

