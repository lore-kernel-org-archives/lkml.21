Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789730;
	b=b5Q30ZbDNao5lc60Li2VxJNTqSL1DU2HUrMYlE7JumTTVzst8mTnqnhLxhIY9nV3fU5c
	 YDKMmIOFL1dwl4Cca9kV8gSoWv5aGzG0oeegAPvU0OnU+81JXXwED4fytRo3r0A+WqpBd
	 fIdUmIceokfKVXv8Y62y0+hyaivYabX3Nnb8kGh+wquHpHWOBm+dEze/04PybP8kT0enq
	 fdy1+SsFVflbx4vL+n9V48eT1JaVBp212up2R74JAB9xTzYZr1lJVBpI8D4YjDStSAbGm
	 4/1jVv8a/EH0+9hmKvAg3cw/ErXV+vSn8oc0HpAuyJP4bsf6rHW8jnUg1A5CIOwjTwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789730;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pl61tywIjHKWOijz0wTqXxW3qDD1wHyEe1xZW1YEAMk=;
	b=pZUE9MVGWwL74RxTkCi7F4KYRDQGexvXcKPlYKKIQ9b3atm1FlnDf8t2HmwU6Av9XKz3
	 SNqrOUl/PtkNbq+plJWwF7QE5e7UxSOaqZyxaQ4wRrJ84llBbX/CWDNITfHm7wgPrRGGv
	 tDTp05s91keZLzRyLC7bEYAnUv58eb9frewl5jwqRXkLI8xc1aAG4UR0wS1yb5Lju/ne4
	 b3F/wISxxpwgam3horaJaTW7qhRatkesdVCXfLDvoev1UYlEhc04ihiHts1zo/stll4Uv
	 Sp8ugyQM9DJ/Ky+JmVCs3sSbKlD79ZpIRPGWNzTFK61E5vtgWntS1qVU1nG6RtvCMJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pwnz0Gye;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="QJ0RW/QA";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3746606B43E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:28:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3746606B43E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pwnz0Gye;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QJ0RW/QA
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE1GuQ2683853
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:28:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pl61tywIjHKWOijz0wTqXxW3qDD1wHyEe1xZW1YEAMk=; b=pwnz0Gye62u9Xfkt
	E5sKVFoBG8xOnqk3DfCYPhRQk4zDZV1DF3dkkZIe8XsDV9KN5KF0aWR4F/19lbCH
	6CcvGsxjmtJnfIud2lTeCOiMewyRP/Nkpk2fNtJvzmTkSixI5UiRA7+LJSbLUIUz
	CFaRgCn55Bw+aHhI3zkXpzpg2d7/yueVreOFN++cfEUa9oznrtpHl1HbIUOzf5Qm
	zMLP1OQOFlTc2dKBpq+nrx5shsgOWfYpjyEGcK5SQvFS2PAbZowoK6q5gAJBVMwc
	pyqlr+I7Hsv5P8CalbOB1VsUiRLHiN7lHTLW7B/KSYtZzuE+F80B01spDJiA0M9A
	hgjWXg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73uhj1cs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:28:49 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2f04053e460so68124445ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 06:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795789729; x=1796394529; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pl61tywIjHKWOijz0wTqXxW3qDD1wHyEe1xZW1YEAMk=;
        b=QJ0RW/QA2ebi2ReIYRVS3EVhG3uVw+jox5E1tVKLaSMBWT2vAkdQUv8YT2od1gfqyd
         Eg83S5CKl4sh9rfJJyZMo/5fphZ8HHxtoyMwTLKAgIRM+pZC3F1KehoXUpsDekDa6k13
         Ch2cA18zIjfx7bZ7jA2blDx3Fvqq5YiGGq5adHQYG1PG+Vy0130OmPkBxzDw4rXOD1d4
         h3P1FJHF0TSwHKBfxjDMOxgiZiV0humyA2wVpaCs8bD5dLalC1maw5RdQp2vkAjoCMOd
         oaCCKqWOATCZGthohbuYcbXf+ZL0uu8bBfbtBM/nT/lrtEHZhpktQgfXc2/V5PqY6UXt
         4OoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795789729; x=1796394529;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pl61tywIjHKWOijz0wTqXxW3qDD1wHyEe1xZW1YEAMk=;
        b=XYcrKKvepHxDOxKfSIRXshgUnlpBnHbab1CL4AEa1wjmN0wMyssO+OE/+8oQ1WCzOg
         dw0QNnq1Lu8TUKmanPMogW4wk4tB6bZV0GL8YJBpa3IQVep2RZOzVpk7r5oAnGHRtlg2
         4/pNRIRSusTYZ+N/mCTYNB3UpvzL1V7wAg56BayOEbnPWaIFgabJifvQiNLdwBoOYjKU
         DOjgIqcgcL29Ag4fGA7FZKvFp7Yyq7Yzj16tzji2tmqHsMC7Kz5rHlD4ZuaYTJh34Ql2
         mcBC5IYoUjTUZaTFQby74Sz++vfHZAnkzbDydnTuuUmfaLd2ITgoBBb8MOCJzRhqcRPf
         MFQg==
X-Forwarded-Encrypted: i=1; AL+hErGKgBJhk9HLMyrdwTICnjsuf6L9VewvdLMMNbxOBvKly+lVyg+1gYWdeHvg4GXf9LFIW16zM0GLL5veuh8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fbZxkYJ6GakvWYW8nNrVCzajut8BX8ZBieSly4Dk6tT9aW8Y6
	G/wEcBXG0K6/PTSLjQheNm4x88kh95CKhwi0aXfb5kfxfFcQR2r1i7YT4cEP+PzhS1d6U+BI1nC
	dSvVF/l3YVJE+a9IDLvartqIb5/A51MOBQZkkmU9jYxDVhNOBx7CfVhzQX+xdiAnJiEg=
X-Gm-Gg: AZFdTZc+BQijD3y9GgJOs9Fo9AUdvJneO+usgCZRce1bIc1V2ImzYyexj7dzpar2Dmd
	pqk6BknECE+bGDZSv9pBWwE9kp9wBqzsrTZhGpyN03seb2CIEuFlKfQ2uFEvFm3hrv9975UXfec
	82EvZ/a7E1mneZ/iEtgBe+PaEwzY77v2NXbZ2LF7ya92CvyJ1j7LGI29KHhZTHWFmo2wUt3lODY
	eswgFPL05yd46LZuPj7LNadwW9ii2blKhK0xjtwpbNIfmuVp4snbbOJmqWZt++qxWBwumrE3Waj
	zB3VJUKHIxwqh6jVkf/CBoTuTSf3qYthEkJHdu2++65doP4RHHuGndTqI5e/DVGli8qsrZr8AvA
	Ubb8LXZY8UZyzNn2y0JqJ/yGEqXIm5VMtArW4SgwE58aBFMEVP9N2ZDxz1xXUQtrT0+fZsg9fmz
	F8FnfN3PQFKg==
X-Received: by 2002:a17:902:e80b:b0:2f0:943:118c with SMTP id d9443c01a7336-2f03f18fceamr239299615ad.25.1795789728368;
        Fri, 27 Nov 2026 06:28:48 -0800 (PST)
X-Received: by 2002:a17:902:e80b:b0:2f0:943:118c with SMTP id d9443c01a7336-2f03f18fceamr239298905ad.25.1795789727763;
        Fri, 27 Nov 2026 06:28:47 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84285sm120324055ad.3.2026.11.27.06.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 06:28:47 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 19:57:02 +0530
Subject: [PATCH v28 09/10] arm64: dts: qcom: Add psci reboot-modes for
 monaco boards
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
Message-Id: <20261127-arm-psci-system_reset2-vendor-reboots-v28-9-da05a33b08d8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795789617; l=2135;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=dSQwIim7V7/rULXlCKUdNr3qm3JfQWAAjzv2bwKQVlE=;
 b=H0ydfSAVrKfYH6W8G2CaDvfckptjvnYSi2jHXy/IdrzR/rOdsokmCe/1bwvzr4ps6qctiwHlh
 wGGivLVq7Z7A/KAWiHwqC5PNb7ZkliL5N4SpGRmFS2P/JUe8eq5ff2w
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfXzF1nJqQxAARm
 xdQGCpwvRKY680my3OBQuiiMnGQNos6oz7j8+H4FadkAhb6TFfb8VQmuFAIqgjo18CyRY5YDtP4
 yxJrR8W1x8hZT4g7HWsCft/TkHIawfs=
X-Proofpoint-ORIG-GUID: 7C4gRwil0Oh57dlB3pI-p5YHaEk_KUG8
X-Proofpoint-GUID: 7C4gRwil0Oh57dlB3pI-p5YHaEk_KUG8
X-Authority-Analysis: v=2.4 cv=BbBNQbt2 c=1 sm=1 tr=0 ts=6b0993a1 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfX9qxsN6DGJ5sQ
 huQgDIJx8Ou7D/Zki3+jNVBT8JLVlWwXMV6eSV1VIdW5C5Q0ohi23hr+YnEeV32J53jUE2pjpNr
 hPXiz13wjXX/hP4Mp6LJZ6p2gRnxhI3DT5K7io2MwwgBazlPgzgE5tJkNgP7b0gPirbDk0FklQv
 gLjWFfnsr6WLTjGz2f6rfO27eohbQU1TNRWTEYV3lCJeAwQ5WhcdFEYUoX577sxH/FBlEjRnDDP
 qLj273VhWMiASYlBPPmhHvldTZMDE822KqVjZStDpX/jNN0ZYV1LsnQLJbKzsPT9tpXBIlRp1Rd
 KK9jkabXr6xsSQEy3omy0MHa95wLhNxo9HijimDB79IJ01w5QwBcAE6ln49WHwu2/EitV1ve94r
 HWEnrjPbFPDnTq8rJU887r7NF14N9bd/4gpd9CmShNQrpxPscqUrCFybghXgoZOrhYvt6tqt1oJ
 bFJ7dZwTSyV611XRlcw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270057

Add PSCI SYSTEM_RESET2 reboot-modes for monaco-evk and
qcs8300-ride for use by the psci-reboot-mode driver.

The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-evk.dts   | 7 +++++++
 arch/arm64/boot/dts/qcom/monaco.dtsi      | 2 +-
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 7 +++++++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index 539c9c80a808d..074971d310eaf 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -711,6 +711,13 @@ usb2_id: usb2-id-state {
 	};
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qup_i2c0_data_clk {
 	drive-strength = <2>;
 	bias-pull-up;
diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 3541313a79bf4..efb233458b3ae 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -655,7 +655,7 @@ pmu-a78 {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 
diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index be850a23472fc..abe21242d7104 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -678,6 +678,13 @@ &mdss_dsi0_out {
 	remote-endpoint = <&dsi2dp_bridge_in>;
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };

-- 
2.34.1

