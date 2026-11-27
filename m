Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789719;
	b=H2QDNYZgNAZ66BFSIg/HOD/UVvm7O7r2kQ/jpemJtNYY2DBahM+0n2RmHK92MP1NCE/3
	 P4A9scvI+U4/ARL+nqjb0Jg6U3I4l7Mc6LR8Cq7PbPBkxol76u0OFFtaYuPPkywFyT/7s
	 0/ifislXz5JEC93DjdDTL/isMInwg7Ocs0614adDgo7t8IiuqRsbwRQJc0EBLxsNznJs0
	 jj6Ihdk8+Y7Qw0Q4MmEYPrUpud6Qt1mcrWk30NfHhW7zw4wrs3uV18Oi+RYGSkztfvf5O
	 AnrQZy5E3l8PDeYFVS8KpeUwCHHWiqva2diMNItptzx6ppGComEiKNDJkq20X7trTvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789719;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=x4DDgHMGUDoGUNMv7s7GvGD/D44GU6T8zX6XEPszIc8=;
	b=tsr2+5us9oqTNj2pNua7kOfi0+me1JBaeL4hDDjOFbRQ0I8otaeiJqMDsRQMnbYl/aAP
	 dXPDQSqhZAQoU2YM2+wLrEVZO1u2wSUBzWVrnUS1ZZrOwG97UIM8t3+WQQIMuiU0URVu7
	 t9IfLgeMWCWyn3sYcp16iG4ZsgYE8m+v+s16iUNSohXaYGJHwXepoRFUZ/OL1TXXwHQNc
	 9N0EkeS64nuRvj3EV0bHFXfiv1eG6V+krydpKZbbvR/A1bKJEhcnncDhp1cGp+2guMwtd
	 Fi0IO32KtK9ApzY5JK5QZ2kL1XvwOnJwl28JrHrpEjBs+yFHx9AHV6RKcixVRY0uXOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lulB0Jm0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fwBu47WJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6537606A686
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:28:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6537606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lulB0Jm0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fwBu47WJ
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE1Rlg2376469
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:28:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x4DDgHMGUDoGUNMv7s7GvGD/D44GU6T8zX6XEPszIc8=; b=lulB0Jm0sBwZApTa
	ocZKVKaV6qr++oOxS1yVEAozW9+QnCdQD23D71LUCQ1l7S1ngXwE/hoq3j4SvpYT
	YCDCz6sRjA00Rlv/qS8ZQiOx7hR3XsRLDnZXi6lnlfYhRyUJfISPlRCjeOY01fOK
	czf+KIT/23+9vdGumgBa6euC4Nj1nH+3z0emeoabTYvJ70mnSe4ZQOlCVv2ptzNO
	FJSiAHlFSG2ufWZPemjmOO31DX35BZ/mlcXaC83FT73qUdYZGyHs9YUod/HmECOR
	Hb4B8gxrYAiU5PNsnd8JDIpVqrQ6VcvLIVLrqekDkp74M8vtZ8ZbnbrVxmaHB5IY
	6avXWA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u4hueqq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:28:38 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2f08196b148so53847975ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 06:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795789717; x=1796394517; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x4DDgHMGUDoGUNMv7s7GvGD/D44GU6T8zX6XEPszIc8=;
        b=fwBu47WJFvUcKBrOrL2s8N4qowkFgCFyH7wfI+qaBgrk5RuJ5YEioVq1sijv5d4+Np
         D0SltEeQJ0XUgt82HIk9ovw7wf00kGUx4rhqSbbO1VnfS+RMjayGQaMhZyamx9VSGXnY
         os3sU2QmL1akDehFF+O9y3enFrvVffG5ghczFCoXW3+dWluk1p+ED7KOaQm1G4K1c/2Q
         LEjUHnnCHAJsHdIlug954ZBcYwtkPXAUiQLdN6NWSmp10md67kINraOVOdVJWW0qNRLc
         rMKKyeAf1Nk08E9CUyPKC6xKidPyeFYO/LQyANkpUjJm9jABbyrPg48GqRHyPhEobs5y
         W8zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795789717; x=1796394517;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x4DDgHMGUDoGUNMv7s7GvGD/D44GU6T8zX6XEPszIc8=;
        b=enc27syF0dQ++Vhy1oBYIT5OBeAjbjTm4r2ya36v3NmVWsba3uuG5PG6de+M3BCOvN
         c+SSfz2+oKjOlpWrEit5Dt1LVN3878Uqt2X//mCIpjB4Xk50EspxP4lNnwPHPVjIzuGp
         bNIwu43VA+co5U7ciX9HzKCwzb8TjAuvrnDKtB/dUkU+Ztbv8z08uO2R7ikWHGCIy5TA
         /h6HtATwBN+N+Wz64nR2Grm/mxm2u7gDBKfRfGNADM4d7gfpno56ntcWevE0Ii7Ss1kV
         lZ5tdaJI4Wv+ir8Zbeuugjchgs+SkNbTnJn9we9q9GEURM/GtVnTC4TTSDvtZpLXRK1R
         3vaw==
X-Forwarded-Encrypted: i=1; AL+hErGLsC18AX36aU195RmxDprfidbT/rAlAZirzpvue8uRKe8pYR+QWcq+QTuugGISztznInsJfVWKxSm2xL8=@vger.kernel.org
X-Gm-Message-State: APuU4Z85PMmO6PpW3i1JXA49ymTx9UPOlFDGmggvD4geUplvzeBu0ld/
	llY+hfLHoFT7y9Yk5iDyCSHcuQOPnoRYvwyplFgV0qinzF5Tr6WKgEm91Vqngy64aCuO5mugpIJ
	pUAqFyWxd1TVEmOCPLC7/QB1dzpr2JNFADXjwrZ+1cGZHEOPDEutHmYpRsCChKUuIJhc=
X-Gm-Gg: AZFdTZdJJGuOkDvItk9UKI6WAMIT++PRsL8I/Rwd6Y/qXE4g103cEE1zvneZF7d/o9G
	zSPABKBbYct/sq2tYI3HrgfOiEPbGntuGl8hlUzbchp4t/hNnmPVOOjTrFa75UMN1p+lcB8icxv
	C4YrolBAjygMV58F0h0E0q1PLSnN/gN3+PB5ZrlGX++fwbZ70LpvHJn10cJvBPkzi5Q5xVJOAP3
	9vtZnfg6n3C36A1/O3gMRr0HbW4P9l8DRGu0E2Zr2lnqR75RLBSAUtKAxMX3+1vYZS9nQ9GLoXV
	C4TsutBC/z4LmBa8/3NrCOfSQq+N80n7RGw4CRNNCTZu6noVoE8iIx72PTNr3Nx7BiNG8DZwps5
	+HF5/3dQZC9HfXfGg/Q8J7oYQgN3Ff+RD4PYFJEATBKKi5VdxVO4+TQAbTq8Pz9/kI1O8cARnmi
	oYteBKdnnVBg==
X-Received: by 2002:a17:902:e845:b0:2e9:5714:6087 with SMTP id d9443c01a7336-2f03ef58f10mr266789935ad.5.1795789717279;
        Fri, 27 Nov 2026 06:28:37 -0800 (PST)
X-Received: by 2002:a17:902:e845:b0:2e9:5714:6087 with SMTP id d9443c01a7336-2f03ef58f10mr266789325ad.5.1795789716664;
        Fri, 27 Nov 2026 06:28:36 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84285sm120324055ad.3.2026.11.27.06.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 06:28:36 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 19:57:01 +0530
Subject: [PATCH v28 08/10] arm64: dts: qcom: Add psci reboot-modes for
 lemans boards
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
Message-Id: <20261127-arm-psci-system_reset2-vendor-reboots-v28-8-da05a33b08d8@oss.qualcomm.com>
References: <20261127-arm-psci-system_reset2-vendor-reboots-v28-0-da05a33b08d8@oss.qualcomm.com>
In-Reply-To: <20261127-arm-psci-system_reset2-vendor-reboots-v28-0-da05a33b08d8@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Andy Yan <andyshrk@163.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795789617; l=2237;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=9Y63x7L/VrfGqCVKiXMQ6AYnOAt/WI1fwM2YMUVkWxE=;
 b=FG4TKnzLBLe9HV5AzTlr7b2MHYUXVG43f5q7Y7s9PtvUaXhNbwL2HMGwz2MozLLgIADtTWyWV
 pMafjfO+iWwDjSO+dR8pRdxRD1N3/ZyzPh0AecuOnr0+xXelclU9osK
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfX2YLhBaBEtM0m
 RAW/bxPQzVC0UMO2MosDZTjYS5FgWI3QEUEa1uFTpkrjmWR3XVkrTqMHvcQz6CVZNa+S0sY/W3/
 UoNnsel9qwB0UnWMBIkipe8Hujs5570=
X-Proofpoint-GUID: Cf6xZVH7F7G0Y9e8-v8bmW3qQloExvbt
X-Proofpoint-ORIG-GUID: Cf6xZVH7F7G0Y9e8-v8bmW3qQloExvbt
X-Authority-Analysis: v=2.4 cv=M9fYuCws c=1 sm=1 tr=0 ts=6b099396 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfX8EzMW+FnMIp5
 J6wDbdPvmZ52sWnhDqwUCjP/QmKIeWtDOdP/IxEQIgSQq63qshNxjs5aNp+KMfzzzHPoZ33scDO
 6YduMffP9OArj1P/d7lX9zW6rhk4/j4cc5JuHaV6Nni7uXlc9MigXQNgjQHYefp2DYxeoknvQVa
 z/VZpAy52/owYHzWfGznl03q25GcK0Pjn5Fs72qM9WeOoyW0RU4KEPdB+DJ63skg7QgPkfwy86Q
 o/kNm9QVXdgyfFpA2+YwnjQUnxWUheVFgGw7s5ne9sHNTe1fjIBTZXoO2moofc1aDhDYAqLOjwc
 trdVctb3fuUMPxNhMy0jBDN3C4o6Hep5ZV2EQA3j/iNtBIRinUxbsgjit7+lP5J5ogT9goG7FOe
 XJE43f3a7wCea33Kkv5QFGpj6d5++UrSnX1p+lEUmoQfU+Z6uwtF/qQGwP09jYfp5iCOzA2uvMU
 +ea8X0rxx1E18ONYFEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270057

Add PSCI SYSTEM_RESET2 reboot-modes for lemans-evk and
lemans-ride-common(sa8775p-ride, sa8775p-ride-r3, qcs9100-ride,
qcs9100-ride-r3) for use by the psci-reboot-mode driver.

The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts          | 7 +++++++
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 7 +++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi             | 2 +-
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 603a3fa18994a..69617c4e43df4 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -912,6 +912,13 @@ usb2_id: usb2-id-state {
 	};
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qup_i2c19_default {
 	drive-strength = <2>;
 	bias-pull-up;
diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index 22f764b8d721d..a530a363a9bf1 100644
--- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
@@ -800,6 +800,13 @@ &pmm8654au_3_gpios {
 			  "GNSS_BOOT_MODE";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index e298747c06bc4..a3f0eb587ba62 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -296,7 +296,7 @@ pmu {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.34.1

