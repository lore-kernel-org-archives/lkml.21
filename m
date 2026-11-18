Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794983757;
	b=XZTcGVd5898UOUC7XCjEQS+UiWBF5Zq2N53QwJdRlnTdJUJHIqjYPtIJu4av8rCKXwJ0
	 8KU6O1cD3LIh7Sz09ltnSFHr6lpDv0L/CSezQhfsC7jach7yKMITR5tvDrxX/aoqClCGL
	 FbBMm2XRFfK6BpcHuxJqZ0WMlAwueZ1FZ4koV8TEFHNSR7iteJtAlIgwweflkJr/5MoCs
	 eCTC9Zi4KTjl3ho7D15re/ebdgaOHNldRa91koi0xZHGkbsegO6wDYqXSskFW6nRgzRGP
	 3X34lpwDTsIKl/hQjIopYYtAo6K8Qa6P4BZo/e0eqrLgJ4qBK3X8aRVJfIJwTwfz9jQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794983757;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0W7YU0nqnNfpCHH55J3ba3Gg8nFzbCN2KphX9SzD9hg=;
	b=IQhkmyZA8DknNFCr81t/2BTYPQuYH2VYaqWR7SjgGxYizCE1ioKePw/XcNAH1pvLtb7p
	 /f+FYS/dwt1aYMU//AjX2547TPn3oprppVtjLGSJRsl43tO0e+juZefbrfss7H0MKVOzP
	 bYjFcJjIJ2SezITXcsXlAvg+Fr1LlsBrljxwBFokCnK0zAKFg+jLbHRaEwhu26Sx2Lfin
	 AyP62etnTM+IzNuSSFIgnv/dRlwMLw10lGR+seD9KBM9iIHWL0PDIpMq2PedYxGXib+y5
	 ALQQACyp0AhBi+ab8udA184GzP5yiarWAx7GI/NNL4pq9VuIffEzcHo+FxfNjyFVmvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=vayavyalabs.com;
	spf=pass smtp.mailfrom=vayavyalabs.com;
	dkim=pass header.d=vayavyalabs.com header.i=@vayavyalabs.com header.a=rsa-sha256 header.s=google header.b="BUGIq/fI";
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84765606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:35:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84765606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.a=rsa-sha256 header.s=google header.b=BUGIq/fI
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-37198ed3727so2075656eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1794983756; x=1795588556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0W7YU0nqnNfpCHH55J3ba3Gg8nFzbCN2KphX9SzD9hg=;
        b=BUGIq/fIO9uIOIrlMQDHeKoCPKKxf4/yFsMrJpX1DTpgJZx3b4wOoHjQ+P3MMABBUm
         xGQr341C8zrbAG7AjCtmuqzMUM4tPmT3y2XbSZzSs8zx+83mZzYu/gVp1YPII4eWhP+b
         1+I6Ax3+vs0vJKIMDFgv6JTGJSvfP5ex/gJpk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794983756; x=1795588556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0W7YU0nqnNfpCHH55J3ba3Gg8nFzbCN2KphX9SzD9hg=;
        b=PGpQ/ApnD5mGHjUUD5l3kvmcLe62ia88yLHZTFiOqzmbiauYqKj0KVmthicfYVsb3P
         NRESSIkEGbp5+ttIxHB3sJg5uKR8TKU2uAHchpuZHjOgJ327JTCLLBNDnAoDwRda8i3o
         /V7f2R07lL4f7NvZJ0DIYm8COEyISAjnFjJYSEfQoYc7M0kMkCMWXTBWqO+EkoKfhNNU
         IBeh63yl0xNYsmQliIwsF6FGtRIfWkao9X4MS6vn7B34JkKNExRH6kU9rKH3Of6TL0Lt
         iEkUaNpZpobacN+Y3cvwAjzFUr64WgzL9dqU0VqrcZAwelVLJHf/FheR9BXlYi5etifH
         W5UQ==
X-Forwarded-Encrypted: i=1; AL+hErGBm6c0O64ZqhVZTW7ebqTJUR2O13PtytFrLqlHvaGJzZaHJGKHX8oCBEGMDZ507vem97IQojJs/3A6vC8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+RS59dCg05H/16U73gixasIUTP/X/9T6Tf9iMazOQ6bWFqBoMO
	W7Xhzoqn8ZVVl64857DazuIfQG1gd6EEhrIWqFIMH/sNwguhrFcBT8Xtm2bKZ9bbhBk=
X-Gm-Gg: AZFdTZcQ025E+hRsF0yuQEBNflmXYmdavTK48um/zCjC27JTo4vmK5eSJubwsXtY8ut
	2fpiFr5yP00mU7DT7Mjt6e4O59Yftmz7kHKVCh37eMvyMKAyTLPIhei2QFw+oJPdavudOtedsBG
	vlUjrAHjzT7UUOqDIRXXLzD0lQdsoJySDVayz1eK+Nz5H8wN0KFUpnwPAJq9yuYstGWRVKaXBZA
	RJO71eIqH8DcRnpVgwRBwefsPzSNm9GJOPZpiC0GuJTR/kFgSBasX1cHKItEQVsusyjC1HWO5Ef
	Pcy+Bew7NN6pnCEpC+DHC5wa8t4rZUkeZxajFBUNl2FpUzj8LuVimkeEaw7kp3HVxnvWBIIeEMn
	1i50kVNdxqN8B37n9gCe3qMtlzVs3JdfH2tTDreRYxHMg8JhBl3YXhs0wDLvGz5xExEcfxMEr41
	qNFtQYU9HSI53w79Br5NDAGvWvuAQFx7/D3w+0wI99aP//YnKWI8kVO6arOtJW18WT8MUAux9Zk
	bHmZM6eOiq/j6wciPgqcKpnMoYEN9ToOGkBYVILjTPIaYoZPoXmBV0fKb9dHNQWCt85j7qy5f+F
	pUjdJ14GZguqoaN1ds+W0HCBi9koLR3KwCUoUO1j78UA/cWswNalhFA8x9g7EdNehzEuuka9JYe
	jhFhHEZQ+IVfPFMGYUnc3M8xUNeawfCjdTdqV2fcLd05vMm2XqKK8YdLPGSArybgnz+KI
X-Received: by 2002:a05:7301:2019:b0:36a:2f6c:490e with SMTP id 5a478bee46e88-3810e419e97mr4421701eec.6.1794983755563;
        Tue, 17 Nov 2026 22:35:55 -0800 (PST)
Received: from localhost.localdomain ([103.219.60.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a72eb2f3sm5002338eec.18.2026.11.17.22.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:35:55 -0800 (PST)
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
Subject: [PATCH v30 4/4] crypto: spacc - Add SPAcc Kconfig and Makefile
Date: Wed, 18 Nov 2026 12:05:04 +0530
Message-Id: <20261118063504.835259-5-pavitrakumarm@vayavyalabs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261118063504.835259-1-pavitrakumarm@vayavyalabs.com>
References: <20261118063504.835259-1-pavitrakumarm@vayavyalabs.com>
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
index 0189dfdcbbe11..e0a8de643d6fa 100644
--- a/drivers/crypto/Kconfig
+++ b/drivers/crypto/Kconfig
@@ -734,6 +734,7 @@ config CRYPTO_DEV_BCM_SPU
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

