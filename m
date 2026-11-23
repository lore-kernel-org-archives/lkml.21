Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463576;
	b=LUApNUFYn8Ykt/Ll5KSNRVGaTe1ofGI2Oj727Gbj3h8/BqKIjOGY/Pajn+acJZ4mDX27
	 6+JY4/nsm7EToLIoo2L2xaDVLIEko2hsHLZSm9ph4ucXBwuGe+xZcIjT1RFKi6rZ+tMIt
	 RqPAgNt8w6NeBJKNnV8dikgiQmyiuYgPP1eYuTclH4EEJGilFEezHX3ektWAOG2o+ID+a
	 Tn1Zq1q+2wJVW8AlxqQZ6KV9RoLfVvlcuWAcsM6N4p/aR0iLRBO8EPHsyAIqUU1NHv3W6
	 JKLoWJdROW7pERkTzgHY2ciYv9+spfFRLqNYQeqDR1RvmiWOL4K+W+sxh0bGUY0Vg/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463576;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=EULmNcd7YytClpSpWnk8JoA40GEVYN80y+V5m7InF7w=;
	b=l6Y32PL4PVzYUyYKeJLNCL8M63ohdkAkdVj7OtlRJDdZGNYgq+2Ofx5lmCUUp0SkABNc
	 Fp+BkQz/s+inV1I0SFBdgFAor0nma0R01oOswLJ7kIAsJwExnARD7KUmnmFoWCB/VuuJ6
	 KHAEVRjvf5SWj4Rf+UnyDN1or7A5GHzgLQ0JSV+wmJFKSKdwm3aN1BZ6jLx+AEyPh1NAT
	 +Zm7EWlbLsuThtuTq2Rl+9/qb3MzCCT9ALiNYZ9dWhrXJ7mM1Qanic8uEF9Bz6LaZAdTA
	 3LSCXHEbs7kgM5TwfyMxJoQHqVUITJ6KoPNNTZBeHYeTaqMcb8QZPUgcz0Hj141UDHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Y0hE/zS8";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a+p2zF5J;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4E4606A327
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:52:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED4E4606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y0hE/zS8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a+p2zF5J
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJ1nTL3211961
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:52:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EULmNcd7YytClpSpWnk8JoA40GEVYN80y+V5m7InF7w=; b=Y0hE/zS81YmcykKG
	Ecx7laIbm0Hzc+GkteZPg8CAdeAGeIjeZGQU48SH2sird9V3JAO/iFfkwoCUTVoJ
	ZVi5+y6FzW5bFIjuu++7tSfyGdhekHYdXAcIG+2YLz3hoiAkU3sxbxbwF4LXshGb
	vNLB5AFID6gDFqP4WY5cUG5OCgZdveos6bv4aXOO6YMNMBQA4PjtBkDs15bGO3BN
	akrCYrB79oU/0eLleq1UD76CjvGxhlmQ16hBlJvyr8Z7CcNVqJrDBGMMo7JXwqH7
	W7rbNxoe6G50pzt5w1fRbLAJ8QtqYe4856foBuEFI9l2iJpcUtqlAbaP03zl5Pcx
	1FV1ZQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4u9nr6w2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:52:54 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-386b8624cf7so1965934eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795463574; x=1796068374; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EULmNcd7YytClpSpWnk8JoA40GEVYN80y+V5m7InF7w=;
        b=a+p2zF5JtQFLdHMI8jOzvdShY4shu+kItzg/zAcqC/LI6swQaqMkUdwPPxgkJURXip
         JevgGuQq9EkEybxmx3eOp1yxtn1hzXV4RPTixwSbRKueWS4BhkPotrxteuz39b3sqbT1
         on1egO5aBvBWjKRhbS+9NNQWd2a0PYH7YBdU1HZbnBqtgFhcEWJZku9wHJpKXpxjAocd
         fy+TaU8Czy7pGr23G3n/RHtzgT333voY86WR9IHilbePBBuV7vu6oWyrTMmNZoYvKeS2
         etZL69TAVtHMOk719w9WoSvNq9WoVkRoTRWwkPRkn/jBs1NBKuw8Y87HNLRf+Gg40A5z
         7OmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463574; x=1796068374;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EULmNcd7YytClpSpWnk8JoA40GEVYN80y+V5m7InF7w=;
        b=I6drOdD7jCBhMPCIZogxncRzgHTe60D3zjTo23Rjwl3X+YsFvOQADg1/diJiDgj9hT
         no8UqomXh1wgd3j0Wtsl3MRIZ7hEn9TixYMuVpVwPIYtGNpb72RK3evzVkUHCoGLgPGa
         gRcc915A/eowvgocC4eryKycLT7OALIMJKR+3ps5lxJVWNfjBy1unOjVPHCWka8Qkyvr
         HJJwz97xF/B+xj6+JhNzaftRpIXbrUg1CsP3mDaRO5PKEgeAjnKrL5W4anSQ/R67pi+B
         UhGojdpugB7uPNdyGhc6B2HUOENcOB5PGByX8ZLeckPTIkb3FJmpINm8uN1bazAKM2N0
         J8Mg==
X-Forwarded-Encrypted: i=1; AL+hErGCWU0iNO3OaYIkN8AgbHydg+4q/gfok4YQS9nFEviD98Iv5LIX0BDUqX4JU4O380r5EnsNvuxdbLQSWnM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hK9SJJ5QTp4UXEkXy+qhTA6chJKnrH3QzAycWqw5rtS1n1ENV
	sJBZMZvdpYHLhfWs2FOnVEbWT3SwqtazWGoWPJYSw9q2c5lPJCb3q+0aqn0o0rLbbWcVHLs+R87
	SmRJEcL6xR2u+oJnzqgXrCWMPDVxZgsk1efPWQX63CjMCpGa62TxOGlvZgyoe1/PYYuQ=
X-Gm-Gg: AZFdTZf8u6PMWpaBW15yo2EEYTL3SjVHjrw14q9q2ev0t7PgEs4L8HMp8K9IZSEn6+9
	HHwcIH4E1VUMj6NPzu/rtnaQsHxRTBwTOUSegjI1D2p9JK3PtPgXQdaPDgYLJ/Ir1WhCb6LXZBo
	PdLIhkXV4hw0dlFQwuo7AN+VHMaCASp6CY2LC8MlvkX+M+mVHwFRMpH7LQql0aK+TLFBSrDHlcv
	QkkNd1cqS5a/EXNU49G8QaO1PaRg/FFJbTb2HUo3TnPXUcdn+WAwka6EteAzro4p4iUcfqo7wAw
	NpKSX7TskJ/TCDtmKHmA7tD+N3LKVL0AAyNIzJPaVh9BAXx80HMqg7ynoz3zNlZzWWVRMmQw2m9
	HrWBJcD8OnoquBNbcmXOlIH4OR5SOD6kpFQ7RoIktj7P7hJgWQ1XkRf+p8ydxjMmhR2OIE881Rw
	==
X-Received: by 2002:a05:693c:41cf:10b0:370:a11f:dcb7 with SMTP id 5a478bee46e88-386b1067b60mr4405167eec.41.1795463574036;
        Mon, 23 Nov 2026 11:52:54 -0800 (PST)
X-Received: by 2002:a05:693c:41cf:10b0:370:a11f:dcb7 with SMTP id 5a478bee46e88-386b1067b60mr4405145eec.41.1795463573559;
        Mon, 23 Nov 2026 11:52:53 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm36363123eec.7.2026.11.23.11.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:52:53 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 01:21:41 +0530
Subject: [PATCH v3 10/10] arm64: dts: qcom: shikra: Add GP M/N clock
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
Message-Id: <20261124-b4-pdm_clk_gp_mnd_v2-v3-10-98db26a87500@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfX+lKDRPX2ukTL
 sqjMOJIy7u+yz3aTc0dPLNl7rmY7p+8Fnyogppkaqo0sRFIwY9zWDWz3XCjVNrC92spAM7G4ycF
 0s74lsmuwH62dK/rw5TM1cKV/erAXJ5JWX59yc8L8PPrRxUg6PmlEUnIh+2BelG+qaNqgSg+ruN
 NT35YLhY1S8HszIohRO85DxEpbDqHy6BCGNmtPoPA8oA3srU2ECgi9HArA+iA7LNYvo9Ms2V0Am
 jQ/GQdGtBjfLInItyNo8PI/9oJLdRwjBQ0g48zhdoElfCVqheqD9erqw86yI4drQ6Jy8BTrlOmI
 qJsOmMYs2I7kmmbMfuBOgUzmWwTjAcxWPvSvha4YHV6elGkTIJVTZGbAIWgEks+Agg3HJ9B5A7W
 hoh823f99womhY9lxJT9d1AHmsmei9MpVKF7JEeE9B+oo41Oe7kdbxaIdE8xaNFiAreMO1UG+RV
 NMaoVHRLP3DyCrilJQA==
X-Proofpoint-GUID: C4U6vy36pIhQn8Hb7xxHR2FOAUnCkvFF
X-Authority-Analysis: v=2.4 cv=f4ndl+yM c=1 sm=1 tr=0 ts=6b049997 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=tsJniCoxF0iYytplHVkA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: C4U6vy36pIhQn8Hb7xxHR2FOAUnCkvFF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfXyI2NlY7J3nOp
 P9DzZcTSIzvzaYOLADxVdwlQm2xK0cKWJjkJSvHy++Y9kzZrhmo//QrqqkPQxC2YWTWs4TqQLia
 cXsw2zbPnOSth+guqce0pOtrmmjMMK0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230079

Add the GP M/N clock controller and its pin configuration for Shikra.
The controller uses the PDM XO4 and AHB clocks from GCC and routes its
output to gpio87. The node is kept disabled by default so boards opt in
explicitly before the output pin is muxed.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 0a95ad5a5582c643f97e2b0725eb88a9f262d83c..a5079b82f22f518fd9e858303292bb7ab874e1b9 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -992,6 +992,13 @@ sdc2_card_det_n: sd-card-det-n-state {
 				drive-strength = <2>;
 				bias-pull-up;
 			};
+
+			gp_mn_active: gp-mn-active-state {
+				pins = "gpio87";
+				function = "gp_mn";
+				drive-strength = <2>;
+				bias-disable;
+			};
 		};
 
 		pmu@c91000 {
@@ -1303,6 +1310,20 @@ sram@4690000 {
 			reg = <0x0 0x04690000 0x0 0x14000>;
 		};
 
+		gp_mn: clock-controller@4713000 {
+			compatible = "qcom,shikra-gp-mnd", "qcom,sc7280-gp-mnd";
+			reg = <0x0 0x04713000 0x0 0x1000>;
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
 		sdhc_1: mmc@4744000 {
 			compatible = "qcom,shikra-sdhci", "qcom,sdhci-msm-v5";
 

-- 
2.34.1

