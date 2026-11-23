Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448155;
	b=gpKwrHRoPdR7GegHVJpcuh7DON+5OIU4TZg/jooy6Q9KmZJc3l8AKokCs5czvWeO5oqu
	 Z6mdhTr/JX04FV93j6qcfEtlGqcHHrccqukcUq6LBvYwA+5snpe8PILNno+A1goIk1wPl
	 8kXrToB3coqyhZb4Iq8GylEx5iMPL8oEOJ0/6YvLEtvOtEkDxaTei0JcUWaitXJ1oN4Mp
	 B/dUS4kEE+iYSYOi1z0WfMZJz2Aei31kgQ70u8s1dzVk2tmBxjhgMG96eUuKzbqcCox+Q
	 PaKDWX6GcpWLuyfB1IdrcGxAsxAlnjBr9DG2CA8hFEoVP9tGWt3tBl08pu90RHaYArw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448155;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=4/V4cUyDcB1e3U1ZLpf013Jo+2K1cdjb1bmwFhvlnmk=;
	b=kcx++lD1jaxF4NYWYyUYIUkxWrbrNbK6wXiBe299us/70YtHJk1OumMiEaJ/BZRsHCEs
	 wnlpeM/Mfhu+aVO4IcVaA6//tc7GWiZlos2o8F1Yyq02aPp7wWglI8k87MPIF6ETU0sVz
	 7zvZ8aNh4ui0Bt69fCP1m4DE5SbexAPTsux68ijwcbXg5qizT7nFzFH43f3XfswGK2EBt
	 kisCBiQ8128rFFHWlHHM86g8aBIB2Gnr7wYsAmnQvgVRWflWVjcOSp38KwNkjG6w7rIBQ
	 Rmh2G/uAKVglX66wjrSmEZ5hyjoC/geA7inLzB7dVZ0zjjj5p/+kITMBhld7aNjxbbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b="w/40V23F";
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BA4606A339
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:35:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95BA4606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=w/40V23F
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so36486145e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795448154; x=1796052954; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4/V4cUyDcB1e3U1ZLpf013Jo+2K1cdjb1bmwFhvlnmk=;
        b=w/40V23F3QUDoW4lzpB5eyWuf9zKOaEm5+vZFedf/QL5C71p7lf68BwqoktT7pnxZT
         LBfwcWkmt3SHfrPuJYG/ff1YaxfxPAFTl96phJQFOu7qQ+tZJYLfoIxIWHDBWH15JnZ8
         Ipo4cGPrnwWEQpqncE7HdclW14ce+Ens55Rx6xdBjz9ocprLRzemkWKhIhmnh/hlLyZ+
         Cn6GGViT0oYvPNnbReYH/8wert6KnmVImUHZoXE+fbGYUJeftoLFwVeYNxVRpk8d52+r
         yh1AJkuOx3xX6tTgRb4EuBFCGc/VNN9MArzfmWJr1HEwKz1ostd4G1MtllhCGFUfxsMd
         LhMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448154; x=1796052954;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4/V4cUyDcB1e3U1ZLpf013Jo+2K1cdjb1bmwFhvlnmk=;
        b=Jh74Sx5lE3SylDa2Q4HYyg0raqvC0w0hnEpGMPqm8jTvWxzPwa1XuBYd8Ub/s1H0JD
         4UYygye8wxtAjJYF/qM6a9hc2MR6E6d0mIcEeXKIvuUYYfuJlNajhuzgUJGFLAGvRoD3
         iZ+u+uxsi2OeORhFtWSkyGw6AxAsXviyNfUO4DNGUh9g85U9eGK4Qhpg70yR2YrCENsy
         BTPEOdzwfySq6aAH4oJesvaKbKhCPPMn7BUTnES6cq8pMNCOu4eXLThb5W8+bBpK/UT+
         VMvLNQC/lfz9QrwCDt3CsPCJola2IPyANewLzDPRGUqoMSiYSXW2y6bS5DrccfU6R2mQ
         Sx9g==
X-Forwarded-Encrypted: i=1; AL+hErHZL/eevKG5q6S/RKD2k8QOpNeZY1zO5pj9nyXucsMUSwC9TNRblrgFu+FcX6fWHonv1+fpGIMAHcffKVA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ryrp9gA5gzoFA7zyAWPYg6PrKi/qdjaT/JOQGhNcWlYhTGmxh
	KIj9G2UQMzlFlDCBcPDOZd6IAldUpYV0PrtNdXoctWBxXXYSEUkljIkFrIuWl4ASvqI=
X-Gm-Gg: AZFdTZfpTp7z2HIfZPTaCLHpdYN4nDnTJtADdg1kkVNXxxYqXyJVUJfqVZOIT2eyzuK
	PlG1MLlmCVFOi64uzodAwQHuJxXo2AkEBvVpNGdgSSI4xDz4InNlLe1PzCq5HKqYoNL7lM2Prpv
	EJkwxi3HWB5N1x0dV3w/Dl2QbuDohAFjeoomtNxQpp4fkMIWgA6L1lPSKMOS21+Vx6zYSnO7Dsh
	aqn5/Hy1e/N20Ve01pzelet5kMV1xVfi161h7HTTvYUl6KhOAmxywzSEYFOEw2k1RpGsa83yljV
	L8HkFpKUX10xAZ7refMP7KlkbJJqwRC8+E8p7o9ViUNTh7GNVofInamQWmeBDQofb9ARqkkfP5D
	lTz10txi2id3Op2z4coGohD2+katwTD4zGDgFiiRzZJxRNLE5S18Mm8Jh7FtiBON0ID15DqbUVZ
	Ebm+bIfw2anSSg7IJ6kOBnRt+SZSc2TYIFfpCbSrAZyORMNRB6jOXIc9rfH2BZku4wRUq5OHxrJ
	5rUcmdQdUQeI7cXkJ6bg1LCzoh2oYPmD0SG1LNe4flFiMgD8hX+OTdbjitEnsrSNJMHqr/SyTNG
	vGmtTruv7mlJGpop0Mx5LttN5JI58uS+9j7O8TUl8Vg7HC2XILeY5nh/pPi1J/pbNFKxta73Lmf
	8HS5u9Nsp9R9Z5WRWE4SLkloCkUhxgus=
X-Received: by 2002:a05:600c:6749:b0:4bb:8508:7fb3 with SMTP id 5b1f17b1804b1-4bb8881c3b3mr227256985e9.11.1795448153865;
        Mon, 23 Nov 2026 07:35:53 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a1e8bsm305917455e9.9.2026.11.23.07.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:35:53 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 23 Nov 2026 19:35:38 +0400
Subject: [PATCH v3 4/5] arm64: dts: rockchip: Move RK3576 OTP cells into a
 fixed layout
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
Message-Id: <20261123-rk3576-otp-cpuid-mac-v3-4-40c756dcf36f@flipper.net>
References: <20261123-rk3576-otp-cpuid-mac-v3-0-40c756dcf36f@flipper.net>
In-Reply-To: <20261123-rk3576-otp-cpuid-mac-v3-0-40c756dcf36f@flipper.net>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Michael Walle <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Finley Xiao <finley.xiao@rock-chips.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ryan Leung <untilscour@protonmail.com>, 
 Ricardo Pardini <ricardo@pardini.net>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3709; i=alchark@flipper.net;
 h=from:subject:message-id; bh=Y3Bw7NplLdotIeyq8DxbQXfi9QyNK60bhdpYvFiFdO0=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWSzxHr9v1nCn/FUVfRj0tlAhtfTphs3SRcUb5NbPNnO7
 P9RiUCVjoksDGJcDJZiiixzvy2xnWrEN2uXh8dXmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHWMeIgYtTAKa6gJeR4ey7le0xbkstHy6+UvhWbMM1QevjS3cum716uZtCwvR7O60YGe5c18y
 71/vUnI9f5/wr00fOCeu9Yo72GPkkbvB+uuLkDhYA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

The RK3576 OTP describes its cells as direct children of the OTP node,
which is the deprecated syntax predating NVMEM layouts. It does not
allow a compatible on a cell, which describing the CPU ID cell needs.

Move the cells into a fixed layout, as already done for RK3528, RK3562
and RK356x. Labels and node names stay the same, so the cells keep their
names and existing references keep working.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 105 ++++++++++++++++---------------
 1 file changed, 54 insertions(+), 51 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index 7828736bf9ac..6f9fd73d24d6 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -2298,63 +2298,66 @@ rng: rng@2a410000 {
 		otp: otp@2a580000 {
 			compatible = "rockchip,rk3576-otp";
 			reg = <0x0 0x2a580000 0x0 0x400>;
-			#address-cells = <1>;
-			#size-cells = <1>;
 			clocks = <&cru CLK_OTPC_NS>, <&cru PCLK_OTPC_NS>,
 				 <&cru CLK_OTP_PHY_G>;
 			clock-names = "otp", "apb_pclk", "phy";
 			resets = <&cru SRST_OTPC_NS>, <&cru SRST_P_OTPC_NS>;
 			reset-names = "otp", "apb";
 
-			/* Data cells */
-			cpu_code: cpu-code@2 {
-				reg = <0x02 0x2>;
-			};
-			otp_cpu_version: cpu-version@5 {
-				reg = <0x05 0x1>;
-				bits = <3 3>;
-			};
-			otp_id: id@a {
-				reg = <0x0a 0x10>;
-			};
-			cpub_leakage: cpub-leakage@1e {
-				reg = <0x1e 0x1>;
-			};
-			cpul_leakage: cpul-leakage@1f {
-				reg = <0x1f 0x1>;
-			};
-			npu_leakage: npu-leakage@20 {
-				reg = <0x20 0x1>;
-			};
-			gpu_leakage: gpu-leakage@21 {
-				reg = <0x21 0x1>;
-			};
-			log_leakage: log-leakage@22 {
-				reg = <0x22 0x1>;
-			};
-			bigcore_tsadc_trim: bigcore-tsadc-trim@24 {
-				reg = <0x24 0x2>;
-				bits = <0 10>;
-			};
-			litcore_tsadc_trim: litcore-tsadc-trim@26 {
-				reg = <0x26 0x2>;
-				bits = <0 10>;
-			};
-			ddr_tsadc_trim: ddr-tsadc-trim@28 {
-				reg = <0x28 0x2>;
-				bits = <0 10>;
-			};
-			npu_tsadc_trim: npu-tsadc-trim@2a {
-				reg = <0x2a 0x2>;
-				bits = <0 10>;
-			};
-			gpu_tsadc_trim: gpu-tsadc-trim@2c {
-				reg = <0x2c 0x2>;
-				bits = <0 10>;
-			};
-			soc_tsadc_trim: soc-tsadc-trim@64 {
-				reg = <0x64 0x2>;
-				bits = <0 10>;
+			nvmem-layout {
+				compatible = "fixed-layout";
+				#address-cells = <1>;
+				#size-cells = <1>;
+
+				cpu_code: cpu-code@2 {
+					reg = <0x02 0x2>;
+				};
+				otp_cpu_version: cpu-version@5 {
+					reg = <0x05 0x1>;
+					bits = <3 3>;
+				};
+				otp_id: id@a {
+					reg = <0x0a 0x10>;
+				};
+				cpub_leakage: cpub-leakage@1e {
+					reg = <0x1e 0x1>;
+				};
+				cpul_leakage: cpul-leakage@1f {
+					reg = <0x1f 0x1>;
+				};
+				npu_leakage: npu-leakage@20 {
+					reg = <0x20 0x1>;
+				};
+				gpu_leakage: gpu-leakage@21 {
+					reg = <0x21 0x1>;
+				};
+				log_leakage: log-leakage@22 {
+					reg = <0x22 0x1>;
+				};
+				bigcore_tsadc_trim: bigcore-tsadc-trim@24 {
+					reg = <0x24 0x2>;
+					bits = <0 10>;
+				};
+				litcore_tsadc_trim: litcore-tsadc-trim@26 {
+					reg = <0x26 0x2>;
+					bits = <0 10>;
+				};
+				ddr_tsadc_trim: ddr-tsadc-trim@28 {
+					reg = <0x28 0x2>;
+					bits = <0 10>;
+				};
+				npu_tsadc_trim: npu-tsadc-trim@2a {
+					reg = <0x2a 0x2>;
+					bits = <0 10>;
+				};
+				gpu_tsadc_trim: gpu-tsadc-trim@2c {
+					reg = <0x2c 0x2>;
+					bits = <0 10>;
+				};
+				soc_tsadc_trim: soc-tsadc-trim@64 {
+					reg = <0x64 0x2>;
+					bits = <0 10>;
+				};
 			};
 		};
 

-- 
2.56.0

