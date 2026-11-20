Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202505;
	b=Ydz/T9545OoLSM8z5TV2T7PvO6Cs//GX/wZEHqrfC91V0+YiiDSr5dSK7Ci1F6sfY2xe
	 8kkxWcvKp41OV6wRgA1ECwyLBq1xL8XC/bGcENxYtUbA94p7zrX4YqTFtPHakfmiUih6J
	 gBTsS2Vy22qgRLxGt8yadoIadEqbOit+FCDfC9lHwiCiK9lsQuIawg3IMLJFAOcEJkaro
	 Fm9mID+CMJMSv0L3HtqGwW0FtrRT743SsYZo3lKWzCpfA77teLj+yio1S11ANe0oBN2B2
	 MpzxSZoBtFdxSmV4uNPo1iBzJy42JA4K4OtW0sc2/ID/LkmKoU1cvYxnQdSFr6jKBOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202505;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=bBmqP69mry+lGbki19N79NWmhaQ/6EL+J2EA0Ie++Zo=;
	b=DUkzpq4PDZ9Q8nLhKEpXFChKhSevgusVeEP+Ygtd8ktOBzIeDuP+c+ijsylFmVehNh+J
	 gcJ0/h/aWkpvPt3SVfjK5w7tqla5W4eZpky5dHX0NvULkhWM9zuyFKGR4j/tGHpOfNotc
	 Cc6pDXUOVBsEahFvSVXbBMpnfz30MVmznyCYJg9osvDGBzwbIeG0MV3irv3a5JBeIneno
	 3+aq0MxNh0Pf3V6uwpNOwgDsTbL8NCraFNyebLbuMRTVk0tu9IpymM9tDIWxeAR3ar5B/
	 3bhMw4EC4VWwiI7EDq73xeHTXkqeqEMvan+dqOAgydTQZw0mwxbjGVa7fBwiiWsoQsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b9TuiA7k;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F071606A6F0
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:21:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F071606A6F0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b9TuiA7k
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so835836f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795202493; x=1795807293; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bBmqP69mry+lGbki19N79NWmhaQ/6EL+J2EA0Ie++Zo=;
        b=b9TuiA7kL/LWUVNnDt4r8uL8hJ3c1kZtprGU75ftxO4VFgjHwqdIP3sM95mLfRyVzM
         VSNBfVz9+1bF9vYdgh6ZC/pq2M1PduUtbMk0PomXQbSijh9AzHr6lZIpMnKteJiV5hDt
         m0aVNH1Sf3PlxSNqCoz4ROJxI9srGp0a1jlKPDCgpF8kiD+77I8FbWcCpf6NLiNC6YVH
         UCA16OBlZufkgy3PQam7zJeCt27VFmC2/jraCJl1zSEDG3+Uk/xAPeiA4Hb2bnEDvIu7
         itF4HwSsfGPiJFeoaQOaKOT++/yALBRh3NY299IJYU1+89F9j3EmDeRv9zeiARp8/iC2
         Ww4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202493; x=1795807293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bBmqP69mry+lGbki19N79NWmhaQ/6EL+J2EA0Ie++Zo=;
        b=zgubINi1LZf4z58Kbvs+v4zgJf97jMv7Jm/bhqB03J8vU3bGS0zuiZHsqtGWzjUaUN
         qIOuyVZtjYCxcLN+nvbaUD9Sh5FsAhgNWcgkdpo7mCApPiENHl6YCu96tHN5ddFkA6NN
         Rc5FXf1SdBpZ8HVqsP+fc8bVNhXAH9FOp0VkyNeY8NykURzVBLbKaRVdvSMlB3E31P1L
         Ac0hbUkpvKKxLNxtvHcezpCXqtDrLanZ84DTeBkrrZXuc8VpKKG2etZCF70iKFloK4FE
         E0Tgd7ehLfxw4n3R9WQ1bQfFiBF13mfK+bHLgmB3wjcexmo2h4czx1U/H+qjt6H9jcLw
         z4uA==
X-Forwarded-Encrypted: i=1; AL+hErGpWF/niQCI9eTa56dPovuxF7QXYRuU7VFtwKWXommpA8AzE7QVuK/SESPx+DvF5hK6HghCLpRfDfuMLPA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Y/syY6FArVi74pQzhPUqEgof/fwSSVSBxwbiLXRWXYEkgGVfi
	bVg6YPC/AdICvLyJoQGExxdbSEsJNvjoSWg4RrirztAqN8M8EO+UmJX7
X-Gm-Gg: AZFdTZfNNm4J82hENo9LqnhjJlB21K2ld4VEIetzKym9UbxDSESRk8Ad1qbZa4C9THp
	W+vsf6iUrI1jXLolEXN3CHbynxZTMpltpESMf0SAr36HzmN9p9m493e6LA6angt/tXbdDPnPA48
	rsAjrEFivFq+gWA/GkXRN2KSNcXJz0Nbk5ZMj/MV/fcFL+BeaWIkEBuqXl9WT0EOm+q5va0gwH9
	OP/lIzw6M7UbuGIKkO8TwZRZSg/oaKS2L7fWiJdPbsWHRLDEv/6X5OdKIhXCjo/rNJZ9VgtrJo8
	+Z67z9dfWuvHEi9Urf4jT7BJCsepYc5d1BXvOhNNGTsouqua1fJ94TX0C8VnbnZ/tXsto/Ypmcw
	cLibKWhav28FIOsbrJX0XXT4CZv40oIGsj5YR+C9XWVJ9rq7GMaPPNs39jp3p9V3Q99oARcO6wK
	le0/oUo3B16wMVus3i/Lyahzie4MEsHToPIp/Cbmur9Tjom/mt2HUuxHx1E8rygts4itkbaxktI
	WYF2Xuhz4T0KZOpygm5HWlXa9MSkPU5NF7TP6EFMxOH7jNFhrzQLLs+mc7qAurl+40bf1UZ0kdA
	00FynKIb0CbZHjwPQBKY/u/5O9HW4+zf7o1lE8BNsg==
X-Received: by 2002:a05:6000:4812:b0:491:a219:8506 with SMTP id ffacd0b85a97d-4abb55183dbmr8227192f8f.48.1795202493000;
        Fri, 20 Nov 2026 11:21:33 -0800 (PST)
Received: from [192.168.0.2] ([197.250.160.206])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm8405703f8f.21.2026.11.20.11.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:21:32 -0800 (PST)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Fri, 20 Nov 2026 22:20:54 +0300
Subject: [PATCH 5/6] ARM: dts: zte: Declare nodes to enable the board's
 dwc2 controller
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261120-zx29usb-v1-5-b0433258e51b@gmail.com>
References: <20261120-zx29usb-v1-0-b0433258e51b@gmail.com>
In-Reply-To: <20261120-zx29usb-v1-0-b0433258e51b@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Lee Jones <lee@kernel.org>, 
 Ulf Hansson <ulfh@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>, 
 Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, mfd@lists.linux.dev, 
 linux-pm@vger.kernel.org, linux-phy@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1980;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=VM93HH2t+Y1jF4XnpLTskujk8HKKI0SNwO3Nkis00qQ=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBrAJ2XsdE4XtHXB32BoPfUssqGek5Snakxjcygb
 ymjgroPEw2JAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCawCdlxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiKGoA/+Jg//JNfc0k8TCoWlB57VTEUolY5k3Cb
 /BrSS9BX50YVGu/+HzfpBKoj+zDVoYQYMR7YMv3QDqnLEU+zqcZFaXyh476zzi72itSOU4kGTtj
 +9SgKtUdCm9bxN8rdctWmeWLqbXPrcrpQiTk2ZL61TLT0AGOki56beImFwuqbro8vkjpAV8Lr1a
 lSYW04G/FKMIVyuygKvLKGhZ+Mu/RRYRMvtFuPJ4E0XeRJ7JbwR4g0yjpiAhyybMRWetDuHwJoX
 UASgZ7aaIcGMMm7ajBQ/9Iy/r3MxVZNdRk0P4lncHRPXhQuYxo5/LA92VPadtxDJcuBppv6hBar
 aUDxcmjqvs/zZlTHMMQxcHKoqI7tdfmYUx7ziw4WSIDgmSf8myzoZq00XAGfhpf9BAP3ObuDTQg
 R0xumTXxnByaAMo9QJH8ZzLGg6xl6ZdP405AeqkNreNOCBOZxMOcTIomfdZsSo6Dg02Oqu4W+fO
 onN/KsBNwl/BPAny3WdPYb8Fp5GmIbqLvqxXfCqwfi8TveidunVclh+TDa+nb4eSQsf5tncF94t
 c7FQEK65ldHG9HnblB6KbWI42xu02XXFa88SwSd1qspzIKrbBji6lNs+6Yyp27DZLOPb9mJqVll
 NYFWkTtipcDBCYyRbXgSu5TnxIFdOcZePEEYjNqtlJEwn1S+kLzQ=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This adds the socsys syscon that provides the power control for the
controller and the dwc2 controller itself.

On all boards I have seen so far the USB connector can only operate in
peripheral mode - including one device that actually has a USB A
connector. DWC2 and the PHY can be programmed into host mode, but there
is no VBUS power supply.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
 arch/arm/boot/dts/zte/zx297520v3.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm/boot/dts/zte/zx297520v3.dtsi b/arch/arm/boot/dts/zte/zx297520v3.dtsi
index ebac3cd137df..2fc888b10006 100644
--- a/arch/arm/boot/dts/zte/zx297520v3.dtsi
+++ b/arch/arm/boot/dts/zte/zx297520v3.dtsi
@@ -5,6 +5,8 @@
 
 #include <dt-bindings/clock/zte,zx297520v3-clk.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/phy/zte,zx297520v3-topcrm.h>
+#include <dt-bindings/power/zte,zx297520v3-socsys.h>
 #include <dt-bindings/reset/zte,zx297520v3-reset.h>
 
 / {
@@ -111,6 +113,13 @@ reboot {
 			};
 		};
 
+		socsys: syscon@140000 {
+			compatible = "zte,zx297520v3-socsys", "syscon";
+			reg = <0x00140000 0x400>;
+			#power-domain-cells = <1>;
+			#reset-cells = <1>;
+		};
+
 		matrixcrm: clock-controller@1306000 {
 			compatible = "zte,zx297520v3-matrixcrm";
 			reg = <0x01306000 0x400>;
@@ -176,5 +185,19 @@ uart2: serial@140d000 {
 
 			status = "disabled";
 		};
+
+		usb@1500000 {
+			compatible = "snps,dwc2";
+			reg = <0x01500000 0x40000>;
+			interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&topcrm ZX297520V3_USB_WCLK>, <&topcrm ZX297520V3_USB_PCLK>;
+			clock-names = "otg", "utmi";
+			dr_mode = "peripheral";
+			resets = <&topcrm ZX297520V3_USB_RESET>;
+			reset-names = "dwc2";
+			power-domains = <&socsys ZX297520V3_PD_USB>;
+			phys = <&topcrm ZX297520V3_USB_PHY>;
+			phy-names = "usb2-phy";
+		};
 	};
 };

-- 
2.56.1

