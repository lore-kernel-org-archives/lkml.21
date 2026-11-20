Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173094;
	b=wCsVSuEIrt8JTTug4UX6kblYo/niOMWo8qHLaGW2SZbERgcpptDCjl0gZk/ssOSn/LeY
	 ZXB7Xg5jy+IZ/k0SvYGW8F5AZpBHXT1S3lNEvCMt08S/FQZ9bJXYnllcQaLIrCr7TdoT2
	 TIHBC4UjNAaiXdfOA38n23KN6i9dM92pomaLNvlK2akBIu6JN7RUKFEbVQbjqS2qy0BeC
	 7PQWK/BtBGIuqxJ7pvOjcpejqBAeV5hVlarCYJekquePPGO7yae1C5hsxsQzv9sNkUNtV
	 ovppZAku1DQljFfZ7+C9xUhQcf0kAvpXywaH6COio5g8updk5tlRUZZxzdIdbyktAWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173094;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=z35r7zkccuSTk0hX+/sGIrSPymjmK+o3T2HJpVZS+Eo=;
	b=N82zVsl+P/pM3jD0QfHn/aWA40BjuCnLfUJ8T9/8uU6mHSwVxsGRAJUMkU2hnWS3ZycN
	 yrDpFEoksT0cSY7GmE1Jk+gA93M8tUHyeK1gKUPU9X5SKlU7bRYpq1GnBIv+wke4Fg5Ko
	 hA9u9XnYFPZ1pTMx23iRuHnw++JxKdAdudHhdqbKaXOEOCbKPpEPXEgVii8Zt5ZMd0dzx
	 Z2v//3QeMKTz0qrNU4OPn2CXDxrFeptHwgJfU/ZO/ekV1vbIV6JN8MnaAZbUhZxwjhAch
	 Spdvv46b5MPh1sPyHsAkVLLqGcPFIyUG4bz5HaTS7HQlggZre4TRD7GZxd39WhUIfVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZrarcjEO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MVwp0pmg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4470160A260A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:11:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4470160A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZrarcjEO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MVwp0pmg
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjwNS1060481
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:11:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z35r7zkccuSTk0hX+/sGIrSPymjmK+o3T2HJpVZS+Eo=; b=ZrarcjEOINZbaXt5
	bOniYTtLEfvWF8mpy9zanMgoolURDBYH0h4oZp9PHDr+dazlgPWJThLQ4MF6UlJJ
	ghOW066bE85pTVdVboQDMlKtHSRYI5/jc7WxmhJ+4tCuloPx7Ve7uAD3El+YPG8t
	3dum141sxokcprIbHW76sDHs71wKUHU0MtNPpPggh7WTac+s5Bp7oChJgMWyjuN7
	kNKARfFobpR/SrH2nEGxelFCYKO6zEeAgt71iNvu0sTG7EwezyhHyGYDYDDE0jVV
	HOTaaYtgfmLtEJgIVTTla7aBaUkLVHKCUthJsixs6TiIeIKixaxAIxvzqUvWEa06
	tqrBCw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27fykbtr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:11:33 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1af203073e0so893805c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795173092; x=1795777892; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z35r7zkccuSTk0hX+/sGIrSPymjmK+o3T2HJpVZS+Eo=;
        b=MVwp0pmgpg7t6p+qINaswqTorloIHdgNcBRZFMzTlLLED11Z+tmOB8Usa34dpZSP/m
         bsx06rwxU9xKP9RWC2yNqKKBHbz8pT2WjRNkfJ1dRMrwtcugCpreF8VHq5OgfljufEpr
         sUzNZGUdeMhTgESRIzpHosFJQXqiAKYtfsQbiFd3mdRwMJxVGQVM6lZLzbTWME5RgzUW
         dHqCvHaZb2Wl0nUbhKaFJpImXy4rz2IefczSs1dzRVUf1FFE2yNOjBanwacv3dOEU6rB
         kf8+8d5Iu/YNhjEQucSTE5TlG2+UC9PgB3FWEhJa2OPg4szGj50ZbnmNmZuLaMgaRuel
         LIRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795173092; x=1795777892;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z35r7zkccuSTk0hX+/sGIrSPymjmK+o3T2HJpVZS+Eo=;
        b=mVtFGZJPrpYxYmYDjAdInyrzQm2GoXsAg4WE/v9pkq6yUzcykE+Yq85A4E+G0FLWkb
         Xm3Gq4b+c/8MWVlTSOkVwIoNsK8zehO/pnszlzGP+i8nv9uUiF8dQRJTCLaheWHvR2CP
         5ILKP1VPgVJvjGynC3kx129LjTzbYaj+TbLPDrOQb4lWekD8lF8wtwq2d1mnJ1etVRU/
         7ogEMaMjcZmNlD7vicxjrqvVSXQ/1UB6+TdS4EU39MR+4PWkObn+OEnPPayEy7oZqVSb
         Wg1gFP2Ni6bY8uqR83vzah4mskGN6JUlvBV7unZeUB63cpbENEBIkdzbcbVpqT3TxAG0
         Wemg==
X-Forwarded-Encrypted: i=1; AL+hErF7fIiqLc2GsozJ27KlotDGC7/wucwsd4S7Hu9Opk/Paki0KTKR5GrQL3zkS4N7XPchVJXoiuBpMpqGLAI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QU9r7h6ikOZhW/NTzT5eUFt5kGF4kGGui4XZN8zSrT5yaZ/42
	hMCiKQTeMGtZJiL6rUCTvF1peDGmwbvA/0e3RC+GWGJTH87Um8SOuVAboF0bziix90e3z+IfRHF
	fy30GoSlBNicRbC9AIwMiVmrjb2YZhYi8hmxMfexlYxsKHvMKzDWvoYIdNCMUgB7llts=
X-Gm-Gg: AYBFou1WCgsDXHHv65SRfM0hxAARGBmwXKEXIPdlxQ5wuoZAwT12XEWoyJ7MSGjtljp
	rchB+NkKSmJCrW/knInj+9LeosJtSjdrrd9ymDPDJslzJxNs1TZUh4ZIni3cEU0fCblyVlHUh1F
	baEAd1LzrovkR4D8kcjZIkpwGusi6Mm0avyIKHEDEM6iGhC+k6OOOuUQEdmEfO81jj5uSSgByEs
	jaRwltx6896qvk0UQEN5s9FcYRiEiF+SXojiwoJV5//hsRZXU3XtjZyAMTAogygOdV88kel+npP
	Yl2LJW0239w6yLH5RXVC3HRAN9zzvCwzQhHEmoiklrJe64DH151LCrMhM1heCWjtCXMkBWkX+Tg
	Pf+raOsLUF77qM3iWgLLmjnNlChUYpGN8oV90J7G+l011u/Yxk2ALYOIbejwTZMJ2M9tfkDFrPS
	vsk1dIbBl1
X-Received: by 2002:a05:701a:8148:10b0:143:2719:f800 with SMTP id a92af1059eb24-1b556908ecdmr2340175c88.40.1795173092018;
        Fri, 20 Nov 2026 03:11:32 -0800 (PST)
X-Received: by 2002:a05:701a:8148:10b0:143:2719:f800 with SMTP id a92af1059eb24-1b556908ecdmr2340148c88.40.1795173091432;
        Fri, 20 Nov 2026 03:11:31 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm7254229c88.13.2026.11.20.03.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:11:31 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:40:54 +0530
Subject: [PATCH v7 04/12] media: iris: Add non-pixel and pixel context bank
 devices
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
Message-Id: <20261120-vpu_iommu_iova_handling-v7-4-25a771235a7f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795173061; l=5826;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=8H0P4ddJnokiuKN13cprMhw/Zb8moRSMQ2sLTECuERc=;
 b=ydGkGahgKa74r0eBoQ9TzSZdEGYLaPLK4AAPAIObp1ZuAZfCH1VICsfJFB7B6qiFe7A/TcPo/
 qZ3D642vDrZB7Qju4NHrO7WKxVrKqTLookHXtGhxj+x3gqa/GiRtUZG
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX74Q0A8LfJ85B
 /RPMqtnsnQDf02id1JKdKHP8Z3mngX3kHx4lk0F1aNZwmtiJbHlfLfAAaAHrzbgSFMUrEqgnRJP
 5FOr5HueiJR1RrMT92LGNmSh440NbGw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX5e2eLOnb/7k6
 aPLH2r3mh1LFMKCAINmjoor3FdRMC/WYgYyJDbIaPaqzyIKBpMhrxQkfLgGE1BS77NmsGBq4oBv
 +iIp7qjk3ZAQ9tAN78X5KOr97NOznQSXV3DbNyPY+qvAPtJkgVvA8FyJz9diBtUaGyCtTst6NMu
 g4EqqVJCr3tbK7u1nyBR+kWID6KNd87GXjLTnRyIXWGKD6tTnsSkni0abDc9a6ZkAZ7VlVWB5pR
 2lx6wBBGMqvFMEQGU1QxJ/rHgr/e8eLZxoTTKyKULzHxC7FCGMSvdkEDbwJcg+NE7edr9GRp7XG
 2EkQgVmNnZE/qHbVldng8dooWiYVHmSEUWFLqOpEHs8jif/RxZG3itZffS2cM7VpowObhM/J6oR
 X7vfWz6bEP0/FUVOXV5z7rNTM08cytrUdR8UqyrYMHL7/ODrJpihpdPR7eNGHZfHqeaIse9VIjA
 V4aHKAJ3wotS2IvtXMg==
X-Authority-Analysis: v=2.4 cv=GZKCDgXL c=1 sm=1 tr=0 ts=6b002ae5 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=FR9WZtxvUMymXjMYBvMA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: yjmPc8wa-MEO3IV2td2HuamELMGl96uB
X-Proofpoint-GUID: yjmPc8wa-MEO3IV2td2HuamELMGl96uB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200044

The VPU issues DMA through several SMMU streams, and the hardware does
not give every stream the same addressable range. The non-pixel stream
cannot address the low 600MB of IOVA space, while the pixel stream can
address the full range:
    +-----------------------------------------------------------+
    | non-pixel stream addressable range (600 MB - 3.5 GB)      |
    | 0x25800000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
    | pixel stream addressable range (0 - 3.5 GB)               |
    | 0x00000000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
A single "iommus" property on the video-codec node puts every stream in
one IOMMU domain sharing one IOVA allocator, so nothing restricts a
non-pixel buffer to avoid 0 to 600MB. Once an allocation lands below
that boundary the hardware faults, which shows up as unhandled SMMU page
faults and spontaneous reboots:
https://gitlab.freedesktop.org/drm/msm/-/work_items/100

Now the device tree describes "non-pixel" and "pixel" as separate
context bank subnodes, each carrying its own "iommus" stream IDs.

Add helper functions to create and clean up devices from these DT
subnodes, and call them from iris_probe() and iris_remove(). This
applies to the common probe path as it is required for all platforms.

Set the context banks before v4l2_device_register() so the DMA plumbing
is in place before any video device is visible to userspace, and tear
them down on the probe error path and in iris_remove().

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.h  |  4 ++
 drivers/media/platform/qcom/iris/iris_probe.c | 71 +++++++++++++++++++++++++++
 2 files changed, 75 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index 3aeab49600e4a4742e1a8b141d1fedd219d8dbc5..236824d06c3bb7a3618bd24182f74c309a18bc29 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -40,6 +40,8 @@ struct qcom_ubwc_cfg_data;
  * struct iris_core - holds core parameters valid for all instances
  *
  * @dev: reference to device structure
+ * @np_dev: reference to non-pixel device structure
+ * @p_dev: reference to pixel device structure
  * @reg_base: IO memory base address
  * @irq: iris irq
  * @v4l2_dev: a holder for v4l2 device structure
@@ -88,6 +90,8 @@ struct qcom_ubwc_cfg_data;
 
 struct iris_core {
 	struct device				*dev;
+	struct device				*np_dev;
+	struct device				*p_dev;
 	void __iomem				*reg_base;
 	int					irq;
 	struct v4l2_device			v4l2_dev;
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index a086e519a55fea8649480a91d191fa3528fd2eaf..8b45a062a510dd0e96824e90d4398f9ef9294709 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -203,6 +203,72 @@ static int iris_reserve_iova_region(struct device *dev, struct dma_iova_state **
 	return ret;
 }
 
+static struct device *iris_create_cb_dev(struct iris_core *core, const char *name)
+{
+	struct platform_device_info plat_dev_info = {};
+	struct device_node *child_of_node;
+	struct platform_device *pdev;
+
+	child_of_node = of_get_child_by_name(core->dev->of_node, name);
+	if (!child_of_node)
+		return NULL;
+
+	plat_dev_info.dma_mask = core->iris_platform_data->dma_mask;
+	plat_dev_info.fwnode = &child_of_node->fwnode;
+	plat_dev_info.name = child_of_node->name;
+	plat_dev_info.id = PLATFORM_DEVID_AUTO;
+	plat_dev_info.parent = core->dev;
+
+	pdev = platform_device_register_full(&plat_dev_info);
+	of_node_put(child_of_node);
+	if (IS_ERR(pdev))
+		return ERR_CAST(pdev);
+
+	if (!device_iommu_mapped(&pdev->dev)) {
+		platform_device_unregister(pdev);
+		return ERR_PTR(-EPROBE_DEFER);
+	}
+
+	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
+	dma_set_seg_boundary(&pdev->dev, DMA_BIT_MASK(32));
+
+	return &pdev->dev;
+}
+
+static int iris_init_cb_devs(struct iris_core *core)
+{
+	struct device *dev;
+
+	dev = iris_create_cb_dev(core, "non-pixel");
+	if (IS_ERR(dev))
+		return PTR_ERR(dev);
+
+	core->np_dev = dev;
+
+	dev = iris_create_cb_dev(core, "pixel");
+	if (IS_ERR(dev))
+		goto unreg_np_dev;
+
+	core->p_dev = dev;
+
+	return 0;
+
+unreg_np_dev:
+	if (core->np_dev)
+		platform_device_unregister(to_platform_device(core->np_dev));
+	core->np_dev = NULL;
+
+	return PTR_ERR(dev);
+}
+
+static void iris_deinit_cb_devs(struct iris_core *core)
+{
+	if (core->p_dev)
+		platform_device_unregister(to_platform_device(core->p_dev));
+	if (core->np_dev)
+		platform_device_unregister(to_platform_device(core->np_dev));
+}
+
 static int iris_register_video_device(struct iris_core *core, enum domain_type type)
 {
 	struct video_device *vdev;
@@ -249,6 +315,7 @@ static void iris_core_release(struct v4l2_device *v4l2_dev)
 {
 	struct iris_core *core = container_of(v4l2_dev, struct iris_core, v4l2_dev);
 
+	iris_deinit_cb_devs(core);
 	mutex_destroy(&core->lock);
 	put_device(core->dev);
 	kfree(core);
@@ -377,6 +444,10 @@ static int iris_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = iris_init_cb_devs(core);
+	if (ret)
+		goto err_unresv_iova_region;
+
 	ret = v4l2_device_register(dev, &core->v4l2_dev);
 	if (ret)
 		goto err_unresv_iova_region;

-- 
2.34.1

