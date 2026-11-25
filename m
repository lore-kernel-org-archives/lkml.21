Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795593615;
	b=dRPbm4/+xhN8tPrWJJ3WEETgm8hCYDzgoJoWwNgNhhr82NBqi5sp5VORbo8qBVOxS6Gr
	 kxknVaxMkoJeuXMh49kvpnssKhp+i4REt5xMFe1q4IGgAdSAOxubLd9b8FZOH40UkkIfo
	 Q9x48HNr7MziC7CGV/o6dkq2ku+otxAt1Us4ZT+VsuLnJgj9RdbV+yOJpJqZZgzSpzdkY
	 3QGdiUOUkZRnYsdkjOzGNFVUvem6v2kxgT+7TbDTW/d6r0h/fcP9gRaq8JTb/E2v4p5/S
	 isAnB5gkjO0vdS+AEWFzUUzCZ07lhlND3wEh6iIgoCVYFdLxKxYH8dfupqmQDSrmz4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795593615;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RaTpNYsU+pyqZ2JhTEPeBrlnqy0P3FMeT5rLYhp+Ceg=;
	b=XHz9p6VU3kM8ssZsG8K75N0z+LHa5ynlwnjIg2YbzKRTyDBEnpBLbf2bybbhFZLV/hlS
	 +l2nFpW5YcHnqut/5iVW2vyWK3HmHQ+9Qi1ZYv09KO3dpeluGvE9VHIecpfJn1NpOzFS0
	 jQhIc8AwHgjMoWJGihAQqXQUb/NMhiPSntQEW4DscDmtDxlq0p0X3m7ICqECY0+m97OYY
	 wxt/TRUjOvQz58/TCCSMUPtTnFlzJwWDx8WEbX9dDFj5T4NXc07+gbCgET3O6bUZAJbzI
	 +EH+xpt7XUvK/tT96AYPc+RdhlkSn7WE23Hwt69UcC2G4b+bFaeQvxKkzrA4GaykAbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=fail reason="signature verification failed" header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eUeM2dHb;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A235606A6A6
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:00:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A235606A6A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eUeM2dHb
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68XU8299990
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:00:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RaTpNYsU+py
	qZ2JhTEPeBrlnqy0P3FMeT5rLYhp+Ceg=; b=eUeM2dHbZEp6XUeYtUL56y5X27a
	opEmPFJwRR7WZeGDAx92O1N3PsrgIIx9enWpGXvnAywGHAuY7cqe4ssMJcahb5cb
	FNhuVwq7rrINqRMvE91uLvFddSSrvFoIT/VvDNVhmrAOHa24+uvhppcXfS+7cHnh
	LpGL442RrRzH07obaI67WcieFYfrEPgAm3Lv/MT3gulq9/MB+JCWXXLUzJWkzzxP
	5uXZfthwGfaHMRTaXFMpQGAEZshzMNjNhVDumBpqwbNQM+TIjlQ3vX72wyBA0nlg
	kDfxFmtKQ2c+ibSpliALIcIID/xUdEwRuWkSd3Sa7Wjwi+eyfzRqxJWsg8g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5n6rsf90-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:00:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2c0e6653so105325185a.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:00:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795593612; x=1796198412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RaTpNYsU+pyqZ2JhTEPeBrlnqy0P3FMeT5rLYhp+Ceg=;
        b=fRCK1Iz3NruF/Zw3e/79J0fl+/EGEup6xGcPdwCkshrUQEoaDLryRAlYByOHuTBxEb
         iStMx7mTJ9nT+vRIUVCZ0XoOu+vF/EG6CEA9B8jUKq/4quv7y10c6jhqljz6j4sYAdpS
         TkUxWBkre6X5GdqMhMF/jmSzbQbI6lie8Jrkd3TnWwe2ZedbCZhdDqnSNVDtR4mHi/tE
         Y8a/gWL3mLQLxk+VV0aT0fjyv+z8x7RomodlBhvshsA5GvYYReaU3Lhj/6+Mf8mDBRos
         Or6HAb3BrtEqj/6OUZqOrNk/xm5GN5qfmI7SAxB2YVydfht2nsuWFtJoQoKBklZ6h5GY
         vbrA==
X-Forwarded-Encrypted: i=1; AL+hErHO1sGalSLOFmxTzL3FxDjQRwxRMhnecelgusuNTb0BHVvu7KGYDH6GxAqqjuBQJ4U4bUi2M7qFZIuPICI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+P0Gh7vSEsRZlUyl6iXIMz5LRFSxs/2wKkqk3LZlVXezE/21WV
	7iN7rV80a4LSm6K61fxnsVdeJAsxkDAgdCmQ3cpQbASgDVacI/xVAoiZZ5el6jhvD6WMyaUjsCF
	GAg3sM2uQDAUO+FlG3hCDFGL/wMFtRixbTnDEtZMYIP0wD6S9VOzRUibtJJeRQB2xKOY=
X-Gm-Gg: AZFdTZe8O26tR+wDvVuC4oBfu5jyj1dYPLlMDMoQN6486XwhEZlHqv85Ifnk5CC9xhv
	FdFa5YAZN9XGUB1dzrpEuCBMH0xpkH34Znl6Yu2cdL0k/ngm2mRlpbWgWjsP98t0usDNBv1NOzw
	iFr28v6ul0CHX8L6HgjwI4sGrHE8hOJYng3gpE61aIt7Csf/Gj1JhCzkQDXqWupf5/D7J9+YJf8
	Yooeuz5sInPXhA5o3ZTXumx8rrxv/dbp2kUg0hK0PhuqeJJXvzNh/l/+TGlCgvA2I72VCBvxICh
	rFzcSfodCzmOk/20H0XI/Q4ADenr/JaxLIgbl+aa0eFXEbU/YxeQlG2ujW9WNE26w0B9PiL0kcB
	aIFSM3OBurCUaUq4amHZWhH0TG2PGPOgD
X-Received: by 2002:a05:620a:8015:b0:945:fe1c:82bf with SMTP id af79cd13be357-949bab54098mr2838320085a.61.1795593612454;
        Wed, 25 Nov 2026 00:00:12 -0800 (PST)
X-Received: by 2002:a05:620a:8015:b0:945:fe1c:82bf with SMTP id af79cd13be357-949bab54098mr2838314485a.61.1795593611865;
        Wed, 25 Nov 2026 00:00:11 -0800 (PST)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm585912015e9.11.2026.11.25.00.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:00:10 -0800 (PST)
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
Subject: [PATCH v2 03/12] media: qcom: camss: Add streams enable field to camss resources
Date: Wed, 25 Nov 2026 09:59:52 +0200
Message-Id: <20261125080001.2540101-4-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzMSBTYWx0ZWRfX/PTn0NjrBPkE
 nq/q+rrtIbp06XaD+kXiOh7WNQImK0TmCQfLCszk0RY9Y3qzuzmbzVNtHLYVdkoQ7G3XgjziTZD
 KYzEle2xKq0EwEKlnUmapo728bNaCQarlefmMXFPLjV8ovBWvA7xK5unymKTCEfROYB538yxoEB
 cy2Ksp2VeMtOb6qE0j4l2Ow3kEx0VykOnWzEQ4deE/NsXv0Lw/iijZe05rFPilfUYkFdFs6AVOd
 Gzv4ks417ygSnGJXZ5f18jG44wAS0qTR06oQXdelndTYaXgazNzxEZjdUcBMoFhIx2h9UZ0PKk9
 LIycp9UHCUpcwj64eryJBq+aBCVcazdhIxt1VJN0IQmTfiHRi97KXgKJ45fF1DWUQjBCpn6FgxF
 2WMKl2qwAixbw0t9AqCrnCViaeFibzN3uv+4sSOMBH97FDncC/9BQSNyyYzguMOfRIn7XF+YZNs
 wd57TjhnIXqs0UJyOUQ==
X-Authority-Analysis: v=2.4 cv=Voa2kO2n c=1 sm=1 tr=0 ts=6b06958d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=Zc0e2cZeo9r8mepgbREA:9 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: zvbRRq-WMZ8PGJTvCLI291n7jVcYxN3q
X-Proofpoint-ORIG-GUID: zvbRRq-WMZ8PGJTvCLI291n7jVcYxN3q
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzMSBTYWx0ZWRfXx9p2JdwJZ7Ru
 lyhZ7jDGoibJpXJ/ufkTPncUqH2uAwBucL9Sgs+cWo8w8PVF4j9vzq0WGJz1HK/eTqtlAwraZWn
 HB7PhEeymO8/WxUkkf9DsD6C1dfnIfA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250031

From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

Add a per-SoC streams_enable field to struct camss_resources, used by
subsequent subdevices to select between the legacy s_stream()-based
pipeline and the V4L2 subdev streams API.

Suggested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 7564a7c46fa2..621ea2e3eba1 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -121,6 +121,7 @@ struct camss_resources {
 	const unsigned int tpg_num;
 	const unsigned int csid_num;
 	const unsigned int vfe_num;
+	const bool streams_enable;
 };
 
 struct camss {
-- 
2.34.1

