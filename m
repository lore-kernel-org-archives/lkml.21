Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463541;
	b=cx6A/yVAKjlR5K8rFwI2VRoSxlkPpnBVPLXFw/CErDsu1jZLhAkkaaK1hrtfcNZxfFT7
	 9Dpy3/63DY9KaYcUc8pqVZmHcZTHG0LLtw05T8FafdqnCgAZ3OxLVHWi5tykz2xpYv7ne
	 m2mnpDrZs9RszYdy1fnWc8XUvvmdTssYwDYynGV849FbCL7/dyJk1paTKRyI71F8Iew5D
	 Ryw9J8MRjanYz3Bf4DXdnA/tzaY07NbRIUcphDf2ykh4ukKxX4L4aNKRALaQcVPozTT17
	 Eti8l+iXwrglxeWBpfCnsY2NsDIfxNIae/OoZFXQDIODtWn+kqu3+V0olqclU4P3s6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463541;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=wr8hKyb3fdhZFuS3Pwvmq7kRMuNlTVJBZoS/JMsjzZQ=;
	b=gC7rh5/Bzsxw5uPTbccsKbOXMoerXDMPYXU9kYvRw1FBK1pwiXTGKEccSYrpH124hmRD
	 TCaAvQpeOBZLv9q4LLFjrl8ToLTA47R7XaJGuA2LuwfI+1GpDTjt4TGtg3LQUV4NqomgP
	 tFj63+QsUOxy1zRpXL6wnqfFOTAMa4QOOQznFIbvpzauGTvVwFAJQ5+ZprmYPhKVJyI9y
	 ox9X1rIZ17mrS3XiXkDMPD9NqMLCR4BnJJWGO00XwJnurL9zTuIzcFbc4HKSt2OJajeUm
	 ClyRixQaxNeJoW3ZtnbhEvjmNFyLZAKjXm+bIXP1DwbgtZb85mawGIusVjkAQ0ikdtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f7AoG1YI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E0F8Ximt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC93606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:52:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CC93606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f7AoG1YI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E0F8Ximt
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGmJH1861196
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:52:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wr8hKyb3fdhZFuS3Pwvmq7kRMuNlTVJBZoS/JMsjzZQ=; b=f7AoG1YIeupin4O0
	R/5CTQYuKQ8tR1BMuBoq7/tIJlaIR/Tljnz2Ey+Ib9gZcHMBDuUvA+8RF0+4Bn+j
	918ou4ynvY29Vl7SKWmRf2C9kabDXVUi7IB5+YPqRCocHF28v661troUrrKVKcYw
	OM6ak215ha4X57QVVhx/Mrbj5YWMgZd4vknRsp7EvCQ/1/L40SCuhRe3LDX2u9fG
	lcpIyqP+bWyZ5N5TTg01xFRfJ39IhkswoUf1QjiBAC+YwHV+ya1I7XWCfo30+9gK
	vtLBY7AjY++cB4CuL4KnE0z7QbIZmvBl2TT8nAxMfAyyxSzGE9usEh40EvwWijld
	leFTDw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g9a35kx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:52:20 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b56c696405so1734043c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795463540; x=1796068340; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wr8hKyb3fdhZFuS3Pwvmq7kRMuNlTVJBZoS/JMsjzZQ=;
        b=E0F8XimtQzAv9D3Fqolp9gXkSX6L4IR3KSy5PXbNAql+WR+fLoDgzmO7gIM4Accl0f
         NwQ5oI3+n8CSHJfxZAy9n4TkQJUjTSJsFUu5t3++PpJ1IzzVV8TgIvigSsfK756HmO8X
         BmKBlewuO1ryWTeQrYIDq7doAajbvDNvCG6/CNi9beQ8zUHtPxp6RqSFwbmXpYEs825p
         dYfzfMp9Ru1PpgLfXOVH/HkwqcepKz4vBs/BtP730mo517ikb47zjec+LrfEFCOSi9BH
         O66F/6sZlkzQT6fa6yrjuDdsA5DTutpVqt6vIoMa0j2T8liTS/r/vJEDD+6d79VgNEAu
         8T4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463540; x=1796068340;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wr8hKyb3fdhZFuS3Pwvmq7kRMuNlTVJBZoS/JMsjzZQ=;
        b=NdI3EJofYb1TcfQDpGZcjDpeJgDSFt4c7G9LV2eIMKybzfe5jVxTaS8AFo4R3crfgA
         beGJcw7520mYH1i4F04cqTTI9JB+NChL4g59vnf87vTr/r870rv6r4I9a++XlOBnJE/M
         N71cpHKv/EXHifT5DD18i5wDGpZDLoS6tRivyhv63AHEqKNtWWkMemk8bS8O2SNi3DXP
         VuKXGvE3r3P/hWJkM85QLbSiqecPXY3qTSiKZNE7N/caeUlePEbM0YGimg+TZzazM3sh
         JMej7bxKxqeeDwll1q11uufZDaTVUSlfd4vnJYgGb3UPX2qEq3BLot6QR8hx+6CaU1tr
         SFLg==
X-Forwarded-Encrypted: i=1; AL+hErFMlG36S1uHXw+jwxlXxjOMhwmkkDRzUBUmmWEqjDryxNE3hBQHTREuEz/0ohNlmQbqGVM84hFhjC/gM2E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZSPHGYb0tTI/enkKWE7Al2MbpeJLQ86Ti4JELb6qVHUEDkX4H
	hktqB7ZMiX/+K3ZXvT4dh9pOuqsrDuWDw6TVJS+V9qFtBxzPbY7hnLIcUm+8bCbopoFDVWqymSW
	BZPERZ2My2G6nb6nK+Sd2V+7yUmlgktHSrXfnfX2UBfeIYXm5wJyUGmoIsM8BQ53zwZg=
X-Gm-Gg: AZFdTZeUHFdab7o4ZUtIqfPyHUPsZHDTwuihDdVsjysba7HnuMDA2nBvlfZGxIrupjK
	BhCDF/aYmjE6U87ywG62Xzrg2jH5GgiahIcYvToL33S0HSEUCjk83OQm4gR3G9O5GbXZ9JmnXKN
	iwqUqBOkAUFDBTKfTmcCVuIn1iaLuXrDPHf7k7EeFn5E/msnrTevSbpdFnAt0654Lb/1sFEb/4B
	iRmiYQbx4h1y/ONfXgcymE6BbU/V3T+f0cjAaUCPZLY1jCBFo/Hxq7NBgI/5CuUZIOMVxifRzdY
	F+UmOp4XJOW8Cb+VL5iclRhpB/DDU39t3rxo4D4PZxq+RNpf/ulX3uKnVFQJyM34urJdw+KNBrP
	c1EyH4xQSQJGUi4ddSHFcWkvrdzbzFAMo5Bex/taB3sogipKhFd+lMrTAv0j07dHbp/pt5A7gVg
	==
X-Received: by 2002:a05:7022:3f0d:b0:1b5:3aca:8116 with SMTP id a92af1059eb24-1b55690bcfemr12298656c88.33.1795463540093;
        Mon, 23 Nov 2026 11:52:20 -0800 (PST)
X-Received: by 2002:a05:7022:3f0d:b0:1b5:3aca:8116 with SMTP id a92af1059eb24-1b55690bcfemr12298630c88.33.1795463539518;
        Mon, 23 Nov 2026 11:52:19 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm36363123eec.7.2026.11.23.11.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:52:19 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 01:21:36 +0530
Subject: [PATCH v3 05/10] arm64: dts: qcom: qcs8300: Add GP M/N clock
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
Message-Id: <20261124-b4-pdm_clk_gp_mnd_v2-v3-5-98db26a87500@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfX5iD/c8tFSmn+
 HgY+opMrhHhthVOHesZu5PFKqZ0IbCajZRvI79pXxGY/yYOugajdjMGmHHU3cIdyuMFY81mu3fC
 ZWfK4iI4PV7bIgmRRX7oLRfOIjAoWAo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfX0SlNpk7q938m
 OIXgMr1DmrMbIu8JLrbmH34UIsO7dI3awP0gDJoLLRCXxyRSnqolnG1Pp3vWV4k7WOdw7XInQop
 OB1Jii1HVaBx7luSGwQvghMF2P6aLG7YN0o+3G7tpUdgf45ponYxYu9k1QUhPXjNppsg6gcCHJe
 faqodwSZH0OsD0ZOXFQrkK4D1hZaRlq1UGI1UjSQoCyMJXWaMpbWGMJHtjcVd8IUxQB3GdsnYT2
 LcZMU6R/YYx6t8y3CryqdY41rJt4f0Rhi31iXzjUk1GGXE6Wa5bMzqUh83n6M6z2po+1mR8UNz1
 +8bWtPT+y0qbZTDoP0fO60a7EWhCBrSFt+QRqpbb2CHTHYJKCNRqyJIQ82BM/dBT+HXjhMxP0CJ
 eaBemAPN+t/IsQCKoD5rvaPIM+2WlfC47qgYMu1y3OKMNMYMz1YcIP4FONp2KoPxCZbsvoVUuP6
 wegJIqzd2wlFYbf/cFQ==
X-Proofpoint-ORIG-GUID: j2aw3uQQX5y59fmxzw3Nk5-xv1XB5RGm
X-Authority-Analysis: v=2.4 cv=cYJHPXDM c=1 sm=1 tr=0 ts=6b049974 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=sMxVnY04UXhLatCab78A:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: j2aw3uQQX5y59fmxzw3Nk5-xv1XB5RGm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230079

Add the GP M/N clock controller and its pin configuration for QCS8300.
The controller uses the PDM XO4 and AHB clocks from GCC and routes its
output to gpio32.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 3541313a79bf47fe27499f6dc370cb778d780a08..3508869ed92b439b35182e94a5b9a24078efbf70 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -4892,6 +4892,20 @@ sdhc_ice: crypto@87c8000 {
 			power-domains = <&rpmhpd RPMHPD_CX>;
 		};
 
+		gp_mn: clock-controller@88d3000 {
+			compatible = "qcom,qcs8300-gp-mnd", "qcom,sc7280-gp-mnd";
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
 		usb_1_hsphy: phy@8904000 {
 			compatible = "qcom,qcs8300-usb-hs-phy",
 				     "qcom,usb-snps-hs-7nm-phy";
@@ -6458,6 +6472,13 @@ dp_hot_plug_det: dp-hot-plug-det-state {
 				bias-disable;
 			};
 
+			gp_mn_active: gp-mn-active-state {
+				pins = "gpio32";
+				function = "gp_mn";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			hs0_mi2s_active: hs0-mi2s-active-state {
 				pins = "gpio106", "gpio107", "gpio108", "gpio109";
 				function = "hs0_mi2s";

-- 
2.34.1

