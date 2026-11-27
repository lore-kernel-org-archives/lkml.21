Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779713;
	b=jUaWd0CAxT5hMo3lCT5b/KUsWJm4KnxXpqcaHfV0DkGGOWn0WMOwKEuxweyP5H+0mrvX
	 pGPOrAAW19NdyBKDka1X0X8E0/jKQ/fMklRn4ne2wDTrm5arugM8xKBhvVuD4k2uw6VYR
	 OdmC48e26mLb2Rw3HifbjUZ7W/HLjjzJPnIyG1X+QDlhM//d8p9GMszcPahzvKbI1xhmf
	 bX61ffVFHMq6GLVWwzJtREmcB9c9uXHM/J2pP0G1rwKAkkH4WtR4yx7iqJQstIpeBddBi
	 q+AS6sQoOSl8zoE2IICCWDAow0xNT1+QCjdgEeFx0Wv8lCdl1S8Bk8LL/lkfw+3ws8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779713;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IbK4llwd1PhFlKCE/m8ohegsse3TXcwA6KPNPzmjdlk=;
	b=W0JZ+aUEOHSIwL2nYDXDZgQ90XxirK9OMUfdfshh7yfOaHjIrqjEYEbIW3loksp+pKmx
	 zpJE60YwCH4jgu988Kr+vPIM4BVm4p22FjEauCtvv69yarii6aAg0B5krMjTemd6pjcSC
	 mrOkzL873mG2f6tkDyQsXYljvhQ6/C+HuyrbT5IkDU8r+GdXmLRCpxyB5YxfAf4Xgy8cy
	 OFeoeh3Up5OkBp8p+2xa9z6raX/jIImT4knrJJY+VPvHhUbmrKTZ26m6oZl8nsbjmx0Cd
	 SneXAfnPlXSClpS4+JOxERJCCuO+GpsalBGu/VOFBHyViiLg8sYzsP8UFFNx3PFXZ1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YEI6PL0W;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iJ4muU+E;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB5860A3823
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:41:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BB5860A3823
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YEI6PL0W;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iJ4muU+E
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARApdcT052840
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:41:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IbK4llwd1PhFlKCE/m8ohegsse3TXcwA6KPNPzmjdlk=; b=YEI6PL0WRgRqSSAN
	nSOL2duNrmiw6qAIfg8y+vWyvITyfNtDcPeAg2bf4mTfOdS+YzokLAx7cXfoJViV
	9ZJRP4uwRfFQHI3686ENV2iKwjhq+vh+j7ddQBrgXSCsrTYzwUEaEuOfZ7TIOfUu
	VwNAnvME7KlIOW610SYdAt7V4QUNk+oXDf079UXDwnFdr452ayo6Rkw/hQIm8Xut
	mp5UMy2xAHYOcA60ixiRH6VDFpGzwxDN+i2r8VhPo2Gqt2zDLX5QoohHpoOs7zfj
	fLaYjmB+mZg7IY/AC4OUE7v1/3Wi4OOujW9hvQ4+OOAditConMbVYosdKuzlyQCJ
	vxrxPA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74g6s886-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:41:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94961ed97d6so1323686585a.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 03:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795779711; x=1796384511; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IbK4llwd1PhFlKCE/m8ohegsse3TXcwA6KPNPzmjdlk=;
        b=iJ4muU+EVTr/3UFctMn21qV7TcpXv73+u/vfgLFw8wV1Jfh+P5Ko855PPJ5PN0I1nX
         z66+YuuQl9+TaKE7QzFm70+rGEFVit+7XE47yBDVVP7roe1PF/+Jxw3v2mLgNSOxg5RJ
         FC7XZF8LrzaPLdrvl6rE0cBYnDD/Kr616iWDj7E3iseXaJyT9KglclXI5O6k06xnBxbk
         VB48NJK33DppznyjbeUxHmvoVHaRTLbSkxa+5Igwpy9v1eliKKPKvog6U6m9WyHIF+eM
         QiXmr5LdiE5IewEg6IlERgoZ/dfTN1Ptvp0jW7cLHmXHlrwkY8q9wnNdD0PzIH2iQe4n
         QGnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779711; x=1796384511;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IbK4llwd1PhFlKCE/m8ohegsse3TXcwA6KPNPzmjdlk=;
        b=IKEaeBT7R4bgk6pAE3Wc73soLN1pyd28h5vTffRubYR3jbpjkOE7vP8OJmhkZtjIad
         zhigUEv65U8CVCWy6wqnI2NyBTBRcAYT9u0abgcC0qFeWQfPDwTI0+/2xArvCVilPOX4
         9YpTeIuJmeb+NR8P00k/1DKxeUBaQB2vSi9Tz1K+nOfH5vFJlfGXF16nk/bajXF90qtY
         fQKeRLflSg62mNFnT5N+Ck0aEUQ31RfAqBO+MC4rWARmg/Qd0o1r+fgh7tYHxr/RBHB2
         2+tpP3U3B3+aCNM0N1MpLPnALPj4dVWOPpNIINmaV7IY8iVeyiOnAJ9hQY6GX0QPDXHD
         B/xQ==
X-Forwarded-Encrypted: i=1; AL+hErHQAnNfVBBj1iAyNgaofJq7lF57tode6u5x/kulEkn1Z+/+YDEQ4Ixetc2kPBYah13srEP7H/Q5cZKI4oA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DqJWugNBDJ3xJEpCREAVOyENMKulO5RuBJFo4uewbGwrySL5T
	eKFrg9jxpP4jnsD3AB41ngjhm332EFkwPCHCnuH2ghys30t3nVLMuyBHNDPaUQY9Cixkq19ILFa
	1ZxU3q+03QArblhHZmafJB4Z8eca7J1KljrfgPf1At8R3lQ39sKmJH/w3ADOGZ1ciDTY=
X-Gm-Gg: AZFdTZcWpMs334vRBEom5TNRbV38BP0axxlMKHL4FNNDvu8eJSPbXzkKfTtme4KAIDK
	BFZFLv6Raf8YTkg63Rr71WetuUhCqPzN7wW/0WO2+7sHiEjTcN7S393z9myTBYMnagBqiX5VVpH
	HFEBnKqJLyjPW4UhSTIhdva+6acYMhOCFjFsf+MTVIkUBzpethW0HquyRll5/c2UqGuvyjDekgS
	Kb/b/QVgfcHREIaC5MlOUSO0ezwuMn6VzPheuDmR4vZZh6pNJnKzKJszGSjJRtgkZz14Afh12Ke
	wivdjcd/vhXVJzHlutNbKkrlpGpjXJOYCCI4Vx4I8ndGpry1llFFK+kt6c9M8qYg5D/Zsy8f2iy
	W7wOH1mSD4UXqJvxMY+QY5SCNMfaOrGQ5olIDsoFEKREQHS95seTQUiZ0hpIuLSmZ/cV4dQu8Gb
	B/WfLDG8s3iIZxSao75rCM2guBgc/CV1RUdaCrPWTTu7d9sV/3MBlaRmPxiD4ByhA=
X-Received: by 2002:a05:620a:2585:b0:949:7058:dbcb with SMTP id af79cd13be357-949b35723b2mr4487218585a.14.1795779711396;
        Fri, 27 Nov 2026 03:41:51 -0800 (PST)
X-Received: by 2002:a05:620a:2585:b0:949:7058:dbcb with SMTP id af79cd13be357-949b35723b2mr4487214085a.14.1795779710945;
        Fri, 27 Nov 2026 03:41:50 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb41f4sm45137049f8f.7.2026.11.27.03.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:41:49 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 12:41:35 +0100
Subject: [PATCH 6/6] clk: qcom: rpmh: add RPMh clocks for Seca
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
Message-Id: <20261127-seca-clocks-v1-6-1781298e658b@oss.qualcomm.com>
References: <20261127-seca-clocks-v1-0-1781298e658b@oss.qualcomm.com>
In-Reply-To: <20261127-seca-clocks-v1-0-1781298e658b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Tyler Baker <tyler.baker@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1984;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=srAZ71NXEA0IeXVxC8c9c3eQfWsuz9Tj4jyzkaequpA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrCWxxSP0JWM2StVqCxtvfPFlaMOs/L2o/OlqMZ
 mR/x8oJVqmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawlscQAKCRAFnS7L/zaE
 w9ZQEAC4Gvk2dIigG7Dz4jzmH0Uv6hw1GzUWCpyE9glv2ip51Q9rbPVxi0q5zVO4znmxCFRVon6
 LM/BxU+gSXqWWKtoMWDFDA/nwiWmyJAMZ3f4+H2gNXgY30E/6dGZI/j7/e9wdq/NjRRiXbNvCC/
 FYBfr4OO1Wz18wLZXNKUwGKNoPk2knWpaditAWjt3f6xMf9putbf4nnLzOQZffy7NcA3Qs5rN21
 O3AexhbML21qmDcsvp2HPpwGAPEbgkT4TuQJJWWfy4Lx5iW3YGW0M3TT2FvUFbTwRJLOlb63nTH
 Ds/inYG5oozQLrm0aY8JYZ6naD4iQwDlgLz/WhRUlVFgqF2Ri+uCZk4vVboeAuheE1xj9lIeFWu
 60se39Hr010mwsf3Hej/s9mbhCatTnyhQE0SKUPeF3VwbZSsbH8uJLkdqOpbYRzceefH3xXcKyE
 dm1gjlguio3Nr48khgIRUKxzv/TSK+LBN8pyUwMlRdKBKG8ZNvOIZtyUWlu1hxO6xuXFhMBZSxF
 rl1srOqaaWcRN46yFPYWwNX9w01sniQRfPeNEcYTUnlBm/NDkNzkbs0ZlpZ2iQw/EaWs9N/nc8U
 EAAshUn/eVD8UFo01MemAv4SemoJl/laGIqOd+iLRYyi/+qt464sz2QcQzo2S/hVnDawtYhXzpr
 g9KsRA3AihjvZIg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: sljXCVuHIMe-kCQLVBXofoV1N1icuXev
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b096c80 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=b_YBBtIZcKF_qvpD-3AA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfX5q7f2K+Fn0Zg
 RK6U7KvQM7LHnr6SLomcken2BTd0DvbUk/m95HDOGTdMKWdtSyAlxPK/s4bFGKTtVIekB8tGvww
 kYOAusvOC+XPg6txyCQhGb3zrLAilNI=
X-Proofpoint-GUID: sljXCVuHIMe-kCQLVBXofoV1N1icuXev
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfX3s7Ua38qLNSh
 oVSNxbKEBH9ejDhvKap3NFs18x13Sych47SIrWtxEDFskw1IUHdmGd7nqVhihd32cEGtafHzvqU
 piiCfEMQhLSQ0NIf62Wi9ZhYwKmKqr9NMZ6VzAjseqf74fkVqRyqzoqejP8ZDQgumgMmreHRcQN
 e90/ryDP8g24R2kt46A5HAZAjDoNxbeSIC9tYg9XGdQNHCExi9Swa3+jjB74qMyd2BkjJjmXegp
 r1s86zxwtY3salrF+5fc94STAE6MLxnbQm1PuJfE2JWh9zvdd5MH60EKb3D18TqwxPVT/Lfbrpe
 fxjtJjxTO80kh2VKtjmylNMwzFRCSwvDKewDttR/lczlMmhFFmL2AQAmLT53wy321KKqDg41soU
 QsK0ELlmaHbVgCc4MBUUxrf/SYDy1t1aenpjzQthpxOoNsL/Y0T3MDYVdGZZSHBGwBYuyK6/vfu
 nOUPsV47kulbwhml/2g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270046

Add the RPMh clocks present on the Qualcomm Seca SoC.

Co-developed-by: Tyler Baker <tyler.baker@oss.qualcomm.com>
Signed-off-by: Tyler Baker <tyler.baker@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rpmh.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 68640e5904a6484a37d48124f9d253d15c9602e7..178f39ca3aef8bfffcde2b7065884d1408eb24e1 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -994,6 +994,21 @@ static const struct clk_rpmh_desc clk_rpmh_nord = {
 	.num_clks = ARRAY_SIZE(nord_rpmh_clocks),
 };
 
+static struct clk_hw *seca_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div1.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div1_ao.hw,
+	[RPMH_LN_BB_CLK2]	= &clk_rpmh_ln_bb_clk2_a1.hw,
+	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_ln_bb_clk2_a1_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &clk_rpmh_ln_bb_clk3_a1.hw,
+	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_ln_bb_clk3_a1_ao.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_seca = {
+	.clks = seca_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(seca_rpmh_clocks),
+};
+
 static struct clk_hw *hawi_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
 	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
@@ -1155,6 +1170,7 @@ static const struct of_device_id clk_rpmh_match_table[] = {
 	{ .compatible = "qcom,sdx55-rpmh-clk",  .data = &clk_rpmh_sdx55},
 	{ .compatible = "qcom,sdx65-rpmh-clk",  .data = &clk_rpmh_sdx65},
 	{ .compatible = "qcom,sdx75-rpmh-clk",  .data = &clk_rpmh_sdx75},
+	{ .compatible = "qcom,seca-rpmh-clk", .data = &clk_rpmh_seca},
 	{ .compatible = "qcom,sm4450-rpmh-clk", .data = &clk_rpmh_sm4450},
 	{ .compatible = "qcom,sm6350-rpmh-clk", .data = &clk_rpmh_sm6350},
 	{ .compatible = "qcom,sm7250-rpmh-clk", .data = &clk_rpmh_sm7250},

-- 
2.47.3

