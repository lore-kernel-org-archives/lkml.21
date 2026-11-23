Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795452195;
	b=tAI32nZkKsv4EKsA3RoL3Rj1RU+RF2djMRKABCrSIWDuc9jN9939N2kpsn1mmC5oiHb7
	 zk970N37zvN/+OGn80MJJnSJWicvpQXDHKVaNBT2lGnaN7kuY+w3rOFeQTKUIM6r9/Dg8
	 fyHJTU7mCKgCAlCt5c0EeLKgHyLAMVzoQxBFtg0IMSyqh9zv70P1FU0yW+Rk3df2Tiyim
	 +54W79Hrsp48UL+Z98klq1QANZzOGAuF1txKqOaiJMGdnm9zFevO3qJJtZxhQn8WEEhFx
	 a5SaX86saiFOmP/CQWGn+3MkGpYgfuCzXhsYPDMYbKNYQmPgKzy40OeenhPgNdeH4mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795452195;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=K/0f/Fx9dcCRSnODkYtK3aiTY3t3xedC0JyO9Aj9vBY=;
	b=KrwdkHqaS0LBDlu9XqZT9/uU2bgPwa8M0q+fUwtZKLcIdapE6YpKzpRfhFYNukF0cU4D
	 5JrRGEiA9IqvaV1vUIjbf+W9ZOTsdZgw3QXA/HieOnVGXY7UsvgAUZ28EmWOTFYkdMqBh
	 TgC4G56zc099L9ePhz2MRukhZ9+PRA+kwdaDr/yXTme0atJyQwnY/3hm2Idh5MjDTgZUD
	 VOBq9E9T5ezUjb1Y4uNBeXbcZ9kns/+31sbhfJ+jqmPzpHBWYEAHDPC33xSZA4ii2myOi
	 Mi+jf4jE+gAH4boS++rgvyEZnXAlwwmA+a3tcwk5tNxMemMQ1VcMGX2/32gKfwoOBCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bYi20q5q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JSPPntkE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5ACE606A6BD
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:43:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5ACE606A6BD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bYi20q5q;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JSPPntkE
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGmii1861196
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:43:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K/0f/Fx9dcCRSnODkYtK3aiTY3t3xedC0JyO9Aj9vBY=; b=bYi20q5qmtj+mmQ/
	RBnmM37JL43Sv32HyZV40BcU0nKWzO90dX3rVPBh+1lNie/T/OprsBUPNknFKkxj
	HAPisO4bFdVYDJIVjN32uTjKpmY8b7NIi08EiaH0YgDVTF+TueO6osskrfUVtjoE
	UbNFmfaiU8JN8Dz7tkad+zWVJbi0R52qAuL/t6z3D4d7P2YfPN+fXf4TY0VGSBrt
	antkIZkSepzsRvbrHSlT08UrzekzX5MCOBsuzLtzWO1wrEnF9JzMGEy9ZdjNKxW8
	aq1UQi0B2bvlSR+EI6h+Y35kNgutMEOYsURprvKt629I0/i2wvueMyGfhmIIhvv+
	d5tieg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g9a2cay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:43:14 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-99c47fe8cacso2688556241.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795452193; x=1796056993; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K/0f/Fx9dcCRSnODkYtK3aiTY3t3xedC0JyO9Aj9vBY=;
        b=JSPPntkE/swE6x9ThFFHmU+dc07IYKfAskGaaC/ny6rDJof5n8MNJGyiLBLMDUGaMV
         ZCuAQa0Fgrbc4J8w9CNrYoK6moJVxuGJvwX/vBQ7b/tD8c0ufDC7xGMhwTMhI1pQ6jsP
         2gmL+AiayoJhai+fvrxLj7JeAdMhcMHIA+8zM9Q1ZOZws0kQF2y16RjKNrJJQbmfcdZt
         4GewrfNMcEZf2gVFFaPP9/xsCK//QlpCwLlTgwXEMNYDRny71OaNz4tibu1lyAGQGb9s
         FOm98+b1VpkHqNFEshV60uEiB8ejP7q+wKDsvEPOAvYpmkPiTCuo/7I437h6rJNvX2F5
         9kMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795452193; x=1796056993;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K/0f/Fx9dcCRSnODkYtK3aiTY3t3xedC0JyO9Aj9vBY=;
        b=p6rWX2dKTyxIvb07/GZXj+sLcISX8uvcDjB20HgzL0N6voIUgVGLF2liK4+lpvAeua
         4XlxvFjfzVJ5ICCPW8wI52pnRNBP7/e6YBFXh2grl91/PE3LDU+IdgiddV+GRQxLaNZ8
         30SvVS7TDvSprrOGB/3JzjJcXJAkT+XRw80uPsibSufmKPvqQzoVCRICgKwelWdDkYXB
         VRTUyszMbOquwDDcwpSlc5u7E7zkJh4Lan5gmg3Ku+TlZkU+v2bCpu4ye2yLD0X827Fx
         zadknxjMTwCohJtgVkqrLv7m6RLeKcZhuJCZgD+aef6Urcq6KSEPPKsxSbFGVv9JcZ9S
         Jpvw==
X-Forwarded-Encrypted: i=1; AL+hErFvdSs89c5emuSNoe1XFCHLx6JfQsMcA3VpORADwjpafm2YRNbspHdJM+A55SrgaRmSTA/ov4U1ZAGE1DE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mXkGjAlyNu87nqFeRlcxJM6oSFkLVWfZSJE19wyEWT7t/ipZU
	dJ9LZwlwxD5DexU8hraomz8l6m+cXRvRewntwXTrluftST4dsfrQ9rjnPnH3bheC/EofRU8NuMm
	aPzqYYnpGRfEpzPMQ49h5oz9YXiF2tBhY3qAPRFZxRmz/Zr8wDfuZG1P9OfnqNcduPWA=
X-Gm-Gg: AZFdTZc/cL3FwgdvXaen8Z9qzrdTHizmBgO0ArNX17OorK2uiVxCQmXDGYPxZqHtMvv
	FeVFtLShatblYHtqHr9czOGOF4FDaWHQHFwSwuZ3XRqmFobA9Oz+Xr82Y9ycaC16hrhCSHrGxtS
	xZ9lEx/zlKpD4ktcogWZvkBdP62LBypJXnZ6ItqnLrt6uCEPhpq8aBFZ9gRua36coV8Oj8T7x40
	5DToJiCl4ShejCJKHilU2aXoV4tCiasdbztvdOfJvuKgbPfsRxxHawdJGj5B/+W6xIjjpbRCwDq
	e3R+ahoYlKzcey3HU9BUrR/S2YJcM0gVZPQFXsLYy2l+Cad8gCQTqyQSksUK/B6/US8NNSuD0rS
	JIpSKRdWFhS0lVn+nS4u4o8Ew0lMGgq4MHz1AYBOvzs5DTSnJc3o33RxHGLlbcdsXYyMjnyXHeH
	T/fb6dLazkIqlL
X-Received: by 2002:a05:6122:1994:b0:5ee:13ad:6c8e with SMTP id 71dfb90a1353d-5ee8af3d2c9mr6205481e0c.17.1795452193261;
        Mon, 23 Nov 2026 08:43:13 -0800 (PST)
X-Received: by 2002:a05:6122:1994:b0:5ee:13ad:6c8e with SMTP id 71dfb90a1353d-5ee8af3d2c9mr6205435e0c.17.1795452192792;
        Mon, 23 Nov 2026 08:43:12 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b00117dsm426725366b.80.2026.11.23.08.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:43:12 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 17:43:00 +0100
Subject: [PATCH v2 5/5] arm64: dts: qcom: qrb2210-arduino-imola: enable the
 EUD
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
Message-Id: <20261123-qcm2290-eud-v2-5-9bfc432dee07@oss.qualcomm.com>
References: <20261123-qcm2290-eud-v2-0-9bfc432dee07@oss.qualcomm.com>
In-Reply-To: <20261123-qcm2290-eud-v2-0-9bfc432dee07@oss.qualcomm.com>
To: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2NiBTYWx0ZWRfX9tP3yVa3I2Ly
 Wi1KzJWBa4FadFAwmlqG1ASBshA/6MS+IXXV8rKEfGuAFJH12ptwoX1a9egFyGMR8C7xitZWuAX
 MkDE/cmpkpLrkD3WfDkBq+nJNSp6L94=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2NiBTYWx0ZWRfX4JsJpovM68nr
 RQEsuimAkuOxSDR4eXLX1W7PHLP10Am4TyiNrUzhz07Xo8d20v6ldJf4/oJZJF9ADxCwMjK5P3v
 X3XRmyfHqa8fG08+yFRfGFblyOKh0juKSBNmMFkKBKREURnax5UohUzYZRddT/4TuL7MxL7Aq7e
 00NHeHhOnLKIzzFRpR8jgK8Klk1uACU4/oV9YCrRoKBtqLkEqcyDthS1GaYiQuB3qomK/ZP5PKh
 Xst3vmaxOWxHniTAI8OubpWQfi9xgiIpSn6/LjaunRmNgMVGg1YmCNnWViCS0b8XKfPWjU89dzC
 e2c770VnIBIhxQwQ+wV6TsTjtqLdvMSqbMdv1hJrfDQ5UFsncHeaOk5cyz2nEu18b++fUhg5XtF
 WZBA7nBSkOX0aO3xC44dc6L9IKhyYULUqGE5Cl6d+/bja3qahzlGDAgXh/v3GjB5c2/kY2uBDl8
 hfEAswGER+ahyP4MENQ==
X-Proofpoint-ORIG-GUID: ifKjTFHhiXN4d-FQje-JYMmSvE7an4DJ
X-Authority-Analysis: v=2.4 cv=cYJHPXDM c=1 sm=1 tr=0 ts=6b046d22 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=pvBjvzZ7d9aESBAnF-kA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: ifKjTFHhiXN4d-FQje-JYMmSvE7an4DJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230066

The UNO Q exposes the EUD on its USB-C port: with it enabled, a host
sees the EUD hub and its SWD/trace functions, which OpenOCD's EUD
adapter uses to debug the SoC.

Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
index e99d2a56dc28..a1af2caa5bfc 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
@@ -226,6 +226,10 @@ vph_pwr: regulator-vph-pwr {
 	};
 };
 
+&eud {
+	status = "okay";
+};
+
 &gpi_dma0 {
 	status = "okay";
 };

-- 
2.53.0

