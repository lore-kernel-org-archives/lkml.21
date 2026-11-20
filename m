Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173084;
	b=hq9RWXRkT60yVlgNZ8WtZte+1zlz//cY62g4QJDOHWh24uVcjS4KcI4Zmxmqw+hsvmVN
	 QP7vXroAZUVXAgGWUqU3yYzAq2hz/W/i26nNV1krggNZ511+igeMpTxhYEles4WTXO4as
	 xZZUB5Lu7oB7bysRMHHJN9MxcujFXAjg7etE8ixpuHqdgex+LXdqP2X+K+EPI08JlFDsw
	 AA79kIqTJGtxGZyi9U2dI5RTUSIKg3x3XxGmGCFvbNBv7xF/V2h1cGTeRLXgeZ7mfLu0+
	 uRIdIFynlA7N1HfOYHANZciHvr371ToPDVU/7Zw2ROZqFCHZhHVUPkHaPzh6a4Lor6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173084;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cn7g+ecg+pr4fRw8wEKdLdBlRPbJsgFxcvU1mUPI6CQ=;
	b=UFou7zERfVYKZmic7v6uKkil0SiTwFYoB9JnPmu/zVC5ZbYtZS3CjVY4wdZtrk305ivS
	 5rqVDCzV9EG2dZjoUaMJqymzyvj18CK9lu5jNZ0IPx/qJG156tP2OSCImPnANObkBP0rP
	 cNf5DP+SwwRPHkP2hDFppyMo14XZCMicl6fkOMclKWVGb5vjB9GtMw+IQCDSv3lGBInNc
	 1+6ugF2UNOu5h6HgmroB6HHFkQVHVkgxhSKyxjaFOhWkaKfvQe1GDJKislxHz7e3XTWjC
	 c9iz0ggiwmYHBxFx8rv3zl10UdhfQTWqTQljmwP2pfnGFfTWO8uYp7Vix0vPwloDQzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X1oYaXsk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CUrQ50kS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF10860A262D
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:11:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF10860A262D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X1oYaXsk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CUrQ50kS
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjt0f1168916
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:11:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cn7g+ecg+pr4fRw8wEKdLdBlRPbJsgFxcvU1mUPI6CQ=; b=X1oYaXskRqLrHtKS
	jZFVxJ5WvyU4KXJ+1gjhmAknfTU+k5PyevW8wn8wOaPl7iag3PK/xVsH87A4/7iE
	65U9JRvP5cW4UhbgXHYcMS0+YbT99DENl0eCQMtTZebInC7tJvto1V5+i9uPpBmy
	/AMwV6sGcf9XkmRfKqBvL38DTUmTmMau3v7icRyyI4p+YXbP/9V/1yGf3QBSrxur
	XT3NuFXwXKHel+gWLwpIKiFVzBO8ghO9u57ApNXUrnVtrErBVO5ShkNBMuXGSOFh
	42ooTx/Pq/NgGXiWWwz7mqMgF5awSKOrSLsF9pjm2gs9PhhIOJO6Fm04g0bVFRKN
	nGBa4w==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27b5uddy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:11:15 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b29df78132so825879c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795173074; x=1795777874; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cn7g+ecg+pr4fRw8wEKdLdBlRPbJsgFxcvU1mUPI6CQ=;
        b=CUrQ50kSXVHY1FKiVRFqRW00l1elDTtdGr3SboGwSkNsFZEPSkgiij8LXV31mvdusm
         s5zTyv3YNb4VwlTTl/vCfRMcdJUeOzJECvdJ1M7VK3dsZVrx6EHT0fXu+TvlZuDJRcSN
         7j8DN4ZASRCYJGZ829U/tI61TYI3rovypvhgUX44618Aj8qLovMFmKZoiZ/7KoD+Vp0B
         4lAXebQnfztMUwUhahk4RBcuqDaucTOJo/1jjEVgz9qfKzfmdq+bYUX1ALJM7ZAjWkre
         mjazjqKjbVmln42YfOZpUccr5IerpOUjkFmhMpCpozMJNHugGXGsB+k/WzinXGAfTXCN
         8t+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795173074; x=1795777874;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cn7g+ecg+pr4fRw8wEKdLdBlRPbJsgFxcvU1mUPI6CQ=;
        b=gTB0ePutb0rBf7xAs6j/DP9dU/H7Gi3ch2lp5+1yvUDzGqFAmWtqXnqBuC+3QyhIsF
         04YDdsCvU4SbWySB4ZMMHjucunLLPzyI6m8NdH2o53GAEIceb0qC1UVpSzPdNsD267Sf
         ylo1bzBWRKJ4p6+5fgMz73L6sHP9DZyfXWDLUqp3uDTsNseb2TzwahN35P5nRYATgzQD
         oMYCvsP8/vogyDQ7fe/YIReSHieTdNWT3zno8VrdVxIFrybljFOItR8J+7my7W0u6dJ2
         5u+39+VQiNQwJqRB3NGHtAr8HXphqIzcrUR+zjMow9saA5ZE9EBn+jnvQGQTrm3eotEW
         aqsg==
X-Forwarded-Encrypted: i=1; AL+hErFMJ1pY5OjkAsWh+DQwrFgA/fzoe+H3qd2Wj8d0kY2/z2mkuua79xGd/odlZU6048cpLgpc61peUgcnwKk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/m17gauTh9zvwHFJT562OoXoVtLsyaUMx1AB08dF7EaN1qXjej
	moGR76IRL2qw/jCSV85YUxQux63hbQoZSzHt4JBJfJKuIet14fu1/Opq1iihOC9RRh2A8hC1TGa
	JqkdN/jl+V79lJ3HdCZlMiNdFR33luTnepQvtbSnyaSshcZAu90c8yeazTfJTkPFo2Qw=
X-Gm-Gg: AYBFou1Fi+AJ1EBbwcG4vvBgTsUWrBbUqJsBwx5OA570sibM9W3b+HPCkfhoqlGE056
	UkRHm1cQUERn51QT6HgSOcv3tku6Z70+t0Uyrxl9a2Td5NTN1l/0aD89SXHzYEOn4gnOGEFA/GO
	59mJndEPLSFWQQ1bXm0B9sMPfnJo2kfg8sHgpYwKLSmnds9Hpnxae7iTAjdKiIn7cnVwjJeUiBK
	dNp++4FvPgl7yN12Mbe/FSkP7ZUc4jjuyN/qtQ3/nE9TOKVYfjojMA97lTpsKiXiehInYPaxqHF
	s0GFz5uXoEZFYfkjZY8gMO8FGcHU9g9ZbRN47/mCDjEZbq1B5j642bVzRRdJMXqgqz/tcSIRfv1
	VnQXk8Z9xNgwGpEwngA1ISP2ZUtdW/5SCJpN6XCP9/kTOx99+hDbxwzE9WfW4ZiHdF3iibxFWLx
	lXGSBOcFbC
X-Received: by 2002:a05:7023:888:b0:1b3:ad63:b9c2 with SMTP id a92af1059eb24-1b5568ee910mr2747971c88.22.1795173074347;
        Fri, 20 Nov 2026 03:11:14 -0800 (PST)
X-Received: by 2002:a05:7023:888:b0:1b3:ad63:b9c2 with SMTP id a92af1059eb24-1b5568ee910mr2747925c88.22.1795173073491;
        Fri, 20 Nov 2026 03:11:13 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm7254229c88.13.2026.11.20.03.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:11:13 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:40:51 +0530
Subject: [PATCH v7 01/12] dt-bindings: media: qcom,venus: Add context bank
 subnodes to common schema
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
Message-Id: <20261120-vpu_iommu_iova_handling-v7-1-25a771235a7f@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795173061; l=6195;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=QubAncHhhvP95+8S4/Hf0daptJaGxx+rk0qFwJM9cSE=;
 b=GJLLVLvJZg3eRglS4gj6HNYf/ZtzmRLyhRLdgszhX5eCa0sG3R2ydlGO59TBrF5FWLgpPzopR
 Z40gp3lH4ovDs6X+3Sv0JmZKHzYk/KLjzY1qXaEdHofU6gLNa3fkDae
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX5ZnaqNPlQFi6
 MdmFAozT+jIbZG8WXp3bpKN5hxZ8OXPkHkXRkXwR8y89JOJ6JnZ9PvM7ECtDwXRa5jheynZuwmx
 ZuBV+5Ai4mHIzY9y7HwCiD0zvDpJwmo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX3eM/ZpCo2Ep6
 KtA3ltpwPCZkCtFqGm68ltKlyisFV2WTTFKqFw3Hs6kKs42OrWYwIz+jpQKnkgc/PBB6jP6BdBh
 cdug3Kq7nts30gShEvv5PmVLt32hlyXpdZAd14n0IxBv56QnxeuUx74LkXK4vSNcDRXRyRbfCmI
 p8Mw0dSv0hVLN7HaigWa3OZuCAI3tBTcygTaKRs9v0IT731kb7acWX/UL+7bajDOppZFQxOtNf1
 hp3OSfJ+JrRbLBEsUztgnxCxDjWGzG/N8U8xUTh7O6uRTLN7Q2AwTNbEiRlqLdcQLkRqOMxgwMZ
 I3KG6f+mz56KqV6GXvw6ly+PeBlJ9RE8JVgpF74CxMEFsuHm5PFJ5aX3H5e9hngfWeu33zWmMYH
 jf3DoUo1z+GjQ+m1ev428HlW4qXNwUkj4C5Pd/qcmd5zVW4EwXSLV97sWDGdSz6iwS2TsiEOQej
 FKK/61B2+fdc6cfd/rQ==
X-Proofpoint-GUID: 2wjCM0h8IfWW3svIjN88NDO8UFNoYZHw
X-Proofpoint-ORIG-GUID: 2wjCM0h8IfWW3svIjN88NDO8UFNoYZHw
X-Authority-Analysis: v=2.4 cv=LPTz05W9 c=1 sm=1 tr=0 ts=6b002ad3 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=voxwdBqwZatJwGYNWigA:9 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200044

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

Given that the address range restriction is for specific VPU stream, it
should be ideally be moved to that stream. To achieve the same, a subset
of streams is now represented as subnodes, so that each can be
associated with its respective addressable range. The design was
discussed and agreed by mainatiners here
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org

In the past, this limitation was addressed with an iommu-map approach,
with the iris driver dynamically creating the devices. That approach was
later concluded to be a hack to avoid having subnodes, and was NAKed by
the iommu maintainers. It was discussed in detail here:
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/

"iommu-ranges" on the subnode describes the *allowed* IOVA range that
stream is allowed to use, so the IOVA is allocated from the specified
range only. Define all the possible subnodes so as to describe all the
VPU hardware iommu interfaces, both secure as well as non secure.

address-cells, size-cells and dma-ranges declares the 1:1 DMA
translation into the parent.

The parent "iommus" is kept as an alternative via "oneOf", so platforms
that have not been converted to subnodes still validate. New platforms
should use the subnode form.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 .../bindings/media/qcom,sc7180-venus.yaml          | 15 ----
 .../bindings/media/qcom,venus-common.yaml          | 97 ++++++++++++++++++++++
 2 files changed, 97 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
index b21bed314848480b82153e49602f0b19e08e7335..bfd8b1ad473128c974bce84639cb0aff59d8c2cc 100644
--- a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
@@ -91,21 +91,6 @@ properties:
     deprecated: true
     additionalProperties: false
 
-  video-firmware:
-    type: object
-    additionalProperties: false
-
-    description: |
-      Firmware subnode is needed when the platform does not
-      have TrustZone.
-
-    properties:
-      iommus:
-        maxItems: 1
-
-    required:
-      - iommus
-
 required:
   - compatible
   - power-domain-names
diff --git a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
index 0be2f9119e78233928d23af86836ac294aa769ee..6c205077bea4d729335d7a5690a57bc1bb43ed9f 100644
--- a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
@@ -50,6 +50,93 @@ properties:
     minItems: 1
     maxItems: 4
 
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
+  dma-ranges:
+    maxItems: 1
+
+  non-pixel:
+    type: object
+    description:
+      Context bank for VPU non-pixel buffers, including compressed and internal buffers.
+    additionalProperties: false
+
+    properties:
+      iommus:
+        maxItems: 1
+      iommu-ranges:
+        maxItems: 1
+    required:
+      - iommus
+      - iommu-ranges
+
+  pixel:
+    type: object
+    description:
+      Context bank for VPU pixel buffers containing uncompressed video data.
+    additionalProperties: false
+
+    properties:
+      iommus:
+        maxItems: 1
+    required:
+      - iommus
+
+  video-firmware:
+    type: object
+    description:
+      Context bank for the VPU firmware processing domain.
+    additionalProperties: false
+
+    properties:
+      iommus:
+        maxItems: 1
+    required:
+      - iommus
+
+  secure-non-pixel:
+    type: object
+    description:
+      Context bank for VPU secure non-pixel buffers.
+    additionalProperties: false
+
+    properties:
+      iommus:
+        maxItems: 1
+      iommu-ranges:
+        maxItems: 1
+    required:
+      - iommus
+      - iommu-ranges
+
+  secure-pixel:
+    type: object
+    description:
+      Context bank for VPU secure pixel buffers containing uncompressed video data.
+    additionalProperties: false
+
+    properties:
+      iommus:
+        maxItems: 1
+    required:
+      - iommus
+
+  secure-bitstream:
+    type: object
+    description:
+      Context bank for VPU secure bitstream buffers containing compressed video data.
+    additionalProperties: false
+
+    properties:
+      iommus:
+        maxItems: 1
+    required:
+      - iommus
+
 required:
   - reg
   - clocks
@@ -58,4 +145,14 @@ required:
   - memory-region
   - power-domains
 
+oneOf:
+  - required:
+      - iommus
+  - required:
+      - '#address-cells'
+      - '#size-cells'
+      - dma-ranges
+      - non-pixel
+      - pixel
+
 additionalProperties: true

-- 
2.34.1

