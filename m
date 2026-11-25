Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795636363;
	b=3+Fa3LNtFSMfsbdG/wPjDfHtCebNBAuz/rGc2g2OsMcZhn8dPX0LDAxU4LyLOUbWIjkY
	 GitRvLFNZogCrRVxGhKjqVjhyv0KrsNJBATqHYKWM9bvgfu+quEWynNHyLIWDltt9lsR1
	 JifBXtmo0sh19r0zUJ98hwePMf7iDkZHpjOXlprCKKTUkFznT3PYXvoiDfpRJLN2DoMW5
	 SwoxceBhyl+vHCSz+yDFIOL10MWU5SAnu2bqO0QocRrWbC2ppweWFUvNxO8jd2vdTUz7K
	 Mhe56hYYnULXyvANau9uETzpH9lbKbE+vECjXYV/uJ/fDxT4a0TEDXlnSdFBBad0jpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795636363;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=N+yTEKtv1a9mW5bSl/QtfRWCYhcI6C9rhqegmsyvKbs=;
	b=XVcof1Qutzpw60azfdjSX57zhgruRdsS/k7a/+HY7M6P829fvJZxbPkSHa8nhIZBzdUZ
	 Q4rprswlkTOm8WO8O0C/Z51fLcFGNNHQ0r+L3OQWGCou+BWM6zi3iOuy81BSkaz3AyQvM
	 GvGGGvwJU22sDdfmx228moIjSjVLVT83GtKC4BTEwRiNnobnjsWrczhOWqyEYhQVcPF6/
	 HZlwmKjkomPXl2xeojxxHBhyCDvI/bfqOSogP5RwKBiH4EmFGjRa02lYlqc5lAXt/ylm+
	 q/3d0ryKLime4sidK+h/f8zudEx8gz1VqaHWjGUmwIuqltxkGqCCEEWU8h5M2PfAL4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XHu1ZAnb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZErE6gHy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1172F606A330
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:52:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1172F606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XHu1ZAnb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZErE6gHy
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APJApgN1357614
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:52:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=N+yTEKtv1a9
	mW5bSl/QtfRWCYhcI6C9rhqegmsyvKbs=; b=XHu1ZAnbmrEJWrA8grrqU8YU+Hl
	ANFhDJVso+pHirUX0Lv+kVvDJrucArnsRoj3jnAdKI/l0TpCJZU2gugn5w1iwElU
	iKNwxTSH5R9uauP2UeDVCN4GajNN559nYDbTIynZb7htPrUE0Tofso93rJcaRVpU
	R1vis4vDH5SzwmoONAgdIJBDBr6PaotxJ9cTrpz/147/etvPtzstOQPNuoFe9r5H
	9VQ+HsMeC6jWOv8D5ZDEBaPLM7gTUXTGy+b5UU3ev8T/lXvBgWET+669ogYhEWgW
	hk/WDe2lS4inZ23gYv2P7nbc6hrrx2TlrhKTb662BxB2/vGfGEEgSSIqCTw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5yaxsts7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:52:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f5844e383so947799985a.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795636361; x=1796241161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N+yTEKtv1a9mW5bSl/QtfRWCYhcI6C9rhqegmsyvKbs=;
        b=ZErE6gHyPmcexilO6LYBBM2sDxoB3MDsQ6L025EJZSaepEIlw2ibMAOXf8+p06q3Dr
         3MEQiBrWbF166rpcj6PTF3HNAgM1DpAJmxg61GDtVvTLZrlakDlC29Y8kM9R3qLQzsc3
         YSOqi/IT9fZuQs1rLMwPFILR3RBjrNVKD8q2JcwnpnTORmYWc3qH/GwfCbj26Sp3lK3t
         h2rgqd9QRTX2w6XQnFgLJiIzNBCv8K8UeH7togiMhKHO4T5+COiBR6nyRxb+3XTn2gvm
         +GdSMPuXBxuWjpcoXnry+eYA6E3hsN4Ego2JGGX4vmhG2RMeuX6y7z3ayQ37ozXmL3dF
         j5Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795636361; x=1796241161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N+yTEKtv1a9mW5bSl/QtfRWCYhcI6C9rhqegmsyvKbs=;
        b=qsvgasHO5dEFZaD4cYv8yc7iMhBNVaDLGgF4B9MfvFPIK8P/QokGhCMW/IdAz9zvz1
         3o7oDg8XNob1LUpVMs92zJ0qgrOdGMkTDRQXkTgVOvblwnQPzE7G4F/kfUuFxJsXXNHI
         te9j7VkndFts5CV9XOawGbTPTQUzD0q/T1N3AFu+lmTZXYca3du0PecwVJO/bFOHhwtP
         T3nCTPBTSdNqXP3riNNa7vIT2cCfzKTLmVcEL2E6YxeuXeCcrevO8FAQmSQPXLLZFKLh
         K9CE9G9OCgSDAxFEE/37E9UxgxiIQT9lIDuHXhLq7qWb1PsSsUI2RU+SY/SOdW8yru9E
         fRbA==
X-Forwarded-Encrypted: i=1; AL+hErELdoBdkN9I50tKN9f5gNM29W8W8+nZ91S5VlYJ8Rnpt7ZntMOdYRQ2I479E13MK+UjVBl2T639B3wvyl0=@vger.kernel.org
X-Gm-Message-State: APuU4Z84RxbtAblv+W4R+No8g+kZCDRsa9zdG/i8IDENupOq9uNypFAC
	PdUhhyWu1N7HRWo7E1g//lMZOKXRwguAWbO9DK6sEUtbBFpAGGvZpsjph0tyAIrITB1+ahI6olN
	5hgWeMK/wW+UYMG4ryh1g2Qrq7gc4AzouEIx4vHsW57YHVdb9FdEV+a80u6fl0NWGBsxWy/yyne
	U=
X-Gm-Gg: AZFdTZc4dozOjVHC/IKQCX+9KgiZqEeo8dqU9tBQpLZZybOFd7aAFGxYxnpy+Kxls3f
	DFrRbzDSBlWD/fIxUGXD1aTPsveRv+SGROdkKZ4wyHN4FR4R1ecoSm/C0sUODK6O0s7stt6uc6B
	cie+0Ck+8t5Xx7D7ZNk5Fj7r9bOCResnmcQXRyq2zqnVx9O5IvpjVXYLNhGMZwpF85Is9lhhLUP
	1eUVyFRSZ4pWU7a4XQkpJ7sRX6lgk1sdNjWAvZuVXaeTQ4G/IGMb2L5L+qmmiu2SjdfgPZWPfW4
	rHpz/5X8tEVGMKaxGs0fviu5aWhu0G6xby6v1I5z+mLCsT2L8VrfZ1JqcvDVFsFPMkMFsK3r5e6
	PTMB726Oem2blxMBTTvnq7pHPkLvUssH7uvntskC0vSzjMFVcHHmcglGd783NnkhD
X-Received: by 2002:a05:620a:688a:b0:94a:10f3:869c with SMTP id af79cd13be357-94a10f3879dmr67455485a.55.1795636361403;
        Wed, 25 Nov 2026 11:52:41 -0800 (PST)
X-Received: by 2002:a05:620a:688a:b0:94a:10f3:869c with SMTP id af79cd13be357-94a10f3879dmr67451685a.55.1795636360999;
        Wed, 25 Nov 2026 11:52:40 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm774316205e9.11.2026.11.25.11.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:52:40 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Griffin Kroah-Hartman <griffin@kroah.com>,
        Luke Macken <luke@phorex.org>, Srinivas Kandagatla <srini@kernel.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 2/3] arm64: dts: qcom: pmk8850: add PWM node
Date: Wed, 25 Nov 2026 19:52:25 +0000
Message-ID: <20261125195226.1563577-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125195226.1563577-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261125195226.1563577-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: 8YWwaUpxbrS2desRFLmRidTS1PsQSwAZ
X-Proofpoint-ORIG-GUID: 8YWwaUpxbrS2desRFLmRidTS1PsQSwAZ
X-Authority-Analysis: v=2.4 cv=ULpIjyfy c=1 sm=1 tr=0 ts=6b073c8a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=mO8_gwkcAAAA:8 a=zgIjqA5jzSmhAMQQ9ZAA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=InTEqNb8lIr1xazlwGwc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA3OSBTYWx0ZWRfX6jnUN976R4hf
 EecxPFeQl0KSGTuet5dWtHpYg/b9z0223k7koz2Ld6hFtmRYRRyQhyqm0hioSYPoCI9/5i1w/++
 +Nyl47X4xBbjkU9KT/3dEFDjQOQRiHB+qtgAzer59T7xiNq6DbTiizdZ4T9R5QUyVtol40ulnBp
 vUo0I7gHh5Ngf3HkGB00HRgrdE2wllwxJwqEt3fctJhDpK+yx2Z2O3h3SVC2BfvviBc+fpxaK6+
 dIMi55+9mxY9Uh8niMV7IVHsDc8bzyOMjMpA1mZNWvMaUQoQZ+/lDNNkqHPxphQMO9FVSZdI7nj
 XYN/UFplAjye6aQcu+X7Zi37kdssph2Z2vDHOjAVVj+ZFnt1RR0F2KAmyfuFPLElZbuZo/t/cSY
 GFjT17ussmZXniToYfwOpPAsVCq41jP7jCHYTd5S7ZwYpseSuT2lVRBsuxZ+RTBI4NXfB7wgtdf
 /Unflo9+m+aW5n+n6Zg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA3OSBTYWx0ZWRfX03R8GAng+O+k
 rQl9yzi7wX1xVuGpf0PmnwQax6rwJdUT/bAY/0QtjVglcoF1IGwY45SFHGyKLswWortcaV6jo9b
 uhkiafIvSUKsfNukGP634lasRVK2QcM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_05,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250079

Describe the LPG/PWM block on the PMK8850 sleep-clock PMIC. Left
disabled at the SoC level; boards enable it and reference the channel
that drives their backlight or LED.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Luke Macken <luke@phorex.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pmk8850.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmk8850.dtsi b/arch/arm64/boot/dts/qcom/pmk8850.dtsi
index c7ba72fd48bc..053ae42ef0fb 100644
--- a/arch/arm64/boot/dts/qcom/pmk8850.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmk8850.dtsi
@@ -66,5 +66,15 @@ reboot_reason: reboot-reason@48 {
 				bits = <1 7>;
 			};
 		};
+
+		pmk8850_pwm: pwm {
+			compatible = "qcom,pmk8850-pwm", "qcom,pmk8550-pwm";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#pwm-cells = <2>;
+
+			status = "disabled";
+		};
 	};
 };
-- 
2.53.0

