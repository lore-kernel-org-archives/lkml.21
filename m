Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182255;
	b=x3lNfoK+bJ9Coi0SVIYZgpnorTJ6sZIwTctSjyinsw/arG/1NvbdCES5wLur+hNV4z7W
	 8DEWt188+USTxB6L3CShh0CclpSJeobmeUsuoHTNNvBl/7+5oRNxJCuYjvJ82cwzaBgEo
	 0G01siVHg5cxpUWCbA5nbvXu2VNtpxUY3NoyU52uWEjzXa3mtIm5iGZVvuSkyM4miFQpx
	 qgYfGKNmZougAdAe64NlhVkUaQLygpQRQsQnHgdZrRw3QfpCzTbhzQkZ6N6C50M2DvV3u
	 FEGZjh8+l+engnZz27E65eyA8jN7JPnRZg9f2rmCiTn4LEZX8OwrZCJp0rd/enDQBNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182255;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/W1FyUMmKaB6WaeuXYdnagaj02F5bspI2VHNpVO5YfQ=;
	b=SkvIWOo/xnE6rIb+hFIHUK2CD3hWsrg3E117elgXXI2gaHcOa5ifkN5YtKuvc4Mz0aAe
	 VznCWwxLF9OIU2u9UB9047QUC01bifhk6SsmDUPryPU/GoflVHMEuem3vwNpb/gshwpyE
	 0y7BsWLxX5tZRA4r/rmkvg4Mw1rscFoZYt1ErTy/4aniAwwd0ATR7U7J292vrZeH+4M2k
	 9hrpMIIYchPWk5JoKnhCTy0Q+bPO3NXdccH2skjoVWLtmqN7A7U4SJtxMn6Q0R8B1/ski
	 mJm2X8Cvz5H49f0haUqWETVXmiAQZHR7IN3yTVa6h9tN0iyXJEE/YjIuN6by7xAHueQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="I///JBMg";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ABUC36bW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54DB606A33B
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:44:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E54DB606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I///JBMg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ABUC36bW
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAk6NI3987226
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:44:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/W1FyUMmKaB6WaeuXYdnagaj02F5bspI2VHNpVO5YfQ=; b=I///JBMg66s+Ajzu
	47ybV+1oKz2uCczswJ2PLec6ejaV8ECbm7IfuYzpICw11jUAWMVRIzg+OsYe4ap/
	+Mtw8Rbx9r4eUs+2WCUN0vwcJj7F3LE/ywIgGOqi5wSvPw/szZMa6E1/Kb9TZ0vX
	5j1hh+1g/A89ebO+E4ZIMxEJgQoJmT2r3dh0TI1MaeubSi5v8KrieU/DNnyrKsR9
	wU6r/VIKXVMxw4H1Wq3hrw+DP4hTux8BPHdAE86pgVQ4DGEo7lLAhSsibmhhAJ6H
	olphCQt6frVIoaQZ+zG31UD0VzOYKY2Oh2RdOWvOGZzr8nZwJn6PiNtmLHgbOJ8Z
	M1vJpQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2gu81q2t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:44:14 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-375bac6bd21so994209eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182254; x=1795787054; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/W1FyUMmKaB6WaeuXYdnagaj02F5bspI2VHNpVO5YfQ=;
        b=ABUC36bWyzyBN2l4y+rZd3h7O8zD1ufMl9ss8Y1NpT3UAp7ySiZ9KMgsf4ij0M64/3
         QJJKz1H42lY80jGu5zFid8+WrMHuQ+7HmWaBKd92ZrECe5pNbso64CbV+F8nJhgDR3eX
         OufzAuc1rgdQRFoVGlc8NXHW0wys1uIyepuhUVs+bYLhlmw+lGco1+9e8TCh10kPhvx2
         GPbUK1s7b96Gjma08YSndlU6jCComM4la+bgJEAmHlFJLw6dn835awsXVWsk0xCkYiGw
         +yHEjviL5GKZnN4f32gya8L55qYJBduHcxw7aeQ5kbJCOXKjW7B/8g7LznxeVLb71kTQ
         3Eog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182254; x=1795787054;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/W1FyUMmKaB6WaeuXYdnagaj02F5bspI2VHNpVO5YfQ=;
        b=ysvuhCBNJdUG1Rc6JSbv1MxmEPheoav1O9DvRtAFhqDXK7ghxKRWq1lm79hK6jMkEx
         Pd8pIZn8a/1Zd8A6lWjz/NY4EmFoY2Oxvp17/v0u2xvv0+eNintcUIojO8dZc5ubSqSD
         d5VTC0Id6yXGtyoFopC2YLsXe0D3XAx76tJ3S03oWy577DWNNcTisKWJlwzrsO61MrTP
         RfjKEulE8VJX++lV1tYIYBD6ugyhSgNSFpiWJJ5Elzue+3eZVet3xFFLBBQ1efJmkbKV
         3914uWHsQzIBgT1kUsb0d3cDJ9/f7msvoY0VYh3DVQBK/iKQkZic4ryRHIYH/Qikie6i
         Tn9g==
X-Forwarded-Encrypted: i=1; AL+hErE/O/i+eemWbs3+IVWm7+hm0L3gvIEmvXR0GJhiUAUceK1BOid3uplC8piwc1Gx+VwpG7DLaM2XO8TeBAo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3EuTLm1apn2u0rEU9WKXZuBxl65yXPwWb1xEsF+YED9j/xvhj
	0PS145TMbH4+amLR1UumJtAIwZUIvyKDP21VM988mqpJeemjA2jviRagBMt3qnkTatl6Mc/BFkP
	HmiGap6vqrfx3Um3G7W44PH0QPFownOqt3HDedhq/9EGf+82DeoZCTRvZlMk517u3rTg=
X-Gm-Gg: AZFdTZdKqKxKW6WH2JaRG0idyFkx+4/dlPxrOwVOJdWpPEWNlbbWDaZX6UWXj0ERFJe
	8Cg83PJpcF98nukMkBluDq5q7bqlJhOEFY0TbzW/E2sc5/6AJiJNFcDpE1LcM1oWsxd88ZQRUJB
	gp8vQXsHmWvq/DBPL6m1bE5Nz3PNyVCgJzW9TxiuKM94B+n00q6QE2VAB9OUBXQ8kG+84ghpZeR
	Iaw1p7LJZW9nE5Fao3mGoCzvVnbo29TA7EyuEY52FSom2hLCGdAhtAb5XDX5n/EvCepz3W1fKSO
	gj0+U92wMDAu/0Csij5Lh6soWOlc5zADGIa6MBclt/HsTjbn6DCbQf4QJ6Lu4+OWvmmJZDEA6YL
	7wI3gnWKrL+nxfPKZHjnGi7KEtgGBJT9+t8un42oRhLlnpcC++iTTabTtq/OJl8ae+S02HFD2O2
	pOnaM=
X-Received: by 2002:a05:693c:6395:20b0:375:6fed:8e71 with SMTP id 5a478bee46e88-384b3986edamr4222118eec.7.1795182253239;
        Fri, 20 Nov 2026 05:44:13 -0800 (PST)
X-Received: by 2002:a05:693c:6395:20b0:375:6fed:8e71 with SMTP id 5a478bee46e88-384b3986edamr4222061eec.7.1795182252290;
        Fri, 20 Nov 2026 05:44:12 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:44:12 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:51 +0530
Subject: [PATCH RESEND v4 20/20] arm64: dts: qcom: sar2130p: Add GEM_NOC
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
Message-Id: <20261120-smmu_interconnect_addition-v4-20-be30526391d9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=1058;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=jWnycFT0az2p/u5EzI2kuq2uyYSvSmt1HyCePSsKymg=;
 b=ZflA6r7UtGdDB/8yQ07sE7yzSHaKi/dsLit6bYC44nb5Pebakn6aH+wZQKxLjgIoCtcFXVcpe
 bgFuB6VkQYvAFuouqHVo9+JC5mPuCRTT9JJdyxC+SQjThL3oBPuBpig
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfXzUKoCOelR+pr
 CVqevRD8PMtMkbeYWTNPQfLdNeS4AbAvKKQk4Y8jO40R93u2rBT55Mirhxk6eMPoK5SioHQdCVX
 LnSniKCaWwpvgXCMNfMa6tq75cTcZCE7+pzVM//+gJpl3ZOfhGEbM1YkPtCWfvMi8fmCOqXrvSR
 GIDHgjH5IdoKOWKmAtmCv0bZWprFauJpCPbJGoi1iGKJlFyChQmzgl9byHcjZV3yYVPeSPY8dCl
 f0CIOXbTFjnAFZ1W1OcWOT2UZHp6mxSYUqKGJe5iczTolI+foxoKEnNf8mF+nUNlInYywXRy4oU
 7hKZbq/U7OtFMSDNiW2+hxtxLY9/BKH9DP+9OtuZ6X4lCTaEFEK36HBsC+AgV5ZjarsY8DbWgPW
 rKV1ujxaCDZy5vVz1Y6HKfGPiVUF7oyCPvjBtjuuNoMdkDy3Rzdab5xiVrlWRGvzwAErfaakCdh
 3beZVKkmVeoOeZllUIA==
X-Authority-Analysis: v=2.4 cv=bLeDs/+Z c=1 sm=1 tr=0 ts=6b004eae cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=BzZyaU2VGnUrTJno3XcA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: BohG6pkVzRF1NzUsShF3lCt_3QJPQFxc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX36dHDQp7Mys+
 UTRCeU70Kg1o9WsAzqIWc5HnIxGGByQe38Fe5K0oUg7ZK0982Imv4SB8l/KieufQEdy3HnJv21/
 NAH1Kw+h3PhL1UTjla4bKPJTcr3o+5A=
X-Proofpoint-GUID: BohG6pkVzRF1NzUsShF3lCt_3QJPQFxc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200054

On SAR2130P the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sar2130p.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sar2130p.dtsi b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
index cc4077005e66..950fb83f26db 100644
--- a/arch/arm64/boot/dts/qcom/sar2130p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
@@ -1857,6 +1857,8 @@ adreno_smmu: iommu@3da0000 {
 				      "ahb";
 			power-domains = <&gpucc GPU_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		usb_1_hsphy: phy@88e3000 {

-- 
2.34.1

