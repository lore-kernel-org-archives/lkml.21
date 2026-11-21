Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795280885;
	b=iWmGG6lF/iaKkwzBjDBPaZ0iNjnVd0RjhSL1EfNCbN3wp+gqNGnvhqxj9oqED1qGX3ID
	 8v7AxwyZM0NcJCNmdf9PX34TMDxCXYQUmK2ZDPt25kmacXUOIb2G7qhcH+4qPwPc9iBrK
	 hlrBLIo63ye9JnIYOWLNJsLgr+AJ/f69BJ8XF7sHU93sh1hIE8gVTc/ILJ0ORziYvW2Nj
	 6pEaUDY1GoQkMtYVCOvAY8q1bRCyryzCBaQH8C7x/bsSX1S5vt8iQhppO9u5/iY7IZN0Q
	 8e1cbe2AZOFuq5vs5aIjzrIG0xK7OlcraG6FDCyYmCK9m/Fmis94yI46JSyUtcso0Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795280885;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6JMwvaxCTx+HUaMXGEdxOPJWtOy0hnILiJDEpf+rKRs=;
	b=v+qxd6e0Z5KNDJ9W8TxkFsiT4pvIYd+rRUDGwXvRZyiCBAKOpkXgBXj8Qik/qeuaQY8+
	 +VKL89AKyhVGdTzjnUh3EAja36MJoSfqfsfNiTDTgjbv6YK6TTq7lvdfk3Oz6+oxghay4
	 mvRnAnTRx6FPsDYvNe3Mzfa2tUXBO+i2GBljH8rdb/zEbVbCLZpgTe3KK0Bni/d59Spsu
	 j2H1Vux3iRffyhXj9KjXoGngewHPZ7wTxfqiFxFfSRSp7AD3QjuaRjG08iBK0f+qcOH36
	 5fd8NnasLmFk4mpG1DbKssYsGJ3il49CoVPBAi/COJdYcjD62PWJq85Tplo0LtNBTlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KHoLdF8y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i8m0AiGS;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117B0606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 17:08:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 117B0606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KHoLdF8y;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i8m0AiGS
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ALFa97T001487
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 17:08:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=6JMwvaxCTx+HUaMXGEdxOPJWtOy0hnILiJD
	Epf+rKRs=; b=KHoLdF8yM3GjkwU2sghWWXbPZ9Wwc5pI+VlNa0W44zI6ta2xvmU
	0w6ncLwksaAn1dXPKME3Lf9X1uUkfA60VrutbRNwc4o5sBw9sBOTg6QxsWt7jZXV
	MU0/vP3DDap8kv16mn7XqDHkjvvEmALAodcIm5DZ83LKj9BvLZyIjt6gg9pV34RR
	R+to5Winke2EUh19thpNccvOZZkHTK0U7SfeujUZmxNh6Q0MdQy3E5feiFzjefHA
	oz4u8vIE4W8vB2W+DC02vub/MVfl/uK9FXtCODyBAaKPXYCIKiY811FX/V7hnoZE
	3Jgra3BhmXBkHdPq1zJqrgT50jNTUVbAqgA==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j34ka1eee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 17:08:04 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b4dca1ef03so25633557b3.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 09:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795280883; x=1795885683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6JMwvaxCTx+HUaMXGEdxOPJWtOy0hnILiJDEpf+rKRs=;
        b=i8m0AiGS1SCWF/1fVTjPy9dp5qw8iNXfdQpn0ByUNIPLdtX41UkEnNSAad2NbchT2X
         6CbQlzqoTL917/+cI42q39f/QkmYS4pHX7G8ZncPesyeK4C8+nEKyBFdAqkTGbnAQ9Ph
         yeLFo6XjJcCSC9dknclkmnARx3oXo4mo2da7y5HxMEa0Wu8JPHDSh+rI25j9tEzGlSNh
         VjpXFMSYVvzE7aHvGfjOw0zeCF24/yxt3jw6ExSEkqGi+CqmGV7w6pl6JmR6zUESTcjC
         AH0S/dLuPTU2QK+9Vd9QRLwqi+VsIflmlLG1JyOP2sgEOf4C2CKvjKx+t31Iv6gGLspf
         kyRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795280883; x=1795885683;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6JMwvaxCTx+HUaMXGEdxOPJWtOy0hnILiJDEpf+rKRs=;
        b=yr08xiZALe24YmWuh+iXLxBDPaDDdR7+QYGXc6w8ExyUN5C4rXT93XawLdRYNTRgog
         4lkT9Vc5bHQ1OSaZwuAUD7cuzCq8iuutLps6pek7+uPQ0eftu+e20+0T4zn4MG4ZLaPY
         9ql4vc0ixnWaSqCKIl/I5G/6vQ6ekrl8Yd2aQga1xYfaqVptLktCC8I4Nza3w0V7xS7x
         S305xwfA6UPbpk18oDYCksIvlKzISb8vpBwxeC4AEtPtEtC6nbkYU77uG9Pmr45h90Dv
         AmVI98DENvsQlERgdvsqs9j9rJogk6im0lADf5HxzmfSVmCERfTT1/uXHEk8HwpNq7VV
         LbFQ==
X-Gm-Message-State: APuU4Z/md8Ix75Hak6d/RZoX3YK+KDEd95P897LWIu732bW4YWqTCfrn
	XfoXM1gay9fFmIa7iuL6hwMntPbVA8mlzynOHEM63wmeq9yeTyZqpQ+8zVBrtoUrOkDnePCXRtY
	A/A5df/qiErdawqwD6jrIis1bx/E013gXurpIDk75Yyb8uJHeV3Td0N0Pki6DMPzc9Nk=
X-Gm-Gg: AZFdTZc8HRzJtW9bvGFawtTFfd6H9NMozKiiAkosAGyYmFnKVJ7PVSLTJMxeOvAdhLr
	c8uP9D+EBxBYBvRPfk6SD3lKJ8dBaxA7h7p0up4OzgxgeDDiBof3GexLFVNeqwNLwnJLJg4AzKT
	ZDsVUWghRjwxvjaAofq2swFZHwaMYzY243wdCW1q8ma07iz/zhtufSvLtwY9BGun+ItJUAz/+Vn
	tCfDmCxNijn0xNfgwnhjfR9v7GhAmM8JmeZyXXha4JBCpyamvGSZ3NPWOcPeRfhJ23IL4FCR2vB
	+xCdaW32Hj+qyWhP9/9STO6b7Ia3QieeXaRyVaKi8x+Sf4W7MoAXNCn+hl540qqNVw72sNDbn4m
	3IzRqpqll1FNY9tOgr9GbaagL64DoYACzm+gtm/h0J5PIejsdjIqHyW1tc6tL/A==
X-Received: by 2002:a05:690c:620b:b0:8b4:c2c4:c5f4 with SMTP id 00721157ae682-8b5205537camr25045567b3.67.1795280883149;
        Sat, 21 Nov 2026 09:08:03 -0800 (PST)
X-Received: by 2002:a05:690c:620b:b0:8b4:c2c4:c5f4 with SMTP id 00721157ae682-8b5205537camr25045447b3.67.1795280882704;
        Sat, 21 Nov 2026 09:08:02 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb98b4dsm12945871f8f.53.2026.11.21.09.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 09:08:01 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH net-next] net: stmmac: eic7700: Use syscon_regmap_lookup_by_phandle_args
Date: Sat, 21 Nov 2026 18:07:54 +0100
Message-ID: <20261121170753.161170-2-krzysztof.kozlowski@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2887; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=K2miH5rqAJRKMoflINTVIzDqG1cCAkCBPvqZkVe/Cxw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBrAc/psZcP9FJ5lY0nUMSWSWhVysfAnvNdWEi8V
 /DTgiMqbPmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCawHP6QAKCRDBN2bmhouD
 19QBD/96ZEHrUEJ1Wt2vF2JDNxYNIqpgQn3W59iY8d6X1iKITuOmhcra0u586cS9kRhGt8+g5Lf
 GN8qLomatvA7zUx2yQNZzBWHLB33SclN3p5KdyjIJG3nJXqPPExxGw0K/Yiz18MafXmwFwAX023
 mfkGnxOPNV3Z1a6TTKKMMQ6k9t52GVrVVFJX0oQfevNQU3AkaPuRnJe26aitu/94RWhqTSYYmV6
 UoaEVPGoM34cjseqOp86ibCuqJ4qa7uiXLcJ+4fglk2NMcnYkw8AuVEx0Wf1nWJXSHQ0q/qGDTX
 t4ueEx5ia3F1fEoThkwVxolpGCVjMI9WtWgb9u9KmIdloyF3c5f1Jj8ZtIxVvu81q3PTwQdP7lZ
 3W7xaZYLFKTDNDsWGyO+K25d+eD3q9aoq7Bw3wKutb9wplJ/YlhZ63YIv0QYnY1zSsQXnCD6KGu
 anwp5Zg++bl0wVLBvS2hAdwVnocANkLY8gGjdWQXj/kDVW0vogjgnmdCi/UpiTG9gTeGnsP3YZg
 31Mcv2936IMA2gMj2cjR5FeCmx08UTRLCjmnzKfIeVs9v5Ca0XcAo01EBj9OK2vlYPgo1KxFT3m
 RWUbzV3iNCDdgbHJWHcGV4zBdcEYMYSkeZ3yKrjtBJVzHX4tAewuDWk2b9lAWM2AZGAoowLjgIU 7oE/rope89UpnsA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIxMDA2OCBTYWx0ZWRfX85mro9aGfgad
 bmagzQ/BCXMKWbyNKKiTQD4LUbmGD3YHgcA79Zpsl6XHO3PztrL77kDUQZYhsUm/+gqv54Rs6VT
 l8Jd1l7BACP/sb0oJ7UESDlltdhQVsk5xdba1tF3RBHEFJpNFUiscqZvsCce4PTMOJ7gGRoaNPW
 HyR4MqPTsJD/6fSpRHtTZ4UXx0qpCfeWFBQV4sz9ZAttJEoZnSPoaS6ABdSfJWXq7l4ACnFuMJu
 14ZHkn08mZnbzxtpfUPxWVdim7JAut38Qf/LD7LDga/ttARMV3vkdOfOaS1/4D//UPHKwF+s6Md
 pxYkjc6oMUujAFE1weYhYkiA4OCDaD2Ac16GnSfYeOgaJW7O42MR15NOap5On36P4A3esU+Lhp2
 EFOSm5IHc3LLHM4FpKCnSd4WJJFTYGsZxLK/5gjyzQs098UJgtDE7AYCFcHmjOWdsTTuK2l043u
 r7PFjBsB04RKQ1u3ayg==
X-Authority-Analysis: v=2.4 cv=RJEmjIi+ c=1 sm=1 tr=0 ts=6b01cff4 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=8CrXmcB1Y8iGUmZwrFIA:9 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-GUID: D_y3sLgbvxGtr9hvkyDB1oGZMeLfJx98
X-Proofpoint-ORIG-GUID: D_y3sLgbvxGtr9hvkyDB1oGZMeLfJx98
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIxMDA2OCBTYWx0ZWRfX9Rcf0b7X2TDi
 8cUVuyau3HcuyEsgmWs8YQ+h7N/SGoojpcbTufYyrGEK9m5AUbdBs7F/JhCqO6eUSgMhJzZ2vVY
 zTYksicOTJF49sLF/aoMraZYLN/T19E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-21_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611210068

Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
syscon_regmap_lookup_by_phandle() combined with getting the syscon
argument.  Except simpler code this annotates within one line that given
phandle has arguments, so grepping for code would be easier.

There is also no real benefit in printing errors of missing individual
syscon arguments, because this is done just too late: runtime check on
static/build-time data.  Dtschema and Devicetree bindings offer the
static/build-time check for this already.  OTOH,
syscon_regmap_lookup_by_phandle_args() already handles error case if the
number of arguments is too low, thus switch is safe.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-eic7700.c   | 30 +++++--------------
 1 file changed, 8 insertions(+), 22 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c
index c229275b11b3..287f717ab3ed 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c
@@ -170,6 +170,7 @@ static int eic7700_dwmac_probe(struct platform_device *pdev)
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
 	struct eic7700_qos_priv *dwc_priv;
+	unsigned int hsp_args[3];
 	u32 delay_ps, val;
 	int i, ret;
 
@@ -254,33 +255,18 @@ static int eic7700_dwmac_probe(struct platform_device *pdev)
 	}
 
 	dwc_priv->eic7700_hsp_regmap =
-			syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
-							"eswin,hsp-sp-csr");
+		syscon_regmap_lookup_by_phandle_args(pdev->dev.of_node,
+						     "eswin,hsp-sp-csr",
+						     ARRAY_SIZE(hsp_args),
+						     hsp_args);
 	if (IS_ERR(dwc_priv->eic7700_hsp_regmap))
 		return dev_err_probe(&pdev->dev,
 				PTR_ERR(dwc_priv->eic7700_hsp_regmap),
 				"Failed to get hsp-sp-csr regmap\n");
 
-	ret = of_property_read_u32_index(pdev->dev.of_node,
-					 "eswin,hsp-sp-csr",
-					 1, &dwc_priv->eth_phy_ctrl_offset);
-	if (ret)
-		return dev_err_probe(&pdev->dev, ret,
-				     "can't get eth_phy_ctrl_offset\n");
-
-	ret = of_property_read_u32_index(pdev->dev.of_node,
-					 "eswin,hsp-sp-csr",
-					 2, &dwc_priv->eth_axi_lp_ctrl_offset);
-	if (ret)
-		return dev_err_probe(&pdev->dev, ret,
-				     "can't get eth_axi_lp_ctrl_offset\n");
-
-	ret = of_property_read_u32_index(pdev->dev.of_node,
-					 "eswin,hsp-sp-csr",
-					 3, &dwc_priv->eth_clk_offset);
-	if (ret)
-		return dev_err_probe(&pdev->dev, ret,
-				     "can't get eth_clk_offset\n");
+	dwc_priv->eth_phy_ctrl_offset = hsp_args[0];
+	dwc_priv->eth_axi_lp_ctrl_offset = hsp_args[1];
+	dwc_priv->eth_clk_offset = hsp_args[2];
 
 	ret = of_property_read_u32_index(pdev->dev.of_node,
 					 "eswin,hsp-sp-csr",
-- 
2.53.0

