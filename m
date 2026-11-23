Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795460749;
	b=kUzZw3Zij1XIyjkxIQIPE/ogm0eoO3jhoRyPA0iqHMd3fq8vYifS+7kFfcVwAZ0V9sn/
	 UUlgbbf15Aiks7qLQkRBc1BHMUBcJ+pmMpDyJEzuXLarKyeB+6O8r8km+p4PQjH1fJ2i5
	 snnqNVGBFCMYAQpfMOAB0YN2Ur0e8UhEq+7PHlEbV3QWb8xdeLiezGhR18MAgjCQONSPb
	 X25gyk8+Zo4rriGlGzURZl4mmB454jCTU7IkzlHgE55+u7UlSVKdzFd7ko4+iISRAW3Ut
	 W7CQXjEMwGNF1arfRQBrFq6mC/9vc8b8ESo1/lvYM7mPK2Ye1ww9ZxZ7wcPqMHqwD4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795460749;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=La8YckiNeld4H5l7NAaRli7pn+waejxq1bDCNMoUyYA=;
	b=Fk/53j0HI2AUjvSZLcjxZcHuE+d4ZJS86SzSTITCPoi9Lnyui/acW0uf9aAgyYQfz8+x
	 MxyT+LAcRIiVpJTkO2uRlJjz9iq8o0TI21hHouPYv/ufPhh0hkAZ6odkFBu09s2t5cNSd
	 A61xvmgS3VJ/A7yHeIPsaDRg+P93ztAZklK1nKFCjeqxfCRfl/5ciMcAHRANlcV8TYKJi
	 /iF4sWGhyySFlsCDBZQSCVhwQjsPKNvSRrVRuhXYEcBpqhPKtSDzbCsakyW68JtEMD8h6
	 JR+frnLKZq9zD159R8BRC0twm8qUE59qZ4pjUimiVInwdpL8dDKfLUCWV6ebvczMzPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LcrIknaP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cSvA3hqi;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A67C606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:05:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A67C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LcrIknaP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cSvA3hqi
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH3vU2340403
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:05:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=La8YckiNeld4H5l7NAaRli7pn+waejxq1bD
	CNMoUyYA=; b=LcrIknaPBOegfrGe2gC1kekCmoeN0x4g/taulJGXS83OWtc3QcE
	ueW51DnYOLMJFt33CLUj5+HbAkUaGCxHbXnwsFLZoqtjkniAwswqJ7n6mM6o6uw0
	gkVE+nmTtHI14BJoKO852+w6bUdiXbkCcE1fJsGbproKLzmGUypUM7JHvwazrIIm
	VVeRxH+SDKJ1sjP2ZvpE7rxAGjZKXnQ9Aw4nayjRYnyJQHFZWeS13iGUMj6Pye5Z
	H9Ig08yfDRJ8INNMSNefRGSvlm+GYVmusX9KE5g6msgMF+Q3adCncOAE2bpgIAwX
	kf33Fd3Ns0RJIBQiaQN71+vjKV7aKmetQuA==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4exx372c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:05:48 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8b2fb1f981fso49049557b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795460747; x=1796065547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=La8YckiNeld4H5l7NAaRli7pn+waejxq1bDCNMoUyYA=;
        b=cSvA3hqiXmkhe3zwkr81JhFu6+jBPJ5cVtIQeYsTW1GQtN2wm6OwUsYkiDPIMnnR4e
         ML+ckQjpegMWkZ8L8bdb2GhabfxXuXz6b48aiI4ZLQv7PlUuuqthO0yiF8fxwO34Ct4z
         EScc88KA7V7NePEiZR3OJ0YC13zCS/8jU5rps3vpM1/erAdlUWbRSPHvMvXMrgW5h17X
         eiwOlSu8w0qa+5LI1GJd6NtCWiw+CFOQFST6cJ4qVsXaI9EgEZ3kvboTBfd9hBFDqAUu
         WZSdDJrSIESIAgfn7Fpdyh8FeEToLieTfWSISNEbbXs0NbfvEBPhgfrZroQm1hvFWYdj
         2qtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795460747; x=1796065547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=La8YckiNeld4H5l7NAaRli7pn+waejxq1bDCNMoUyYA=;
        b=ACPgTkycM5yDj8SvFuQiQn5k0HkDZpejZqpIhVYTZn6MpsWnjK9GL9xC9dANojDaTR
         Wr/ujh9T9MaBasGifl5LXBGgxEHqHZWifG9FY3laIeMbG9aqu3gzJxf30NQzT2YT6rfC
         m+aGgDY1nICdZxYa62ugB4HL4z6FkpAIf0shtfAVHHmnbLRqtZm6wAVWT+IkA6oTw2y3
         b5TW91beP0NNljO01GzqO4n7e4DKpLSOM5aLgSHqvXhadHCi0/nXb6MVa5OPfaNAYrX5
         Pm0uk7wKAQdWHdmsKAtl9GDH+JX5ZCG/aWxGdZrwOSW1yLtxXBGUNsyuuy6qPcJ6t+UW
         VG1Q==
X-Gm-Message-State: APuU4Z+KbVSZTh99zj8gJRi/3ogC2YfU12uLmAPO5oah5YztWqiN60EW
	hFXyCnG7YlLlwAANFJD2sKSAYgZuGHgAoW1y2vP7zU0wP9yFs4s2c4cZIZF+bxCGa3lYQ0tztyF
	nIuRGDBWcCrA/uIbacqSVpH8dPPD96nf/BySYcphscx8zrRLsAlm9kNWo+56u135kYVk=
X-Gm-Gg: AZFdTZcFy+NMG+LqvnnRREJaQlUNOZwmh8bqsRuGygOGKeX0FBOlzRbPBQ+kUaHre9v
	I8M0MpsP1IN9t8X81ioaVK+3kjTttFMSVnHYSI8ui9M1q+I2HbfLcVrt9zO+NhLWRFicAut9VKN
	kllfsFe2522dkFHrVqWPudTb6gqaQ7CTx1eFr9qpzvOgq+J9FZS6lL7jJgO+udKv4CAcW8UERDu
	HtiDSeOerriQEfOwbMrw4+auB1/R6yyBAFzFskUWpfOyR5VbyiqSj08IspFIjedrCHqpqf9so/4
	Ov521p+ANlTponNGY8kOYHBuUu5qxPD03XLIMfK79bEn94zVA0qxbqGx+12/wx8asdso6Q4SR2l
	bb2B+pFapDhfQ5QNmreCoHhPdn6p5EVNTKxr9G/B5Ba2XWyei17I6BaTkFxhg9Q==
X-Received: by 2002:a05:690c:450c:b0:8b4:deb1:4b19 with SMTP id 00721157ae682-8b52031c2famr54214617b3.7.1795460747236;
        Mon, 23 Nov 2026 11:05:47 -0800 (PST)
X-Received: by 2002:a05:690c:450c:b0:8b4:deb1:4b19 with SMTP id 00721157ae682-8b52031c2famr54214367b3.7.1795460746787;
        Mon, 23 Nov 2026 11:05:46 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa397asm24345658f8f.48.2026.11.23.11.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:05:45 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>
Subject: [PATCH] phy: qualcomm: Allow compile testing a few SATA and UNIPHY 28LP drivers
Date: Mon, 23 Nov 2026 20:05:42 +0100
Message-ID: <20261123190541.262138-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1379; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=BYfMrOXsD2Uyrht2e9gBvUV4lJ6sv2/BcyeGFDSbzDY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBrBI6FrCBYAoWmdO8yysgN76glC20RW3+e+bmt4
 uaON8dyINOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCawSOhQAKCRDBN2bmhouD
 16Y3D/9IseGqpYsG05UpwiPN/hDJ6Ej9SDJj9dZR7+XltaPWoaM62EPZdi8O3cz32prk/wLIMGE
 N65Xidrqo6an8pzUoLOsuGYLyew4D9bmoBBDOfZNaoTMRMX7u6cyrqSf0wgOS0mvMK80iIn+5F9
 szHY/dntLDjAVh8LOHBhI4x+2fZ1z6VklRc7nK3JyYd/zQXWqu2v6hma2mHWc/SbO+0Ufe/5SYR
 /ccwDj9S3Dnk5xAiOyROCsIMRXc84NyofW+T/OOx7xAOeGZhhZChJPO4eZOYw8V21s+iQfl6f2j
 bbZrUC/9g0uTC//LhRoOKtW9LmjKd9kQ0d7w0DSNpenFyNkS1WbQ/RF2gbC6yeSVdazbvQB23mR
 vgx9XdzNVPnr4gWYI9pCt1fR9n1BdwoRxxwZGtqY13x7fmgNU4zzYZpCgk6ljDVeIhHi/f7vWjF
 cIKg9wyKUG+OQRpAtE7inc+NKHTV/I+OKQ2HdPCpqG9u+0E3p4leqdGKCPLMsim21EyGcN9WHz7
 VkvekdBgOeWyzbB3sift7dWy6RSp2IX3TvGAcdmlviyhZAOyz2jFyun80jP9PckV3iXGjQl0YuD
 M++Lq9QAkl6IYDE/BBBdFXwTM00L4qn5iZr2x0gphdSlI4LGFUrXTMWNxoooYKgTv8iiiIrL7H2 lD2LcUzhv61vbIw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FKKOVOos c=1 sm=1 tr=0 ts=6b048e8c cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=OLCHClxKf6i9BzEG9Y0A:9 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-ORIG-GUID: ckm-XtmbWdrOeUag33KcnfQCIMR1EbME
X-Proofpoint-GUID: ckm-XtmbWdrOeUag33KcnfQCIMR1EbME
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3NiBTYWx0ZWRfX2CT5+wsB7bwD
 ube7fIUBIUM7U0TE7Jd0OCEHkELevk6j8bfMhgx1JG3dy94GuxBmET0YcBiXsjSi1EeRjpvLcOe
 UVZf7JXShqynMW8LFEzrCTKWOQUy3Zg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3NiBTYWx0ZWRfXwhgbPHCFy98Q
 otmV98uNavQICWA8kJs4/a0qwY5yCrRlcZgV9+I40aiUf9FDYYlgJ5ph2I/eUsTG+KgIlAhhzo2
 MVH9etuabvOnMQ/Ju+IKdC3A57clGTdJN/x62WPW2eNuPNQE5CtFZtrj1Oqvl1K3GDKA8rpNENi
 Wg46ZyOC5UHuF3J1ByCF2xAmHfl3BEApdyHIJJEen/2QTnQ1TpQwd2PK96B/iy2RtlP9TkZ1yLS
 fpL3yrtp5wG1AdSqA9yh8+HsKYST7zDn3YJsFkPWJlrMiDx+5Wiilsc5oiMRCADaYr6nCVVboX/
 9pme78w3ys4eh2adfy1Rd5jjVXxJnkm2ASvBffJUhs8D029+kypj5z8vKQrUbPDG48cu18Lq5ex
 uJfEJnri/RBBN0cqjR/LLFXd6rMUv4lFQka/oxFi9e6NEjnvqUeAuMAuce4g2zoUfCU2sYWKi+b
 s582J2pt5ZXfTtmQSQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230076

There is nothing architecture specific relevant to building of
PHY_QCOM_APQ8064_SATA, PHY_QCOM_IPQ806X_SATA and
PHY_QCOM_UNIPHY_PCIE_28LP, so allow compile testing for increased build
coverage.

Cc: Mark Brown <broonie@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/phy/qualcomm/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
index 2486720b9ffc..7885e98c904e 100644
--- a/drivers/phy/qualcomm/Kconfig
+++ b/drivers/phy/qualcomm/Kconfig
@@ -13,7 +13,7 @@ config PHY_ATH79_USB
 
 config PHY_QCOM_APQ8064_SATA
 	tristate "Qualcomm APQ8064 SATA SerDes/PHY driver"
-	depends on ARCH_QCOM
+	depends on ARCH_QCOM || COMPILE_TEST
 	depends on HAS_IOMEM
 	depends on OF
 	select GENERIC_PHY
@@ -52,7 +52,7 @@ config PHY_QCOM_IPQ4019_USB
 
 config PHY_QCOM_IPQ806X_SATA
 	tristate "Qualcomm IPQ806x SATA SerDes/PHY driver"
-	depends on ARCH_QCOM
+	depends on ARCH_QCOM || COMPILE_TEST
 	depends on HAS_IOMEM
 	depends on OF
 	select GENERIC_PHY
@@ -175,7 +175,7 @@ config PHY_QCOM_M31_USB
 
 config PHY_QCOM_UNIPHY_PCIE_28LP
 	bool "PCIE UNIPHY 28LP PHY driver"
-	depends on ARCH_QCOM
+	depends on ARCH_QCOM || COMPILE_TEST
 	depends on COMMON_CLK
 	depends on HAS_IOMEM
 	depends on OF
-- 
2.53.0

