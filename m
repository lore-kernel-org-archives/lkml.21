Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172901;
	b=K8DrvARc9TMmjEn7aE2jJVNx0UUIg95hZNTgAWDAKMeLCLIM/7lAEaez7COiTRORRATD
	 6F3Ke8ycAnNzjiujj83BbmpKudWEIB9fgqipL28rsOf+jsInGxJTaYyBbttl4hAta08O9
	 iKlP8aMgrRyd3MVpCuyKRW5hYwPaSpBBchl4DcCvWcQVvVLIm3a8hfsleImkQKiwz04T5
	 pg4qrn6MelAB+V1e0DB8ajB7jgbNqYU4w6E7Sdqj1XMl6vC5hsOcwHootNIm10EQlIL7F
	 heGFpy43x2qvf68iDKF1B97emzndlBH7J4FShRSecl/XMOddbDRDTnDFkzmCFS1S9Dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172901;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=aS7LLfFWKco/ZCfqEM+r+9fW1cESciSfAHUcC+2r1I8=;
	b=XDcuSq2D42FQfnRqG1v058fUqSKYtyQB5o1E7FM2QLHGUPpB5BDNkQkbT7i7yklIuL7z
	 W9bjv29Rfbpz/ryvXa2BBXSndgGHGo/swOy67VTv2+w+5ABdLVdhNQehoynKAfU5Ey9KP
	 cNdQisbI2VR0LCQWZ5uUKYqgI6rDISx2Xut7IuG5943HJD+lHeQsre1O2dOvnyfY11JJL
	 Hm7KHkhanlfeNacRdYEzJRFYnF2fD8woE1CI1u1JYEyaqmbhmYpQVosLdb9BzuZ/V/qbU
	 3Mo1veqUUthzMnuJGsmlkYb+f6UVWk8AselBUSB+ay3MqfRqoV6r4aAJ4wzZPy5DtmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="M/SiqKVW";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="EKsbm/Ui";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3793160A6F46
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:08:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3793160A6F46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M/SiqKVW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EKsbm/Ui
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjw2o2155236
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:08:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aS7LLfFWKco/ZCfqEM+r+9fW1cESciSfAHUcC+2r1I8=; b=M/SiqKVWCsBLXFmb
	l4zFOxr6T0VDM1R0F+KY4JepcSgMLlrunAvyOA1fzp/XEWO7bLUuvqRXrTDEmoVq
	jBWyM8s1t+5jghX0GC39ia2TqFJfyL9n0ST8zoe8f4C9D36bQvXt0YTyce0MRxWG
	fyClqlnYwed2v/YMdcUzPm3wM/+8ThTvA/ADNR7zlU93ZEkEDb/KfKFX74JULDVi
	eKjCR9XFi/XlO9BbRzQMqNIgyoTolQzIGV2HpBiliH0dyskfcqWzc9a0ie3rg3hw
	xKedYlmST1zQ+mDvDOz8ny54ZYvAnJw9oYgCQtuFJ4V6NQtWDp+SGXiN0LERCwDU
	BXcqxA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2f4yhk72-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:08:20 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-383165e9b0fso848113eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172899; x=1795777699; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aS7LLfFWKco/ZCfqEM+r+9fW1cESciSfAHUcC+2r1I8=;
        b=EKsbm/Ui293vLEA3NBPMfLRlifGYParMRHZHrGI3PFMe6y8NaVbmMs/KNJeVgSmdFZ
         2idARqmLUhb+49iI7JLdnnlf4qqgSGyfFPRVGSq+7bPS6f29lHM6xe3CDgx5FMfy16TK
         uSjD1N1d0ddqK9ICv/Teh6AqhrbJseTL6c36OKhm7tyBSQCzadM4UmqAqLU897zDPYnO
         b9mClnydsTc0EjSG0I5wY2PY6npuZocQ1RwHfnJzl626t5bHzVzlfBsfcHgWwiLuZYfr
         HNgQh7V+QGIX/wWySDKWgREnA6siQ6ja2LZ9kgMgPjiqapxo/OiqhxKFELLbxcy1oo5o
         Um/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172899; x=1795777699;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aS7LLfFWKco/ZCfqEM+r+9fW1cESciSfAHUcC+2r1I8=;
        b=YYI4rdqwRD4Cy0R+FNI1SDeVER8PmUEuDhioVHg7VLCKV08UFhDAwxTOyepFA/fNVZ
         tMAIJUgnHk3+Y8dkqc9NzZb7ec5aaTx1fntZwSTvRzOwSDWeFUwdXzmZK9r0oKoglQdd
         UotA+XtoLsqzOkKkCQkw/lpGfiBKhqOGYu/L653GeH83NMabZgEyqwXE4k6ZLNCSJL/O
         4l74wQUl4CNF77kCT40DIE9pBqHlsFEnXoNLz2gpg4tbywrhaPSRjhkqFcpQvqQ9BdBX
         XH7mnvZET4MHLuzIY9OF2/zato2d6ZPzV+gCxtH73NyLSUjKXRUP05R5b5MPI48zrgpK
         3UoA==
X-Forwarded-Encrypted: i=1; AL+hErHegIk9I1O3iYbkEexFTZhg2htN9JUaKq+bqepDYRXebnI1QP7LX4EwhWT1Z+qqIThvYnqOSyMh3bedvyA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8SCT/t/kmGNAjmV9fAcVu9QusISpcsyaAyHnWc+0f86Zn4/iBK
	0CGrrwax1dUHNd3GjzPANllA8Qk0E+FYb9kyhKBsoc3VrPYKzQgZex8iDg5R4PY9sIkN6ctBDga
	1vn0N5v0wd41RpXnLZIfEoFWjs1ctvwsjdq3NXfTX29nPY5w2Qd/cs8Ypq0GYS6Qc2tk=
X-Gm-Gg: AZFdTZeqYbdApvef+CJDQzdA+OZXxSrnkDA79WJkOctUDHkQY8jDLvYQ4ZT29jKNtUe
	R+AbPneuxr3SfqVyNp00j+NcMP/PJwu0piGRCcPc1xPJhiv695T4VEoagLv2cg6kCu5+eUsq21a
	8hZ+8HPPAFJdzWe7L5lb164jvHKlK9ZD/YyHxP/Q7eX7yD8c7ECq2O71rYeoIWkMKslXXIn1TuX
	LP9q7sp+z1xhkZ7VLien19TTepVJwqzwzl71R0FUugEKbbwbgNZwXKQd9jHMKE0BtnAUHHDYXdl
	CZp8El0ajHQ2PPPVYokRLQeLCjsfgMYV7TlEfLOhTB0cd1ZQ7+WHZgczPukt776SVDcjknUdNGI
	6luSVHlBs4ftYMEjHz6T53PzP3ia1fxMcmD4m+qE9MMZni6Pu1ctCwJAQoxD+Xeb5lZ9V4JPxP3
	Ie4+U/
X-Received: by 2002:a05:7300:d08a:b0:386:240c:19dd with SMTP id 5a478bee46e88-386241b6dc4mr814528eec.9.1795172898605;
        Fri, 20 Nov 2026 03:08:18 -0800 (PST)
X-Received: by 2002:a05:7300:d08a:b0:386:240c:19dd with SMTP id 5a478bee46e88-386241b6dc4mr814485eec.9.1795172897871;
        Fri, 20 Nov 2026 03:08:17 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:08:17 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:35:58 +0530
Subject: [PATCH v4 17/20] arm64: dts: qcom: glymur: Add HSC_NOC
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
Message-Id: <20261120-smmu_interconnect_addition-v4-17-cab8ee8be0b3@oss.qualcomm.com>
References: <20261120-smmu_interconnect_addition-v4-0-cab8ee8be0b3@oss.qualcomm.com>
In-Reply-To: <20261120-smmu_interconnect_addition-v4-0-cab8ee8be0b3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=1054;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=kQCr9BRTX/wWuCiHnkZ4IEloHpuZO4nxnn6nFDJWtJA=;
 b=VRQkE9FAhJjTHlJP+APs4NQ+u4MYqq3cljaL6I8nd2vmk2WV7jWXRfdZc9YMifbamkfdNbVRg
 df9S3AkG9TCDP/witUqKjgnNiQ+QU5yxEYYlir85AK+7EeOtvUUrD4Y
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Authority-Analysis: v=2.4 cv=Zs54uN7G c=1 sm=1 tr=0 ts=6b002a24 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=a6KFA2mGowSrcUvabvcA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX8FPq4flf5aSh
 KL944XR5MqUOxU+RUYmdYMMt21LoCz2UX1pslUz6BONH8rJqUeymK0xIGyTtVAcQYa4VyKqJtQu
 NzsNYIQpoRjTwTs9CGFi2weZLpjKyi24kj9lLldOmRCOIKeZH+XgSssNe4uCXN/Xo55tL/QgEVC
 0Hb6GDFVkw/A9P2OmiF7SHvS61RaLPglR1CxV5yrB9E1voIbEy/GMbjSq2mlRuLFFP/rH3hHOjg
 h6pAlK/UD1JYlDncHDF7B2IMenjhgtZw9s9ZRk5LAyUmeF09Hei3gvQX2jCYTborfzeXdz56SK0
 hrzJ+WKZwyuG5ugSdIrvbDg10yOXIED651c/X9iwCU3qGnJ8asOOrN5rrLqpAQRnZf+gkC+qPO2
 5pBS3AdnrmQJbRahVo0IWiS2DbZL3pGD+of3RIdfo9WdcDRXcjJgYurgoyiorIAFL62lugIiV9q
 McNOeTOJwcYBCXgUgxw==
X-Proofpoint-GUID: hy9wCBufibfRjtSu8RUYEeBFAP97iRdN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX5BJCKOZnG17F
 RxjVAbxFz9/ZAHA3cEIb7bIOw9/pyBF7RNonPY0w2O34pQHWHNMLgJYs54WohI5QIioyh9fHUHL
 NAkaUa++X05nlzMe93WOQhGDhbdLZNs=
X-Proofpoint-ORIG-GUID: hy9wCBufibfRjtSu8RUYEeBFAP97iRdN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200044

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

