Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795593630;
	b=SmlvEkPgI/RQFBBMCku1zr3W0hyw41P15uZxVO5LhtYYDNR/1Co93JaneeFqS65amK6j
	 VZMliufEnW/FFKm6UqaICU9gXrZCJDbIO3OWrHFEhV7khVWZG5EqCxABQHmleTLuwEbp8
	 HOgLuMu1lqNPP4Md7r4nQBmUXPBdc38JeQHO9jij6nlYvnmMjsjrw9GAUZseYxSsd/aue
	 /Tcp47HefFavVU+zXHdO/CmwB1ccTz4B3EbFoe7CnKHjNbRf6OKiCtFQDVcJmOVWyctnm
	 jdHDAQyjgyJBda3fsU4SUQ8bLzTecKkiGvW3lP9C+/MCSr/kPIAotyc9YsPpOZMvjNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795593630;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=roKxUa4JIcTuifH94iqMJAT/BBOaH7ODw0ht5sDegWg=;
	b=GAWZ53Xt600tdJzdxYyWW6AqumBU7H2SmtB7m3aVY3t43D3ZAKsDLrkvknz5cZ6Tu3W6
	 DMOM89f7uAubkhRAJpKnYwuYXrKK8JTgbE46iCNNwSPAu+lMGnPYgEuVEV1O7BjmJcJia
	 3QClruyz7yYjFrIUVNmfUw8AKQ4hK9fxnevfXBW3ZrRPW5CNhoE4OijW4nDmYlS5E5C73
	 byYxxi6/euewAbeIUeXPZqyxG6GOBItHHinshBCSu/jDbdww0kd4hRU6blEfXpPuDCexR
	 XofHP5e9i6VUgoIE8aG4TUa9cWPFQpzylvZC7aNA7rYUi+zyD6fgcLEilYseuKEjFXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=fail reason="signature verification failed" header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k41zDtuP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4AE60A2608
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:00:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE4AE60A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k41zDtuP
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68ceg3630251
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:00:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=roKxUa4JIcT
	uifH94iqMJAT/BBOaH7ODw0ht5sDegWg=; b=k41zDtuPpn7zGE/GWiYmqan+VOk
	kn7JnGcP6AtnIX2ksXuwgxMya9IWF7YhgSZAzMVWiUBYSBtzRtrQwUOnJdMQKZ5k
	J6ujSsL2SSd2wUGOxrT46v7QCD9Eou0hk3cMJd3v+F23e+IjpSigb4pepgVy+1G7
	Cjdt9clWYmJ0ih8Tvt9QuQ5HBvEgqgf0UQHudOVc25mPdfBRsvVi++gA3EfgrUHo
	MvfJBuLRbAicHbO6h5xd6dIBMhr7y5bASCo09mDVdvwBAdxD3xwZ/zRomWTajUXZ
	lgK7+1pdiKFnz3M0Iq8BpLZITW7y60vIi1uEXuJXGjNfCpzfjPwc/bKrF4A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5b8047qu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:00:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94960bd17b5so894267085a.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:00:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795593628; x=1796198428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=roKxUa4JIcTuifH94iqMJAT/BBOaH7ODw0ht5sDegWg=;
        b=iIB1uRRNLfQypp/Kq5c9+YeCJEvu1/1mOiXq0e+xtx/gVw8/pGBh/hsvE9l0ssoMck
         ejn8p728F/85jIRviW2PHah2QKdHjwJgpydzyK39RXkgDTI3U05OOmX4vBeXCD3JMKRf
         lK5zrwYOjZIivfb76ACBnEHh+BgsiGZkuUneRu1wXaE98Tu++YcsMZ9Cpu6WKZ0QYcdt
         4Y5aFuZikTd4kbWEoIY/WzWeR7wSFEx1plyj6fxsBsyozoHdoN8itJInMGxyKNlqnG8a
         y2IRVTy2hBiNfEKQMsTpduylS/Atsi7yQijRINK9/7JGOf4ozuPl3EzYSYRvwucUQIvK
         SsNw==
X-Forwarded-Encrypted: i=1; AL+hErHnsy/8jxIke9Osk7eR85ZSHLBQ4rjVinAykgveBRXB1BPdsIvI3J0CbGmJbF/VN07MYaAtV9pXI045Tp8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8vMjNp3AeSr00Bi7yUf7IEEO28TYf/GyFMvuCAviL3M4BMrfV
	Tbyp3eZTiFIKSSnsyhnHmbrT/6MsibJ8BkIgYzuJZCuCWpMiGbTWJPMW/0QvOTNtWGHzyAHUYQ+
	ZMyQ1CNkHy3YeZYBwuXxRLF1A9+q6LVUU5w9rZyzAi4Ab1/CIgw/c0E3nFfBW+ZmOP91zGhmyyx
	LXBg==
X-Gm-Gg: AZFdTZfhHewW8Y2t+JhiTevYPMZnMI5ykzA5g/UoKUvdVz8JtzqCyKs13MC+kyrTsG8
	O12qk+Y+CibezsghWOA5dRsaSxUEO4RetfiDdK8qFzzewudFKhdm8cfviAxk5PaCc2piqbjiuuG
	amX96Z/BEQJWqW1geKDXcDs+EsoxHjml5fZcmHmYOexin5sU9ywBt4ZYZAgG2BoZaxlWVPCNnWV
	m+ho8K8yBpkObuRBBxWqQMrwx+4ax00JYHQ62ORVS/2+BQdJvoA9F/BTv1swocvjfiMJeKUdHkP
	x7Cen0H6cZB8yTSgdWtJ6ewQWUjZ+l6jbQ4ccVHrt8Q1FZ03BJ0m+LYucCBNpk3Q15t4/rKUzYs
	gP8lVFPqFcKi2iOAF5rOmZDvJoKXghIuG
X-Received: by 2002:a05:620a:5386:10b0:949:bed0:b895 with SMTP id af79cd13be357-949bed0b9a7mr2140964985a.72.1795593627877;
        Wed, 25 Nov 2026 00:00:27 -0800 (PST)
X-Received: by 2002:a05:620a:5386:10b0:949:bed0:b895 with SMTP id af79cd13be357-949bed0b9a7mr2140957585a.72.1795593627354;
        Wed, 25 Nov 2026 00:00:27 -0800 (PST)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm585912015e9.11.2026.11.25.00.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:00:26 -0800 (PST)
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
Subject: [PATCH v2 12/12] media: qcom: camss: Enable streams API on SC7280
Date: Wed, 25 Nov 2026 10:00:01 +0200
Message-Id: <20261125080001.2540101-13-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzMSBTYWx0ZWRfX2cBmuVILjEMW
 FSFOYmiuVvDA6okgFkOTFwVSVmROGetFGxV4xEdp06xzn7O44/zYXaI3wOTYm6RtQsiAdb0CpN4
 Oh6P77etEyo+gMD27M5F+0D1zHbyRZRnxOPrw+tzCOdl9FiqbFsbeR1eNkPtxasa8C7iJOvl3Uq
 2aQ/dqm63b48eYh+rDldwVhiKODoEYpwjSwhEwBygSAItFRVE6srtOG3Dg8msRgGNG3zsnbKoy5
 vcriduQQ733eRhxntixebfchD962vhxZgYnUp/C260TRbkWTuF7Yjfq0jT9Ywd4PrUPWTKmFakV
 93OZNqQuqJ43T5bzJm3HRARImg3UNDPDp32yIjxHBlpIYV8+E+penVybkIrFb9NvfylvE1y4Mxj
 Us8TXu1cA0ksb2EQICKQqYLwYvD4EOT7KLnTjvzr4DZPgvEAwXuw/9BdqJGe9V7b8C+jH7HHPVL
 48KkH5NyRcXw/rfQjFg==
X-Authority-Analysis: v=2.4 cv=K5W3jCWI c=1 sm=1 tr=0 ts=6b06959c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=ZovgdgjKAAAA:8 a=EUspDBNiAAAA:8
 a=nrc8VjnkgqnvnCm6B8AA:9 a=PEH46H7Ffwr30OY-TuGO:22 a=VOxKbm1zgHvARWIDjr3b:22
X-Proofpoint-ORIG-GUID: nwft6Aq8WpABIWtNPASLZLjEjjfyteGI
X-Proofpoint-GUID: nwft6Aq8WpABIWtNPASLZLjEjjfyteGI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzMSBTYWx0ZWRfXyNX8iKwaDFzF
 rKOq+q2Rd+zKgEGNGhRZwWJD7x5bog3vqHZdTUovhSPt5EvGQodn5x9pLlbcIPcMqYRzI32Nl/u
 Blhs5F2FtD/PT8I4/j3WIQgccGqU+Ts=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250031

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

