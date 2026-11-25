Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795593973;
	b=u70MWfLdE8gqarn23RMzSinPV0DChi8nK+56hzMEyQ/V6hzWZH4z7/8OevY2pDQVTNSr
	 IexS+JgZ5f1GbkizDIJUIGu6KCj9ZNAZrQtdKFIH3vZJk8QCaumCSrDIGfiWUVzNTLhHQ
	 x78hOiPdQDOlBiwQPqEzqJ0eDs611nb2bOg2iUNQ2AQhrSuq43xm1IrdwfkRkfc3cSThj
	 D/lvn5QqJ6ngxO4Ax3YQTYarpdMZHQkYCZOwOEaYTMAx09C51pwvyibUAdoPOhnHjVlPv
	 rONFONvYeXamgatdU6JOG/+WCsUX0Rzh3Q3heBPjx1h5qwMJ0KeHwme5IO6esMEyb/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795593973;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KnJ4D2byKSqvUlVSKEd0aDJoKvrePMH3zxEo+TVbVxw=;
	b=b0XbH0QnrZme5lFOJ8ER5LN83iq/qPgNuuQLwRZ9XSnJvq4GHYp3TcYtwK4xI4Dz1TzT
	 0hBlsBOBSrRt0bDxhliaXFELDddawvTYxd+Hy5aDncPkGdnzSbmt+veWqYxHQ/0fVLs3H
	 yli5y7d7kn2CU2Ui9L+XPZTBKT2qZFC98e9SR+LzcIYM2MZHEYAWRpHCjzFCc77WF0u8H
	 +i8AwHr1YHWt6/O+E7PYPnKqlMR45HETxFUFHqvtM/7zlABxyfujmAshWqxwHvzFvmoDX
	 CAYcjnSHnw9/kfFqeGS3tjBTsyaqU5orB2v00+IIhPN68Ffdst3U6RaU5kS1Ek5BHyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=fail reason="signature verification failed" header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ev6xJXyZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F999606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:06:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F999606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ev6xJXyZ
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68jOa057312
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:06:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KnJ4D2byKSq
	vUlVSKEd0aDJoKvrePMH3zxEo+TVbVxw=; b=Ev6xJXyZ6aecoiO1HM5wUNfbmme
	hU7apthnajHIz1fmbUpbjcuO1MneckKvv8Mm6VF1q0Jzm9nGLIaMmZAlWvUg5Uq6
	PZDdeYtDvfbIv1rRWzZXplYT2KF/yodJgs/FhEBnMrftEsWFJzeBnF/pJ9gQffBV
	Y8Wt+BRxVykjZs1bq/cka0l13+T0e1hefWgDJUXd+cYjCcvXoSLMnfTMos91y2S7
	itKAbbzyy8RW1sNp5M1qR1LebddLQHZOJtboDn5KBTk/E5tW/nLyHJwHqWGS37wO
	armtdl1wVHSk4RPjkO6Jx8ACevlWJ18bxxMtm+a0QEMdSgeNBDM6jhwH1yA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5gnfae50-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:06:11 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-92179251e32so10291096d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:06:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795593971; x=1796198771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KnJ4D2byKSqvUlVSKEd0aDJoKvrePMH3zxEo+TVbVxw=;
        b=N8T+IABAqhBE7UfOpWkHPghI5l0iBtsnRDR24sN4lJXc5toxTY8Fs2HWtLVh0Wqn1v
         d2UWGmczIuI2mypH/w2ISoPuZ/QAnD3HHUoIFVXxzpWsQr8VtscAo6LDX7oAHMvbW5TX
         epJM58c7QgMuWINpiBdX21u9DINndDHPz3vwgg9kSjstwQ+tsTsKVcIKySrU23zyUiVQ
         nFUF5w+ueKKtT/Ps+A2vYA2xRpuGidg8PX9PRx2oNI8zj2LggiZ6m90rhtR/PQIbOIA1
         ZibzzvDaWFsA/ZCF3XK3dnr9OZ0UCeG+tX8028u4doVTXi1k8MeGIrJDFlCFG+xPiMjc
         wCDQ==
X-Forwarded-Encrypted: i=1; AL+hErHtAFi1ib5AStwi8HGUlO9sQNr0FPhogo00VhPar+IM4oDpbdo1cwxx8roPn28oRv/skp1EDFO8iTr9HdM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zBCd871zbh9/KYm5yQVeESu3AR4FDdonCGRoA4xUz8Lh4Ra6X
	50h84/Q3njB/FJS+0lFeGyzR2FpQUdFC6oXkj++aLxusuCM089/w1/1UjnsMYcAe+Skd8O5h3MP
	/JfSpDknLP+DaZAWgvjeE7GFn6MWl+tg7/UCybsY3FEq5crTro2K6fPs6By0x2/3//gN2abKp12
	2Ocw==
X-Gm-Gg: AZFdTZdHoJB9Hc8SMb1yLjhFOYclgqODtD0J8LTcfEVYSzhUtTGy1AT6B9g1je+GO7s
	C1T0bvcDPyBZ3FhfrS5CkSNaNZtQP1GB5Unk1ZIdhbaPLflBtJgD9SSKsbU2r1+gRwM148eyx7T
	qaLpr+TqLnKhcrZXZ9eV14OFrAd11B0OtrYVRdvDnMwIyMHhNSbjLgFpKX8KVIqJJbPWxGuIFfG
	g1Y/Ctas7H98oHN2fqZ8rbKDjLTwc0Kbh2nAJGV+oMvGUUQXdvzDGopjver6ZvrxjK81G4DO0C9
	fJX++QuQG4WuDaVZLeGbc0MJIenilmOPF4hHDo2MNYzYP/2QOaskzeMjIWZwNeIZBDMz2LLHui6
	hSDY+oCRbb/AGxOmq7ilqFGN4JF1FExoB
X-Received: by 2002:a05:620a:8081:b0:944:192:85f1 with SMTP id af79cd13be357-949ba9dd015mr3124846885a.48.1795593971249;
        Wed, 25 Nov 2026 00:06:11 -0800 (PST)
X-Received: by 2002:a05:620a:5394:10b0:949:bda2:194d with SMTP id af79cd13be357-949bda21c95mr2062728585a.83.1795593625623;
        Wed, 25 Nov 2026 00:00:25 -0800 (PST)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm585912015e9.11.2026.11.25.00.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:00:24 -0800 (PST)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, Hitesh Patel <hitesh@ebytelogic.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Subject: [PATCH v2 11/12] media: qcom: camss: Enable streams API on SA8775P
Date: Wed, 25 Nov 2026 10:00:00 +0200
Message-Id: <20261125080001.2540101-12-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125080001.2540101-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261125080001.2540101-1-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzMiBTYWx0ZWRfX8aS6RFYSnCqr
 D3ukKlwQ3T0N7IOUHxRLADxTjlckovvfejGNMchYuHd3CS8tW6odgaPbuzZIlnLXSoohoYA4wKU
 sHPyKVi7emF3mRSuzxRvAet6OTIQCqQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzMiBTYWx0ZWRfXyDRorZ/4vd/F
 VF7weKmad2m0zJlB8h0VwbSlnPNKCI6d/0Qyh/5IxEbsAlFMoaO89vzLDnyMm1KuLQ04uugDJCi
 OGaPgvsXQWRfXE/7nfVFXmIapje/TJ9beu+5qYKPAEOwEXpHRyVM2k5pIvBZckGUoiDhiuQjJJH
 MU2I4d6iHNwBEFdcFgCDvUEZxXY9jLP1x7j1KD7ehvR7mmmgqpZ4sdwHy+xV292Yet/7/e5kCaw
 tue9CbH7UfxJo40DgewIxfex33XUgojbeMvIjkSgWh2Q6fSjPCj6XePt+UD+oKM9sRBVVJH5wtL
 /LmyZVSRM8fhtL8q0hj3N8Q1B0Y9ib/XlzGRQQ9kzHAmNtih4J8azhKPIOyo+F3zBC9lctvsCOq
 Kzj6NcDGcKFnMjbZ4RSQxtO4f/zXOL6Qnp9VtsEx0FgLaCrJ7U2HzktVbXadMUmP1ti/CB1XbYn
 6ZINYe4xyIcNNwLdmFA==
X-Authority-Analysis: v=2.4 cv=f/Xdl+yM c=1 sm=1 tr=0 ts=6b0696f3 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=onitAmIIXR4QNx4LYmwA:9
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: ns9yDiRuBclwDZDnRmuxvRsUvqHX7r6y
X-Proofpoint-ORIG-GUID: ns9yDiRuBclwDZDnRmuxvRsUvqHX7r6y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250032

From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

Set streams_enable on sa8775p_resources so CSIPHY, CSID, and VFE
register their streams-API subdev ops and probe with
V4L2_SUBDEV_FL_STREAMS instead of the legacy .s_stream() path, same
as already done for SM8250.

Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 77fa80dd79c4..e444c29fe847 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5719,6 +5719,7 @@ static const struct camss_resources sa8775p_resources = {
 	.csid_num = ARRAY_SIZE(csid_res_8775p),
 	.vfe_num = ARRAY_SIZE(vfe_res_8775p),
 	.icc_path_num = ARRAY_SIZE(icc_res_sa8775p),
+	.streams_enable = true,
 };
 
 static const struct camss_resources sdm660_resources = {
-- 
2.34.1

