Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795794943;
	b=BvJPT7DH+DOn3rmsy0WYSg26a4RUvfGHm0ef3V0ijQkgGcy+6OtHz7Nb5pHDRoKgWCI9
	 QWGyFmdJ1hye2loB2FNAU756dYtUakNBooSaj2sRVDqHXmxst+RdEp0eGOG0jjFMAHTGL
	 FA+rGqrKlRXKmy32Fy3RThHYevEePZYjdF7knvG08kI/mYxI1cBT836UJUOFNZGECYhZn
	 Ld8j9nEzD1gGNhALB6R/j0IH6POdAHqKKflpfTBc5/AOxLLZPj2agEy7QK7b+YHEfUil6
	 3WrDbi9h1Rie+Rb9eyZcYGPxt1VfGKzpArxsvF7d6TRxJxroPVrfEfVYBp1SpH2Z29A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795794943;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rG4kr1Dab3RBza5xdIKbdkUSrFDK0iKFNsbeuPBvbQc=;
	b=t2ak6AfeHMAhLhkZn9UsSgkeviScrbXUwTSbH9/lGH32VSJnPAblmCqRMSqTDQr5baw3
	 JhZPBryKR+ZqvUfJvtlO33EIB/aJ1YLlHyAOLeWZbq8vccneSzf5Z2TO6EnFUQHpCR17G
	 t/jxsJ4ZqmmV1HtDPQAmDMyw0Yrve+Q2UsZLqKDBXQL3aPvgIdEp3u7nUo4ZKGAy+y/Dy
	 xpkXGsNnfDK8i6TlTnVoFtqI8pN1mqE/FQjjKWOhY18XlCb9mDlMrA+2fYb2Hps+DHki+
	 w4iSSDyA7VdmXNrbZfA1G9MulWkW+XcRKN1wJEOIUj7QmpMoG+UGYokvIV9qDakmL0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VV8XkmTA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LzxJcOoP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A9E606A69B
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:55:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6A9E606A69B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VV8XkmTA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LzxJcOoP
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARFpa1U065894
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:55:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rG4kr1Dab3R
	Bza5xdIKbdkUSrFDK0iKFNsbeuPBvbQc=; b=VV8XkmTA2AIyfOcHypJJ0qWuqQz
	au7QkqKzUvtqdux6pms9+IN5SP92H3BP10OUVJFismpodw7Fp+1FnuU7df5bYIAy
	vzfhL/gejcpDitBFxjDZz1SlWTZiyJ8sEqb3WF7uEWS3HMvGvhwrDFqtEIengowY
	9JsOGz6ywojNwe/aG5NLmt0wdD9IgKXN04Hliv7HqvIO14aUoWLlZp+WvuVSSPQg
	rSdRqZLDI3o4XG5UgHRS7XC6Y5nkNYwtUQ9g0T7d2v6A64Qy52ib2w4ZRVCBf0+B
	3JIYrvYdz2IGplbi4i8gynSjJeDi2wdDQb/IonnQ6KXQ3R1n59+ki6/Uejg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73dhac36-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:55:41 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-921246186bfso155533066d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 07:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795794941; x=1796399741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rG4kr1Dab3RBza5xdIKbdkUSrFDK0iKFNsbeuPBvbQc=;
        b=LzxJcOoPvOWUdsjuT3JSFnVpzRUjcEp4+BcVYqPfOTH6os5LjgHSUgkDnzLk36nFln
         27iyfyyHQWxEhZD0czFiqv9q3AmR1TEHatRp5nQ4/kwO+Hr7CTNcV7k2wRZii7lVNXzi
         qEgEZIKihGA6YiWfu/0rwHGPtU+cYUpgbeZVHVmjMZaWFfpXTyJtCNc0PKbKpKUfpMkg
         7N0krsnS1pN+QTJP7lTnWMTt8AFZw0GA/QU/L1NlkpSsjIjk1b/37ck+ld2om6qZHFuv
         BLupdq/sM+SqKhkC2/7yLN6fJyLOJhgHsDXqdYcTjknsbXpNna3ekkXY19cSgnzpGZr6
         P1eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795794941; x=1796399741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rG4kr1Dab3RBza5xdIKbdkUSrFDK0iKFNsbeuPBvbQc=;
        b=z+O6zT1YNPjmvDcup+QZl5CeHvy421jMjQ7QH3Dom3fxPZ/yB1KQVK30V2/xzKWO2n
         gje/zjgguFcZz0EwpNGgWPE6Wp2IGOFWPBv89BS6An/mqDuA5NHOtuo9e0CTrMycwppy
         Lb52SkWb0sVBc7JJdrzjfTdbwjqrjtwHTe9RUNg/Q+T+p9N4L6xeeb9f5X523bTxk8Eg
         R0cPx+JlHiMuAuOJxXj23Zlk2RLNUd75ZYU5BxhniRNIVkTSZk8ssBYsPu8B6vAy4Zui
         lzR5qQpH18gXDj8XxiDkbxhR52IG5+oa3j6w5CWCvDaqnPyV5ftLx3IVoUhPMk9C+KaZ
         oSDQ==
X-Forwarded-Encrypted: i=1; AL+hErE361RFc0655KsPf5xYxj5VIiOUaUuLguk/+xiDiHH6YGQah5XAdVla8BlGXjklDKU3UV7Q8XSWVHMpu5Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z8uuqlPRPlsE8c1th35QXLmneLyhC42AC02Cq7j/rPuP6T6t2QC
	WwcQ+1IvsAN2NaaMbztaGFY4+SFYtvCgPr5nKa0jdHOgnZd78B5b/smlUmNiiXkrF72u72SBf41
	0x0ku5X4QmrpFtxOjyV2uDQoRzfltAuMKh22l5Fi0wQmVCT2hTTinCk1IL2gl5NbZx0g=
X-Gm-Gg: AZFdTZdMIo0z9q8Hq0sCH49OuKt8MzE5KMrJ2FXeaW7tXZfI13owiM4gU4b2L+ReeYX
	7kYHxSsykbQVOMfQz8RgU8wqJLpKTefShlVoC5oDW/TzKSpGhc6iFZFFA12a4HVAl2zR7QfVkjO
	21vlRBlOht9CtnTzhDUKB4zORATKbK9jvBpJ1R3eS7FLrnYIUqornYNG2NEqcajgFq0cgbCdCTl
	lDxxDi+V3BQXLXFXLzXKykkjtWdWsjwPc3/8rUFkTSAKpMw5Nvkk07MB62AsifrsmK5VfJIWDK6
	LE1BVjvOYPeyFCFXS80ftodjw0CZNqRw9ZeZR/gX71EPB59nPk0ZELqZ0TiHYNsuvdLL7N+Gh5b
	kbTLDyIkROjmh+JQEFek8KQ8XtMKJngBsQpQdAMeW+AfuLiLBeAmHLxtxkRuXKXV4
X-Received: by 2002:a05:620a:44c2:b0:945:dd80:75d7 with SMTP id af79cd13be357-949ba9a5803mr4563576885a.41.1795794941203;
        Fri, 27 Nov 2026 07:55:41 -0800 (PST)
X-Received: by 2002:a05:620a:44c2:b0:945:dd80:75d7 with SMTP id af79cd13be357-949ba9a5803mr4563572085a.41.1795794940729;
        Fri, 27 Nov 2026 07:55:40 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf6804sm47272636f8f.10.2026.11.27.07.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:55:40 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konrad.dybcio@oss.qualcomm.com, abel.vesa@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 5/7] arm64: dts: qcom: glymur-asus-zenbook-a16: enable WCD9378 headset codec
Date: Fri, 27 Nov 2026 15:55:18 +0000
Message-ID: <20261127155520.358909-6-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127155520.358909-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261127155520.358909-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2MyBTYWx0ZWRfXyto/98vWne1J
 PEr8AtSA4Wv94sRhu+390+WZgCR3bg1IU9I4gacqkKlaEPFLNhpnjilBGr6fJ43l5s4SrQwGu8r
 MjipZ5frD1gSbgHThAdCWTXEuSf2x2+IYOZNP0TICm9PgTYY9XlmR0epjWda2r3JcaFstgiu4aH
 8PuUqQr5dgI+HUG2oZCd7l4z7Nx8raZ10i0AmuCOdtJwGafudfk5bX/tmU+nD6LcEFbvsVvkCd1
 fEkp3e1pbK8xGHBcDbPs/3hM8esFohj7ncfvnS5s4kwdnHYdOc9rG9Vcm/FR0M2KO7fHcWD86hs
 E4chX4+2Nk+aggyUQ/PzhGWgSmFTAUKfZY1w1WlHYdqYJjU/+CGuEpLmuZfAuWps+EB8joBnYah
 FT7feR+QEWw3thMh+yV+qA4ieWBxYrRFfEXv1FTDa8kMNLzkJwNn/1CZuPKVbBYvUd3vkno7t8v
 9F6kh1M/dWyzn+Hke/A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2MyBTYWx0ZWRfX8jW5ORaYqnPP
 P/qV30RXLIhsaBM3pRk/7ctUUWWj6UvUkjb/rAly5DlGviVWWiJqhWL3xsT0d/t9B6gUxC6MkAN
 OWOlnY75dROTdF53NJOqhuO5UAX1Nxw=
X-Authority-Analysis: v=2.4 cv=FfiiV5+6 c=1 sm=1 tr=0 ts=6b09a7fd cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=HoGlWSY98BlP11pXvYkA:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: g25j8sWQHPsR8L7vAi-0neIRbyivcjsd
X-Proofpoint-ORIG-GUID: g25j8sWQHPsR8L7vAi-0neIRbyivcjsd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270063

Enable the WCD9378 SDCA-compliant headset codec on SoundWire,
matching the Glymur CRD wiring.  Adds vreg_bob1_e0 as the MICBIAS
rail.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../qcom/glymur-asus-zenbook-a16-ux3607oa.dts | 91 ++++++++++++++++++-
 1 file changed, 90 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
index c253597b5a5a..3922d3eebdf9 100644
--- a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
@@ -272,7 +272,10 @@ sound {
 				"WooferRight IN", "WSA2 WSA_SPK1 OUT",
 				"TweeterRight IN", "WSA2 WSA_SPK2 OUT",
 				"VA DMIC0", "vdd-micb",
-				"VA DMIC1", "vdd-micb";
+				"VA DMIC1", "vdd-micb",
+				"IT 41 Playback", "HPHL_OUT",
+				"IT 41 Playback", "HPHR_OUT",
+				"TX SWR_INPUT1", "OT 36 Capture";
 
 		va-dai-link {
 			link-name = "VA Capture";
@@ -308,6 +311,38 @@ platform {
 				sound-dai = <&q6apm>;
 			};
 		};
+
+		wcd-playback-dai-link {
+			link-name = "WCD Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
+			};
+
+			codec {
+				sound-dai = <&wcd9378c 0>, <&swr2 0>, <&lpass_rxmacro 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		wcd-capture-dai-link {
+			link-name = "WCD Capture";
+
+			cpu {
+				sound-dai = <&q6apmbedai TX_CODEC_DMA_TX_3>;
+			};
+
+			codec {
+				sound-dai = <&wcd9378c 18>, <&swr2 1>, <&lpass_txmacro 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
 	};
 
 	wlan-connector {
@@ -351,6 +386,13 @@ m2_e_uart_ep: endpoint@0 {
 };
 
 &rpmh_vregs_b_e0 {
+	vreg_bob1_e0: bob1 {
+		regulator-name = "vreg_bob1_e0";
+		regulator-min-microvolt = <2200000>;
+		regulator-max-microvolt = <4224000>;
+		regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+	};
+
 	/* Unused */
 	vreg_l2b0: ldo2 {
 		regulator-name = "vreg_l2b0";
@@ -763,6 +805,45 @@ right_tweeter: speaker@0,1 {
 	};
 };
 
+/* WCD9378 multi-master: swr2 primary + swr1 dependent (DATA lanes 2/3). */
+&swr1 {
+	num-lanes = <2>;
+
+	qcom,multi-master-mode = "dependent";
+	qcom,multi-master-peer = <&swr2 0>;
+
+	status = "okay";
+};
+
+&swr2 {
+	num-lanes = <2>;
+
+	qcom,multi-master-mode = "primary";
+	qcom,multi-master-peer = <&swr1 5>;
+
+	status = "okay";
+
+	wcd9378c: codec@0,3 {
+		compatible = "sdw20217011000";
+		reg = <0 3>;
+
+		pinctrl-0 = <&wcd_default>;
+		pinctrl-names = "default";
+
+		reset-gpios = <&tlmm 191 GPIO_ACTIVE_LOW>;
+
+		vdd-buck-supply = <&vreg_l15b0>;
+		vdd-rxtx-supply = <&vreg_l15b0>;
+		vdd-io-supply = <&vreg_l18b0>;
+		vdd-mic-bias-supply = <&vreg_bob1_e0>;
+
+		#sound-dai-cells = <1>;
+
+		qcom,sdca-compliant;
+		qcom,port-mapping = <2 2 3 4 5 6 7 8>;
+	};
+};
+
 &tlmm {
 	gpio-reserved-ranges = <4 4>, /* EC Secure I3C */
 			       <10 2>, /* OOB UART */
@@ -920,6 +1001,14 @@ wake-n-pins {
 			bias-pull-up;
 		};
 	};
+
+	wcd_default: wcd-reset-n-active-state {
+		pins = "gpio191";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+		output-low;
+	};
 };
 
 &uart14 {
-- 
2.53.0

