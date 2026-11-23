Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463556;
	b=09dq85KRTPWMAzync9XNGVtahSKcUFYc5fgttY/l3PQfPrhZtAkkKaMHMpnM/pAjqjCS
	 TdM+5rQmKfIzOPiSj4bpA5EzDCP9LWpA4M2fh1D9FtC2OPE15bu+gSjstGyan2TUlXb/q
	 xld3DNSZ+KFfre0QpoBcURh6/bLoCPGBz1FW4uPUWMyClU1KFUsqy/TVIgpHKu9uOPk86
	 q8DBue8kXqbF+cUu0NiTKDN704kSl2AM8zFJuc9TDB0JaUMWiUQMBAZqtqqJB6cNzY9om
	 JzrldpUJHtbcOynme1kiBb60CghBSg6xS40D2oLtfYnCUy0mHcND7oJxKWJdZ2vMr1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463556;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vrzuixifcgj4ieImFYZkDs5YxdebevQpN1By2OneWM0=;
	b=4Z0edwglIKtHRw1/gL8jI3bxgm975XmxBon9ETTr2JqgSuPxiTLnDuCpsy+NFj4yOaDw
	 yYm2mhaSUujYEmbCYZUthzSyEjCbqHgx4uG6GvjpznchuipayHf0UrMAgWREgiA0o+4fp
	 APTaW+BZNOfFGaRtWElCqPjn61VOXUylOD1R5ylrkGw6SfSr1A7L4K9xhPh02OGBRXqLh
	 dzDsssMjIhsqz/E3iABXcwu582QDXO9X8MxVHlFKu8yjMKHab/89tJN6clNUhQDf2MLpg
	 hvT6QfJgDWKzHw5EDonAaLNLS9pbNlfful6y6g40R/eyOoWAJ0fH2sxf+If1lu3Vcww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="jxF/MHQN";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MPcvWDat;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFE0606A32D
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:52:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEFE0606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jxF/MHQN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MPcvWDat
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH2p03475220
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:52:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vrzuixifcgj4ieImFYZkDs5YxdebevQpN1By2OneWM0=; b=jxF/MHQNRK4rlZJC
	uidrjDDFeqZL8iSWhn8PNkEDS7Hgx79vauSEpalFIzPwkujyOatXfBEmhCN8bLYo
	IF/9hKoafE//RYaWdUD5A7u+na6sQgg1fj5lbkPUyDvPDgxY+xgkhSSefAEXX82V
	nG+oXN9KPMzjqvuFdHOFftZVkS8e2nn0HGeVbtGJHsXvogoE3Ti5gsr4ktTYHIIT
	w7G+T90Ta867z4di7fLATnB631mFFTtJ00YQP4qDmgDKkdcK63WosjtBnTjPxGGA
	z7o7oSHypZ2FgIfxcDT6RymzoCQrcFanGA7LB/Hy0sy1D/2Z/7PvWuO1HSssytGn
	JN3CTQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4hn7tuxg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:52:34 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-383ec96a7deso4198819eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795463554; x=1796068354; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vrzuixifcgj4ieImFYZkDs5YxdebevQpN1By2OneWM0=;
        b=MPcvWDatwtYh6jxBLmMD/rCxLEpOWjqi99GdC4qHws8IQKaPyjrlfTNAIdds4dL6SJ
         uF6dTCwxRggaiHaj/9UhLQ7+YS0Qqrz4NKwRvSm3wQuTzIABkvoa8u+4zF5xEp8iku0q
         phCUv0sI2/7cYbOf8bfFwUb3fnyAnmdFPZ5nLg99tIooYdhRHIIcEzmQgcUpgxXKWVAC
         FWuMNPO+7lwpTekAFiErnPP0Uii1WIkBaJ9KHVXzEHXnyRWwjg9qbPIXAx8L7+qOBeq6
         FW/i0Hf14B0T2geGFsD075VipG73SJThA8g2sbQjwQSyPBj0NjV3erqQ4MF+olIkWCnf
         dkpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463554; x=1796068354;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vrzuixifcgj4ieImFYZkDs5YxdebevQpN1By2OneWM0=;
        b=C5YUJNkC5FXmw1JcQO0GQrScROyA6c/eCtNBzQfAY//TM5apnNicco6tGKlv+Sr4Eg
         w8hWvsNGVu7Ze/+FLmj72lQUrFxGP6wMBgR8HnEUMR+wwg/9+UlXnJBjfSJlFE6GYg4W
         3eOzLVbeutxEGNxt2XjIpyzDdEl3gdQYFfax3WDdoKkyrX9EoHOCLTIK8yv4qhr9oz68
         IDtn3k7H3s8254smxj3oc/qc9IB1UIfcCRpijam2XqZg2OvNEa3XjDW2/mRv0AedLdrR
         u11h/LwP/bst7tYl/q7MJYL3EAdyjpNd2/Iur+uq+0qdClis4s9F/eBVR1yKVSasCWJG
         jaYg==
X-Forwarded-Encrypted: i=1; AL+hErHVfpqxug36Wj0UcWM1HYXmd362OWQBUaRwO8jSQm2ylv6e0cR1bUy2OUJQWdVQ2wHvB0gMKcL4buekc+g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+E/qQ77atLd9dECY5HD6Lgy0HicadtL/FJ+TcJGvRgnPcWKdVw
	kAA99EmonIyxm/0lhKhWi2W203rXS47zYq8p6GKsbcBimGEsHVziTat6SDYsKyBn8kXA4TxkpPb
	71kSGdkZohDVDtQ8Srj2WyhzSIi5i5d+NstQkkMbKCgoBT4+n9qqBApcJnVL8p/vrXXk=
X-Gm-Gg: AZFdTZfquxXlgezTTZQfbuwFarhgyFdDLmPs7KQOY7SBeD816Yb+vtmwtTIk/cPS4Qc
	ZF+OKYoByIVezMEDqNpzQ9lXBB1mlPTfThd5mN62nle/nYMjn8qZSqH15WxaLb1iUhLhuq9XvTq
	8BlRz0ubCSsZjZ71EBLltiN4Gs/30qlmoWd3oCJOrwsShqSKlvfuTfNKzqYdW8MUZWd99w6FKgX
	LISEYHBFcEhzkf4RGDOodS/zqvVfkN2WKjLGr3LUorcbdvMy387mSBOZ0CalcjcgzIgwLeikvls
	A3B7tLpUXX8aF0+d5zYA+iR/xrGS/9Stjsy+J0grqfOGOwcknKA1ukZJWE7zmmgFVimcz63cP6t
	fKEFMxewnV6IHQ6dRSza//rPq8C3wNk4MEgsASME77noP150nAhm04Wi2hZQ53JmrTCgVSOi0Dg
	==
X-Received: by 2002:a05:7300:7b26:b0:380:f32e:d257 with SMTP id 5a478bee46e88-3856f6524a1mr12179029eec.13.1795463553652;
        Mon, 23 Nov 2026 11:52:33 -0800 (PST)
X-Received: by 2002:a05:7300:7b26:b0:380:f32e:d257 with SMTP id 5a478bee46e88-3856f6524a1mr12178991eec.13.1795463553150;
        Mon, 23 Nov 2026 11:52:33 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm36363123eec.7.2026.11.23.11.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:52:32 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 01:21:38 +0530
Subject: [PATCH v3 07/10] arm64: dts: qcom: sc7280: Add GP M/N clock
 controller
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
Message-Id: <20261124-b4-pdm_clk_gp_mnd_v2-v3-7-98db26a87500@oss.qualcomm.com>
References: <20261124-b4-pdm_clk_gp_mnd_v2-v3-0-98db26a87500@oss.qualcomm.com>
In-Reply-To: <20261124-b4-pdm_clk_gp_mnd_v2-v3-0-98db26a87500@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=Ls0HWXdc c=1 sm=1 tr=0 ts=6b049982 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=f-mW_kVclKPPUklfXV8A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfX4cvHFlY+Q7OF
 aKtjFyGw5O3Ri0+6SYzli+vQCgcZBUYmwia9nWe1+4KjXf8ptFPUK64jNwCqj2X+bbzg5NnUKlO
 BimNuJBljy5vBqTrRFr5hB9cEF0FvVxOurC9ZCHYISt/byV+xhCd4oROqAJvsJzp9rknO+xLwtx
 IH6qb9NxrhEs3ZoAiDfjiOGTRIDc1tEhzA4/lEmaXaY9Rou4TXwuKTQuzbaJtPX/TLD0vSDdvaW
 /xcg/UHI1O5fr0yjUyCi7AsfnwyObgHUzGqqbitn4rknn6ofycjBGTYCsrVVgx3pwfBMKFT6iTo
 8M1JlMlLZPI2ptcp7PLMW0XIS4iyrbywayiHNYWEYbQq0xsdZDTHoZ4BSeOKY8Vv49pIrux05c4
 UJNi78ANgTKfzeh85bTPPmxx//GIYQIYVlqkgoLS3QehpACoZVFe2IzCctQzoNZDuF4evrQMme7
 o7z+geTXv3zjM2HFSWg==
X-Proofpoint-GUID: IvGDqypBi4t2SDa6UvndjTfh2LKFpaCO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfX3x/TYsROfu90
 4tAXOxuX1wnVkbDU3MW8Gj/dqUyPM1RYR3GGikySe+XIIsuG7SWCb0hUivqmSpudqDhtFCQ8Fl8
 Zyt+/u2CyepuViBv/3koSw85sZDq8WY=
X-Proofpoint-ORIG-GUID: IvGDqypBi4t2SDa6UvndjTfh2LKFpaCO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230079

Add the GP M/N clock controller and its pin configuration for SC7280.
The controller uses the PDM XO4 and AHB clocks from GCC and routes its
output to gpio60.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 10e9a5279ed60cea1514097354b8f0f59ffca2fc..773f4487d78301a18d5c27e9e97462e60adefd0b 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -4454,6 +4454,20 @@ usb2_role_switch: endpoint {
 			};
 		};
 
+		gp_mn: clock-controller@88d3000 {
+			compatible = "qcom,sc7280-gp-mnd";
+			reg = <0x0 0x088d3000 0x0 0x1000>;
+			clocks = <&gcc GCC_PDM_XO4_CLK>,
+				 <&gcc GCC_PDM_AHB_CLK>;
+			clock-names = "pdm", "ahb";
+			#clock-cells = <0>;
+			pinctrl-0 = <&gp_mn_active>;
+			pinctrl-names = "default";
+			assigned-clocks = <&gcc GCC_PDM_XO4_CLK>;
+			assigned-clock-rates = <4800000>;
+			status = "disabled";
+		};
+
 		qspi: spi@88dc000 {
 			compatible = "qcom,sc7280-qspi", "qcom,qspi-v1";
 			reg = <0 0x088dc000 0 0x1000>;
@@ -6683,6 +6697,13 @@ mi2s0_ws: mi2s0-ws-state {
 				function = "mi2s0_ws";
 			};
 
+			gp_mn_active: gp-mn-active-state {
+				pins = "gpio60";
+				function = "gp_mn";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			mi2s1_sclk: mi2s1-sclk-state {
 				pins = "gpio106";
 				function = "mi2s1_sck";

-- 
2.34.1

