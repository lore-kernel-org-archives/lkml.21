Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794937330;
	b=QaX1tce/SUNwqALEJnOXjbVBW5atbC5UouLMghnwd+wd6Js9uKVqUBXSFgcJDgSFbVFq
	 cpPHTKFZmOIpGBjt7tPL4pstLbUv3lFqT/H5UxigGmQ9U93YsCC3lJqYu/Cpc/FmGdyGp
	 NRP0EotSvbUX2JzAxaigCQEe+GYYAkl6I7yzLxItlwIKwA1XqNrEJ6359UioFykqH0S6M
	 CKwAc6lxC7QKiGNnP9QHXgWJpJAZoGvAF+BJa/pOnqX4RVdPZOSZu83eWxhsF0q8eky6W
	 ouOhaefv+J985qA1ldq4/bXw5WhNUwVZewRodlaxLoUYfTG0mf/O11D19EPPRhEEN8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794937330;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wTPPTTwSIsIlB2fjrb+WqTZ06tnehY/OHjYsvZRgHj8=;
	b=PvS0eaNBlkRyIv2ipuaSkl8JuD6dhV1QZsIWWM/mdNPTqgTf9mrgTKukmIRiVfYabMps
	 jPhdbcKDHwr/2r4k0c43a6SeCfKcBSd12t94G9mLXVNYZ76wZ83CSbyQEsAnrVE0fnZB7
	 NdHuUfGq/74Vn/Hsul79eBWn/leCpXDy1xeTAz/5RISj/qsaETiPwhKH3jOBqNeAVGOof
	 xGUp+mqVF9T/YOsSShHpLGmU1mZRMv2H+8q0fxvHKSHDG4VCO5S0H3wVARI+lRN6v5ogd
	 4/G2gmMsO5UwW/ME4z1sUv81mLCFaH+EFBNObMN13wEjQRFk4DqAt4RsHKel38hDrkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="jpSp/odf";
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFD0606A8A5
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:42:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AFD0606A8A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jpSp/odf
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso2223544f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794937329; x=1795542129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wTPPTTwSIsIlB2fjrb+WqTZ06tnehY/OHjYsvZRgHj8=;
        b=jpSp/odfNg5lMN7KMmydns+yyMP7dF6B9SzvGkqhUF1wGakXbAWcroqVUnguNwnaw+
         NHXN2NLtjvsA3Y4UJn7lDJpc4fBva2/seT1tHcWZqODvF4iskxfa63HLkPBAGNYJzQFN
         d5nwsKPy7mqECAHUlejtXwvZIjULe9tm1SIt/CeLiMe47AJFLY2FgYKqtgUaOUA+hAoh
         Xt27nzD7E/KofDaPec7XDLzYS5rfkUvO3de2CjcePSFwv/C2yQqkETjr8hJforxPfTE6
         kO4W1EA7s233ZtdTxSdV5RNNSWg3DGYH3ay3Sm0qo0l7+uwTXJiQ6a0CmoyYfIN5M8LE
         ThIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794937329; x=1795542129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wTPPTTwSIsIlB2fjrb+WqTZ06tnehY/OHjYsvZRgHj8=;
        b=dnDPI7U3j0qn8jSDpXXDNbdWjug28bOfcMkgjQNX0S+gbVijTkqJ4WdZPIzfLbYWr+
         6ncE0wnh2obqQyKnghZbHOV2Xj5ueo3OitGQ2AGB0X9Hp5gQYA2z/Th4uO7IrNGjpDzd
         G+m/9p08iIJCTFF/g9VpsUOmmMp80tdhzfmnt0qftMG7z2QPTa322PK66+5ItmfuHvRV
         fQ+DH+m++pyrRRIXoqmR+QLyxSdRUnRk8M/xspT72ksAaCq0tf6OKWixyKd1isIJEl29
         qYBIuvTL3CsxrFWRP6UbKMQ+4XxzGcjY467KXPGl1YjvGbd7lMAeFzcMQlFAb+G8dkg7
         JXYA==
X-Forwarded-Encrypted: i=1; AL+hErFFWyVJ7EERXmc6Ak4SJ9a2A42aIl/PmqTPRghnuFurqNjSFIsbPYi6J0RTOfHDSZY0YMH/9FX5sY8F5V8=@vger.kernel.org
X-Gm-Message-State: APuU4Z88nDgtkXt8mWdw8q5I26oZOnJCDCSB35wXR2tR0oKmueMkzdHg
	INb+Jj1XoqXiRnRLPGx5Fvc2XMUXojifTeAw0PpeL7H/EsJ0ribrNn29
X-Gm-Gg: AZFdTZdLnbSZXneCcgrNZSHrHWCM0yNauCynMaSQ3AJsUNu4p+daS7h8gRdHhlMCGYQ
	Qd1ZGZrek7hN698KCUcKgKmR6eMcN9/bd6+h8Gt7LXSSV18JD/8fTDcrRoA7PNhtqxgBuOlcpwS
	Zqq+H5+PE62QXBn06TKcUAcW1zb5P4yoNwOMnk/G7XCyn2s4FlvVFsonz9r6Z0j66C0TmLbyyLh
	eM6c/Tyw+bmw2E8F2SorE3LsVm6BpX90yr8/vhGVMnCV5UMsCl8OWkLXJgt1XH0GFK/YQ7exUkE
	KEEMJHjlRk+HVALwrlUi0RNH2OewGsS5GNSNHJJVRjHR1sxW675M/LHFpyt39hdvXDZzqICAa6X
	8ae3SFb69ng58ai+FnGNQDSNKxZjPOifSzLOnfMlFLSmWqUBLmGYTP8RlKwUvnFfUVHCVkWH+yJ
	uIOiukTr1Gk6tT6S31KgqBpM645YiFvJ7ugDywkaCOxyo307vf1PKyxlIDe8NWbJAslDWYMsXKq
	PXoIcYkSyQPHoXvrU+4vVosSDrvZGA5SjZS4Z7m3JrGZovHtzsx0jlJocXP4LtomJdiMrNnhaeg
	1I8W6hHyCIcYM1xmctkFk1k3e2JcN+VqutJmKoBSbEIprtKTrnWO3seang==
X-Received: by 2002:a05:6000:26c2:b0:48e:3fc:e393 with SMTP id ffacd0b85a97d-4a6332bc6c6mr464449f8f.6.1794937328672;
        Tue, 17 Nov 2026 09:42:08 -0800 (PST)
Received: from vitor-21h1cto1ww (dsl-30-199.bl27.telepac.pt. [176.79.30.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c7390fe82sm30962552f8f.17.2026.11.17.09.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:42:08 -0800 (PST)
From: Vitor Soares <ivitro@gmail.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: ti: k3-am69-aquila: Add ath12k calibration variant
Date: Tue, 17 Nov 2026 17:41:56 +0000
Message-ID: <20261117174154.549590-6-ivitro@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117174154.549590-4-ivitro@gmail.com>
References: <20261117174154.549590-4-ivitro@gmail.com>
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

From: Vitor Soares <vitor.soares@toradex.com>

The Aquila AM69 has a Silex SX-PCEBE Wi-Fi module (WCN7850). The
module reports the same PCI and QMI IDs as other WCN7850 designs,
and its board data also comes in variants for different regulatory
domains (US/EU/JP, UK/CA low and high). The IDs alone therefore
cannot identify the right board data.

Describe the Wi-Fi device behind the PCIE3 root port and set
qcom,calibration-variant to the US/EU/JP board data.

Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi b/arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi
index b6854acee8fe..62904e9bcc71 100644
--- a/arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi
@@ -1393,6 +1393,21 @@ &pcie3_rc {
 	reset-gpios = <&som_gpio_expander 4 GPIO_ACTIVE_HIGH>;
 	ti,syscon-acspcie-proxy-ctrl = <&acspcie0_proxy_ctrl 0x3>;
 	status = "okay";
+
+	pci@0,0 {
+		device_type = "pci";
+		compatible = "pciclass,0604";
+		reg = <0x0 0x0 0x0 0x0 0x0>;
+		ranges;
+		#address-cells = <3>;
+		#size-cells = <2>;
+
+		wifi@0 {
+			compatible = "pci17cb,1107";
+			reg = <0x0 0x0 0x0 0x0 0x0>;
+			qcom,calibration-variant = "Silex_SX-PCEBE_US_EU_JP";
+		};
+	};
 };
 
 &serdes0 {
-- 
2.53.0

