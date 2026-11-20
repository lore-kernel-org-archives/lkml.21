Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182234;
	b=c9JTyH6yobNSIKcwhhalNeN80QYwO6Ur5ijB52Q2pwgo1tP2gvRpjeQSTdVRlbTyC0sx
	 VBb/KKCnsAi78n1/sAl0kEt/2p51SjW/2E4Bkhr0eD+NaWWJpvCq/9lhINM5O+i9bw4sk
	 zBz5/YhGQcqmHOimqAW3C9rEoWhiIOmPNe21BhtBPxCypRXz01XEN28nK6ya6DaViJFZO
	 yfIRE3EKsMTPWmjf/Og+b86GblKpjezrK19IEHd/Z4FUTf/upBUVQhDn/oXTd3AU6m2dr
	 3IuICgi88uffO+dDCeBCxyF8W6xCpbz3H5x6Ph8/1+dbpQzBaq6uiiQ9nfAZIfd7xDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182234;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1n8AvJWAPVamnEVhs0wyLEjCYaGptaUkE4x1OLf2QZA=;
	b=INCW0LP7wByjvf8MHBlJO1/gfaL/pVTLYoaOb0QG0kzXXOJi5/1wHiFWXQgWQ2bSSRlv
	 aB7AN5NEP+6vv3bR4rjJn7r5HNHgfXeh6daULWN4wQCg9dN7Q4j/EiQLkknwwXCt1S4KA
	 yVDsv/x/YW++/931FBy7wq/Empm3X2BGvNd80QVM4hXIb1PHk7FFCMs8g7/CexWEFseT5
	 Bn03W6oSQM75pM4KLfCzZnW+EGKCjx1NBKQT4gfh1WoE85w0vggT5Umk3WycuDQjwQTyu
	 GXlMGvsyXZGblZMTTA41Sx0+O1oMlnlAvzgJpL5S9EcPX/OTr+Kijc4rcGOp2VYihbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=clk3TyRx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bfE9cOiP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2933A606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:43:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2933A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=clk3TyRx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bfE9cOiP
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjrfg3731045
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:43:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1n8AvJWAPVamnEVhs0wyLEjCYaGptaUkE4x1OLf2QZA=; b=clk3TyRxsqGpmwKH
	lXFfHJxGFKAo+2t1b7eu0FhmFz8UU5VLD0pn0BT5PwOd2Su68D3lc4U1WMgdM3pC
	TXHincv92LJJFagvBU3qxroJpby2qbjx3xHsqWhtYE1JLn4ReJGTWF+UIDUP04R/
	faja1vhBDAakHwDXpepD88lWuevZi3lTmylUyxCBpqFHm54oIHDKWTTOs2R1ffcl
	ydKhBgnJVZuNfYtM3VCStl7C5f/gI63pR0/hzVaw4gI5K7IrxkyykCE6QqaDUpDW
	yYSJzAM91z2nrVPn24bTgOOCGw5ZnYgV/fVPZtcrfOu3tVWzmeE7lIyw3OBKc4pf
	1akSlw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2mm4gnh3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:43:52 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-38131260a5dso2341511eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182232; x=1795787032; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1n8AvJWAPVamnEVhs0wyLEjCYaGptaUkE4x1OLf2QZA=;
        b=bfE9cOiPTWNTjRt5aiqNOp2uXhuBgGwY8rbEqFQeu8nHfAAYMoIZxiLHCEc/9ScQEb
         g5qy6sDRQ43CS0hixCDk8/nMuCkgMcEUzhFWB5JgHKF2B6lZWL3vhIREHEmkkpY/lGTy
         sfJkrv87EkPoTRBwmI58Xbi1oFFnElhyfSIt47u+DxW6Ol0TsWuKPOYOLxr59X94xpVS
         0OqrdPTQGEXdczMfYEQVBla8ke0NCfZ1hfWoKHm+F5zQ5hhIpET48Te6vzV2hLBEFSvT
         Zhs6kDFDO4CWcEKfd7XOdw1hxaLhzpGaQCfRPjN6Hwdh6gcZOJ2ZHoX/oaUSek2NWsGn
         t1eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182232; x=1795787032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1n8AvJWAPVamnEVhs0wyLEjCYaGptaUkE4x1OLf2QZA=;
        b=vfJB2MeXyMkB1ZgpMLPy8cKtpJnllOB4XXx95ke6Wl8qKs38oonFEgQAMZjLiT6cYV
         Tl1ZeJ23NlBBODJReB7LKqmKhjJmV4XFZ4aZiHpDDDVTyA59pmPiXcoIa4/1f1D65WHB
         NIVF/e1qNnPqzcqwyYeMX7WldGyZazaZBOKvGOq3GHMFXUFaqDPK0IZrHx4gIvAJo4lE
         r5I+cO002TZE6xkzPrltg/NVR/6G6b59XFRZo1Q+t2fix4g/0XC1C0gkOLDFAyjeVdGm
         0/D1qrDjO3RONz1XSjQiADz6wOY+1AqgLo7BIod6pNU4POK1hNry54wd61DQlqHvKl6G
         D+Sw==
X-Forwarded-Encrypted: i=1; AL+hErF8su4d/Wg7PS6pj03S45CaWWay0lvpYEalzHLkcBmMAvp/l7YXlHg5X2BzoQTvArmzDPGAW6pxaVpVCVA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+UUXtR9zrOoq4qJEhYfXsRqWi9rAmBbFyUOL0PwlX9QyWVh3J8
	6lC2Wk6mjudruMDp5NjQvmA8acga4Lm1FmAursMeO4QIlCn2TZrw+jBBmY/QpGQcrLhm3nNUdbv
	VDdNw/gVnuOZ5qjFaTORTmSTwHITpjvK2f2/Hu+5noPlxyyzrHwlz0dZB1l+7kGOZmYk=
X-Gm-Gg: AZFdTZe2QzjaVaR8GYglcux9g1cV2WEKRg56pCyzLeD4NdO2qIvaPXRnfQUhkPPnPBz
	+03V+z0t7QLa6Mj8L02qWwHi+OEFTa/ZVXPyOGC9yBns9jel8CBa/Z1jEdpoWpX1sk+I/u3b+EM
	MjmD9rDfVDX4imwFSPVN8pGS84seETcYiRk3Nm2/Sifqu2aZNoMQ32mOjxSI+T9JUjt3UufLcyE
	mp4hGKrL55ucujG0/TeIaREN2v3ubsL//sFP5REmBFs6GYAmhn77jmoEAr6PUdLTw/Qskj60YCc
	oIrZ0imEQUBFUjVPgat6VjWKZgYRM26ACQ3Vx3x9yr1relBWVZEcmsmz923BTodKoqdF3t7OvrJ
	zSMMRUXkKlbL3AAtpZ/XYbSdJiFHNR/tnIQbQiyl2ZrWYoMDnANz09qG3bck4SGN/Rllgev75ln
	93JNg=
X-Received: by 2002:a05:7301:f23:b0:370:a11f:dcb7 with SMTP id 5a478bee46e88-385707434a6mr3031607eec.41.1795182231721;
        Fri, 20 Nov 2026 05:43:51 -0800 (PST)
X-Received: by 2002:a05:7301:f23:b0:370:a11f:dcb7 with SMTP id 5a478bee46e88-385707434a6mr3031568eec.41.1795182231051;
        Fri, 20 Nov 2026 05:43:51 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:43:50 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:47 +0530
Subject: [PATCH RESEND v4 16/20] arm64: dts: qcom: kaanapali: Add GEM_NOC
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
Message-Id: <20261120-smmu_interconnect_addition-v4-16-be30526391d9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=1086;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=VBW+lAkn36GDWfLSpCvNbA+g18nHUbQQFlmvho8wcKk=;
 b=Fm5c9lgr4dbQtZ6J15zj9ArLcVgsoaJbg8eXgfGxClImKansogbJQoCBmf72JtCS7ZdNH5yZU
 9syPd6qmkycAwiyl/Un5MoDMHOeMfsWOs5/rFq2iL1qBF8PoemaXM3b
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-ORIG-GUID: TzBCQDI7M9p5Al2S3sehyW1Vx0_6Hnsf
X-Authority-Analysis: v=2.4 cv=RZYFmFtv c=1 sm=1 tr=0 ts=6b004e99 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=iVAGZxyPhfMzDMBdamgA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfXyh59uK5mz8Y8
 +RliJpXFk1dKAQOB45TlZDd3aFf8hSDrbLztGzWK9IUWk3dTLR6IcrNcdasSAhHQqaaTJTLKHlq
 Q+GGqLHdK2VJkD8bUvzRHH2qIFMATPo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX04OzjfCuBkV/
 h8A6rLGmL6tea1lJ89Y4oHYenRlDJjzVOY0lt+zPEm5rc5mvcbW027jraD8Zyx2eTrto4YjU7ms
 pGlZqc6AI44KmWAjUeN3wBkeDSFOq5Pq6++sJ28D0v5MUP+zKStYoEoYrBdFV8RghAJpI4AmV8z
 GSN9OEywKORzl2KuNI5U4M7Q9PXXHBlN7Z66HI6V+EGRj/Q5UJ79buOXFLY/wOy6IR0rs2tGO+/
 8Qveg7DqvyBOL1fn8ZzIoN2wrp52p6XJ8visymbw/z3SYBb6lXUSL+IxcxJeuWekvV/d0PB3TA2
 S0cEuQGpnqttftpys1C4YUJl0cXL/zq85HFbYTPJoirdMFZsc6OxY2965egHJV5AOZSByNuwCEO
 cXEL4zl39wLBb58cnHj3AESYnWf1AnoTQdwSFygNksBbQgh2RH4y5LHIkVtc/q5VHLNT0I2kgzO
 pxMKA5j3jFbBeut4V5Q==
X-Proofpoint-GUID: TzBCQDI7M9p5Al2S3sehyW1Vx0_6Hnsf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200054

On Kaanapali the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 9f04a5ad75f2..eccd5451e875 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -2997,6 +2997,8 @@ adreno_smmu: iommu@3da0000 {
 			clock-names = "hlos";
 			power-domains = <&gpucc GPU_CC_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		remoteproc_adsp: remoteproc@6800000 {

-- 
2.34.1

