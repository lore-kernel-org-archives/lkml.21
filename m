Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795643758;
	b=nmzTB+mzmuZaE9KKOf9Auy7TLq9gpnW24PzwaQpNLe0DqDceRZ7/M5UF3skdCe2ZY/7r
	 3Pdxtey7M0qqhSYo2T+nUdZjBXG4015mTbIlL7OVirccvU2WIQJEspjxRskpB6Q0RJqx5
	 Ggz1h0QYDPXTuMB5LEhozduEUMcNBa7vJymj4zfco7Pxptf1qSYM60wt193uEuK6qrEX5
	 +z5JKORIMCPbhV6UErimARlDYeWMvn0vLL04HfaK2YFwnmRe3bLYpSQQBRS3uFEIaCkiM
	 Nw+mJx9f3U2zXaSqYCiQydWRQyuHmbxnFNV/hV4cUI1aHT4CoowPq1KcdeCaVicm2Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795643758;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uAN+qnezUmFhxXGPo6XpLvUj0u7gFP0sdPzMCnlyKSE=;
	b=Pw84ZY7Dj54XzCCAL3jyS2LFVjkjziKCXhlLnK8g+GOFvHlxABXAZf5ecZCwMr8H1W+B
	 48/6e/XL7tvWKzff8Ms3q+Q6docS7J+N8rycodoKTu8m79yOrNPxJMDtie2fFPyIipgsS
	 /eRQhE5SAJsXNftWddKrfSpXdwhd4lVsvm7fDLYyAXosZZSP98Ugab5geRrp/TnmLtw8u
	 urcc0N5Obx99y83kIrnOslnDpqCQXizGsI5KiBfajfbfiViW7sU39rd72PIW/t6P7FGYk
	 EQ3/3F3ck687PoreP32y+ZLY2Q1Hc0B7xc7UEdWwcw5LNAY5C6O/XVV42H8XdRg5ohw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="gXo0hC/n";
	arc=none smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1098D606A6A3
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:55:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1098D606A6A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gXo0hC/n
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b86bbce3d1so8608170a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795643755; x=1796248555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uAN+qnezUmFhxXGPo6XpLvUj0u7gFP0sdPzMCnlyKSE=;
        b=gXo0hC/nffijD3GTgiFu30p6FztE0NaPZrXRVSn1ssm2VPg7P920slYHTUXtguI0No
         5i+BcgE+yT5GypKmCQQFCpAbaggDi3hsLNzZBrTcOL76nYozB8FhrVWIj/+hqvxzo93E
         KYynxwNIPylitInk/wGonjKpwwwx9BOYMeuExwO17P+R54k3196WCj4hpHdRVcrvDaev
         tyqoZvmB3M0VH1vZxvjah0/V/ysq5jLnWS6Z3GUK7uBKuHytklNS6EuK+C4+OZSYb0L0
         N4c6PJGLC149Lun7XUW+wp29maw6rYjdf4jd61rKuSnovs4pd79yuETKfLzgMgEoUoAt
         pWrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795643755; x=1796248555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uAN+qnezUmFhxXGPo6XpLvUj0u7gFP0sdPzMCnlyKSE=;
        b=1wZReK1KkNBeBsOogJQlxQmoi51Uc87op5GBtQ3ryA/d5vMaIKlBW8PH7YZbKyVXli
         KVbyBc5lwro7pF/EWm/BobVDo0DblYQgYO2Y+f2yxqhCyoWFpXYCsjpDKLU1Pxzj+lCr
         +7q+gu306WxYIJXy8B9ZXWs6TRXeJc6NPLMmbQQC760RCwjV6xI8YyJl+OP/SZdQisF/
         3mxSnpgE0tYUGhJAMtljNWbQKmqwJZszjxX/122S0AuACGdym0qiidEsIXb4Bh4sk0rU
         kPH7BojkdIqZxGuMZzZVHu1Fw4wsyOm8I7tdbgCeieCnerHbaJo1lVA2PexbUT0AjwYz
         dzaw==
X-Forwarded-Encrypted: i=1; AL+hErGzifvX0Elifzd8LZp0SHtT39lAhzAIT3fZTvy20ZpjOMxPQXQ2fyZe5V1kmgj46TZOcwZ2LCIasqe2uqM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8MjLB5OamW9I7X2mbV+MCix3NgGOgz8Vq5bIbgLR6vFoQhLWMi
	PlFxlhTYayXxU4bwYBzKYPEokr/F7RR9t2BgPHNOiC82a56yLogVoMY=
X-Gm-Gg: AZFdTZclAUHf8wEWqD7+B8eUwOL3VMhU0riKMGTyjdQgusQ6aNU1lmzNw/RFpssZ1fo
	1O4GKOja6SFvfNmAOKTJjTS9eP/pAm5+bb/ggHqs1eUJUbTVk5zgb1h5l+Od6v5e5Y/YotG9aCp
	SA1TXF/EKAOKL4cZf/Tfm3sIh0o/nX7U58hi/dlmKPEhpZee5JeuG7CnGagBGy/5pUs0me4fwNC
	RtOhYs8PiSDD3hGOkOOFjKavn43O38FUbBDme5EthDlu1ulzf0ndGxOkk1/XO7D5itwnrHhLjNi
	Z/E5Pre7jx/Ip4X1JxcclsRxC+/dBl1VkGdwfe+RpbDWhQ81roYl5XgUacBAr3iVZF8pgXB+Yxz
	hdvdcF1twqodcuRmg5YL7YFLV1BgB0fpVAemmwQRduu1XQnpELteI0MZzCHyLC1K/UqqYxNx39b
	fgm5vq+wPWlvGRpKq3NpTMTzNmG0Z0aJ/BGQQexz/TE8laVnxqP9jwnwsj1adYjni+bDoJFVx+D
	rGuUKxSIGJ1bxnCygoOQIUwCLDqcDrZ65M3E7ARnrXSCxFv/ZM6Bbyn41pHVQP1VYIGBcQKvdi2
	tx90ngwDBc7E9aBxmDHEBolCnOlIhAQkBe/Jd3NPdJblGMmodAKJ0vgP6KBtLar5B8l0dkFRCbi
	GRilDCyUQB23caWsZ3HcMLIV4
X-Received: by 2002:a05:6402:280e:b0:6b7:d55:87d3 with SMTP id 4fb4d7f45d1cf-6ba37ea7696mr12598729a12.36.1795643755329;
        Wed, 25 Nov 2026 13:55:55 -0800 (PST)
Received: from sohrab-omarchy.fritz.box (2a02-a44e-4ae7-1-c0e-6d5a-8ae2-915.fixed6.kpn.net. [2a02:a44e:4ae7:1:c0e:6d5a:8ae2:915])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370e77d8sm8608871a12.14.2026.11.25.13.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 13:55:54 -0800 (PST)
From: Majid Hajiheidari <majidhhdri@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
	Roman Linev <admin@mswin.me>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] arm64: dts: qcom: sm6125: Add CPU idle states
Date: Wed, 25 Nov 2026 22:55:50 +0100
Message-ID: <20261125215550.1834075-3-majidhhdri@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261125215550.1834075-1-majidhhdri@gmail.com>
References: <20261125215550.1834075-1-majidhhdri@gmail.com>
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

Add per-CPU power collapse states. The downstream "trinket" low power
levels use exactly the SM6115 numbers (silver: entry 290 us, exit
376 us, min residency 1182 us; gold: 297/324/1110 us; PSCI CPU mode 3),
so reuse them in platform-coordinated mode.

Cluster (domain) idle states are left for later; their PSCI parameters
still need to be checked against the downstream levels.

Tested on a Xiaomi Mi A3: WFI and cpu-sleep-N-0 show up in cpuidle and
the usage counters increase.

Signed-off-by: Majid Hajiheidari <majidhhdri@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm6125.dtsi | 32 ++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
index cbc500d69..f30f7b16d 100644
--- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
@@ -44,6 +44,7 @@ cpu0: cpu@0 {
 			reg = <0x0 0x0>;
 			enable-method = "psci";
 			clocks = <&cpufreq_hw 0>;
+			cpu-idle-states = <&little_cpu_sleep_0>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			capacity-dmips-mhz = <1024>;
 			next-level-cache = <&l2_0>;
@@ -60,6 +61,7 @@ cpu1: cpu@1 {
 			reg = <0x0 0x1>;
 			enable-method = "psci";
 			clocks = <&cpufreq_hw 0>;
+			cpu-idle-states = <&little_cpu_sleep_0>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			capacity-dmips-mhz = <1024>;
 			next-level-cache = <&l2_0>;
@@ -71,6 +73,7 @@ cpu2: cpu@2 {
 			reg = <0x0 0x2>;
 			enable-method = "psci";
 			clocks = <&cpufreq_hw 0>;
+			cpu-idle-states = <&little_cpu_sleep_0>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			capacity-dmips-mhz = <1024>;
 			next-level-cache = <&l2_0>;
@@ -82,6 +85,7 @@ cpu3: cpu@3 {
 			reg = <0x0 0x3>;
 			enable-method = "psci";
 			clocks = <&cpufreq_hw 0>;
+			cpu-idle-states = <&little_cpu_sleep_0>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			capacity-dmips-mhz = <1024>;
 			next-level-cache = <&l2_0>;
@@ -93,6 +97,7 @@ cpu4: cpu@100 {
 			reg = <0x0 0x100>;
 			enable-method = "psci";
 			clocks = <&cpufreq_hw 1>;
+			cpu-idle-states = <&big_cpu_sleep_0>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			capacity-dmips-mhz = <1638>;
 			next-level-cache = <&l2_1>;
@@ -109,6 +114,7 @@ cpu5: cpu@101 {
 			reg = <0x0 0x101>;
 			enable-method = "psci";
 			clocks = <&cpufreq_hw 1>;
+			cpu-idle-states = <&big_cpu_sleep_0>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			capacity-dmips-mhz = <1638>;
 			next-level-cache = <&l2_1>;
@@ -120,6 +126,7 @@ cpu6: cpu@102 {
 			reg = <0x0 0x102>;
 			enable-method = "psci";
 			clocks = <&cpufreq_hw 1>;
+			cpu-idle-states = <&big_cpu_sleep_0>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			capacity-dmips-mhz = <1638>;
 			next-level-cache = <&l2_1>;
@@ -131,6 +138,7 @@ cpu7: cpu@103 {
 			reg = <0x0 0x103>;
 			enable-method = "psci";
 			clocks = <&cpufreq_hw 1>;
+			cpu-idle-states = <&big_cpu_sleep_0>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			capacity-dmips-mhz = <1638>;
 			next-level-cache = <&l2_1>;
@@ -173,6 +181,30 @@ core3 {
 				};
 			};
 		};
+
+		idle-states {
+			entry-method = "psci";
+
+			little_cpu_sleep_0: cpu-sleep-0-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "silver-rail-power-collapse";
+				arm,psci-suspend-param = <0x40000003>;
+				entry-latency-us = <290>;
+				exit-latency-us = <376>;
+				min-residency-us = <1182>;
+				local-timer-stop;
+			};
+
+			big_cpu_sleep_0: cpu-sleep-1-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "gold-rail-power-collapse";
+				arm,psci-suspend-param = <0x40000003>;
+				entry-latency-us = <297>;
+				exit-latency-us = <324>;
+				min-residency-us = <1110>;
+				local-timer-stop;
+			};
+		};
 	};
 
 	firmware {
-- 
2.56.0

