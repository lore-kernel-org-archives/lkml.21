Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795464428;
	b=3Y7k6zLVMADWepyWxy2TUzWVmezgfNi8jBnXgGRjBGO/s4HMKHF3/If47XiEVgGY3/YE
	 n6LEUuerqa7T6zLKXFkLp7hQVCL3YtuuN9peyEbfkoMlYz6yqxIrQeUm9RMsUYrwvEbHQ
	 RYrCPjxESDvHXGcj7QNGuF3h7QqoABdUX9h7GCbyi31O65zkJ1dCy2XaaDvo2ggG8sCqM
	 KYYZOKQh2GdQc1rxqtzJyfQqByhueyhXk7zxv0xxvCtfig3vIrRs2OawJ60/RcFmjFfTC
	 BDhA0HYRfWsckqU/Il/0vZvI5TM69dztQWCCihNk/302X6YnqrMboX2Jsh/kwJSwP1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795464428;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=a2ziQehWCmdgrGG7cVUPIQm6dAT6aWiKHtE95x15y8o=;
	b=Wl8N32ptvmOmCny9bxPzoCl9vy0G3TLFPe/0QO/6ZHqdu53zN2EZlNPjaiLbxr3bGX+H
	 9BLWyN9RJLVcaTulxS3thQw+NQB7CM7r9YeVzEngx9lVHNb9EoYy+sSh0TR8ASDJFWmsU
	 3Zt5+5JEXJBPeQbOIOkE8xF47QI8uznKM3lXLb2kxb+qCD7XCmS9/2VJTgS5FrUHieJiY
	 wZQF43YFHpUHoH4rcIS13XYMtbDJ6os/jONjxfQwGZsz5v9eV5JstRX0Ook5chooXbJ3g
	 sy2EhXO8BKupdrBwJ3kek+iVSXX4d4ZLPbj39kMG2bRcHdwj6r0BdaA41LHRJsClLmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BSe2t1Vx;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77476606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:07:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77476606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BSe2t1Vx
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2f04fab527eso26943245ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795464427; x=1796069227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a2ziQehWCmdgrGG7cVUPIQm6dAT6aWiKHtE95x15y8o=;
        b=BSe2t1Vxxt/GUuaXF6Rle1jjuc26YmcHWoFPxyzA1scFiUmskTGduJNViX87Ro2WQm
         SVftky6KMPlwmk8HRA/9q+ZU1eMYqQ6txsOPNwWFxgToZvnp4BwVh7PbU+OL8T99PdYk
         Ttte9qUXz2nAwPZl8uKVeYgK6FXkoTVyfqBtABi34cj6OGKywl1rjdwfwXCKvI/ffadt
         P24q3ZOXtEpNI8wV8wKsKQDCaibivK58M2Ub/f+CXn3aXo8RJ1Jr+/yvMqdgR17yFOQn
         zD8XzPybhy/oTjGblfOQqZ9l4WIj3uhOaoodcWvs/dGmpd2OvL/CbGRtwdYQvGVmqMXe
         RYZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795464427; x=1796069227;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a2ziQehWCmdgrGG7cVUPIQm6dAT6aWiKHtE95x15y8o=;
        b=VeDElD8TR7TaHsLGcishB08ESEGj4yZZEwlXeGUO8ZMNPTGbQGFxT27HpkLbz1AyNU
         i/X1OgJX3GpWXJ/5sPrdV7WFIyXOBuxYwJoMFDdPwczbxesYpwZhCbpXHSjYe66DrLSA
         rmOQ62m7X5ouZzUw9UlA7ablfClwiiEdn/WSUG+CAdiEO4IPpHlNHQhKWfWSHpJoXUxC
         r3UZ0d2Gic0ML3C7dBG0c8hxu/dCJSLbK51quw4WRihPqpcbLzBkZb/RULbwh287LAeK
         Lf1YGUJyO2xq9u4vxyxp3o9BQJz/v4VqAdu9O+tpGe65mUJwuLrZnv4JyU+3TZDjSlc+
         ejYw==
X-Forwarded-Encrypted: i=1; AL+hErHp+hMvnKw6IIZ4kmf1L/yK2wu0eAnGEtnW2yTpH52TFrNEIDS8zCghJiHVcMC3rVwodG6TxjzyVvrWaOk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9FWuVci+vhylCLPhZXXVfcDkKW1NR+3LN+rCoO4HHk77venma7
	+nzGBqWehW4Ua1HKx4wWuzz15vQ1N7meY3IuAmBD/1LdEOR6y4qX9h86
X-Gm-Gg: AZFdTZeh0BMA8knuxc2jnFtUf4uniHCkpxp8cKw900CXQFMA7LTmOpC13yHc1+8G+4s
	ilT9KCxv+p8v7GkVTI28JsinkuyYBwHBWk/TlRX46dteK8//xyXtC22ivs+LzauxazhJWZ/Ttsy
	AEsF+kBUNFTA6zL1dJ1M55s0QOw9k2W4+Nuy6oDs7EwXZktN/ve8KdKnJz0159YrxYedFwab0Eu
	fwuMrcuXznWfGN3cylmDQ3eZXaiF5k/0eMwsjyTCrfrr/EKAmkMWc7UJ2ceNNxLf4T1hyS9TP/L
	3WHMtUsqGaWHWowwru3EbRUg84emUalBrwrzLFDX+NyCX39nie9SmMIur0GzE3lNb7AMl141TXG
	wT9ip8pLBOn4czuleGdFpiZBAP8odQbNr/9kAf5FgsP7RiBvgqkRLvhA2CzFpORvMIhzW+9Kc7v
	fmzHAnq5NPKutD9bwWMjqX2ATlvHtYU6/cHCNHkdooij+Jx1vTu9t3unvq+EeKiIkV7FoKm/TcF
	65EmqbGwF6wIijRyavtF9+QyN0BK2vyJqzOi5BdA7gA9EvHZ4v7xttSLqzMKplvOtzhDcdHRyzv
	NKaeH57QmkseaqV5QPyrr8Srh6+U1w6dlHG8QuJA6yb4DPgJrltlUtX5yUm6QB2xlGHH8hoCdA=
	=
X-Received: by 2002:a17:902:e80b:b0:2e9:660a:7944 with SMTP id d9443c01a7336-2f03f2689eemr126770635ad.58.1795464426593;
        Mon, 23 Nov 2026 12:07:06 -0800 (PST)
Received: from X.tail7c3ebe.ts.net ([103.190.40.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0b8a43768sm3092515ad.31.2026.11.23.12.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:07:05 -0800 (PST)
From: Abhishek Chaulagain <chaulagainavishek14@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Abhishek Chaulagain <chaulagainavishek14@gmail.com>
Subject: [PATCH] media: atomisp: Remove unused timed controller code
Date: Mon, 23 Nov 2026 20:06:58 +0000
Message-ID: <20261123200658.449-1-chaulagainavishek14@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The timed controller HAL module - timed_ctrl_snd_commnd(),
timed_ctrl_snd_sp_commnd(), timed_ctrl_snd_gpio_commnd() and the inline
timed_ctrl_reg_store() helper they used - has no callers anywhere in the
tree. The only remaining reference was a stale #include in sh_css.c that
pulled in none of its symbols.

Remove the dead source file, its public/private/local/global headers and
the timed_controller_defs.h definitions header (included only by this
module), drop the object from the Makefile, and delete the unused include
from sh_css.c.

The timed_ctrl device identifiers (timed_ctrl_ID_t, TIMED_CTRL0_ID,
N_TIMED_CTRL_ID, TIMED_CTRL_BASE) live in the shared system_global.h /
system_local.* enumerations and are left untouched.

No functional change intended.

Signed-off-by: Abhishek Chaulagain <chaulagainavishek14@gmail.com>
---
 drivers/staging/media/atomisp/Makefile        |  1 -
 .../pci/hive_isp_css_common/host/timed_ctrl.c | 66 -------------------
 .../host/timed_ctrl_local.h                   | 12 ----
 .../host/timed_ctrl_private.h                 | 26 --------
 .../hive_isp_css_common/timed_ctrl_global.h   | 46 -------------
 .../host/timed_ctrl_public.h                  | 51 --------------
 .../pci/hive_isp_css_include/timed_ctrl.h     | 37 -----------
 drivers/staging/media/atomisp/pci/sh_css.c    |  1 -
 .../media/atomisp/pci/timed_controller_defs.h | 14 ----
 9 files changed, 254 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/pci/hive_isp_css_common/host/timed_ctrl.c
 delete mode 100644 drivers/staging/media/atomisp/pci/hive_isp_css_common/host/timed_ctrl_local.h
 delete mode 100644 drivers/staging/media/atomisp/pci/hive_isp_css_common/host/timed_ctrl_private.h
 delete mode 100644 drivers/staging/media/atomisp/pci/hive_isp_css_common/timed_ctrl_global.h
 delete mode 100644 drivers/staging/media/atomisp/pci/hive_isp_css_include/host/timed_ctrl_public.h
 delete mode 100644 drivers/staging/media/atomisp/pci/hive_isp_css_include/timed_ctrl.h
 delete mode 100644 drivers/staging/media/atomisp/pci/timed_controller_defs.h

diff --git a/drivers/staging/media/atomisp/Makefile b/drivers/staging/media/atomisp/Makefile
index 1d0fbe220..2680e40d9 100644
--- a/drivers/staging/media/atomisp/Makefile
+++ b/drivers/staging/media/atomisp/Makefile
@@ -145,7 +145,6 @@ atomisp-objs += \
 	pci/hive_isp_css_common/host/isp.o \
 	pci/hive_isp_css_common/host/mmu.o \
 	pci/hive_isp_css_common/host/sp.o \
-	pci/hive_isp_css_common/host/timed_ctrl.o \
 	pci/hive_isp_css_common/host/vmem.o \
 	pci/hive_isp_css_shared/host/tag.o \
 	pci/system_local.o \
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/timed_ctrl.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/timed_ctrl.c
deleted file mode 100644
index 948b0b0a0..000000000
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/timed_ctrl.c
+++ /dev/null
@@ -1,66 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Support for Intel Camera Imaging ISP subsystem.
- * Copyright (c) 2015, Intel Corporation.
- */
-
-#include "timed_ctrl.h"
-
-#ifndef __INLINE_TIMED_CTRL__
-#include "timed_ctrl_private.h"
-#endif /* __INLINE_TIMED_CTRL__ */
-
-#include "assert_support.h"
-
-void timed_ctrl_snd_commnd(
-    const timed_ctrl_ID_t			ID,
-    hrt_data				mask,
-    hrt_data				condition,
-    hrt_data				counter,
-    hrt_address				addr,
-    hrt_data				value)
-{
-	OP___assert(ID == TIMED_CTRL0_ID);
-	OP___assert(TIMED_CTRL_BASE[ID] != (hrt_address)-1);
-
-	timed_ctrl_reg_store(ID, _HRT_TIMED_CONTROLLER_CMD_REG_IDX, mask);
-	timed_ctrl_reg_store(ID, _HRT_TIMED_CONTROLLER_CMD_REG_IDX, condition);
-	timed_ctrl_reg_store(ID, _HRT_TIMED_CONTROLLER_CMD_REG_IDX, counter);
-	timed_ctrl_reg_store(ID, _HRT_TIMED_CONTROLLER_CMD_REG_IDX, (hrt_data)addr);
-	timed_ctrl_reg_store(ID, _HRT_TIMED_CONTROLLER_CMD_REG_IDX, value);
-}
-
-/* pqiao TODO: make sure the following commands get
-	correct BASE address both for csim and android */
-
-void timed_ctrl_snd_sp_commnd(
-    const timed_ctrl_ID_t			ID,
-    hrt_data				mask,
-    hrt_data				condition,
-    hrt_data				counter,
-    const sp_ID_t				SP_ID,
-    hrt_address				offset,
-    hrt_data				value)
-{
-	OP___assert(SP_ID < N_SP_ID);
-	OP___assert(SP_DMEM_BASE[SP_ID] != (hrt_address)-1);
-
-	timed_ctrl_snd_commnd(ID, mask, condition, counter,
-			      SP_DMEM_BASE[SP_ID] + offset, value);
-}
-
-void timed_ctrl_snd_gpio_commnd(
-    const timed_ctrl_ID_t			ID,
-    hrt_data				mask,
-    hrt_data				condition,
-    hrt_data				counter,
-    const gpio_ID_t				GPIO_ID,
-    hrt_address				offset,
-    hrt_data				value)
-{
-	OP___assert(GPIO_ID < N_GPIO_ID);
-	OP___assert(GPIO_BASE[GPIO_ID] != (hrt_address)-1);
-
-	timed_ctrl_snd_commnd(ID, mask, condition, counter,
-			      GPIO_BASE[GPIO_ID] + offset, value);
-}
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/timed_ctrl_local.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/timed_ctrl_local.h
deleted file mode 100644
index bf97f272a..000000000
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/timed_ctrl_local.h
+++ /dev/null
@@ -1,12 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Support for Intel Camera Imaging ISP subsystem.
- * Copyright (c) 2010-2015, Intel Corporation.
- */
-
-#ifndef __TIMED_CTRL_LOCAL_H_INCLUDED__
-#define __TIMED_CTRL_LOCAL_H_INCLUDED__
-
-#include "timed_ctrl_global.h"
-
-#endif /* __TIMED_CTRL_LOCAL_H_INCLUDED__ */
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/timed_ctrl_private.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/timed_ctrl_private.h
deleted file mode 100644
index 7b90b4cf0..000000000
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/timed_ctrl_private.h
+++ /dev/null
@@ -1,26 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Support for Intel Camera Imaging ISP subsystem.
- * Copyright (c) 2010-2015, Intel Corporation.
- */
-
-#ifndef __TIMED_CTRL_PRIVATE_H_INCLUDED__
-#define __TIMED_CTRL_PRIVATE_H_INCLUDED__
-
-#include "timed_ctrl_public.h"
-
-#include "device_access.h"
-
-#include "assert_support.h"
-
-STORAGE_CLASS_TIMED_CTRL_C void timed_ctrl_reg_store(
-    const timed_ctrl_ID_t	ID,
-    const unsigned int		reg,
-    const hrt_data			value)
-{
-	OP___assert(ID < N_TIMED_CTRL_ID);
-	OP___assert(TIMED_CTRL_BASE[ID] != (hrt_address) - 1);
-	ia_css_device_store_uint32(TIMED_CTRL_BASE[ID] + reg * sizeof(hrt_data), value);
-}
-
-#endif /* __GP_DEVICE_PRIVATE_H_INCLUDED__ */
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/timed_ctrl_global.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/timed_ctrl_global.h
deleted file mode 100644
index e4c136660..000000000
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/timed_ctrl_global.h
+++ /dev/null
@@ -1,46 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Support for Intel Camera Imaging ISP subsystem.
- * Copyright (c) 2015, Intel Corporation.
- */
-
-#ifndef __TIMED_CTRL_GLOBAL_H_INCLUDED__
-#define __TIMED_CTRL_GLOBAL_H_INCLUDED__
-
-#define IS_TIMED_CTRL_VERSION_1
-
-#include "timed_controller_defs.h"
-
-/*
- * Order of the input bits for the timed controller taken from
- * ISP_CSS_2401 System Architecture Description valid for
- * 2400, 2401.
- *
- * Check for other systems.
- */
-#define HIVE_TIMED_CTRL_GPIO_PIN_0_BIT_ID                       0
-#define HIVE_TIMED_CTRL_GPIO_PIN_1_BIT_ID                       1
-#define HIVE_TIMED_CTRL_GPIO_PIN_2_BIT_ID                       2
-#define HIVE_TIMED_CTRL_GPIO_PIN_3_BIT_ID                       3
-#define HIVE_TIMED_CTRL_GPIO_PIN_4_BIT_ID                       4
-#define HIVE_TIMED_CTRL_GPIO_PIN_5_BIT_ID                       5
-#define HIVE_TIMED_CTRL_GPIO_PIN_6_BIT_ID                       6
-#define HIVE_TIMED_CTRL_GPIO_PIN_7_BIT_ID                       7
-#define HIVE_TIMED_CTRL_GPIO_PIN_8_BIT_ID                       8
-#define HIVE_TIMED_CTRL_GPIO_PIN_9_BIT_ID                       9
-#define HIVE_TIMED_CTRL_GPIO_PIN_10_BIT_ID                      10
-#define HIVE_TIMED_CTRL_GPIO_PIN_11_BIT_ID                      11
-#define HIVE_TIMED_CTRL_IRQ_SP_BIT_ID                           12
-#define HIVE_TIMED_CTRL_IRQ_ISP_BIT_ID                          13
-#define HIVE_TIMED_CTRL_IRQ_INPUT_SYSTEM_BIT_ID                 14
-#define HIVE_TIMED_CTRL_IRQ_INPUT_SELECTOR_BIT_ID               15
-#define HIVE_TIMED_CTRL_IRQ_IF_BLOCK_BIT_ID                     16
-#define HIVE_TIMED_CTRL_IRQ_GP_TIMER_0_BIT_ID                   17
-#define HIVE_TIMED_CTRL_IRQ_GP_TIMER_1_BIT_ID                   18
-#define HIVE_TIMED_CTRL_CSI_SOL_BIT_ID                          19
-#define HIVE_TIMED_CTRL_CSI_EOL_BIT_ID                          20
-#define HIVE_TIMED_CTRL_CSI_SOF_BIT_ID                          21
-#define HIVE_TIMED_CTRL_CSI_EOF_BIT_ID                          22
-#define HIVE_TIMED_CTRL_IRQ_IS_STREAMING_MONITOR_BIT_ID         23
-
-#endif /* __TIMED_CTRL_GLOBAL_H_INCLUDED__ */
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/timed_ctrl_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/timed_ctrl_public.h
deleted file mode 100644
index 51e0bc0d0..000000000
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/timed_ctrl_public.h
+++ /dev/null
@@ -1,51 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Support for Intel Camera Imaging ISP subsystem.
- * Copyright (c) 2015, Intel Corporation.
- */
-
-#ifndef __TIMED_CTRL_PUBLIC_H_INCLUDED__
-#define __TIMED_CTRL_PUBLIC_H_INCLUDED__
-
-#include "system_local.h"
-
-/*! Write to a control register of TIMED_CTRL[ID]
-
- \param	ID[in]				TIMED_CTRL identifier
- \param	reg_addr[in]		register byte address
- \param value[in]			The data to be written
-
- \return none, TIMED_CTRL[ID].ctrl[reg] = value
- */
-STORAGE_CLASS_TIMED_CTRL_H void timed_ctrl_reg_store(
-    const timed_ctrl_ID_t	ID,
-    const unsigned int		reg_addr,
-    const hrt_data			value);
-
-void timed_ctrl_snd_commnd(
-    const timed_ctrl_ID_t				ID,
-    hrt_data				mask,
-    hrt_data				condition,
-    hrt_data				counter,
-    hrt_address				addr,
-    hrt_data				value);
-
-void timed_ctrl_snd_sp_commnd(
-    const timed_ctrl_ID_t				ID,
-    hrt_data				mask,
-    hrt_data				condition,
-    hrt_data				counter,
-    const sp_ID_t			SP_ID,
-    hrt_address				offset,
-    hrt_data				value);
-
-void timed_ctrl_snd_gpio_commnd(
-    const timed_ctrl_ID_t				ID,
-    hrt_data				mask,
-    hrt_data				condition,
-    hrt_data				counter,
-    const gpio_ID_t			GPIO_ID,
-    hrt_address				offset,
-    hrt_data				value);
-
-#endif /* __TIMED_CTRL_PUBLIC_H_INCLUDED__ */
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/timed_ctrl.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/timed_ctrl.h
deleted file mode 100644
index b8f48b3c9..000000000
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/timed_ctrl.h
+++ /dev/null
@@ -1,37 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Support for Intel Camera Imaging ISP subsystem.
- * Copyright (c) 2015, Intel Corporation.
- */
-
-#ifndef __TIMED_CTRL_H_INCLUDED__
-#define __TIMED_CTRL_H_INCLUDED__
-
-/*
- * This file is included on every cell {SP,ISP,host} and on every system
- * that uses the input system device(s). It defines the API to DLI bridge
- *
- * System and cell specific interfaces and inline code are included
- * conditionally through Makefile path settings.
- *
- *  - .        system and cell agnostic interfaces, constants and identifiers
- *	- public:  system agnostic, cell specific interfaces
- *	- private: system dependent, cell specific interfaces & inline implementations
- *	- global:  system specific constants and identifiers
- *	- local:   system and cell specific constants and identifiers
- */
-
-#include "system_local.h"
-#include "timed_ctrl_local.h"
-
-#ifndef __INLINE_TIMED_CTRL__
-#define STORAGE_CLASS_TIMED_CTRL_H extern
-#define STORAGE_CLASS_TIMED_CTRL_C
-#include "timed_ctrl_public.h"
-#else  /* __INLINE_TIMED_CTRL__ */
-#define STORAGE_CLASS_TIMED_CTRL_H static inline
-#define STORAGE_CLASS_TIMED_CTRL_C static inline
-#include "timed_ctrl_private.h"
-#endif /* __INLINE_TIMED_CTRL__ */
-
-#endif /* __TIMED_CTRL_H_INCLUDED__ */
diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 4a182dc38..e3942362c 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -60,7 +60,6 @@
 #include "gp_device.h"		/* gp_device_reg_store() */
 #include <gpio_global.h>
 #include <gpio_private.h>
-#include "timed_ctrl.h"
 #include "ia_css_inputfifo.h"
 #define WITH_PC_MONITORING  0
 
diff --git a/drivers/staging/media/atomisp/pci/timed_controller_defs.h b/drivers/staging/media/atomisp/pci/timed_controller_defs.h
deleted file mode 100644
index 37a9226c6..000000000
--- a/drivers/staging/media/atomisp/pci/timed_controller_defs.h
+++ /dev/null
@@ -1,14 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Support for Intel Camera Imaging ISP subsystem.
- * Copyright (c) 2015, Intel Corporation.
- */
-
-#ifndef _timed_controller_defs_h
-#define _timed_controller_defs_h
-
-#define _HRT_TIMED_CONTROLLER_CMD_REG_IDX 0
-
-#define _HRT_TIMED_CONTROLLER_REG_ALIGN 4
-
-#endif /* _timed_controller_defs_h */
-- 
2.43.0

