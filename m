Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182244;
	b=OJFdcXZBb+oIAsDciN60MlmSpM/IwAyJiUqzzKWw+EmsldX2gcQiA8/03LZkn+n82aoT
	 WF2c9EJjhCkMoRh6O+JbRawl6qDFpdeQbEmrC9WqmJb7Ix/ZslEwtX+Fvrr/WlJmiDJZq
	 TyD6Yc9E1wylYEIgwsFhrHkAtoN9A6kGgykFMhh8r1ECRYhPWkJYsMkcI/p925AlD/VoZ
	 VGVZI2osdGsHP+fclz7GG16Y8KBZ+eb62G3BQlTtxuwbjl+sXxu8Cd3svIsoLg3wbdCOu
	 HUscdswnzPTwahJJ8aeSSKZ7iCd3B6AbhNJOwDpbaMPmkz8CYuLIGpwMhSsmywxg8ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182244;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aWLejDBY6cxKAWalyM4UrAn1z5uDI+O1UHK3W8xEzBI=;
	b=4C1evSCcehNPAbim1Kqn4wUkD0rUTwcOFD9HIUQBzq6x+BMJS9vCN0H5wV/RYPZlf3wd
	 l8h86iorYd37qnp4ORTJphCVYY0BnBBLZ7PYPV2DybRJo8FjNsFRRFb1hqZLyES44k4GX
	 ITb//iTmZIdVM7ZUvpbvK7iudfWAUdwp1LgBz6LK9tVT4039N2/Gvpz3QPBxHuOvjpeiS
	 D6Lj0trwA5uRcY4vwM48A+AtFK4GzonjRhp5MjsHtBcXqWBKUeK1omSDriRSefo5hM/d1
	 RnuGRaJE37WSFMC2gSK684a+ZQRBjP/3I/RtKgP1GvuEvil/vl/0nmvNS91qwM3rIsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h8lmYrck;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vx70um7f;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE25460A2622
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:44:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE25460A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h8lmYrck;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vx70um7f
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjx8b556465
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:44:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aWLejDBY6cxKAWalyM4UrAn1z5uDI+O1UHK3W8xEzBI=; b=h8lmYrckPdPOTE9c
	zBfMzDPhb09b77c+f7yC++L5R671ZuqDB4ARr8QmZkVWngg8rVQozVA5dAT3uwMv
	DeCalnH3oHpSn/4mMtGROnCaGRRte5JmgxEh9tBuWB3fpmh9OmhYJncenlOWJS5E
	nqh5ZTC+V9bv5AfI119C5acSzsYxl3n8GU+fZDBPKB4JMtNxusRxFnD1MxlrSC1Z
	VYJ9wu9fcadHw/OusG/AhSdbWLb/tdl7JFVZ3Yn5IanRMQ+MZqyxIqWwMK3bU7LZ
	m1+mSlPSPFfVi1VUwXXkwVx+E2Wm3BtbjC6MQnUEmULsvha24zyvKq0IEt+p4uAK
	yS/U6g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fsbj191-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:44:03 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-38131260a5dso2341887eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182242; x=1795787042; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aWLejDBY6cxKAWalyM4UrAn1z5uDI+O1UHK3W8xEzBI=;
        b=Vx70um7f0J0eyXpM+/rcbMyho5v/zaRarIUVoYd2Mex+/5bcC8u3tJQlfcBQ0+ePhy
         ZP+db2jL61voc0tie808NH2gFchKQsYIk4ylFxKsikk46dFESVSTpjFKke0fgZLcMEKf
         Taj3YbpWseRziy+xw7a+PsRu9WWmvYFpp+7+Ro7n5biYJGe9Hy9MtWZ26XaJcXzJURuH
         OOWlUt8JL74GNOzDJD7vBsVRQLnKSbGZDQuUrjQMc0oYssq8aHzLNw/GRmNfjpelcEO0
         z4idJ9IBqjEEfKa+iea7D3PBmfGdg9CLUDSjK8ezvznEArB9uS8JrRxIiCnMtnEYDvrc
         YjPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182242; x=1795787042;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aWLejDBY6cxKAWalyM4UrAn1z5uDI+O1UHK3W8xEzBI=;
        b=yTf1HW8PNq7lQ6EOV/eWsOsAb/6/hTPI+I6lDbzoqStqq0wUx5+CrOfXZLu4NIGsh2
         7RrJNNxBHV/M2fIhNiBZLJNSxfvcOb8HFJPgLSOh2j9yQdVUZYD1lAzrCwK7ndPzGz8I
         hwr44UH98nScCQ3RpgCwmC6YXLpzYOgwc5uADu9weNXIsGwwaSIsxXVkg1kKsvNOc3f3
         FxLtmP+nZ/D6fXrPVyTDzpiQifzsXaybT2CGbuOACgxPk4TbxuFM2YZi78u0n0ls/fgS
         uRfUPCMOIgC4vgbVfJ/99uBut3aTN5FMoeuKGyJZljVEmNMWwHs05KFsAnGdGrUT2uVp
         44Zw==
X-Forwarded-Encrypted: i=1; AL+hErEaWDPU6DVcPEtGv7ANn71I/XOjwr0tG4XeKFX1yvolXS8SKyMQ/CxxbJ27znESNRFiTlkwwBzeZMs1RFk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9l6bWWaexQuyM246iQne0vgkxQF3nw80Vh6McKMojySgie1rmr
	WJqis0i21ScCD9M/jihf+u8dWzHZYw99YO2TW/BwfRWcG75zu9Axfd9i9eJv6zrI6ARRDIXlWsd
	3en3YmRisJ8xU/6iCajQQJvpdvA9mRLkHzEBHZqifk2o6h79Ua7Q/AUGJa3AXQioQFOM=
X-Gm-Gg: AZFdTZdYRK3FTmd/8Z7YLycx9Pt/a7BglgBn3UqqnSxCwgY/gfMq0f5hnuqP+5M+2Ys
	IjPS7R9koweSRLwVoODCDescXb0aBuSMAhJauG+Lmmt1inPV9AbD2auQd1fNjOOtu3Hl96vejJr
	p5xbUvlYEiHRD3ao0cnUyg9RG8ejYNdo1H+hEFF02mKiamfwIRnmA+/gLHfuSLzB0MFdQwONQnb
	jPVmtcbfaCUUqQ9hHf0/H/l/6Eco7mVw41rCMaeRB1eD37zNfmodAVQderxIKH2s16zWrt2FzzH
	eHzv1YJnkhcWpb5JGVY/gg8Wpghhjbdo7SuxPnsDSkNEr6xAZWd/fU+SPxfUk+LKHa7PksJDnpk
	s9zRF/4s9apLN6RdynLPBHJuQNK2y4LdPPio+XWeJFU/4CwvZzHdQGtrpUBXy+N8D23iqnqU+d5
	3eANA=
X-Received: by 2002:a05:693c:87d3:20b0:382:8358:9e03 with SMTP id 5a478bee46e88-3856ef457c4mr3214244eec.17.1795182242339;
        Fri, 20 Nov 2026 05:44:02 -0800 (PST)
X-Received: by 2002:a05:693c:87d3:20b0:382:8358:9e03 with SMTP id 5a478bee46e88-3856ef457c4mr3214196eec.17.1795182241665;
        Fri, 20 Nov 2026 05:44:01 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:44:01 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:49 +0530
Subject: [PATCH RESEND v4 18/20] arm64: dts: qcom: milos: Add GEM_NOC
 interconnect for adreno SMMU
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
Message-Id: <20261120-smmu_interconnect_addition-v4-18-be30526391d9@oss.qualcomm.com>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
In-Reply-To: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=1035;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=uW8nrRF4SJLtr5/e82lnBVVXICez3ZPhzw4syEcDxKA=;
 b=ruBw4Imxa59bxECtm9BfDnEQ/DhLV5sEaxl2SqHiR8757X6GkqgD6J2x9UuFHUZeWElYLwbS1
 eSMtXQ8gr56A+YS8LcG974uxZbhOFOHcVO3rJlm/kmCKVRbZFPz+WnV
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX6RMB/qL/I20Y
 vyfVcdoTG9hP7FxpHcBWhVwpQLqWfPxi6TOI5g/VOriXt+2FQcY44x3Vbp6haPgo7RO5k+cGgfO
 I2gA1IcHAMvTvK6KrPhbGBoMVmEpYCEqvgvtXIXCZ3027/JXvAQAPFsvco3w9HvphZNWbJoTkKy
 I7rwg4Kbk4DI433cVrTxw/pRglTRbqPImXky0iM0yEABOBeA1EiSy35v+beCFUiH5rOFtYlz3SH
 QNVomWIXps6YAY1SFSbDuhFb4F6GM570zVUfjAnf/rEJ5wmdyJpr7WCx58BxHyDst5uuLHuzDPs
 Y5UqbqL6uIXtQxWi9iCCkQCgtcSrSFlNyypKm4zvo4tV2Zg8xjS65qRfIQENnUXhFm3co9hRegu
 fo4IImdkrvT5/kqSE+hDb+g4xkllf2UGu5tPYFFK/ao7XIqFxWSy8rS/+TgifDbhgvTvVF5viOP
 7t15VP7Npmgjz78ptug==
X-Proofpoint-GUID: gwctjuUJInL36Dx4D6_bYIxpSon8V4N8
X-Authority-Analysis: v=2.4 cv=DeiCOftW c=1 sm=1 tr=0 ts=6b004ea3 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=iSr-qRAn3DWi8jR0IaQA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: gwctjuUJInL36Dx4D6_bYIxpSon8V4N8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX/CnnLPik0gLe
 B+oR1bwNh8ZJMErA2VSLpGKY4Y914hM+nv932lf7HMZ/dZB0q+7j4fgQaTFm+vOsdgJ9LTV2DiA
 fqt9qiFgMMiE7NSvTzzBcZY+IWaCycg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200054

On Milos the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 9cae93b6a610..49ea0a8759f3 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -1988,6 +1988,8 @@ adreno_smmu: iommu@3da0000 {
 				      "ahb";
 			power-domains = <&gpucc GPU_CC_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		ipa: ipa@3f40000 {

-- 
2.34.1

