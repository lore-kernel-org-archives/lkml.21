Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425832;
	b=MEdoaJl4XS0Xs6VyRgMedvM+SfmxX/w0i3x2JZa6nMgHBqCmpX0RAq4JS4eiFA8EYggu
	 zOxxjbKA7QAEQ5qkN9Tr9n0+TQm1YiW7q79XY8D7NoH+4NMc4bAWagEhvbbqJgqYRVQqX
	 mIZzdc81C1QRi37tPMLq/OlYBD+/K9pYZRmlu15OiJOp9S9bKncw6EfZbTEldAi+bfwAv
	 qvjaEibCxD4bx3XlX+bFhE/LfXtcRBet3tJy6uUCWmJNjnmOH80fDfAFK+nd3kqXq5ENJ
	 jhQVaAjQFw9Ga+d9Z+9RBQwkXo99eE4zTFeIIR63tV249+4FyYcQT7CYi6KYdkpOZsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425832;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lBEZ1Ox/BmdNOLwypVnEWy5Q296hGUAvyFtNqCvGnJU=;
	b=39hwQKyayKs57BRnSYyYtEbHfNMNF1XBhN26m3gJXP1p8S18CnyKfX7lMboak+asunig
	 b8K814qCT1c6Npb/VH7KfRL5wqRKj/YSUOvqO0LsUiHUl/xepCxsgPZRFbxQR2OUe2lSY
	 QYobZKRFvlKVQ2zxmEGNwfnKb1VBLoIh17OTRW5R5rvuJSRQ8vN/iHbgjWm/KUYqBNrCn
	 K6FqHcDduFtWent68EfnttH3zS72VFFRO1FbZeekqwUcVNTLpvRwP58AxJMBeWQi31I7i
	 +G847mBtqXkF8tUwGXXisInxsV+p6NEdYKHAuGE3ssKrq0ph8GUSetcEEw5AqaMUrRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="e/LZQ7kX";
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CCA606A331
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:23:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3CCA606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e/LZQ7kX
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so1851649f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795425830; x=1796030630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lBEZ1Ox/BmdNOLwypVnEWy5Q296hGUAvyFtNqCvGnJU=;
        b=e/LZQ7kXPiQooHLAgyHKV7edFi8YVHtSFrT4dN5NfrCLdlmwE27ntYV79oKPxmGTFy
         MMxE7oOFvYDfbzH1HgCCf6MOf05aewMXjiXILlwAJy/t72RfjxUp/0/iIgcEbVcF4ck3
         qGtYlw0wvf/adDw12V9VwGYAsMOESarpH1mrhw3fog8iwXSC0oWgnnJnX03UsIGyoQQu
         UJDWWzIoggI4Tb9VIjlzQCPTA/Bn53pPiX1W3Jq196oH3VwArIMQhMcRBJr1pwUmDyoI
         tAF/2AbW9oT1pKNIkvxlN4hhc5KBWnf/scogxU1GB9Pzvaf92uxDZLSiH/BnaCKbzpQv
         qU5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425830; x=1796030630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lBEZ1Ox/BmdNOLwypVnEWy5Q296hGUAvyFtNqCvGnJU=;
        b=Z2Hada9wFS8PUZneQr6/KjfRTid/HnKomUENBXX+G5F9LjGq/1CZK9gnemPTpdP/jv
         9DizfIMN+1t1qR/PqG00XqtOKh6F6DLjbDaOj76OY4ai7WjA3mjFL9C0mteK58bsNSlQ
         +Lh+lpCwbf+hsAnlg9lBMy/WSul0iX/VcuDGaqfIsvVWhF6M4xG4wg/3Y8jKYOzylg5z
         BduMZr1gK5dU4WdZEJQ+r7WR0RiOW5W4Is20m9hShCfmVzo+185jCcq8WKSX9X5NTlw7
         2u4hdYIenmd2BloVYmHnuclHHHxfw8fucavcB2suWgvEhZrbWag5pGNYr6My0cIBCmfC
         fGcQ==
X-Gm-Message-State: APuU4Z+KZ415VN/XDZUEQoBSfpIIrE12RlRMzeYuxNBWAOA+Ntm+ELQM
	0jHw+7X+TB8qx6+YBempZma+LRJ8WpKROV2hYJ/BJxXwpbMObWCwl85j
X-Gm-Gg: AZFdTZeE3FU9RCepMXBeQ9AzROwyIOexmYxOjEMLVUsgZj1NN7p+oHHpoJhPZQv/Ux9
	mP0jqE56nCrpmuNCwKDrGpaUG6qoUenI9BSaMnJjSTupqMeWr2Pgrbc5pkxMcEJmtO/a2Jd+f23
	CjD3+wRLvUuOg+R+S7q/LsLgOAk7pNUGqw2BP5TbGhtoInU41JYOhMLPqjxOEBPW95f5FPuxUMW
	da3SAjMSH8cuOjPFGaYXoIGdaEhNBNiQW1eC49OjZj/ZLxhXHjBUAql0+xc6esGJysk1Ad86Ipg
	Kks3WJ+mFflBKhwe1hZLG/y5te4aephWpZzCOUFRhIusi6J7+08Qx9rc5t/iSrjdp/Rk3LkIeff
	n5A1U+DFRdTcB65K6LRFV8dI2HPeobNfyBprjKazoz4plvcCNqbQ20kasOQ/OFkFygt6X6pVlDY
	heSoOMF1Rgc8nOL/A9mUq6Mbj/Gj54kjN4XznGYdYLtaCWZwv2fPzUw9q9PXeHyeSNptmX87wn1
	pHCw8Su0iVj7cv1ENlz5FSH7BbsK1cN9OwEktZOBTCNVSaDJITWVIBPVisMWKipkyGJ4nFUz6ps
	hE0vMQJHuuDiwtmPTo/7U0xjI8Ggv0HlbDNWq/FQw2QjJo8Tv83Y4qLfNbwIRiaB1MerM6Um2ae
	LiU+z2DJTpWjZff/WMbLZ4W8lnnjPnlXrQmtEAtMB90atArUaPDmc2MY=
X-Received: by 2002:a05:6000:4b1e:b0:48e:7e1f:8cee with SMTP id ffacd0b85a97d-4abb0f3c23bmr21423643f8f.12.1795425830233;
        Mon, 23 Nov 2026 01:23:50 -0800 (PST)
Received: from DavidArch.internal (catv-78-139-0-46.catv.fixed.one.hu. [78.139.0.46])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989eesm21060655f8f.50.2026.11.23.01.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:23:49 -0800 (PST)
From: David Virag <virag.david003@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	David Virag <virag.david003@gmail.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 4/5] arm64: dts: exynos: Enable USB in Exynos7885
Date: Mon, 23 Nov 2026 10:22:41 +0100
Message-ID: <20261123092244.1792040-5-virag.david003@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123092244.1792040-1-virag.david003@gmail.com>
References: <20261123092244.1792040-1-virag.david003@gmail.com>
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

Add USB controller and USB PHY controller nodes to Exynos7885 SoC DTSI

The SoC theoretically supports USB3 SuperSpeed, but is not implemented
in any known device. The vendor kernel also stubs out USB3 functions, so
we do not support it.

It is though, perfectly capable of USB 2.0 high-speed mode, both as host
and device.

Signed-off-by: David Virag <virag.david003@gmail.com>
---
Changes in v2:
 - Keep dt nodes ordered by unit address.

 arch/arm64/boot/dts/exynos/exynos7885.dtsi | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos7885.dtsi b/arch/arm64/boot/dts/exynos/exynos7885.dtsi
index 6b994b487107..8dd8d666b9bf 100644
--- a/arch/arm64/boot/dts/exynos/exynos7885.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7885.dtsi
@@ -480,6 +480,42 @@ i2c_7: i2c@11cd0000 {
 
 			status = "disabled";
 		};
+
+		usbdrd_phy: phy@135d0000 {
+			compatible = "samsung,exynos7885-usbdrd-phy";
+			reg = <0x135d0000 0x100>;
+			clocks = <&cmu_fsys CLK_FSYS_USB30DRD_ACLK_20PHYCTRL>,
+				 <&cmu_fsys CLK_FSYS_USB20PHY_CLKCORE>;
+			clock-names = "phy", "ref";
+			samsung,pmu-syscon = <&pmu_system_controller>;
+			#phy-cells = <1>;
+			status = "disabled";
+		};
+
+		usbdrd: usb@13600000 {
+			compatible = "samsung,exynos7885-dwusb3",
+				     "samsung,exynos850-dwusb3";
+			ranges = <0x0 0x13600000 0x10000>;
+			clocks = <&cmu_fsys CLK_FSYS_USB30DRD_BUS_CLK_EARLY>,
+				 <&cmu_fsys CLK_FSYS_USB30DRD_REF_CLK>;
+			clock-names = "bus_early", "ref";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			status = "disabled";
+
+			usbdrd_dwc3: usb@0 {
+				compatible = "snps,dwc3";
+				reg = <0x0 0x10000>;
+				interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>;
+				phys = <&usbdrd_phy 0>;
+				phy-names = "usb2-phy";
+				/*
+				 * SoC in theory supports SS but no device has it.
+				 * Actual capabilities unknown.
+				 */
+				maximum-speed = "high-speed";
+			};
+		};
 	};
 };
 
-- 
2.56.1

