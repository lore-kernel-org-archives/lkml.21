Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795638112;
	b=mlOthg2tJDK8oY1RcoC5W7SiJ7fBG9nLyhCqVcWVYFHNRJjhLdSEs9MsPB0zXoijjX+P
	 cDEluLeyfJc2AGFPUOwv+GlXnWnLbUNlBAADCI+5zxuSb7FEEruWpAJpaH6HG6GfF79bV
	 HzKv4Y+HJE0cHrHUROBpNQ+adPYWWciBtdE2Yh/tOMaOAC+pnSJqoDJThc+qf5olAJuhL
	 K4WTnANm0tzLCC/8P4OUG9M52PfDKdb3Nfk2cay7yIAP+MhA/iX2QF+wLMQpo7wReI2Sg
	 bWFiigrX4lYUUE+/nnwrr8PUsiCWoaeqfzdTarJiXY1XH4cy7Q/VdBya6INTtwYU5kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638112;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Gqs0+CN3yF+wOfy/6rjdwNO/hSKMqBqFCGEsSFH546E=;
	b=tukM0DdUUBMWn+JgSmTvTzeQciwDEtr+qcDt5K6uDlKSNqEhC5lEFAFEs6UqM6yXabjQ
	 FI7WbdFk4E0RR3G8iReM9otxeuuIvOHJECNNLmAIxlBOBBdawcY0Xf340w4RJI6XUHRQp
	 ajfYXiASn9cXh/r4+D9ugYqx5BlrxsOI/avh7/YR+JSydB2dDFK/qJ+kWZ3Em3h+8wJim
	 B30TswvuC4LPDsCFuDFrMplpem4Uq1jrPGxYHIGqLOk1Oum+dcn8gsoJgdEOkxcZKVg40
	 +svXMVnzXzMGC4OERB9uBS1LGv0IRmLdn7JMGKlCJC1E6DUixIYUyxccL4RZkqQc7Sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b="ThAuWt/q";
	arc=none smtp.remote-ip=209.85.160.49
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75490606A69A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 20:21:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75490606A69A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=ThAuWt/q
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-48e94879f02so2037133fac.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar.com; s=google; t=1795638110; x=1796242910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gqs0+CN3yF+wOfy/6rjdwNO/hSKMqBqFCGEsSFH546E=;
        b=ThAuWt/q3303JtmtGz5/JedklN/MTvEYgYp7PbmfHBsm/uUWPVrFZkzFEE5xCwSVUu
         8p8snvQokctzHJJdaz+nYbjgfQF8Z2EUi4sD5Shs/5PTRJy5X9n6HeJ+4UPE6XVhOIJA
         FysZ6Ik8nASn0+G/AX2uqPZXa9/jxdhvsjEcqhH5IY2XC0TTL6NFPuSFk9w14aJeeA+t
         EaXAQVLwlLiE8NuiAQR4tC8tKaLE6+LRecReFDvWOB2Ggp3NreDim0vpoVNNwMb06llO
         XQgNkfNxmTPLikkLTNsR0RTFnjhnthipY/jMlxpiV8EesX4h/Um8iLcpc3Gswu6yxwuM
         FlCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795638110; x=1796242910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gqs0+CN3yF+wOfy/6rjdwNO/hSKMqBqFCGEsSFH546E=;
        b=Rh6bUjEiYIKvXXZp8GiryvwbVn5zqgdgRWUOKjrWDOLp7IMYbORTmj9UC1nZI0TdBa
         dycACJrbtxnWCAph7UfAMtD1tIbfSeey1ZMj5eFgutYhd8cUnNB4UgXyozZVLZFqFC/F
         OBpaiQbMSBgbSRVkGR3WW6kUpb1ZZTEtr38X/xUC1rFFTkdAIp7D76GsgaS03hwu5qPs
         E2lvJqG4T6dqhCteUb2JLLXHkCLxR57S9E+Oc6yG5BbJI6xYaU0kpZSBEgdGS/kqLFmZ
         x00Cxn/6DOAmZTSrEDoNvAVMUdRbWg1Jrexd+Gtg3qtfdzEtsLJyHqhDHKTWMRPazjUA
         OfoA==
X-Forwarded-Encrypted: i=1; AL+hErFiJLtvXiaEcZfbA0eRAs6RgAgsEaNZStVsw4bo9iP6gK5bYfJzw4ZAX2dDzR1TmaI5ekeRKwMEJpmwWRs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9KD1tFfmztvB4oOwiaXhKZgYcLj4EzR+bPS6OYvpXZiuYVmJgA
	a8qB8gQVLj/v8mZ15pddw9bplLn9Ku/7Pn4v+cU9PEeJJMVmkBLfhhY4F0TkENPhZFs=
X-Gm-Gg: AZFdTZdEyK/rcCDvA+2moD1x1wfBd5bNLLnaRJgDkkg2VVk4HNmIz1MieN+ygKoOe2x
	zki9qHFqTWGdbMOYFbP2hu9OPtNLaF5XQqpC2t3/vwvQBMW0X7rfJ8Wjd6BOeAAPla71Zk/01dL
	5lcukPTA4/AwGS45qquT8++8ZHsYzdJm+t0mKw70QPB6yRB3PxiFtWk2Be3V0ANFI0/l9aKOlmC
	ia8SvrIpBfTGCn3AUk0wmgFBTqw0vmObM42e6Jm/gMPTZgnU1b3Qb75ZRcjJrnJt2wAESd8KnAb
	B2T7/ucCzN4fZXOc3iLCpw4hCi2qa4dk50C28yvRfgLwOnXQieB3KyIxhx0T2CkRLyq3t9rb0kv
	MGnawCdkwjTnbMdBjry5zzi7ZCCd0WrBQ0Dk9QngWkI2o7zgCObUMUmp3n1MuWvgDEDEm9oN9R6
	pAOoe0hK5VcYISgnfDtclRWRCHwqplePdFPman0hCqtHhSTwqr/INGEEmmFY80bAqZIsL8s1fKz
	CjUW6RjXc+bATOHe+cCxy76yNYzV1m1yAH/0wo5g2EKiqpSH5gEyU9xnte6HTPNjQYLMs1QgO3a
	bMGERSMt/G2QFcuIjL2GLDK3YhO7Q+KqTPDAdNi6ttSxtQ5fY1Z7jIrELA==
X-Received: by 2002:a05:6871:e3f0:b0:4a7:df5e:d6ee with SMTP id 586e51a60fabf-4bd07c9aa0fmr14107050fac.45.1795638110360;
        Wed, 25 Nov 2026 12:21:50 -0800 (PST)
Received: from zippy.localdomain ([76.156.233.211])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5edc52aasm18900550fac.4.2026.11.25.12.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 12:21:50 -0800 (PST)
From: Alex Elder <elder@riscstar.com>
To: sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	andersson@kernel.org,
	konradybcio@kernel.org,
	abelvesa@kernel.org
Cc: daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	fabrice.gasnier@foss.st.com,
	alexandre.torgue@foss.st.com,
	marex@nabladev.com,
	changhuang.liang@starfivetech.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] arm64: dts: qcom: qcs6490-rb3gen2: add TC9564 clock node
Date: Wed, 25 Nov 2026 14:21:41 -0600
Message-ID: <20261125202141.1288493-4-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125202141.1288493-1-elder@riscstar.com>
References: <20261125202141.1288493-1-elder@riscstar.com>
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

Add a node for the clock and reset controller found within the
Toshiba TC9564 SoC.  Also add a node representing the fixed
rate 25 MHz crystal that supplies the chip.

Co-developed-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
v3: - This patch was previously not included in the series

 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 682bcbc0b466b..b327f64885ef2 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -890,6 +890,13 @@ pcie@0,0 {
 		pinctrl-0 = <&tc9563_resx_n>;
 		pinctrl-names = "default";
 
+		tc9564_xo_board: clock-25000000 {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <25000000>;
+			clock-output-names = "tc9564_xo_board";
+		};
+
 		pcie1_switch0_dsp1: pcie@1,0 {
 			reg = <0x20800 0x0 0x0 0x0 0x0>;
 			#address-cells = <3>;
@@ -969,6 +976,14 @@ pci-ep-bus@4 {
 					#size-cells = <1>;
 					/* Map 0x0-0x1fffff to BAR 4 */
 					ranges = <0x0  0x4 0x0 0x0  0x200000>;
+
+					clock-controller@1004 {
+						compatible = "toshiba,tc9564-clock";
+						reg = <0x1004 0x10>;
+						clocks = <&tc9564_xo_board>;
+						#clock-cells = <1>;
+						#reset-cells = <1>;
+					};
 				};
 			};
 
-- 
2.53.0

