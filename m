Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794982037;
	b=JkYJ01f6AyjK4ykZSgVW1YtWSYA3EPu/52dMhdRe2ZihsioD3LwH/rNn3EEd6By3h22n
	 zoYjRZKzvccZt2KdVhxNd28GVQT8lk2b2vwJgxxW2dMQjXZMbhIhcKRrIl9MVHHXiqFHn
	 KvZa/21VOaPErHriWc2lv9/j8U6WzRisJ9QXbMz5GU+7LE/KA46GkwprWYGHq0kE7YASm
	 fdOSQgon8j547OXZwcWYZiF5V+CNYhdbu8IJRForq0CCzFtp+3N5cIx7RtsUMSFMuyLfJ
	 w7SUAAjfSFWUQXhXBoAzvXcgHPERSd3j7hPgPFKQtXyx20oZWWcQJAYVF5dNh/LrObQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794982037;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0mbzOvV8B8p4Im7FX8Y/K+FDcdJCH/2lcbh6yiXftsA=;
	b=OvLhjqwWvBfJ9PAPuOrRd5pqAQVYAe7ygm7dlzpso6Dlb5PJ5pZ+ZSgcDsF+qQZdqVbO
	 LMoZh2HP2BvmAEmNRly1eYseBuNRbHYcncsxVMIKnCJfbWjGuE+bjpLn3G0gJL/0981az
	 POkmctz+cbibe03y59F7VJU4ymmJbjULvFhJ4xunnh/O0UOQEWxRKKFbNUlaqoeK7bu26
	 oWlPgD5qnmEvWdpeJRVdHsV6TSGbkXoZsmU2pCvILAdXSos+EINFsanaxWDn7cfwtQeh7
	 WUitrxs7xca/3weaJTp/qlfs97kljHqh5JZJu6x4yA8cegvj+qeyihYDk507iQ3Uy1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fuPoyeeQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NhvOniWD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B937606A334
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:07:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B937606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fuPoyeeQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NhvOniWD
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UunQ1959692
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:07:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0mbzOvV8B8p4Im7FX8Y/K+FDcdJCH/2lcbh6yiXftsA=; b=fuPoyeeQbFUvnxP3
	zI4UEVfhPyfSGZTSzFKnow3blQpAd4xh1qKQHGYFqgQdklOmoXA26w+6dhYLXX5h
	FQ1PXCsn5tfEwU5oFJgJstr3KacQB+CHSiYcGXMZVilROFdFLNdYUZ0O8hB7DY/q
	ktqdIPNmund+AEe0jDucDKqNKzOVDydJQdAN2QhkQeTlXBucnk4SqK0cMXRTbEWp
	uL856XCt4eu5j1j7BXVzzsAfpA4KJc5aLIZTtHJypHHNG3ym/6YoUCP65D9JHLMY
	/oKJgdi1kV8JrW0Mtf++ryag6mXmFzJbbEQWT2dlWzNFTbI+JlKaLB3cJLC3SdNf
	VrsYuw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9hfes-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:07:16 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ae1d132d52so475168a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794982036; x=1795586836; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0mbzOvV8B8p4Im7FX8Y/K+FDcdJCH/2lcbh6yiXftsA=;
        b=NhvOniWDlscFGBWWx2fB5s0MQ9C3MeJdBPX1PaFJb2z5bGmXgzDZ14Ms2TBoMpIbyQ
         M9jVqFHVU5oikTexVaPP54a1TcQFXK4aXwpTuldebiUBY6QMBW5iP2OxREVYo1IImLLc
         RVim02LHUwe58rDCQN8Zm9H2Fz6DBdYYs4NqoW+jJfPPS75mRo0slseo8sLPe4E4bHe4
         FYDWwWs7Jlx28MA8fnHTNgvepnnZkt1NrUdI8k7ZY8buzvpkWPi2KDDDUar5UyKbqUz1
         /RQ6bwCRKSHgETujl11GeJEix0smUVjKVYwW9LR5YBdtORaYj3F/jgGDyqkTb8+BZIpn
         6r9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794982036; x=1795586836;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0mbzOvV8B8p4Im7FX8Y/K+FDcdJCH/2lcbh6yiXftsA=;
        b=J1WqULIDLYbH2Intnly2T0yHMLZllw69cUcVyJp3RlAEQmvsLnoQFj0kl3An32Qv/P
         IiXfI02GzOsK1lCYGOpDAC/dIuK7Lcu9zFNG4AGFX39t98nu1cQZTs6weJv4+bFCmH/J
         ThMN5E5wNAgBYUBWJKwHs1S4wfHlC8Kto8mmzIy72GaLWAFu/O+PglwYW7sT0ST278D+
         DjzS7sy+O9XySiu4pguaK4Hr0O39XrYJMpIbEhXBaqMvm/NZgRWhxBFYhLXAjeu7JQ7v
         ONumvhJDQhX47mqI79kl8m8qfnIlamY2YRPjgVtbI2srAecJBNlfLTcYX/yOj6qVwaqu
         NWUg==
X-Forwarded-Encrypted: i=1; AL+hErEWga0xzB8E0g7QespEwaUg9ilrYVW6DQjn2cswBa0vyKQQ51lJqjFZ9ew37sxLjSnyIfoCEIOlFAAsT1M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JVWN7CjJs2PMaYzBAjWW90hA+ejaLo7QQufCvYkh3EFhMMwvB
	a11qq9A0R6fSUOgPefJM2g2Bn3VlM38Jk6B/qd53i+qUdJrQrWwzmDR8HB8YvI9Ib8u1EVWQQL0
	BKN77j/5CZZ5pLqpYXJS4vq7431Xnb+2aLCJAjvnZflfXjWDjVymZY4Ok13lRcI1pC6o=
X-Gm-Gg: AZFdTZfSJjKsldrX1SEQ/GwAYfJvApV1XXAGpcfYQd5LFj6N1OskOmyxBS8ksLQLrUi
	KAXACCeOKoaW4+zyOX5FF0mtQDp1MklDJOFiXftTI2FXlAT3sVycm2Mfo9iqwuWiiybYDoD9xQl
	ELkXpYYh9s1+xHGxjUVvNWRpF6TMRDGTifd/i7wd728vM+CkhwHpjFl6bBEjcPNdCLtkERQl5Pb
	CCSL3ApXa6WPYyQhO9dI3GXYVLrFGlwPGoJ/plukyt30mf38MKMjN6jcsSbk8pri8lJtomWxyy3
	LKx5U+yxIgkgcleOPgEDG3NAjyJGP2OWCyFkFhbUpcrDXmiXFEdOisb1a8B8EGpVgqWyXENJtCj
	UhhFioQ2pm8VXKFGESJGQA5OBmB4i9+aBRCafX31Pad/naHN0JSjwo0vhDqeezll+Yhp7d3YonB
	m0oO0=
X-Received: by 2002:a17:90b:440b:b0:3b0:9cc6:62c1 with SMTP id 98e67ed59e1d1-3b3d07e36fdmr1805331a91.63.1794982035285;
        Tue, 17 Nov 2026 22:07:15 -0800 (PST)
X-Received: by 2002:a17:90b:440b:b0:3b0:9cc6:62c1 with SMTP id 98e67ed59e1d1-3b3d07e36fdmr1805298a91.63.1794982034815;
        Tue, 17 Nov 2026 22:07:14 -0800 (PST)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abb786ecsm7476382a91.2.2026.11.17.22.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:07:14 -0800 (PST)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:36:19 +0530
Subject: [PATCH v4 2/2] arm64: dts: qcom: shikra: Add CPU idle states
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
Message-Id: <20261118-b4-shikra_lpm_addition-v4-2-46ee87e22576@oss.qualcomm.com>
References: <20261118-b4-shikra_lpm_addition-v4-0-46ee87e22576@oss.qualcomm.com>
In-Reply-To: <20261118-b4-shikra_lpm_addition-v4-0-46ee87e22576@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794982017; l=4971;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=ZnLGNV9oQobHeXgDfZngn36a5StIkhMbOX9ZnhpmU10=;
 b=Q7ulFEGoq6KIayZAONp4rB1P3oEmfSWPFce8+emz1nEuX6MYnJZxquYMrBYLymn8/H4lu7+YG
 mwB0LdYH8t3C9EYK8QtjgND7UJdDtJdtj3NzGx4x5VKK0nIUhreL/bt
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Authority-Analysis: v=2.4 cv=QenzLcbv c=1 sm=1 tr=0 ts=6afd4094 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=oZC7bev9MFt5y4JAElUA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: npnUuOEm7-YUu1MCLLYalhh_vCrTjL5d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX4WF++/vPSi6q
 I8HrUYUs7TMgMzLkITGrKiypOo9b4GlJQ0IZZhF9zY7ano0hHvVlQKrLd5+6SOQgx4RFmcj129q
 DKMmKYjAaO3ne9vsdArnkA1HBLX9/vPtcKzp2ccpx3oBIx1jJMzsMTQRsmejdj4LIpOb2yDiK9U
 tJIm9i1wGrX60WDyy0Q2urZCRkA58j9agbCacCXigxhgUP0zJo26KdFSrGRPhCrXM2ozYD+axYj
 t/IUzxG9ifxExHd3xd9/pxD2uVW+InnWV9t6RC3PdXfhejMOGT762/2ZduybwDRxeqpgH9+HTwp
 PeVk+Dq+3B8wrEm2jOfvjTw2WjL5Pnp2OEMrBKFFG5HmcXJsisMVAJgRQVTYx73J7e3BShtQ+BF
 WSSOaOo+QsTvsFPOzXA9XWkZakjjkPGo8xAmWDfqQ9IpANPZ/M1ylp/D9qJQ49vT08GoNyFZRh2
 psvpxnaZmQEDOmeQAfA==
X-Proofpoint-GUID: npnUuOEm7-YUu1MCLLYalhh_vCrTjL5d
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfXxvF5qyoMTWcZ
 JOwn8bMKExKZQY7Cyv2/Kgc1lT+Cjo+zpirKN9SBg6MYpe53+NSzDyrrbeRg+y/na24Q3ShvCtY
 mKeOH6ga+kGnGQhroGyLWuJUysByoDo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180024

Add idle states for the CPUs as well as the whole cluster. This enables
deeper-than-WFI cpuidle.

Remove #power-domain-cells from MPM device so that the driver follows the
cpu_pm notifications path to handle RPM notification. This avoids other
probe dependencies that arise due to MPM being a power domain provider.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 93 +++++++++++++++++++++++++++++++++++-
 1 file changed, 92 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 4e5bc9e17c8ed8914733ac9fdc9b69128b40216e..74be82ae50d16c7dcc7bc7af4deb28794efd47e8 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -40,6 +40,8 @@ cpu0: cpu@0 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
+			power-domains = <&cpu_pd0>;
+			power-domain-names = "psci";
 			next-level-cache = <&l3>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
@@ -50,6 +52,8 @@ cpu1: cpu@100 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0 0x100>;
 			enable-method = "psci";
+			power-domains = <&cpu_pd1>;
+			power-domain-names = "psci";
 			next-level-cache = <&l3>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
@@ -60,6 +64,8 @@ cpu2: cpu@200 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0 0x200>;
 			enable-method = "psci";
+			power-domains = <&cpu_pd2>;
+			power-domain-names = "psci";
 			next-level-cache = <&l3>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
@@ -70,6 +76,8 @@ cpu3: cpu@300 {
 			compatible = "arm,cortex-a78c";
 			reg = <0x0 0x300>;
 			enable-method = "psci";
+			power-domains = <&cpu_pd3>;
+			power-domain-names = "psci";
 			next-level-cache = <&l2_3>;
 			capacity-dmips-mhz = <1946>;
 			dynamic-power-coefficient = <489>;
@@ -105,6 +113,61 @@ core0 {
 			};
 		};
 
+		idle-states {
+			entry-method = "psci";
+
+			little_cpu_sleep_0: cpu-sleep-0-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "little-power-down";
+				arm,psci-suspend-param = <0x40000003>;
+				entry-latency-us = <549>;
+				exit-latency-us = <901>;
+				min-residency-us = <1774>;
+				local-timer-stop;
+			};
+
+			little_cpu_sleep_1: cpu-sleep-0-1 {
+				compatible = "arm,idle-state";
+				idle-state-name = "little-pll-power-down";
+				arm,psci-suspend-param = <0x40000004>;
+				entry-latency-us = <702>;
+				exit-latency-us = <915>;
+				min-residency-us = <4001>;
+				local-timer-stop;
+			};
+
+			big_cpu_sleep_0: cpu-sleep-1-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "big-power-down";
+				arm,psci-suspend-param = <0x40000003>;
+				entry-latency-us = <523>;
+				exit-latency-us = <1244>;
+				min-residency-us = <2207>;
+				local-timer-stop;
+			};
+
+			big_cpu_sleep_1: cpu-sleep-1-1 {
+				compatible = "arm,idle-state";
+				idle-state-name = "big-pll-power-down";
+				arm,psci-suspend-param = <0x40000004>;
+				entry-latency-us = <526>;
+				exit-latency-us = <1854>;
+				min-residency-us = <5555>;
+				local-timer-stop;
+			};
+		};
+
+		domain_idle_states: domain-idle-states {
+			cluster_sleep_apss_off: cluster-sleep-0 {
+				compatible = "domain-idle-state";
+				idle-state-name = "cluster-power-down";
+				arm,psci-suspend-param = <0x41000044>;
+				entry-latency-us = <2752>;
+				exit-latency-us = <3038>;
+				min-residency-us = <6118>;
+			};
+		};
+
 		l3: l3-cache {
 			compatible = "cache";
 			cache-level = <3>;
@@ -144,6 +207,35 @@ pmu-a78c {
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
+
+		cpu_pd0: power-domain-cpu0 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&little_cpu_sleep_0>, <&little_cpu_sleep_1>;
+		};
+
+		cpu_pd1: power-domain-cpu1 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&little_cpu_sleep_0>, <&little_cpu_sleep_1>;
+		};
+
+		cpu_pd2: power-domain-cpu2 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&little_cpu_sleep_0>, <&little_cpu_sleep_1>;
+		};
+
+		cpu_pd3: power-domain-cpu3 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&big_cpu_sleep_0>, <&big_cpu_sleep_1>;
+		};
+
+		cluster_pd: power-domain-cluster {
+			#power-domain-cells = <0>;
+			domain-idle-states = <&cluster_sleep_apss_off>;
+		};
 	};
 
 	rpm: remoteproc {
@@ -217,7 +309,6 @@ mpm: interrupt-controller {
 			mboxes = <&apcs_glb 1>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			#power-domain-cells = <0>;
 			interrupt-parent = <&intc>;
 			qcom,mpm-pin-count = <96>;
 			qcom,mpm-pin-map = <2 275>,  /* TSENS0 uplow */

-- 
2.34.1

