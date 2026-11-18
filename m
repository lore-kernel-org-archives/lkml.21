Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794995169;
	b=EgOxtO6W4j9IJ/5H8v5iyrWxCBP1b4cdXWB8mXEtp4kSn/SV0B8nndbP25Egc0e4u6hk
	 RaoPDwL4CoRrSXtuRL0ZEO5Kykl8r3RLJXYc3kiHd2uOWhqWi93XffZpq99JFuR5Ek57D
	 RCsAUJIKGE7I1I+1PQzY2jQ7K+FxOYjDRlJprlVIuUbErq9QNojPZuEUIIECgJIrW5ufW
	 WtzbROmySQHb1K3yqcmhpnSMerEEqYgOgciDDk2j7rbOHOeAEOGCRAtGu9j1ln1Jcx7Ah
	 eUJjmZXmht6PngYEaFe2/qxxJfp2Zk4qgoMIFaZiOkF1cw1rExbtk9nLOV1ly++Z4LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794995169;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=v90T4wFiMXT3Pmz9V4pGM6qoWWe5HVsaFIDzLIVV18I=;
	b=KQFrzElQoIv/1P6BiFovHzuoROsiMui7AoJqJ6qqvN8UUj2tt55aBOBVs9IQ70tsoWlI
	 GfDKCPL62FbJNPnYMU7wOl020RA/4rq8w0FfzRLWsm0CQKlnjx0RC0NhMlg/I6U9fxL4F
	 tWB+oYIDct/shzjJWoVdAeNjOsBOzHP7bEg5/dFfey9XuWA7hDcEta8D2So7Hj8XHclEK
	 sDqrokIMTvgXhXLc8fQCocEar2EV1xOivuVWANkVb2yxYCtf4WOjHd2h0TaxVJC4AZQ+Q
	 yLArf7SZpSPShmQ3l1UeUHgaj7Ugj0sOs91C6Hhkduun24PHiJIAskozbX1r09+U+BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OlMIbgdF;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E2D606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:46:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82E2D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OlMIbgdF
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4a68190a2a7so523364f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794995167; x=1795599967; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=v90T4wFiMXT3Pmz9V4pGM6qoWWe5HVsaFIDzLIVV18I=;
        b=OlMIbgdF0wF88RNTAla/QVbDCTtCBqFsK+c/DaRfcr/zqjmYToILqRVtT4rXyZ/rnA
         xT85U6rbGkOpno5ESwCY/QjGUA5EidYC+4Fr4Z+vTKHZQHmYaxTxlHuU60tPgagsozQ2
         ceSSMRJF0LrCMyvFFE4FxwXSLrQ1iobYPdWrAUVulparBJfd7VjmfdKXKccuidQJnVZ2
         BibjsxLnRo2vKLIHQkCVMKjBgADuPAiz57jwGwS1K7eNuiw8DKfM2CD+byKYkoIrQpBp
         xfOJKAWrFgz4zXcXSgkZAN1U9jyVscm3SDgF23bKDMAtT2ZXdslpA9gsVoNGJKyBRcNj
         6DCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794995167; x=1795599967;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=v90T4wFiMXT3Pmz9V4pGM6qoWWe5HVsaFIDzLIVV18I=;
        b=UnCcodlCI3HdyZsqlsTFRysU38BSn9aJ+ZozbQV9O0ypblQT6+KYrNhovxPSzPymB3
         aPTR6qKJdzlMBpIGKtaJwRdPqWM+TJQeiAqlaaGj4PnVf/etMrnIevCrF1VJomKGMgj/
         FJWBBiAj3dFZG6YmZH0AOD/MAgVaIn2pmuOuc+FaF0Z5xYKP6ZGvmp99qcYQk+1uIgnU
         ihuLeE2hvQjtHt/BnbvFeXmIxY7Sdo4vWaIxE5Fe7JCbHqvv5RLmq5f0ZTKWOFH/DCMW
         8lHxWG3Hssxw2Jcv5nNAtXgGaUBEfyIdjPwiGtVVm7Ez8q+HPG8l89cZfL4jQCdV/ziH
         Oi7A==
X-Forwarded-Encrypted: i=1; AL+hErHCSb6QIm8y5/Xg7LoMUQuxZJ395kP67VAxyXP5kncu6zcg9Aga/kcrvrf0Gc0yYvHxCfQiiw34nqSZTbg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VWrjxOoIYCYHK3OeP0aXVoXEkKOPwYJcjZOgtfyvvVmBbuBYF
	sIjDp7kvOXPoM3mzmQJ70sl+KeJVwiwxOX2VI4xPiPexssqVF1VXmCg4Fbw7wu6HP5o=
X-Gm-Gg: AZFdTZfAoGeMGjqytxnQ/bQpSsEPi0FgDWye1pHPuTIeVpsPOX8icC74Eda7UPwNKUz
	C6DukiwF7g/qlF6BLX/6VnCKJBj4ni0egd0pG5kXUfz2Tui1/bPWHgPDKYrDuxVNI+Bgc0880If
	Ix1jEsYdiSDc/xnowj54cH1Ooymrj//mkcHIEQkYD1NbhyPR3YTOOhbVcPWniySkDHxsMSdBIgW
	/eWQpczlPXpxib7W2cbQDNkwnZkTC/vwIE3r/2TTBac1Vmp9qPIZwSbHdEK8HCAq/A3s9jH+qrv
	lAtkh5pMiM+aHh7uow7w/j3AOdrMyCidVSq0k3eUPE7OliVCQi4W6VDyaMktNvpWapak7tb+Ngj
	m2vbCShCE8Qunx7NHyBZDhsmuXSrF2LdGXAVG3x1rcHboRYFX0EvkVnQk2LJ7Er8kXHloQAu/vi
	/9UE7mLL3TwzCO6JHxl6zl+dy+MAyiR3KZSe4rUHDUFInV6DgF5x2Vamz93+WSHEYHY+CrlehqY
	8Y7gs1VCA7ftskwubxEUzQ3T5bJXdEnDmEySRbKbPFXtFYt/LISL8jWCPKclyRtquHmapQ0q7xA
	aCwMUMZ+B6vsbsgsBScmnDauHlsZ12k/qsrYDgglzFd7OoZ92g==
X-Received: by 2002:a05:6000:4812:b0:490:6fbc:9457 with SMTP id ffacd0b85a97d-4a63c18831bmr4235011f8f.41.1794995166803;
        Wed, 18 Nov 2026 01:46:06 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654b807fesm3422097f8f.10.2026.11.18.01.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:46:06 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 18 Nov 2026 10:46:05 +0100
Subject: [PATCH] arm64: dts: qcom: sm8650-valve-deckard: add more reboot
 modes
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
Message-Id: <20261118-topic-sm8650-deckard-reboot-modes-v1-1-a214636f248e@linaro.org>
X-B4-Tracking: v=1; b=H4sIANxz/WoC/yXNwQrCMAyA4VcZORtoh6vTVxEPXZNplK0jqSKMv
 btVj9/l/1cwVmGDU7OC8ktM8lzhdw2kW5yvjELV0Lo2eO97LHmRhDb1oXNInB5RCZWHnAtOmdg
 wBLeP3ejpcAxQO4vyKO/f43z5257DnVP5hmHbPoEStDGFAAAA
X-Change-ID: 20261118-topic-sm8650-deckard-reboot-modes-6604a5f1d796
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1486;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=4ZnlLeALSzVqUVc/KZNZljqw7GUsLWbDl9Viy/ZS684=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq/XPdQolEG1UfaITInP8T6MtD9n8GC9MTmTZtsIxH
 uxdDzUaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCav1z3QAKCRB33NvayMhJ0XPHD/
 wIeS+uyeMpRPRDpVGwLxG8iizfRO+PVN6UUDPAyeFtxkIiERuCKnOUEdyb+c75fjh3O1f68LMl/RTb
 zr6gKyu847aPS5wGkRxyo8M6Ra8Oqxh7u2/Q8E4pFgn1qkIBz5nn2Ky8Sh097tqSnEn0421nrrcm6k
 cj2gNAF/Vta6Eukz2rLVBHhL6QMv9IPUWAEwgu6q0zkD/pVMYTTZ+ctmM8aqMjfJFE9llH05BvdX1R
 tGgChyr0zO+s7IpfpppS8Q4WR7Ve9bBw79CIjXVC7EvToDdyBelxzfhrzdFJ3LuPYZH7dDLJ/D4z1w
 8wO6wcGPE1QE1hjc6leBE5aifYydlMbO1RSqd5AJDs41+fo+PtlnYbLdG/fD5y/yVoIsWxSaIIGCXt
 22T37ZQiTkyt9BLRD9Fpk9sOLKElVe1NLWIPt93xu0e5fDOF49EW1fdl/OP00Z87hl8GnrGos6LOEs
 QXSKMKGbLL9UdD+8f2lI6gR5KSo2SwYLNjJVYYML5xbG7QfIA7WGECtX+6vdTps12QGkNyxXnMW7ji
 ZtSYusMhpHFB39+tcSqRSYivRshnLOUKT3IfnFanphtUDmVuFtAiWHjgH3wRufDAn2wdUT96OzsWtH
 8bKxNg76F1vQxfA0C+bsO+TwrKB5glqvIcRLlbrhkvWCDOSg99mlBpwHk+DQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the supplementary reboot modes supported by the Deckard bootloader.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/pmk8550.dtsi             | 2 +-
 arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts | 7 +++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/pmk8550.dtsi b/arch/arm64/boot/dts/qcom/pmk8550.dtsi
index 3a9d9f7c3742..bf757b551507 100644
--- a/arch/arm64/boot/dts/qcom/pmk8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmk8550.dtsi
@@ -10,7 +10,7 @@
 #include "qcom-adc5-gen3.h"
 
 / {
-	reboot-mode {
+	pmk8550_reboot_mode: reboot-mode {
 		compatible = "nvmem-reboot-mode";
 		nvmem-cells = <&reboot_reason>;
 		nvmem-cell-names = "reboot-mode";
diff --git a/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts b/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
index a83cad8efb2c..111d00085954 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
@@ -1159,6 +1159,13 @@ &pm8550ve_temp_alarm {
 	io-channel-names = "thermal";
 };
 
+&pmk8550_reboot_mode {
+	mode-edl = <0x03>;
+	mode-fastboot = <0x04>;
+	mode-usb = <0x05>;
+	mode-initrd = <0x06>;
+};
+
 &pmk8550_rtc {
 	allow-set-time;
 

---
base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
change-id: 20261118-topic-sm8650-deckard-reboot-modes-6604a5f1d796

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

