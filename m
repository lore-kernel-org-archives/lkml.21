Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795180517;
	b=DOmQYHu0CNLG65ZoVfSJKxbENG3+ba0jlyGPFLV7DDeVm74v4UfD7bRj3+HrLIew46MX
	 oDXGvbm6W/33hS1DKAezOxZxtTyTDdoIC2jbYEYz9kRdx17k0TRI8jOyJ+QB0TH8ewFcV
	 p8RGAOMqSTMXMj1SEhCA63ecq82BlVtOCDkxpTF+ICLxWum3f8ivk44oVwljd/q1sXT1H
	 D3UhmVjCTO67TsooCCo+VS5OwOYp1hRUlb7G4iNbmtY0gxw/TYZ1/24FXBsRGVbS61FXn
	 uGW0kR01uLX64dvA7q3xW73Tzn0WjHIpdPWCrlKOHE/DEe/pmfsQxoEyAn23TP/3azQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180517;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=I2Zr97px45Lj3XI6OkTDSQtGrZcMB3LLelnuX/SP2Nc=;
	b=MnkR4CMKG9n9lIcnZAXgl3mHVXsdclf8Wynt6IePdYS8JkH0FgIdpRVE7UWh2dWYQqWq
	 YIAriIp1wE3chvnsve00kIQ/6mMH4liCIKR5yK0r3r77YGhhHz6YK1qANVpl2Pujw6vNH
	 0hxRB+t78/a74ZcwtCHsSjDpT3DWcglfgeC/UEhdLBUI0wO1IGMVaky2rBmnBe93nbG2b
	 zdciMDRIOw+5bJ7yXsRoDKkOCJqJlEqJ5yzeW0wG7VEe+MZ7Lw9SagwGzcz8DTSALLcUV
	 H1I88Mj/c+cWDs9+7qOc4KCSNyX8ZfNIi+eDBjytSys3AADQ3CdrGBVFefaM+rX3ERg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=vayavyalabs.com;
	spf=pass smtp.mailfrom=vayavyalabs.com;
	dkim=pass header.d=vayavyalabs.com header.i=@vayavyalabs.com header.a=rsa-sha256 header.s=google header.b=KgsOidvr;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F01606A335
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:15:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95F01606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.a=rsa-sha256 header.s=google header.b=KgsOidvr
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-385c497bf94so1395692eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1795180516; x=1795785316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I2Zr97px45Lj3XI6OkTDSQtGrZcMB3LLelnuX/SP2Nc=;
        b=KgsOidvrbcO6fU1skx4kyAGn00NKAPLV/hJKqHJkE2Gb1+nA8QmttXwJFfGOJV2K24
         jmP4Hn4x9UcH14fvrHpIFH8g8ijrwg4cGrEXAaTSmOxk66ndFhn2CKGs+MfiHKetnQZp
         rRvOvcfxIe+M5+RvamgMlCdSmTzi2Wg27XTUs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795180516; x=1795785316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I2Zr97px45Lj3XI6OkTDSQtGrZcMB3LLelnuX/SP2Nc=;
        b=fmCmD3UdmsDvori5kfp43gV1/NzgIQ9owInqqQ8vskAvOygnX+KR2DDPJ13rBZ4E6M
         gQcfKXsy3OBwB+P9Kv+29dmzxoUHgccJNMf7rhIPoMybB4tN6ey6oLJKQmbWzAcVJ/KD
         6pPfrHYjg2VELaeiroGbVWa+u5zzjun8ojcpeEH0xyfKLDmXfKcXymvYkYQhMx8GQATE
         nuLdadJNJp/6pPOZLZ8NrSLdTJ16Og0eUM1g28hvN80xbeG1c3L18N+i10yj1VijAEvK
         W48WQ51+sypfyJrD82fu1peTVDzX+fc7Jpxiri6+/Y06rjmy9Aew9Wce724a3Wrsjfqk
         qErw==
X-Forwarded-Encrypted: i=1; AL+hErHfGIcdLVW/BpkE7kv7Unz33Ot2vYH0UWlQRswL88xJAJrrdUg2e+7yGjv6l87kk/t9sCt0J1TbkG1fWo8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tbWv/MvysanHw3zo8MU30pr9ckPW+M3hLMc1CiR9fpSpW4r4o
	mgeFr0ZvCSps56GBLGABleJmMkqxcai/t+LPy0wJvK0w4eWDY0h96/xWhKJcDwI48/8=
X-Gm-Gg: AZFdTZcP9I271EyjJDQs1NofrhWbh7p9aRayHfmbaf5Qvr94Drd/M4fJDkZJkzCee54
	QsQQ6dQ6nf0G8zZ7YhuozmZfsizsqWNnt1aqckJTfj21same8qgqCsdkzOEmdf5L6JJN/p0d2VF
	35fC+NJsNbGuiMKh871MxPIXIv6NCFefmzY+PZFMCjCelNUDFNkilANsb4MVnHyC7tYH9/BVGgk
	vC3RkIR8bJE2QpFf9/iK/clQXTTcTqJ9ewyfUERsyYLLgbnzeA6WwS8G/v6Yr/vICZNBFsgL9T1
	gFkxqmUgWl3Dnq6LrS0dYlhSF4rVuenaa2q/KdGEBqJ53A/0DmJsLnqTMWivDlKsyaoAMZXvYkG
	GsLU4UJDN8bytUFZ4U5Z4mkU6x0GHNcgTdzgeJk3343Qhdy2/lMQNB8mXq7e54B49WTx+oyqpIG
	T7NWul5QF4H76LdIU8kEsIGY0DCojawszeml8ierwqhIOUBED51xotNE+sVrlsXOBZ/LKsKd97o
	Ewg0eoFX3JP6rOGaMh3nm5RnQClKHssJ3Sa0PrdLMeCi0w/uh0yg2s3pzSxq0HdNDfJNToKT3PE
	8xr6PK/RtbUOUf/T00o3SuFVvZVD6az2XlA/AvfYhXNUZvIC2vGOoSEVr2tm0AYaD64vJ3rDgfT
	Fz1jC2WEujqHfHZYAwcFwWb1oP9a4hol+V9D2gPI2rtQ8RUGyQ+WqKzCqJpOCpe9emsMz
X-Received: by 2002:a05:7301:4718:b0:369:fbc1:89c2 with SMTP id 5a478bee46e88-3856e63afdbmr2767679eec.8.1795180515753;
        Fri, 20 Nov 2026 05:15:15 -0800 (PST)
Received: from localhost.localdomain ([103.108.57.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm8900527eec.22.2026.11.20.05.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:15:15 -0800 (PST)
From: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
To: linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	herbert@gondor.apana.org.au,
	robh@kernel.org
Cc: krzk@kernel.org,
	conor+dt@kernel.org,
	ruud.derwig@gf.com,
	rbannerm@synopsys.com,
	manjunath.hadli@vayavyalabs.com,
	adityak@vayavyalabs.com,
	navami.telsang@vayavyalabs.com,
	bhoomikak@vayavyalabs.com,
	nazim.khan@vayavyalabs.com,
	Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
Subject: [PATCH v31 4/4] crypto: spacc - Add SPAcc Kconfig and Makefile
Date: Fri, 20 Nov 2026 18:44:04 +0530
Message-Id: <20261120131404.976959-5-pavitrakumarm@vayavyalabs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261120131404.976959-1-pavitrakumarm@vayavyalabs.com>
References: <20261120131404.976959-1-pavitrakumarm@vayavyalabs.com>
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

Add Makefile and Kconfig for SPAcc driver.

Acked-by: Ross Bannerman <rbannerm@synopsys.com>
Signed-off-by: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
---
 drivers/crypto/Kconfig            |  1 +
 drivers/crypto/Makefile           |  1 +
 drivers/crypto/dwc-spacc/Kconfig  | 64 +++++++++++++++++++++++++++++++
 drivers/crypto/dwc-spacc/Makefile |  7 ++++
 4 files changed, 73 insertions(+)
 create mode 100644 drivers/crypto/dwc-spacc/Kconfig
 create mode 100644 drivers/crypto/dwc-spacc/Makefile

diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
index adcbe15851899..ece06af788132 100644
--- a/drivers/crypto/Kconfig
+++ b/drivers/crypto/Kconfig
@@ -738,6 +738,7 @@ config CRYPTO_DEV_BCM_SPU
 	  ahash, and aead algorithms with the kernel cryptographic API.

 source "drivers/crypto/stm32/Kconfig"
+source "drivers/crypto/dwc-spacc/Kconfig"

 config CRYPTO_DEV_SAFEXCEL
 	tristate "Inside Secure's SafeXcel cryptographic engine driver"
diff --git a/drivers/crypto/Makefile b/drivers/crypto/Makefile
index 2c33b83f3cfa6..b80f211598bbc 100644
--- a/drivers/crypto/Makefile
+++ b/drivers/crypto/Makefile
@@ -40,6 +40,7 @@ obj-$(CONFIG_CRYPTO_DEV_BCM_SPU) += bcm/
 obj-y += inside-secure/
 obj-$(CONFIG_CRYPTO_DEV_ARTPEC6) += axis/
 obj-y += xilinx/
+obj-y += dwc-spacc/
 obj-y += hisilicon/
 obj-$(CONFIG_CRYPTO_DEV_AMLOGIC_GXL) += amlogic/
 obj-y += intel/
diff --git a/drivers/crypto/dwc-spacc/Kconfig b/drivers/crypto/dwc-spacc/Kconfig
new file mode 100644
index 0000000000000..b8a7d04209112
--- /dev/null
+++ b/drivers/crypto/dwc-spacc/Kconfig
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config CRYPTO_DEV_SPACC
+	tristate "Support for dwc_spacc Security Protocol Accelerator"
+	depends on HAS_DMA
+	depends on HAS_IOMEM
+	select CRYPTO_ENGINE
+	select CRYPTO_HASH if CRYPTO_DEV_SPACC_HASH
+	select CRYPTO_SHA1 if CRYPTO_DEV_SPACC_HASH
+	select CRYPTO_MD5 if CRYPTO_DEV_SPACC_HASH
+	select CRYPTO_SHA256 if CRYPTO_DEV_SPACC_HASH
+	select CRYPTO_SHA512 if CRYPTO_DEV_SPACC_HASH
+	select CRYPTO_SHA3 if CRYPTO_DEV_SPACC_HASH
+	select CRYPTO_HMAC if CRYPTO_DEV_SPACC_HASH
+	select CRYPTO_CMAC if CRYPTO_DEV_SPACC_HASH
+	select CRYPTO_XCBC if CRYPTO_DEV_SPACC_HASH
+	select CRYPTO_SM4_GENERIC if CRYPTO_DEV_SPACC_HASH
+	default n
+
+	help
+	  This enables support for SPAcc Hardware Accelerator.
+
+if CRYPTO_DEV_SPACC
+
+config CRYPTO_DEV_SPACC_HASH
+	bool "Enable HASH functionality"
+	default CRYPTO_DEV_SPACC
+	help
+	  Say y to enable Hash functionality of SPAcc.
+
+config CRYPTO_DEV_SPACC_AUTODETECT
+	bool "Enable Autodetect functionality"
+	default n
+	help
+	  Say y to enable Autodetect functionality of SPAcc.
+
+config CRYPTO_DEV_SPACC_DEBUG_TRACE_IO
+	bool "Enable Trace MMIO reads/writes stats"
+	default n
+	help
+	  Say y to enable Trace MMIO reads/writes stats.
+	  To Debug and trace IO register read/write operations.
+
+config CRYPTO_DEV_SPACC_DEBUG_TRACE_DDT
+	bool "Enable Trace DDT entries stats"
+	default n
+	help
+	  Say y to enable Enable DDT entry stats.
+	  To Debug and trace DDT operation
+
+config CRYPTO_DEV_SPACC_SECURE_MODE
+	bool "Enable Spacc secure mode stats"
+	default n
+	help
+	  Say y to enable SPAcc secure modes stats.
+
+config CRYPTO_DEV_SPACC_CONFIG_DEBUG
+	bool "Enable SPAcc debug logs"
+	default n
+	help
+	  Say y to enable additional debug prints and diagnostics in the
+	  SPAcc driver. Disable this for production builds.
+
+endif # CRYPTO_DEV_SPACC
diff --git a/drivers/crypto/dwc-spacc/Makefile b/drivers/crypto/dwc-spacc/Makefile
new file mode 100644
index 0000000000000..b7125a7797ba0
--- /dev/null
+++ b/drivers/crypto/dwc-spacc/Makefile
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_CRYPTO_DEV_SPACC) += snps-spacc.o
+
+snps-spacc-y := spacc_hal.o spacc_core.o \
+spacc_manager.o spacc_interrupt.o spacc_device.o
+
+snps-spacc-$(CONFIG_CRYPTO_DEV_SPACC_HASH) += spacc_ahash.o
--
2.25.1

