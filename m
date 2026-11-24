Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795511559;
	b=jgRI6Kcn+NOcHJW2yLQxC1J7CIpfkzCkGGGMM/pIQStTx6KAxGzurWibE/9dKsHR69ON
	 e0KAIGINrk1SPCh+QwqT7jjULkdCDbLTlKWMzGyDWvBmK+jCFJdT/kCXfSMPV1q05wboJ
	 wLLXCe55QgDNLva4hlboh8f/UKb64891ET6vSh3H2bKYLMYOB/ayYVpRjabEuyLveoPvh
	 fBdISd+xT4+q111vJEpzk7mIBH9XtMbfCh6t9EQzqpjpLiqv88UZ6Vf1DIevhyyBy5Gms
	 zP2UoiE3ZBMoZHCSB0ZNeGpSLB+SEu0kQfAsIZLIGskJK/OR73rTYekFiOiwwpaDQOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795511559;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=SqFNsIwVcZQX2pXUfvu+dQXNAKF9jBtpuYD02f+jmKQ=;
	b=4jvCTx3uPBaCoW+Cd9srCNXBmCziI65idledXq6f3BT9jUIJDiCZpPVf6UrobwiJQMeB
	 LsVowKA6VPfVJBdF+zX222Nn8F0JfL5opa4JsHjs2ZfU0ixlVHZxJMh4+cbVEVgCUGmks
	 Sl8AgzTvpsJjNBtTELJKIdhMlb8ks04cno5Qv+QAHEMM1GsvGGpdAPjaCRfUtbh4qiQ8u
	 6feMROkS56pjpf1p9tLK/vBKiVlPijmtLPF07ts06ioKduM2kXItY889NL828cmLyveFb
	 hEFM7uBnHxCU126Q3rPTR2b/4kb9YfJaT0x78uxgsWCI2ajnldpr0qU+cn1rq/WShhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=bzpQTyO+;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4F2606A330
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:12:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC4F2606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=bzpQTyO+
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8B9391A17B5;
	Tue, 24 Nov 2026 09:12:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5570B601E1;
	Tue, 24 Nov 2026 09:12:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6C3FC11E6A644;
	Tue, 24 Nov 2026 10:12:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795511556; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=SqFNsIwVcZQX2pXUfvu+dQXNAKF9jBtpuYD02f+jmKQ=;
	b=bzpQTyO+6WXylfSHi5fNe7m1lAL7fSEY5vUksSGX0rYJ5OjjIvlDZETB4d7iXhRjg4j1Ae
	5FQpjwhD46Z2GdSVRERDmKbnPFyX7h/KPYIpGRb2bnzH/IutYW82eLQdckpWq1UNKG34DI
	UImEph2gDw8YGq8q2+pE5vlmpGhwDqZsiMDUw/SkKAhBPhjCEvGo8rgJPyfyNWo61Ee3W8
	DoVXi6uEjKc3OHXu6axrMIXcym6feEX+GLfaPQaJ66PRan7AtoJN71TfxgK1xE51Jd0RkB
	B+IL5EI/gw7d20GwFxYn8XQLs/5snWju6keFxxi5wd6AQmlLn2/gcJylLb/vlQ==
From: "Richard Genoud (TI)" <richard.genoud@bootlin.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Udit Kumar <u-kumar1@ti.com>,
	Abhash Kumar <a-kumar2@ti.com>,
	Beleswar Padhi <b-padhi@ti.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: [PATCH v7 5/6] arm64: dts: ti: k3-j784s4-j742s2-ti-ipc-firmware-common: Reserve memory for LPM metadata
Date: Tue, 24 Nov 2026 10:12:20 +0100
Message-ID: <20261124091221.2593576-6-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261124091221.2593576-1-richard.genoud@bootlin.com>
References: <20261124091221.2593576-1-richard.genoud@bootlin.com>
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
X-Last-TLS-Session-Version: TLSv1.3

Declare a carveout memory region to store LPM metadata on J784S4 and
J742S2.

For Jacinto devices, this memory region is needed for saving ATF context
and the certificate information of ATF and OPTEE and DM image. This LPM
metadata area is firewalled to be accessed only by TIFS.

U-Boot R5 SPL/TIFS will use this area to save and restore:
- ATF context
- ATF certificate information
- OPTEE certificate information
- DM image (which has been copied in memory at boot time by U-Boot
  R5-SPL)

At resume, U-Boot R5 SPL is executed and detects that the board is
resuming (with a flag set in the PMIC), then it:
- brings out of retention the DDR
- retrieves the LPM memory region from DTS
- authenticates certificates from LPM memory region and applies firewalls
- asks TIFS to restore TFA and its own minimal context
- starts TFA on remote proc
- loads back DM image from memory and jumps to DM

https://software-dl.ti.com/tisci/esd/latest/2_tisci_msgs/pm/lpm.html#lpm-msg-lpm-save-addr

As this is used by U-Boot SPL, bootph-pre-ram is added.

NB: This memory region is not part of DM memory (which is not retained
at suspend)

Suggested-by: Udit Kumar <u-kumar1@ti.com>
Reviewed-by: Udit Kumar <u-kumar1@ti.com>
Signed-off-by: Prasanth Babu Mantena <p-mantena@ti.com>
Signed-off-by: Richard Genoud (TI) <richard.genoud@bootlin.com>
---
 .../ti/k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi  | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi
index d08fd3ff8a89..51b2d11ab5d6 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi
@@ -6,6 +6,12 @@
  */
 
 &reserved_memory {
+	lpm_memory_region: memory@9e500000 {
+		reg = <0x00 0x9e500000 0x00 0x00300000>;
+		no-map;
+		bootph-pre-ram;
+	};
+
 	mcu_r5fss0_core1_dma_memory_region: memory@a1000000 {
 		compatible = "shared-dma-pool";
 		reg = <0x00 0xa1000000 0x00 0x100000>;
@@ -261,8 +267,10 @@ &mcu_r5fss0_core0 {
 	status = "okay";
 	mboxes = <&mailbox0_cluster0 &mbox_mcu_r5fss0_core0>;
 	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
-			<&mcu_r5fss0_core0_memory_region>;
-	memory-region-names = "dma", "firmware";
+			<&mcu_r5fss0_core0_memory_region>,
+			<&lpm_memory_region>;
+	memory-region-names = "dma", "firmware", "lpm-metadata";
+	bootph-pre-ram;
 };
 
 &mcu_r5fss0_core1 {
