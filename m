Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182238;
	b=HdKtY4W/5VJGtv7c0dwU/daKuIS/zU/hSfuOS1S+P71v1698jscxctmhHqcIQxmB+B+v
	 rNNFLRQrBw1hMNpjbln8SAEA1kj7yNFfyWO2QcayYU65GhQiErOtYpdS+vJL61n6BkKlM
	 Mdpfu+wdG5YwkdLjHm7Ks0vYtvb19W8r+8gZZdX5ePS+L/D+HHg+YpDdTOV45qurHNe+J
	 Wgriy6E2cEoII7nLwr+IpTyz5HFQZ+N27tspBUVFB3Zsc29qcH2b8MEfezr4KhzGE8tGT
	 oV1MSE79xaDqSCezhgm0p0UFKOEyfei1UF4zrRN/Yw92ibg1846xH2FxQn+dkUQ6yhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182238;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aS7LLfFWKco/ZCfqEM+r+9fW1cESciSfAHUcC+2r1I8=;
	b=tPtW8Hus9mWN7dBFY7Fsm2mHEqPXZPkBcmRiBkXwDkX/skn5dmX/E1PGPdgNi+b5JCFg
	 02s/h01dfF7C6+Yw1A/ZDQBK+GKrHr4Hk3AYOXil48YqhukN6j1YUm08T24mwo5GAIFuS
	 P3PMKM4iB8OG+wAccrAjP8mHjcwVASWkPOXspZHw4u+6nL7MY/ChXp2WnQY3JbPVKmeFJ
	 M7ZpClNfjRPb3iyP6gnjdrdjBpRbFNa4+z5ROLkYUl+rvVNwWSVFkmNkMdJMnSeG6gFsN
	 sQ2DJV54L8y186cyAjZOI7BucZBn/3Iu5QLGoD+sjrQlsdAY/R6ZJHDyTD0fzZG3eSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P0ALIrRl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="MoYy/okl";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E0D60A2607
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:43:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52E0D60A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P0ALIrRl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MoYy/okl
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjqpn1463003
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:43:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aS7LLfFWKco/ZCfqEM+r+9fW1cESciSfAHUcC+2r1I8=; b=P0ALIrRlHSIpYwnF
	G7zeIIX381YdjzO5Tn+y8+uGwytHLwvvvCMV8Zn2ATImWYIuHDBlSNPbYj4HM5+N
	UAd+jeYYktMpph0XVMCk2zzQNAIC5ef/NIkpXZG9yDo9rzcAIP4goyyp+hstjDNM
	sSVG7oPuh/zet9xK48cYU8F+nO9fsl1y3aybLmYvffbrHB0ys39289NYvRtnMH9T
	Wy1l+KX0SNJC2KwCnU+JA8Vbb+yybaoXYW6u4csA2nZtaKrJ5PQg6XTlQUsbesEw
	CYy28QCLcGB6KAX1uG+/ce+1+91bQ5Pf22clCUSxs+34b/uHEYpG9aN7/GD06wRH
	W271xg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2guahrrk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:43:57 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3854627c1c8so1303562eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182237; x=1795787037; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aS7LLfFWKco/ZCfqEM+r+9fW1cESciSfAHUcC+2r1I8=;
        b=MoYy/oklkklBJGxYhwNTNXyS55sjkz6s2j1YN6DuFwuPaYXR9YkYM8ZMdhTK+qDxF/
         LGOVNYrPx7rdpaZx5aXye6lqsAdYt69zXXjzrl5NRn4foyt13ARjig4m9NKxlzKt8imN
         aVmRQALmXkuERHnoI6lHYX1LQ6YwprN1Qv60MYpHmKW8JASflriomHSMIF7GAB7C+jfx
         I7YpFgZ9pONtdthc/56MbBUqIz/T+2MaC0HAmhdsij6ErLynrCBe/YnNiG39nz8TiAO2
         tH/N/ofvj/8awCw4oRNAxql4AsdcTlIuruGBhDoplIojF/xnohOiUayoaadg7T/7oaMa
         /o0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182237; x=1795787037;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aS7LLfFWKco/ZCfqEM+r+9fW1cESciSfAHUcC+2r1I8=;
        b=qmFqHOitwFO6Cr7hUBBhTPSQG7tQxm61XNMVvlW8xVSF0O+v7Hq9Cz2mnsl28I/Tgj
         lutxN6zQgTYibuojUx6wC9nI7YYSrnc6sevSQHp40NtkjKEXg14pWzIw7zlNQsXUbY4V
         CTlB5aZVScLdqtlcJTk7RZaba/Jvnc+sZGWkt3lxnf376C7BLD1InudDQAS4uVhwrXhd
         Rf5POvCgbDC0/SouxHLkeRE86XNuNNlmd9Oad6AQR/7wUBGUNANSl9/DAUnxc7FdnzSW
         uV1uLejmVg62TCnEw3Xtc88si6rwwNWRks06d5/tQPKyFPUQ1hJqXdnAalb7d0YIf7Vo
         wDng==
X-Forwarded-Encrypted: i=1; AL+hErGPBH0jFZK2ShSijOdnNuZHmdGTvO9sqXfBjdiidEtfiC+KQYJwP+f8hgBZk+aK3XB9hTiCfTpVcZasqEo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Qt5J0a9XPmqwKB5cKQZxW/AHJcVLroM6HETssvtwWSKorU7wT
	VWSAmycLuxu2NqhSm6waMcQTZTD6+scoVuPlUtJssOUNQFdRvNymEVS3qPAzxkuRumH63OdrJ1n
	zDznWrabKJSCsKTawUCFzMCX5cZvVGYUzx9xcgWDjd60RxN40kH3c48EEpRQUbGlGw2M=
X-Gm-Gg: AZFdTZc1ERaNBUD9YbZFLvbIVYfZsfoYsQ0O7ngPV9ZKxHH3uNu9jCSzEbYmmbS82zr
	yzH8N9kqkRb+MT8XtFktaa+ZzZn6axbm0hp4D6c8RymAGLlmdnudlTmR1Q1G28D7KqEf1Gom9uN
	bw6rSc2Nt3nX5X9vSa+mplunPqknxJX6oAuIJBpy5VYkOC2nyJgMf1graPpL23jfyHovEDMiBnG
	/7pz+2eWrxOFx9M1wcXkrqYzScsWLygkx/Izz0r0l7/vs0IiEPPe91OhS7S2S8uyrypSK6KY8H0
	8je016Ow/yVGtZcx8GuqsdIWXjSNnb1NVIx/NPS7jQ2pLLVroOJZmL/0BAM9Fg3m38bjDBnBzr+
	HVNgAieeHCT7qM/qV5QFcIneDYadLzXNNxPHbA22Owgsnx9QtLqOUPQLYzxw0wG61nmZmHHh4wf
	4tYSI=
X-Received: by 2002:a05:693c:88db:20b0:386:1920:ea0c with SMTP id 5a478bee46e88-3861920f023mr1270313eec.37.1795182236935;
        Fri, 20 Nov 2026 05:43:56 -0800 (PST)
X-Received: by 2002:a05:693c:88db:20b0:386:1920:ea0c with SMTP id 5a478bee46e88-3861920f023mr1270274eec.37.1795182236327;
        Fri, 20 Nov 2026 05:43:56 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:43:56 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:48 +0530
Subject: [PATCH RESEND v4 17/20] arm64: dts: qcom: glymur: Add HSC_NOC
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
Message-Id: <20261120-smmu_interconnect_addition-v4-17-be30526391d9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=1054;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=kQCr9BRTX/wWuCiHnkZ4IEloHpuZO4nxnn6nFDJWtJA=;
 b=PirKNama1rX6T3O90xikO3zJbs4R1zjvKCN9rN+lImGmZfjb6w8J3IBREFB0LIbBUhDXscinh
 nJcYe4iqZY+AV+QgHvh2Wx4pbn05gQe7wcOegQFFyLLe3xuIl+tN0Pg
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX82sF8ce1b25c
 JszsLfJ6xrSxrk4PMAM+wmJqkdsRRoyEdet3w0MyaXb1P0YxpwB+iiFzmAg7rpzS0GaMtZIpBE9
 rm18bayR4fe41XrPcRrn+huDZo2aO9uODyKNVXXbdVM/CYWllZqX6YFGN8zLUmOg9L3DiotHE5+
 JXllGrZ/BDac636s3J6T/al6bQdzMXjG94KljF7G2purP/qHaifIcSMWKJGLwZX0h1yiqov9tJb
 ejT0q3a1I9bHeQ0TIaUPWTbsRS1aHCQ5IOuhqfhccPEBXi/0XaEvUiKVFafZKohRbBfvavawaxF
 IljrlAaASlVAKND8Nf6esozFSJcJUhoI4CmnRW6Y6g85qUf8Wp+FYfFa9NdGKiclwyidVe02AaS
 96BNUUor41MShLK5Oc1bauQXRU7YdbL2//7/xIdofqUjprWfojeQx8K0Zx1k/NOzaIo56+f0eNG
 qIhye5kr2fLVE5c/pqw==
X-Proofpoint-ORIG-GUID: cY__pi05I6eIu0e7GtKavB2ZhoVhF_ed
X-Authority-Analysis: v=2.4 cv=BIYmP1QG c=1 sm=1 tr=0 ts=6b004e9d cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=a6KFA2mGowSrcUvabvcA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: cY__pi05I6eIu0e7GtKavB2ZhoVhF_ed
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX7Q6WKD+4X2c6
 xmUK2JoolbhUp36Lsep1VxF8BDcx3XUTLVWdRc1pbdgjSKFV9h5APsQYDrvUHxNUxcimE2FGlbJ
 th+VDipEnshYV2nVQyv4pIjvLrCXhCY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200054

On Glymur the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on HSC_NOC. Without an explicit
interconnect bandwidth vote, the HSC_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index cdaf842814fb..ae3cedcaf9d8 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -4378,6 +4378,8 @@ adreno_smmu: iommu@3da0000 {
 			clock-names = "hlos";
 			power-domains = <&gpucc GPU_CC_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&hsc_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		ipcc: mailbox@3e04000 {

-- 
2.34.1

