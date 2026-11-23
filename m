Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467378;
	b=L+MJF/s7hjtRCvRezpnPx4TDWpdoszqLPY5/qoA+2JKP/CCSFCB05/3oQFOYGiNJZ7gE
	 FeIrZSQVFitbN1BCbqmYL+ZCyUNaS2055eBdp7K1BCqjMnwc2M+j8GqhMD+EhOQqp5AnR
	 WonQjuZWhzCIGJOiciqE24+0lEGNVqEXyIUzLY+Qh0sfRjK1ip2ND0GLy2yJW5TRJcW5q
	 ClB3Fk0u0bLYFbZtBF4kW7IqHH57Fs0xHp8Y4xLiy6oIDbL9HgR9D+ekG7ZznYvbSfGrf
	 XQf4qtmMChSev28j+QFsCUH1A1gjDAiSCGmSwDs/zadJiGNip/xQ76Wj+ZegczIZ6EQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467378;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ShLaGe1p5+gkGgUnMj4N6/Gbqp7RAUog7hkjsCLJl74=;
	b=ur/wR0OUne0r7OhdMRomoA2vcsRSViApfVrqNhKeFB89yPchlM0w0E+NtrVitwUsq32P
	 0uK4JN1ptRRfOX5TcFPtNAZehydP0zvN1JtmiMxW1t19zGO1RScZXbi0YLD+xIFQSRf5I
	 WqkjMoMQ4D64BMQrxSqqmLOr1yiZaOJ6RYKHtcOQldX8F8p9aC7O8W+4//pWCS4NTZEKX
	 TwsW3hqNgPd+ZH7hgwj8+9wjcTxrBSp2DIlpYAhF/o6i8Q5SaHxjIwqKkXQ3napJgxR6l
	 ExA7YJBd2EOeM8iGBQm3kd8MxzPsnHEBOKnl6rDxwBMDgy27rBzMpHjeZa4TXZh6K9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PoyNcrf1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WjCaLaHr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA6D606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:56:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DA6D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PoyNcrf1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WjCaLaHr
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJujF82827710
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:56:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ShLaGe1p5+gkGgUnMj4N6/Gbqp7RAUog7hkjsCLJl74=; b=PoyNcrf1UJTCCSFM
	OZDfLj0txBnlx9abpng0AGg36Y/GVefkTUoiVav6wUTNW1aGZR2rGgxRSibv+J51
	PaPNGSLvIBd/Ot/FVAAsaWDwEwtVcLRKbYQ+TaeMfe8zXXe1OCWia62s3Lv+LgYv
	u4Th0xLmdBysF6TaqA2P2PVadMhQxF+FJlGkkR2GMXx8LZGuTavH/aXTcEhqCjt8
	siGLyrTUDEYziF9SZdg4jmpWP/kk7AnsTs9qAoSMC7C/UgBCEIjCEiE8EIKDuRC7
	dzgah3U/3zNb2lig5lgCWOrKRvEDhy30ffBV5WnV6AHQm4Xv474uRh/zH5xYARrY
	DMY02A==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4exx3mar-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:56:17 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3869accaac2so2012845eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795467377; x=1796072177; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ShLaGe1p5+gkGgUnMj4N6/Gbqp7RAUog7hkjsCLJl74=;
        b=WjCaLaHrx+MIa971TDIrXmWt+lfhOR0F67xIaoDkw+8IN+GjN5wBl+kOJbqTYjZTA1
         Rj2b2t0nrYvkLJ/uteq6lMAd5HcGXFe81GBnv5yT47G2X4BsnuzeUnOhm+QesTkfHt9Q
         6/gpY78x9tcDY4UuGLY5HSVMzn85nhYLwUVwczluCg9bZHv9S06ASTWSKr7zaBCe+ehK
         zjpHk9TZycrxDOdklfhSp23dheLzvTVCcCx/Io0O2gIOmMN8G0hcJwtVphjGu7NbIIra
         yghUny9IvMd2F9kGbM/4gY5wniHI6MoQwZHrSjRCOU+ndivrHS7/umwxj4dEc5Pcn7vP
         IM5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795467377; x=1796072177;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ShLaGe1p5+gkGgUnMj4N6/Gbqp7RAUog7hkjsCLJl74=;
        b=anK4PUUotHTyXkRaKRNhAQTjJ8K0cTOvNHJRvDlMESnB5tviWGYjo982JppCJjx9YX
         PPpKIV5sUDC3qYB5pUIaVOlT9aUg0KzGLtcY5c/ZIeElhZEOWnXxWYD3Lun9Bk2o56j0
         iLgptiAkSrHI5sG8cKRZZVUQSO2U0LSjtLHuvsC6298lt5pBBgaAMRv+nCniL3fBrV6e
         TG7MEZlx5Jl/pDMgV2ieTQ0crboxlaFqMBmaCcbHRmUsBshp2aHylBH8j2MZDf1e9EJm
         E+mIYpON3nB23w4a2Qx5/wF8oyWm2Pa2dc32hcQvb9HnDv8KnXOvlkgFUnMC1waTNLPD
         MAwA==
X-Forwarded-Encrypted: i=1; AL+hErEoudDOvRA5RHDeRIxt3Ug+zVh7YkF7VGQRrmePyNWMxiWOiZFnyZZOH1dPzy6Nrh4lJY3S52I+9qOi/JM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mwkBjRVW1qNbfBSK7IZhAH/Kp40U80Tmd5oZpVkUqjYlRRC6y
	D2i85mxBGJIux777ZVtQDuiJIJt81G6VD3/La9oA+nx1e1HmyTDtWhpRGhz+ZlAGFtA7TuGJImK
	tbDSfXRsAdBWy6hJm2lvpl9401eDFn9avKdqvhYpbsRBoPU5ccW72sGU9/2egCoMnXIc=
X-Gm-Gg: AZFdTZce+lWxGEkjXwqG+RRyw3Tz0qbQrc36k6JQMpGgzb2lDNMkk4hD7Kkf+Bmh/2z
	Yt5Wj5Up5VOMfoz2ahHxhnoMmUbv4zf2z9A4lRoFn4IgZgWdM91p5Q2ggNKHGfR/p+chev18hIA
	bv5NjhyqsmitSO8Qw0G1FFbxQSQwvKVPdZ9n7cOs1pim+BO7iPA4alIpzacxicBAF+ErDqK5hZj
	aFWl/LvBjsJbXvsn3CuwShoM++v5KYwTmCXVxNGTkggnUWW0ilOAzNpzCkYSI5LlZvtXg+c9E/t
	uM0nBLe64Lt7QvSh+fz+cxHFZRq2tUpPbE/x/6ii1uUWzTMh11ZM1QnSZwrHF3GEGC5KJCD2e9/
	uLQQ8S5PFIr0AfBrwcmDgsYTcP+qwA2nBEfz3CyRcsxiHoBhExyp+abhRKt2IJAMG+CVK9/gsZ/
	02AIAAm82x
X-Received: by 2002:a05:7301:4283:b0:386:96fb:28c with SMTP id 5a478bee46e88-38696fb2022mr11275536eec.18.1795467376939;
        Mon, 23 Nov 2026 12:56:16 -0800 (PST)
X-Received: by 2002:a05:7301:4283:b0:386:96fb:28c with SMTP id 5a478bee46e88-38696fb2022mr11275508eec.18.1795467376284;
        Mon, 23 Nov 2026 12:56:16 -0800 (PST)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm44209077eec.26.2026.11.23.12.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:56:16 -0800 (PST)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 02:24:51 +0530
Subject: [PATCH v5 11/12] arm64: dts: qcom: pmih0108: Enable BCL sensor
 node
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
Message-Id: <20261124-qcom-bcl-hwmon-v5-11-747d5383d538@oss.qualcomm.com>
References: <20261124-qcom-bcl-hwmon-v5-0-747d5383d538@oss.qualcomm.com>
In-Reply-To: <20261124-qcom-bcl-hwmon-v5-0-747d5383d538@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, linux-doc@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467299; l=1270;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=47aN023hxv9OOnDCfygfziDOOhs2YVDNkTzqFv8vus8=;
 b=hM3yim468dCAZZp+27L7bqnFCF4BVqSMAsVAklDuWBZmBDI1auh+1HvrljOPuRq2pQrG5Fws4
 nZOhGgmi+RwDP0siclczf/aKCddVq5f5v0VoeRTAGrBt4uZK5IGGnhf
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Authority-Analysis: v=2.4 cv=FKKOVOos c=1 sm=1 tr=0 ts=6b04a871 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=09zRouN1k7u6xsjrD3kA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: oiV1KEsrq7CHuFlvo9lxgycQpU-YCXyp
X-Proofpoint-GUID: oiV1KEsrq7CHuFlvo9lxgycQpU-YCXyp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfXx3E3jMwG+wNF
 UV09etj/puPXWduc2oxg25MrPoWLRq7pYbXre7Vdsu42Wsem+0qEVZ/BLaE7oKSVMeb2p6ckXwa
 S4UWs2uOO0RtZD1pBDwzxzH15tlQTkY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfXyU4gKwYJiUhx
 /zBIIcjqmp7ExMpWnq4TBvTphe8UBM13yCSQIWLJPeT/xSOnYgEVJwB2+DilQj+ZCxwBETu/Ox+
 OEA33o6n9LomqqPIyYsSAFsTWS/BI9+hvEXYx+23Kp3uDfzSRtoZzWE14apjMW638eDhG0tQpRt
 7J9jQ8sMWe86k8GbXYs5t71U9hUiqREoRN59ndU18ewXq6o5YjQ79cgkqgtxTo7zP3MK1h+5aJr
 dtDSSvAe4jcOKDwm4N77S7hE1C85f6hmy02+MYVw1iDHl1XdBxGXK/R9JIpfh/MxzuJhLM49UM0
 fG5btNb0nEzpBwvJFOo/BFjdmTj2UCuo7P8XGlgk70ZfeZYlJxnwA22OFBCpWAWNXoVqocLu5sl
 SHgJm4ZYKLM0w727jLDWcDhDidWHVykFJathQ89vVRag2bCeLXC1oNRzIZEk4c5+B1kEcKWeIry
 fmmbaAo06eztUfBm9tg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230083

Add Battery Current Limiting (BCL) hardware monitor node for pmih0108
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pmih0108.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmih0108.dtsi b/arch/arm64/boot/dts/qcom/pmih0108.dtsi
index 1c875995d881..e8af3e5d583c 100644
--- a/arch/arm64/boot/dts/qcom/pmih0108.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmih0108.dtsi
@@ -49,6 +49,17 @@ pmih0108_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pmih0108-bcl";
+			reg = <0x4700>;
+			interrupts = <0x7 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pmih0108_gpios: gpio@8800 {
 			compatible = "qcom,pmih0108-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

