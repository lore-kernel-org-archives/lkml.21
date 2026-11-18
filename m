Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794994944;
	b=eOe1f/QgVA/xNeRdJN5OUGFO4IbCJroYvpuJ0c/KcnX5AwlKxDjYLJq+YXywhQARHRCT
	 VD8uG+ZLf0QnFa6ku1B0W9mN95vsjDxtk0NEzJP1ro4Wnp2jzDGG9rsMuz5q/fW7sh8Rv
	 IBkMTDzCNcdaVSiN5YBhz9CtokQNh2P4o/WVT57+ItNMS5e4PYcFP+4Hv0QUUvwn2vEqs
	 7jU8rmxjEatlnrlmX9P9OeRpFZhUFeqYx1Tn5Z4FtyQI1lgvMC7hIjCR+XUuVFJ7+wPe6
	 Had12B6KxE4JvSFX9lnbz+7VfM0IedXvC/W99hXZX5URj3NwlQvTy0Um1lhaSjQHEtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794994944;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Cz8Vu1lcKLvo4TrnFHhZwshiSmCqL0xd7AQ2CUYl2t0=;
	b=f4J1mQyhZUfifTl85BBsZH9eN7W9hTL0HqMvY38mFh6BbckrfGWZ6RrkLxPR4wDYAI/X
	 99JvuS7f7yVIbMGMkyVLEe4OYSM2bJtvBNjjl+uju3arGSgd3xbnOlGfuwojvAXEf+Ilb
	 JNUYIhGt/Lvd4olSajAw4n3/A7H1LdeW3pw9eZza668ReYYqITEPK6PwiAci1X4gpfkkG
	 fg5hBw+dIJ8d8uUBmsEPapKmwQYZZhadZ6lHrprqRhSkHwJl+r4V7nVqySDH3AGBmdFQy
	 UWVBeJwGqImWZ+k8h7hH+1cq9EtgXddPqWKHLs4qqd3uvb0cD2oYvNMvDSgeA6Iq9xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q5eJlKO2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UfOhZUb+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829FC606A88D
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:42:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 829FC606A88D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q5eJlKO2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UfOhZUb+
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI8pZxC2106531
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:42:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cz8Vu1lcKLvo4TrnFHhZwshiSmCqL0xd7AQ2CUYl2t0=; b=Q5eJlKO28//l07wZ
	b3nWG/PG1RdmwVGoK8S3TG6A954ySkiowyrb7zwe4PTjL7X1cziTjApUVpdo6wPt
	B7XPLvkSUEyY3I8d39P4YbBUbGq8vx7ksD8t1ZC6NF+8lNYnuV3h/NLJOo15ruwX
	u52tyiMiUdJEWMP9UFiFq9r8EjYWcbpS8M0QmCXHXM5yNPxB+qRc4LS1KK0QA+KV
	q4S4GonJlx07XGCScxtxpisNffdm8SICERR7WQJXtVGL8/N88heLscFy92S60WWv
	PLVbwpEhRmOTXjFZvJKI+zYEJOqy1YL1K+AqZBxXW7yCqJrtv9gVWYN6XwA+fztL
	mYAAkg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8taud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:42:22 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2eaf3f829b3so7539585ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794994941; x=1795599741; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cz8Vu1lcKLvo4TrnFHhZwshiSmCqL0xd7AQ2CUYl2t0=;
        b=UfOhZUb+KWI7i6HdYBRl+Cds7oyirooK1EKGbTp2FSh3QnUyanIDx5erShuYNKpSL8
         w1howFFlfWmK3LiX2aLU07upg07RfzA/pJFumx/vcDWY6sLA7NNZOdYng6gNmkts2cOo
         iPN5vcJLuQpbtY1tEBj01vZnZy2PeD8d4+hzxO9Ao3ZIFybVDk33rfBkKNVqN2LtLRUP
         Z1QxajGWN49NdA9OeK/hJ/Q2YLbiEQJjuwKcK8te3kBcVPviZnfdq9lJZ4tBsjtvIZye
         PysDSa9IKoNzQewAF7bOjob1EZJFPJ5RRnIUMSZXdPypxSKKzLQvD4DZS39rsuuVF86S
         AaXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794994941; x=1795599741;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cz8Vu1lcKLvo4TrnFHhZwshiSmCqL0xd7AQ2CUYl2t0=;
        b=Q89pNLrv1win8J6GjRbq5V69png4JJ2G+P4V7i1bI0oAewSzjmzY26gTXKVSF8KHIJ
         bH1m4JLgmC0L8ilBTQ0QleNtuZP7+PdU/IaA7Q/2yrAt/HFVwaTXH/9ZtsPg9f4geRfW
         C9/rUayvbNEpt/LWoCwNe3CMCDywFXnq0GqxuOApPim9zb+3t5wmYaBV7UlwgrZE6CHf
         OAJV8qWtu6aqkYCuKo+ICkQJNjRQaayT0ZVw3NS5pwTTqZTXhvMeAUthK8tIbDX5t+AO
         37fHYZG20BkbsM7D7xh21VTQawppzjvVFYGN2WfzUiDrHAxPTpfW22OXm01Hqbtoy98Z
         kZyQ==
X-Forwarded-Encrypted: i=1; AL+hErGU/0I8SFi9H0Ojk0wXbs/bBIodPUNi5Z98T/UrPHXDRPmwj0d5AwlPgF7mi1L3t4KDHJKM922xdMU9RY0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JpQ7mTx0ELt0OBe57Un1fl5SrfuvKX5yuXHbbcywSEZ8iGr5r
	ik7D3YTbPHNF1EJzjsnDnvUH9ixona5rtuouxt2lNCI8b2GbGjIfudMBFCV2691UO9w0pNCBmQT
	ENPJGI83fboqqjbrDGZ5j/lPNgHKQSqgr/qyo7Qxn0IhlDY9RgQpi7aO6rL76JEYZ+tk=
X-Gm-Gg: AZFdTZeolUg2uONUPTitpA8bujLggy0mUEZl5ktrQE+TcCkrNflcPIkBBck91vnQcRt
	evB7xRQBg9r7vN9zUCG19CUMvpi4XYqpEL+XOew1nPhklLCwtdKg9zqtiUc9/0F95SI1QbBVC7q
	gSM+NPwI6bLpydweMMkeTr1bGZ6ozW4YvRHy+d1HzZTwcqgwsggn8xPnb8d0hLTQoQtgXAEHkOP
	81Zse1J56ZTVv7cNWIPk9ArrWMeg4opIhT3/bV1weOacDBRi1gI+xWTPTj2iVQXflw8nKa47odx
	rrblwFUkG6zbtQzgFPtAeLyxII9KxDJPm1hFRUl9ZhZjJV6GdzeVEHDGtyRpoU16MzDv01P9sz3
	nRyiGe5AuzWJKSDVVwAuS8GADvjlEjsP2UI29Z8WBF1FU34ied6nnQHJ6smNc6RKAeBOUIf5+Xt
	I5duC2Ruj1twvOVZiCi28mSSp5Ax9WnSSzvNFIYK8bzIXphGsw
X-Received: by 2002:a17:903:186:b0:2ef:d89d:b5ec with SMTP id d9443c01a7336-2eff7530c05mr19417525ad.47.1794994941360;
        Wed, 18 Nov 2026 01:42:21 -0800 (PST)
X-Received: by 2002:a17:903:186:b0:2ef:d89d:b5ec with SMTP id d9443c01a7336-2eff7530c05mr19417155ad.47.1794994940856;
        Wed, 18 Nov 2026 01:42:20 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f008044f26sm2947575ad.70.2026.11.18.01.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:42:20 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 17:41:47 +0800
Subject: [PATCH v3 8/8] arm64: dts: qcom: hawi: enable iris on mtp board
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
Message-Id: <20261118-add_iris_for_hawi-v3-8-51786f6d4057@oss.qualcomm.com>
References: <20261118-add_iris_for_hawi-v3-0-51786f6d4057@oss.qualcomm.com>
In-Reply-To: <20261118-add_iris_for_hawi-v3-0-51786f6d4057@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794994903; l=751;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=hi0+kT+lr/HaEbt7fM61FG/66VSUjQmHQXby413mJ/M=;
 b=qjHYftw8gx0GgWh5AIpLAwCHCx8oongqALIKBEULzF7IBonNqGmb1T4u6QO3VGhPcoInHcOMa
 Um8GqkHQqzDBtPJgDSeWe29qPjaZJuF8hsb3vLvvDtzzTBg/ZoxAKHa
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-ORIG-GUID: bd0rcqbr2TTjs1Xf2M2gJjT52rPt40Bl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzOCBTYWx0ZWRfX8K+DTc/OpSOu
 aIrNExoRwsPNN4Uqwxipc6o3umiYy6qz0rCv2n+zrP46W6oUJ1D/lqm5nBsY2mJSMh9Z63ItuZi
 tpwV9q83B4Rq6V+1xlT0oOmELZ8cqyY=
X-Proofpoint-GUID: bd0rcqbr2TTjs1Xf2M2gJjT52rPt40Bl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzOCBTYWx0ZWRfX6U6CpsWHB26z
 PSqXCSQsYaplGnbs+WtIA6oPgkQSBDiR8vBzJVxGfue5CMWZawwcqW4I0xkG9Lsz4dHFSmiNbmm
 vrX4FDfG2dEq80v9igMWTZqa4Tgh8kwKGmLVSwLGzB2mvSh+v3R4R0AXPtFNvElbnIZh9joSrj0
 VKuL96bCujucNXo/p6wUMV/uup5xBO2RVKBS4pCXVYIH56uVPdhoAgbAe60gZeg/MLE8of59pPY
 BuxbNhO69tRnJy9wqEj5E+k3yNKFWkzQT3bev93HviD59pAVb3vPGpPgdeaa/eg4XSGXC99hoAD
 NqPUBNSoDmhzi8YT6XFwViH5dL/0tKcgAsT9kcEskueC96RuRdWAHUusLpMp3+B4dHHL86p0MYn
 pPg44uqajYc2FXYQ+LGp2U1UuUwf5HAWDNHtQRf5s0poFXJ22VeFwpe2sXN6z5+PAjQGTF+vVu+
 HNg3S3aE1L/pu6iLDEg==
X-Authority-Analysis: v=2.4 cv=NNVAaE6g c=1 sm=1 tr=0 ts=6afd72fe cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=xxM_nQ0a0dx36OX2A9kA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180038

Enable the iris video codec on the hawi MTP reference board.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hawi-mtp.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hawi-mtp.dts b/arch/arm64/boot/dts/qcom/hawi-mtp.dts
index c38e5fab7a2cb29e9237c634d75c6a687a988ac1..a8bdf53bcb5d6cce089f069cc8e91ab544c05d8b 100644
--- a/arch/arm64/boot/dts/qcom/hawi-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/hawi-mtp.dts
@@ -780,6 +780,12 @@ vreg_l7n_3p3: ldo7 {
 	};
 };
 
+&iris {
+	firmware-name = "qcom/vpu/vpu50_p2_s8.mbn";
+
+	status = "okay";
+};
+
 &pcie0 {
 	status = "okay";
 };

-- 
2.43.0

