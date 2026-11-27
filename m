Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789741;
	b=Cvm4W/LPEgXd2Nn1WyIteR/9JzB9Mv/d1CG9rpljXydPOjDhf3Kt3KRGYKIZiUpqZYu5
	 mQuhXdjYla3lgSiL/lF5Y7VaWokoNgfFzoni6OwK8z1cGHZyLYWelnYU1DXjTezD97eo+
	 Vnn1tarOq0polRS0vKQY83l2b9cnWmEXy59oHwp2L2ln0kw0xzzv3qSWxyPsT8PQvEC35
	 Rbul9MCOWVHbtQNh4JUHMovuyeQthQJpydlaxXGEuI+bB3992a8qG89W4YO98gv65owu+
	 iKXU/G8TRCBx36F0h/Uahe7ljcnRa1OcARumc1AfyQRpvNxSC8xbQqSpC1h2ztRFA0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789741;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=YfdJK8DklmuldJ6da0BpfSV93ceFX6oC4GgDqZr+sFs=;
	b=zIp8fplWflHrJ+8XsATqaih4r9s5rr86aP+cMeLCKHxAjjDOYY2XSktXsl4HUDfH+ckm
	 X5hmaU94KIa7D4D288xLNQF+ykCZMbPtcIbbDjC9wnFySGENFHBSRdR0Ua32X+m596JvB
	 VDY7GOLPpfrZO2cVOcybJ6wMi7Hv6m2CcvtrL0CcJtZzP/RlaWIvKvdZoMGnzsKKNgdn/
	 /jBxDi1BDOZIlEfe07z8pRAmX6RBQB2WNAbEN4YZcTUzkd5YhbYmzx8I0Nmte4hAq4lVe
	 TcuG9xHCeIZhpdHgGfAWUh5R0ZdSUfNHgUVCGaGUDoxvQK06ESGPRJMLcHT61SWxftA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ME+Apf+1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eipCavVS;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360C5606A697
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:29:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 360C5606A697
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ME+Apf+1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eipCavVS
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE1Z0K1791206
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:29:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YfdJK8DklmuldJ6da0BpfSV93ceFX6oC4GgDqZr+sFs=; b=ME+Apf+1iDseekYi
	S2ctqAoafiXutknT0XGP7uQmd1KlUZVJ1rmuaJVQQPrwJthmQXyr/EAx3HHFD/2U
	FEak7mcGkXfnh8yVGkZyctvmkx8vFfT1g/ccFjKF/7FpF5m/ifKVTuLvohDOtEa2
	rmqHnpiPSxVpo5cs4mQYnZyORBlnJbVgEHv1kgou6HIeEQqzTA0A0JkprCr9Xy66
	ikHMAsBIVDN380V7gjCevd0PrF98TsEYKEQzRq6hLgWygPxLghc8nWp4KH56XSNY
	frId/WNzJZAE1tNTqZLw6pD9/dVH+xBVR/tr01BOlHwsNIZq72syGSY5d14OPJaX
	9vOKOw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ru3axc9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:29:00 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2f08196b148so53850495ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 06:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795789740; x=1796394540; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YfdJK8DklmuldJ6da0BpfSV93ceFX6oC4GgDqZr+sFs=;
        b=eipCavVSrsKYBkfcMqs+A9U+iIuzWs2IIFM3HRFBuCqxuXvjWa9mlwg3xZk5aXpJ0D
         +x7ObHcboeBW41DAaJQ+3DJRgQ1ov1aSGPzbJ01Z549QzPm+DrIerOY9rgV7V0hvf0hh
         SZUyg83q2ODX74F5tiVpaZoswrLB6zZn8qyeP1U4PPSHBvzcCDhL8BCjdO7TX10kzyN+
         P4XfVceKNm2j6UZmW7rgZC4WxLZC8n/vwfVFt6BzRqMB+8T3O2Kt4atwPTUbijecKIhV
         xHUceoY1CnM44BZK10SwiAuj+7NeYfdbfPczVH5mdjvJGH8cQHdroF8cZzeuT7KlcLuJ
         RIRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795789740; x=1796394540;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YfdJK8DklmuldJ6da0BpfSV93ceFX6oC4GgDqZr+sFs=;
        b=RrS6GAA7oCsVEPPstpn1LNVCqX1nbuuOU7Dg/X93xEVxCHx7v73zJ7cqEVFGT96DZv
         K/wv0VSYPG7Y7raHtPWoyTz9rsifYrAYljz5iKTqFSZowbOM9TfYRG+tZo0ltqAIPXB5
         uSvSgIdmtAw4Nh+VAQ+FPYaBD4zGcn+OIv5UWug/gaLAWnmFRFS3XWP8f1PXW79DXzpT
         S69Z17hokOPUwIzFGG5u+Hfqelip8XxEEGlllyGyRhhUR7iKMj+Vvcw1YLVSk5Mp+7gi
         9RsyHK8VVsrsTpNUFGewHJpbZAIBgUtm4MpXNKHvwakCuRFGyiBGJtZXO0slbip8WZ2q
         x9ag==
X-Forwarded-Encrypted: i=1; AL+hErFOZr6sEJ94beDleERtCUJcLBu29pobhWwDKtBov9LHyVrjtkhmOcyVqh/qfkG0wTGBm81KOJD4oNI5d10=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9ukP8IjaiAUx/OX7O0DLxHRasSjKgEg0uRbSJtzsAjb4EBOYZ
	Cl7Vj00DkNhB8neULzTfLxNiVK3NVH1UFA9tanmAA0TP8LMtAk5/Xvpt33GM3oi73IKINwigPzb
	iqDk/1qe4Efal3y1+6javhWsg54J+kSLW+QIr6tuyo2N3cx/6akbPcyhaDaCsWMzlU+g=
X-Gm-Gg: AZFdTZcPrMknyLUX277BoOgG2jPlsejxveRNg+NoYmxcA5njzk0cBTjBEHmc+80ZrdO
	xX92KaQimCswOUuveLVf1cIEzr4VCRC0vd0fan/71U3Q/QCSJQm8obkyt+3znptEONn3wWrC0ON
	m68eRSdLEDyHG317QhKd0cul/sWiu8DQDCSjrK6XY8IvDTPx1fevA7MLEbIaLTZ2JpMzo0h9ZL1
	mD86e5LkPpkDfO9M04UqNo3IkXvRojE/8QAfQJNafRJb3/SIouIQJ+/YtEkSL5mBKnjRuuIasNh
	AKtUo+DF/8giDF7HQpaMmgcnsxMglUE1163DxjDZQIsXG9go2CtMoxCszUCGRIewUbG3f09XWi9
	YGutOj+9GMtJ1sqV9RnjD153UF/nyAing6sujPoPXzdGi/Vwp8wME0niQbOWHSTZelXVd/2nOyX
	odDbpD6cOGZQ==
X-Received: by 2002:a17:902:dac6:b0:2e2:dfe4:adab with SMTP id d9443c01a7336-2f03f17d22bmr242099765ad.10.1795789739777;
        Fri, 27 Nov 2026 06:28:59 -0800 (PST)
X-Received: by 2002:a17:902:dac6:b0:2e2:dfe4:adab with SMTP id d9443c01a7336-2f03f17d22bmr242099025ad.10.1795789739086;
        Fri, 27 Nov 2026 06:28:59 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84285sm120324055ad.3.2026.11.27.06.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 06:28:58 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 19:57:03 +0530
Subject: [PATCH v28 10/10] arm64: dts: qcom: Add psci reboot-modes for
 talos boards
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
Message-Id: <20261127-arm-psci-system_reset2-vendor-reboots-v28-10-da05a33b08d8@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Song Xue <quic_songxue@quicinc.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795789617; l=1615;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=ph2cyJOL6BXy/8+AP/FfiYNzz31fptD13LLAgSe1knk=;
 b=qrajNkTQVVFubVOWFdztpP2X8o7fcbr5Vd3UeRaqzrLhe8BmaG+Qreuv+VZAsHl0Dz+TAF7tr
 9rg+2IbNBJ5CVgDghP8uA/pFRF3CHYIwUs+QDhWRnh8bgx0XzIsnGCZ
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Authority-Analysis: v=2.4 cv=cOF1IVeN c=1 sm=1 tr=0 ts=6b0993ac cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=bjH5yOvFM8yfI_BY5k4A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: L9YPZMGSglzR7ByTi5xui_vVE8AqTqV4
X-Proofpoint-ORIG-GUID: L9YPZMGSglzR7ByTi5xui_vVE8AqTqV4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfX/rn/saia3ahi
 GMKlPoZK0uwY4IHmL1S1xCNA+9VfA5ClDme33bvCUgnm8GGBBTdOiUoSc3UvcWTsB0Rym1+J6kB
 0M0ROPdYY4vti0810IKNu5vf68gF4xvzurqMgps/DRDqvmtpN9Er80wiKJwB/Fp0agdyLq6P9P6
 M571Kh7Hfxzjh27JJZBzI8teqbBvJwjWAJORfTx47CwGjFtOFyskWWr7zq6kZWIrYX9hSGh5FOw
 GoK5RN1ZTr6HEquwze0/ki4tHw+XahT/o9B+ulQN9ltfoCz/IcQDHGP6TePPEYLuAgTwQd76K1H
 O29Ii5DnfkR/dS2q1WUQ1l9j3oh5clb5WPH8TJ0Z6Plv5OpPG9Jg0uYCjSKzm6DdYPXR2TgXzp4
 FbB/zh1HImAXIYXg1aZ2e3JgyXjM9tUWSZGYYjrOj9Al1IRzqODFBviuPe9HKu0Xn6fpDOOQZTw
 5xZNjGU+RoQmxe+9Qww==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfXyLBxaOxdjXwX
 ZfFK8lKlOl4Xswt2kvM5HxE8dcW7EWBu3ZniS1G5cr/FT7I5CloaIV92X/dx/+fD+z+WbGhGUQc
 evyACzsGjd27vwLKmWDWlqklrJQHago=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270057

Add PSCI SYSTEM_RESET2 reboot-modes for qcs615-ride, for use by the
psci-reboot-mode driver.

The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via the
  Firehose protocol.

  Support for these modes is firmware dependent.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Song Xue <quic_songxue@quicinc.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 7 +++++++
 arch/arm64/boot/dts/qcom/talos.dtsi      | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 142dafb04324b..30e4cb642473d 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -497,6 +497,13 @@ &pon_resin {
 	status = "okay";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qspi {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 1d74e459f892e..937e1d557d41a 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -582,7 +582,7 @@ pmu-a76 {
 		interrupts = <GIC_PPI 5 IRQ_TYPE_LEVEL_HIGH &ppi_cluster1>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.34.1

