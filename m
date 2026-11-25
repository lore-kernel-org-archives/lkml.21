Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795631044;
	b=ndBh7FI73qM4ArefLHkRalukGku9oJCfTgA9LeRIxte5Wxlg1cmEuB4TZWWSXAswex/I
	 3suE5v4Riy/h7p1lgLFwxx/QX7V64qF3my2nueD0J+qqTDaUTNKT2VllBfMU/rXLUnvWK
	 PcKnwlh/pfi+54w1hJ4TIG1vIf/dgN0auwI4lyLP5/WZqos9FTl960v2eWdvCoKt2dd10
	 ZfpSrycGfBbhANY+lHkhmo5F2e0Y8BXT3mhFxyJHBzjpG7JSxMGUAiul4Y8aj7vnBRJyx
	 pDL5zAYvHXbEdmH3QclKlcIJAY+oevFfoMntChnyJKyzoBNYYdCtVPZ7arSz823zYhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795631044;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=roKxUa4JIcTuifH94iqMJAT/BBOaH7ODw0ht5sDegWg=;
	b=rQFdmgIrEMaJk1G4upQ9YxenT1RUyCBkvsxAUEIKplWwHtBHfrHc1MXfV/Qhod30V/cZ
	 m5ek1V5pTOYeyOjKHxYGUbsUOE7q4bmbnTDipr77FtINOWWSOqrultXBDIOSLTMj/FFcb
	 +a0M7frdu38HAvNwFOiczS1wHvE3pjEYMv0cuV7DSdTVPCatrGTaxXo/pIKLflMVvd6CI
	 i3N5eFICf0iEOQC00pRYU1Kp8GGL2FXteIPV6HUR6P5L7OWUPnfA7qG7fXjSv3HAAA7ru
	 9IERrv/TH8GVh541bARPN5SHhI1ZdS4YWPTtgg05gibTqkLczZMMDxSB2d6C/5M9CtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dzuvhS3S;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jkZTB8ot;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39AE8606A6AF
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:24:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39AE8606A6AF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dzuvhS3S;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jkZTB8ot
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APGQOP5326921
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:24:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=roKxUa4JIcT
	uifH94iqMJAT/BBOaH7ODw0ht5sDegWg=; b=dzuvhS3S0ZQYZ2U09KCuw9Xmz6z
	KEDtAAZFnKkbIKD+uGSfTf6HnXxgCEaSQwOIX3YYqFchVbHpsjxe2AfNaI01uVDJ
	5s4rvuXESaE9/3oNNklvcS69fQWjB63T+EFdnszuhDwt0zSzoof/bKOhfVeGuObw
	Y4F4oTFuEPdILp6mOV4YdfkMjd21SldUqKYbyzhl1yYYdsX5ExVlNPpo+Yx6hxNB
	E5j49xYiXqmb590wL/x93mWSrAwh1WzBv8ItrgM4nTbKrwoEV4/GiglwOU96zk4f
	Morp3QreEpq2e2Pq7eTLElR1+BTFoZUKiPSBdomWFQ8SOieuZDq+ddY1U4A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mc2c98e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:24:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-94975041698so1498509785a.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795631042; x=1796235842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=roKxUa4JIcTuifH94iqMJAT/BBOaH7ODw0ht5sDegWg=;
        b=jkZTB8otdseLfWIO0bh6WONvvIHYC+czsKjcQqKTmQ1dlWzThtyMbjymQH6FNP1TVi
         mVqfQPWnAk9NqnDJfl5kRLr0AuAyLfmxnZwFLJJxaZH4g5KP5QXagqr7rTIujiYqt67k
         pqFjg1nRmsgg4+appyuEY33TRHP3SidrO4Ng4fzcfUKaeOQHpyeB7MeVm8HRMVwivCpB
         c1Q9N+/NWghgfe+xynfCX6kKEBsgjDlF6A3EAFNIdxXUIWSwuG3ieMqvdob8YL9pi8fH
         LwV6aQRQsrBgeOm0xIXs41nexAg2OxYRJbVwZJHkJWRjUyt6NSGNmqQFt6nxY3i1Eo7o
         pyVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795631042; x=1796235842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=roKxUa4JIcTuifH94iqMJAT/BBOaH7ODw0ht5sDegWg=;
        b=DYs0VQLQlSVFLguFnpEFXx+Db1oxWdUtzZe3nG7GxDwnjNxitMjaB5NMx4y9K9gJ7F
         du22XqZNf19++kyg5tz0mLiNeoHO/B5zivhyxxRNZoTe5/POltqBa99M3Ix6sCQ+NUPe
         t+1ZkLShfRPgk9XcEnJg/k2Qh70HMrYvvDmxQzGfM/EDD9NAakIWF8DKreBhjIQ+4ll7
         pNNenzvzIySyXjjYpUfxs0gUiEc5VKvXgAAVWH/oTYj7l5SqcG7WBPGdlwqp54HHG3dN
         /iY0d7/pqtzhTxvxlexLzKRV5k2WdohFDKQiNbKmdqUio9fXrRR+RHsWknwoubUQtbV0
         Z0IQ==
X-Forwarded-Encrypted: i=1; AL+hErEoLMxkJPsotpz1vC/w8bIljqf9SOyJ6lDgbnwTDX8q0mLEArawNB9T+73wm7yngQUNnmBy6QKFZmFLucY=@vger.kernel.org
X-Gm-Message-State: APuU4Z94dxW0cABPNV05+yDMVuAKNCSLE4kftEhQj1P9Fv0dAaQqLWbp
	Y8nLUYhgrNwlty6z/tJP1Hae6aolkw8bPyRlkpZsrUTFOinsr4BY+twEzbGJpZgSusIX3hbmFSH
	O47KRQ0IqhlFFXOShoVp5Ufq7vEvho7O8iNLgi503r3bmfOnoGssUKjS8sVJvUPVv0fY=
X-Gm-Gg: AZFdTZeyJGluKaOEjnKACOkDAj5PLvwD86xCTdmpkpqakzWG0RXQySoacQWNiym1T1L
	M6cfb5VC/WKOEYfOFDyZoSuHDvYkv6sp280BwPdNnT/K4LdEJe45hhhUpXZwDx87KIuKFy2M5vM
	qJ/N3T2ZvPPvm2OFflzn5xiAzuhpH97xGDiSFMPtH928NKgukop5R3+swx0cI/Fiik3xgZBfGmz
	EPMdErHveq6xxYkhiIeykRqIDQrKNcVT2c6WV/CExS7rwDko3/fbdsOahqUdm1BwR5RFQFTPXwC
	BqOMBtrX1JJI4YqjVf3sCqWXDqZNV3HZSjgMNgPelxS98ewGNRcvhXLWqPdDkGE3bQrEY1acL+p
	0X+4fdtDCtEnZkaRyNGwEFD4/QBL8L3+3gwQDllfre8otz2mlk0dfonKt6Mr+0c5VX6RAYyNbpR
	nOEtzb
X-Received: by 2002:a05:620a:4385:b0:93e:618f:8127 with SMTP id af79cd13be357-949b35726femr3167823085a.8.1795631042491;
        Wed, 25 Nov 2026 10:24:02 -0800 (PST)
X-Received: by 2002:a05:620a:4385:b0:93e:618f:8127 with SMTP id af79cd13be357-949b35726femr3167818085a.8.1795631042025;
        Wed, 25 Nov 2026 10:24:02 -0800 (PST)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb42absm37185609f8f.1.2026.11.25.10.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:24:01 -0800 (PST)
From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, Hitesh Patel <hitesh@ebytelogic.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Subject: [PATCH RESEND v2 12/12] media: qcom: camss: Enable streams API on SC7280
Date: Wed, 25 Nov 2026 20:23:26 +0200
Message-Id: <20261125182326.2767771-13-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125182326.2767771-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261125182326.2767771-1-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aPJlOr9m c=1 sm=1 tr=0 ts=6b0727c3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=ZovgdgjKAAAA:8
 a=EUspDBNiAAAA:8 a=nrc8VjnkgqnvnCm6B8AA:9 a=NFOGd7dJGGMPyQGDc5-O:22
 a=VOxKbm1zgHvARWIDjr3b:22
X-Proofpoint-GUID: FqV4tJd172xdPiH8Utihjrd7bcI9Uf3f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA3MyBTYWx0ZWRfX9C36cyTOZWpS
 5K4ebOfxjthjyWFjWqo3e4US6g3lh0kck5X+9FRZ55hI8v5LVTKZ2sHlN4r2BL+ITjtV9NrYhNJ
 M//1/f6QHxXsC0FUzIm3Mzf4kes//iZMwB9m6DOT73C1cJHG/2TZZVVBaVJuDjnqzBcCUx4ahIq
 yDZUhntzlz1LK72Of65nLTtlYlV2GK1rKxibYR76G3r6sF0DmXmZSSyTUehAfx8E6ULYxV1/Yqe
 oJa9D5uGMfoaGNw5JM7HNFyFbG60DK98MLCrHWJr/mDqp0WqiP+TObhuO5Fb0DRA1s5nRAu2S58
 8ypgxBwTYSwL/iaqMXtSAcADOm3lP+vayRYhktbylPjnqbI1IRGCnGa34RfRWg/atjK9zT2czOt
 psukAEMEjGGWQEXMzFFh5E3ssUl/ytEbmuxvSPLMz7HGkDLJ1JRMvaSA5OyHa2inJHiiPVcltxA
 lQcdMzrfc3Ccxh/HcSQ==
X-Proofpoint-ORIG-GUID: FqV4tJd172xdPiH8Utihjrd7bcI9Uf3f
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA3MyBTYWx0ZWRfX2D50tp54s9wr
 szszvBSzQRp3nSFA+1gLpiWDePXF6i/h+J4vapl4fHAC14Ei2LDWioap3Tfxgw4aCjmhDtuegsZ
 LwCrfnoJeEvMdRGFONpDcig8it4P6KI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250073

From: Hitesh Patel <hitesh@ebytelogic.com>

Tested on RB3 Gen2 (QCS6490) with two GMSL cameras behind a MAX9296A
deserializer, one camera per CSI-2 port, so two independent pipelines
share the deserializer subdev: both cameras stream concurrently, and
each can be started and stopped repeatedly while the other keeps
streaming, without the WARN in call_s_stream() and without the second
pipeline tearing the first one down that the legacy s_stream path
produces. The CSID test pattern generator keeps working.

SC7280 has no camss child node named "phy", so camss_detect_legacy_phy()
puts it in legacy PHY mode; the streams path dispatches the lane
enable/disable accordingly.

Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index e444c29fe847..60d3d21f6548 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5819,6 +5819,7 @@ static const struct camss_resources sc7280_resources = {
 	.csiphy_num = ARRAY_SIZE(csiphy_res_7280),
 	.csid_num = ARRAY_SIZE(csid_res_7280),
 	.vfe_num = ARRAY_SIZE(vfe_res_7280),
+	.streams_enable = true,
 };
 
 static const struct camss_resources sm8550_resources = {
-- 
2.34.1

