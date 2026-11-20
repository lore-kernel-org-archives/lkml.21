Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173110;
	b=VEOIugv9vuAWwEOuTW1cLN2/4q0H8UgmGCj1va/JDeidu2UHaMXR1n7vGmzt+ith2dr1
	 pdnCe2GgWnn1ObdO+ak5t/OK/CkdHdJx9UMG6F4IK9+4XaVoXkwT/gxMteqEIGzZDGXCW
	 UuBnGs9Tz232M08eK+iwP8Bj/2jNR23m54hZF8Aykxg6xsqKlGFyfJHg65ATTn6svd4By
	 02LyZdKjLnyjquUGqdIlxOjlnursGstT3BeeWTsXgXfOCvA1TGgzJ6SgCgxtkgN76lVKN
	 ++1wfnTcNhQFTBywSdR950x428ihhOITOsShuikdVCkmwdly+gKaR30dSzARBKuXcqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173110;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=HGtGaayd0E9HBtS0GEqg5v1q2maa2MdBdl52j7h6Y+A=;
	b=F9CHu8jAzSN6FwqcJWSXXU0aW0B/4u9RxcqCtNSXfc5Vn1oHKjDgCQnKf1lEc2Ke3Yil
	 3eNXUWkuwwYDj4SonudeFhEeyoKn8JxICNmmXm4Zgx62koMgTGJUjvIkGc+tSvyPr3YKN
	 jbfNxCSDBGQ9fGHap+qcFDHl4yaktoQnEMZ87wSGzrLVJsdvFC35atQ10615EW6KNNRdj
	 o5QVgJu8Fvox9lcgr6qzqdAdQ1pE5Ur8mfBin8aiRCFgCR5Weujh+jy76oprreUWW6NoM
	 VBmBZxvixwr78IrJPU4B1yGGaPjpXZ3j8Lhz27LlMWw84KNcue0E2tPiw4eMJSTfOuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="aMEv/0z0";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EXrmdS7d;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363AC60A6F41
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:11:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 363AC60A6F41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aMEv/0z0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EXrmdS7d
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAk1Mf2433127
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:11:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HGtGaayd0E9HBtS0GEqg5v1q2maa2MdBdl52j7h6Y+A=; b=aMEv/0z0Wq6jMD+h
	qOf8TsJW9R5TvvrS2KDkuu6U0pPONqyHEqa4rcwCfBctzA7CErsdDzbr2iGFBo3h
	P3i0sX1J5+yzmtQcwlq0xr6WjDwqJi6Cii3TdLmd5EsdzqcecehGzkuOa1nLH+ja
	Tue3d1vwYnCJ4s9PhgBYasZuMMRgtB+zCSqCbXE470iH3/g+TQlsPzWCimKwRZ0A
	s8KtED3RmpH5h/y8xX0Y9aAV9DiLNZT6og6QCn5FwibdAjVIPsx6QJlkTyAdibxY
	tl7500xx+o8xsCyRDg2E5FczOWbxQZ42M5p4/4DwWi4WdkZPdu+JIr2q6u9ylR6H
	C1Lk3A==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fjj9fgx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:11:44 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1a71dd190b0so2391958c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795173104; x=1795777904; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HGtGaayd0E9HBtS0GEqg5v1q2maa2MdBdl52j7h6Y+A=;
        b=EXrmdS7dhBq59kW34bQf4JgAAKPcNL6+GVUqOHH8mOApmPADJlitDo+j9EcXYkDuvu
         d1JnPWgsqrl+CyQCb47ftEVVq2RHtEHBa6Nk1xGJTPo4uqp/JOnvwQns3XVnpq7IjB/N
         TuGp6cxc19dtiTZ7K242P7rCpFMkOaYdh+B+aoy0xjbQhhi/s6aC/3cD95j9ED6NSQ73
         J7MLNXQF6ulowL3HFoHg7FSgR7P5Twn0CP8PUuYrNogij/v5v/qGJLX0xwzqTif4XOqB
         cyA3a8LRhZ14yjXW1ij7dWZe2hsgtI+vvJ0PFLiUv3WAO4D8zLm18PqX51DU/BNZazK5
         pEoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795173104; x=1795777904;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HGtGaayd0E9HBtS0GEqg5v1q2maa2MdBdl52j7h6Y+A=;
        b=glGB59A1WtNlmWJFeCvWaFKyS/QTtnWJI2rK6IoeD3ZQ+DCgQ/1EaVccNK9Hnghq1X
         BvLXV8ckhErdqlNGcs0NEptvML3zwUATJuSiWwr6WjQimrvRvdTZk/zIMTWpKau5RFuX
         Co4tNTxdhTviREqTh9vI1aJyEPJaiGlxkH3y1MfPS1n+bmmiw5qKVxJ15sM9zASMtDO5
         zuevg7Imt5zmdCoaBM+4qdBJcpQPvlYSYlltxii5Ri9FuatooCyrogbR2jjegf9edN2v
         xF4/3vs2y8SI18XHaZ0YZDp29qj/vho/7OQmZCVixmsD0AtmMLi4DszZFvbrwFnmeu+V
         4FVw==
X-Forwarded-Encrypted: i=1; AL+hErHxlIPn/uc4LPGmGLR+lQ8bpE8ofAUVIh6hk8D4YhN+yOpErQAdAPMSnliB2ERDhTB4krmubS/oV5Yxn/c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+skpTl/lxdBs8JdjCLwb/sblvgJWxCkqjbtSQgSvnWQ4C2NYJ9
	VGYAkKN6QhKwvX3ABrE0ZhuEaRAW5UeYx4KvZYSkMi3HDps/d0Y0qo6ChZN25DneyqWUW9eirwW
	KmNHqkIOzrSCPxrgqhfJLtfaenuGUepCxtObfhprWr6bTYsXgW+XlPe7yp6DbzmtT2x8=
X-Gm-Gg: AYBFou0pq6RWQW+QLy1CK3COlftKTWdGS+6XLcnGzySyh/K4f4tajolEoocbXdBB2x6
	mZQTRCWtW8xLLGKVF8LSbzyjztIrWVjUZhcKrWXLmhyw4Tp49l2fciIaF/TWGR15Y2kl6CyKCvF
	8Nb5m+Z4BXFLEMwT1U0N4VCizk7DA7fbbIPJdEafVTy4sZ7wMUtRqCrSFVHaaDzcdkaDEF3J2jW
	1VcLgDYstONd8NH4MucKUJ96zGjmHG52UnGpS6FxXFCWaREdadoktW0Eg/txlgYiHp/eRsEj6Rp
	3YXTUJ2bp9vfMWsTC4oc+w3NNcLQYinoxWvJLDKjm3zsmwtSPwhEiQ3oYXM71SygrJUXVFugeVP
	ES67bMOkexo/ll8XkcsLO8XBw8GFkWNlMe16kf/8BiRWgp6zwGfejT8UoIY+WxqENqwJagezj5o
	CRsxNJFgjF
X-Received: by 2002:a05:701b:4558:10b0:1b3:b4cf:8f18 with SMTP id a92af1059eb24-1b556926cfbmr2721996c88.41.1795173103700;
        Fri, 20 Nov 2026 03:11:43 -0800 (PST)
X-Received: by 2002:a05:701b:4558:10b0:1b3:b4cf:8f18 with SMTP id a92af1059eb24-1b556926cfbmr2721965c88.41.1795173103231;
        Fri, 20 Nov 2026 03:11:43 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm7254229c88.13.2026.11.20.03.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:11:42 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:40:56 +0530
Subject: [PATCH v7 06/12] media: iris: Skip DMA mask setup when the core
 device has no IOMMU
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
Message-Id: <20261120-vpu_iommu_iova_handling-v7-6-25a771235a7f@oss.qualcomm.com>
References: <20261120-vpu_iommu_iova_handling-v7-0-25a771235a7f@oss.qualcomm.com>
In-Reply-To: <20261120-vpu_iommu_iova_handling-v7-0-25a771235a7f@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795173061; l=2500;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=RvfzeV61l7S/hnvptS8fij/ea4XXJ24i3aAWnoz9sOM=;
 b=xs+3rtCaNSKwGZJh91t7uaKMKfh3W8y4e4Y7piXyN0lUOY7Z4/t8ieKBgqAc5eKgkcd3SOGK8
 4eDYGtrMe9FDFaRyCyKr0wCfru/94H9uv7qZAcVF9hSjW+FC6F/Kfmf
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=FJaOVOos c=1 sm=1 tr=0 ts=6b002af0 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=sXzWO4cmMkpvoY5_b44A:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX4vUTwLIoiaBW
 eOJMR8QcLRp4+PX80hSw4ErEopfxYCy/bDqbz4O9L9ULblvFGCEUItQnmpGvQu4sjCUPFuErrz7
 vqvwgJGwxrzJCgOJsEBFFbTkl9v7lSI=
X-Proofpoint-ORIG-GUID: I4kl54-1mpJkS14eYfQ8Jd-Z52BmkUoP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX1EeCRmEo0bPW
 DXL9ytDGVgsUl5D16nE3G2WBrxTno59FGnyT5JzHsvmwPrR6KUUGQYVv+vcmA5V7TptxhTu9rk5
 3nfNRMaa2KIWV3m3iJusmgKbm2bHmRA6r+yPLm4srF9Ya+khFJTt+fwHnq5ofqRdbrP4VCv6tvm
 y0ZBogkLTTYAOU3XsTw1aO3qXCivhfYgYFKSi5K8m+CO/M7gNk+Ndo7CgqvfZ90Pz91Aq1O8Wmm
 4T9gY4FtDUpX1/HM8MgBrVXGyYELyT+9qVvOt+567phZR7ri5EqWZy9W6NjvvXJdftRqIy6oCRL
 fmsUwQ5H4aDUzezmyaFXcI+4Ih2EA4wMiXwrooobcxB/RuRlJyqJ0PS/6Ta/r/wFxrDb8uCk8KD
 STeMr+oYMHD0kf9C10NcSkZHy+uj1WHzYNyqWNF45XmGzwaPDMVqLsFwiLmSiwjByCSWbBeKT5K
 yuRvniuh1orDQOdhtyw==
X-Proofpoint-GUID: I4kl54-1mpJkS14eYfQ8Jd-Z52BmkUoP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200044

Once the streams are described as context bank subnodes, the "iommus"
property no longer sits on the parent iris node. That device then has no
IOMMU domain of its own and never performs DMA directly, so calling
dma_set_mask_and_coherent() on it is meaningless, and on a device with no
IOMMU it can fail and abort probe.

Set the DMA mask only when device_iommu_mapped() reports an IOMMU on the
core device. IOVA reservation and cleanup are also skipped when the core
device is not attached to an IOMMU domain. Platforms that have not been
converted still carry "iommus" on the parent node and keep the existing
setup. For converted platforms the mask is applied to each context bank
device instead, in iris_create_cb_dev().

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_probe.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 8b45a062a510dd0e96824e90d4398f9ef9294709..3c6c170a3d75f73b55d3abba0c6c8fa0378fd498 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -156,6 +156,9 @@ static void iris_unreserve_iova_region(struct device *dev, struct dma_iova_state
 {
 	unsigned int i;
 
+	if (!device_iommu_mapped(dev))
+		return;
+
 	for (i = 0; dma_iova_size(&iova_state[i]); i++)
 		dma_iova_free(dev, &iova_state[i]);
 }
@@ -169,6 +172,9 @@ static int iris_reserve_iova_region(struct device *dev, struct dma_iova_state **
 	unsigned int count = 0;
 	int ret = -ENOMEM;
 
+	if (!device_iommu_mapped(dev))
+		return 0;
+
 	state = devm_kzalloc_objs(dev, *state, BITS_PER_TYPE(dma_addr_t) + 1);
 	if (!state)
 		return ret;
@@ -464,9 +470,11 @@ static int iris_probe(struct platform_device *pdev)
 
 	dma_mask = core->iris_platform_data->dma_mask;
 
-	ret = dma_set_mask_and_coherent(dev, dma_mask);
-	if (ret)
-		goto err_vdev_unreg_enc;
+	if (device_iommu_mapped(dev)) {
+		ret = dma_set_mask_and_coherent(dev, dma_mask);
+		if (ret)
+			goto err_vdev_unreg_enc;
+	}
 
 	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
 	dma_set_seg_boundary(&pdev->dev, DMA_BIT_MASK(32));

-- 
2.34.1

