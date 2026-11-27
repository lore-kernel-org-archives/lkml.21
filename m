Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795760014;
	b=mrvwJz4o+JEILUMbeNAhiDpBJa9jzoSx+9nBCLKYVMdL01/+9PYp8VSr/Xyr995kMYSy
	 LRy1h2EtMXMRrIsN0IZ2WZkooroRNIqM++2PSiSI+mwnbRRDH6uPLenfFFh94rBNXUULf
	 II+POpwK1LY2mYfSoz4YtI3NmncPxn0s1dVHJaahfGmx14IRK4gaiGp9M6aZSJ5rHACzJ
	 aCX2dn7rFa9T4inTkZX7g/RCi4bue+o03CsyKI92wSTgIzY+waEub/SEhm8qK1pdK1k2z
	 79tvjIyBQPkgbYIVWVS1B4XAqvJz698DN0YNsz83ZRDgjD3IeC/6ctE4EN5BxD3GG1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795760014;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pli2p43xNZADKHDdBmlZ/K+lxLFyJUZUfBMnzmYwoNY=;
	b=QqT1FrCHBZaRcFjK4yutipazAj7QSvu2fU9/m6OCaZVlzpEm5KG9ezC1iZZbMjSMmvkx
	 h/2nt+mqpEWdmr5QwD5DPlF+BjfP+0GoIiD3r/92L7BjoFmkpstQuaAEIKcY6fFGlLQXx
	 /mbKOsgmU1r/wHydb9KNRH0u3Z4ZsKu7aE0g+OjO89/e+EJTtajaFumbmsHWwcSyf4zYr
	 JAtSjRBJsWJuRlDOjpZs1PCSVpBbU791Rq5tmZt/2YHED0jotEYbwE2kpo5vf2oxVHSY2
	 hLOoqvOxebc4UZlZxpO+4K5Ffo7pFb8DRnWruQTh1GnMjZfya2sqUZA+R/qe0ioZAvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B8yuSs8o;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39EEC606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 06:13:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39EEC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B8yuSs8o
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-386c336eab8so4177605eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 22:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795760013; x=1796364813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pli2p43xNZADKHDdBmlZ/K+lxLFyJUZUfBMnzmYwoNY=;
        b=B8yuSs8oKFBJPGU6HEjxReMKErXxYSXqhuTZ0ePKBcX7zIt64IASi5hFeGvY73O/xl
         uKOPuXywNBpf643aV17JRE3/RsCk85eUXbdX148kLlld9V9IDwnclXTGTTghgFWEtEUn
         sXBqRibNNyIjMttLa3KgwCYnSURRbyvaO/AM+8HbORyKWa+BHhGIWAd+MIpeSxuWjL/c
         icXeLJYgKrs1Bvio4/xU0Ab7DiYOvil40iqEvcqF87mDbXh3FNcuXSDDQ3R++V/UoH8p
         Pmq7W5uQMvaZ6G76fXWVeKr52dVbplKWqw3KsAiRkR9hHijcu2tbShi3FRU63eVjC9ya
         Q6xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795760013; x=1796364813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pli2p43xNZADKHDdBmlZ/K+lxLFyJUZUfBMnzmYwoNY=;
        b=fdCBsHhrWtYX4GMfVqbKyt7qwXnLbJVNci7yNyWMjOfm+qzou4Pfba+kzBxUsWVsFi
         GI0wiBqX0kczMCo8sfkATdkYOajZrV5qzgnek91XaMO4O0mh44gU9rbZezzzlIqNM/jw
         rjypix2QE7g7LWtmJlDtA5ee2L/hTT8M95XIE4JeefXJca6dpjekJqJLZ51Trp7/c6PD
         5N4Ex1s9ulpERcz0DjP29b2JfBMG7sfeNrRmTkmkrxI85U6y1OTqOn1RMDh5eiAlbz2L
         eiymhsyOwZK1oGM0NkFdNEeAltQkxjHQCgOggL0Kdg9KzzY0EYXk2ZTmDVwYSGykCQgq
         c/AQ==
X-Forwarded-Encrypted: i=1; AL+hErGWrWzOHGs4PMK2vadMftGQBP7nAsJC9NHgy6VslQDb89u6X/MwKAnKAB1qEPkyZs00vZcuawwlwGkKXtU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+BSG9kzk15jX5IyUXD0POpaQMB2BawOm/D9JnB5jTP+z5J/6L1
	s7B+Z3vbZ46/SehK9dOleaXHbyqoRsLhCCnfwGhwCLDdyRw2WGAvAFYQ
X-Gm-Gg: AZFdTZfwm5Ax5ZpJt0bSV+PngASq45TIdcpmEz3RotvmpB68g2tiGmL+ia++bpoLUY/
	7Ihf3XVzDYHQsp+IxC/Er/2uEbTtMru8deGgr1iqYZOVVQTk2E4fpMpgyZG98W8L5n54p8ANFfS
	0n2HypUv+DVkJlll5oX7JH4PQAX7eiyS1hecSkllKe+fqrD7b510FdNjgLbEEUpJ6yE2LV6D03A
	dqVvlbx1OM0+2yZ7jqqckR2mMEjr+POen7y4e2uJM2FdCJqo7nKQV/MQPjEQxr0eD0dF6O9e/iu
	tup71wPqtLPnsldxrWwXHHhBGYBURKHN9thKiBTiqbxLiCfICGyHSj9FvacZtZJ3fOwYjjgq0jL
	wfr0S6UkoTLw5r2k8Z5dKkgN/bMGUOX463LaRit17cCWyaEG2aEy4h6RX5wK2vW6NlaEoWvP1pd
	zG9u2mwkrlW4VOuv/pYnrLl682/UTLP/Fa4/pBjnALx+TRcUQ5gb2VQvhtznOLHs5ADrLHwzvMs
	yKWrivB/v5X1VQjgQ2nLkSzXq1331g7wjM0iGlDbDaUK8xqlzUUW82bFtcHd+XPqcd8BnPXVI0o
	rJQzD0Pn1kJ/czXH35+FH9Ff/pDcV6l1VczpRZzXNvksz7tozAoOrv60AKhYNWbL1nR2CA==
X-Received: by 2002:a05:7300:51d4:b0:384:fef7:5876 with SMTP id 5a478bee46e88-384fef75c78mr26535715eec.24.1795760013363;
        Thu, 26 Nov 2026 22:13:33 -0800 (PST)
Received: from acemagic-m1.lan ([2401:7400:c804:b668:d6a6:bf90:ed18:c855])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm40300425eec.18.2026.11.26.22.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:13:33 -0800 (PST)
From: Ragul Balaji <ragulbaby@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	brcm80211@lists.linux.dev,
	Ragul Balaji <ragulbaby@gmail.com>,
	Ho Jie Feng <hjf3108@gmail.com>,
	linux-kernel@vger.kernel.org,
	brcm80211-dev-list.pdl@broadcom.com
Subject: [PATCH wireless-next v2 11/11] wifi: brcm80211: move the USB bootloader definitions to a shared header
Date: Fri, 27 Nov 2026 14:11:41 +0800
Message-ID: <20261127061147.506129-12-ragulbaby@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127061147.506129-1-ragulbaby@gmail.com>
References: <20261127061147.506129-1-ragulbaby@gmail.com>
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

The Broadcom USB bootloader downloads firmware the same way for other
USB chips than the FullMAC ones of brcmfmac.  Move its commands, states,
firmware header and response layouts from brcmfmac's usb.c to a header
in the shared include directory, so that other drivers can use them.

Signed-off-by: Ragul Balaji <ragulbaby@gmail.com>
Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 .../broadcom/brcm80211/brcmfmac/usb.c         | 68 +---------------
 .../broadcom/brcm80211/include/brcm_usb_rdl.h | 78 +++++++++++++++++++
 2 files changed, 79 insertions(+), 67 deletions(-)
 create mode 100644 drivers/net/wireless/broadcom/brcm80211/include/brcm_usb_rdl.h

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c
index b41949a9bd..e48f064682 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c
@@ -12,6 +12,7 @@
 #include <brcmu_utils.h>
 #include <brcm_hw_ids.h>
 #include <brcmu_wifi.h>
+#include <brcm_usb_rdl.h>
 #include "bus.h"
 #include "debug.h"
 #include "firmware.h"
@@ -26,8 +27,6 @@
 #define BRCMF_USB_RESET_GETVER_SPINWAIT	100	/* in unit of ms */
 #define BRCMF_USB_RESET_GETVER_LOOP_CNT	10
 
-#define BRCMF_POSTBOOT_ID		0xA123  /* ID to detect if dongle
-						   has boot up */
 #define BRCMF_USB_NRXQ			50
 #define BRCMF_USB_NTXQ			50
 
@@ -52,71 +51,6 @@ static const struct brcmf_firmware_mapping brcmf_usb_fwnames[] = {
 	BRCMF_FW_ENTRY(CY_CC_4373_CHIP_ID, 0xFFFFFFFF, 4373)
 };
 
-#define TRX_MAGIC		0x30524448	/* "HDR0" */
-#define TRX_MAX_OFFSET		3		/* Max number of file offsets */
-#define TRX_UNCOMP_IMAGE	0x20		/* Trx holds uncompressed img */
-#define TRX_RDL_CHUNK		1500		/* size of each dl transfer */
-#define TRX_OFFSETS_DLFWLEN_IDX	0
-
-/* Control messages: bRequest values */
-#define DL_GETSTATE	0	/* returns the rdl_state_t struct */
-#define DL_CHECK_CRC	1	/* currently unused */
-#define DL_GO		2	/* execute downloaded image */
-#define DL_START	3	/* initialize dl state */
-#define DL_REBOOT	4	/* reboot the device in 2 seconds */
-#define DL_GETVER	5	/* returns the bootrom_id_t struct */
-#define DL_GO_PROTECTED	6	/* execute the downloaded code and set reset
-				 * event to occur in 2 seconds.  It is the
-				 * responsibility of the downloaded code to
-				 * clear this event
-				 */
-#define DL_EXEC		7	/* jump to a supplied address */
-#define DL_RESETCFG	8	/* To support single enum on dongle
-				 * - Not used by bootloader
-				 */
-#define DL_DEFER_RESP_OK 9	/* Potentially defer the response to setup
-				 * if resp unavailable
-				 */
-
-/* states */
-#define DL_WAITING	0	/* waiting to rx first pkt */
-#define DL_READY	1	/* hdr was good, waiting for more of the
-				 * compressed image
-				 */
-#define DL_BAD_HDR	2	/* hdr was corrupted */
-#define DL_BAD_CRC	3	/* compressed image was corrupted */
-#define DL_RUNNABLE	4	/* download was successful,waiting for go cmd */
-#define DL_START_FAIL	5	/* failed to initialize correctly */
-#define DL_NVRAM_TOOBIG	6	/* host specified nvram data exceeds DL_NVRAM
-				 * value
-				 */
-#define DL_IMAGE_TOOBIG	7	/* firmware image too big */
-
-
-struct trx_header_le {
-	__le32 magic;		/* "HDR0" */
-	__le32 len;		/* Length of file including header */
-	__le32 crc32;		/* CRC from flag_version to end of file */
-	__le32 flag_version;	/* 0:15 flags, 16:31 version */
-	__le32 offsets[TRX_MAX_OFFSET];	/* Offsets of partitions from start of
-					 * header
-					 */
-};
-
-struct rdl_state_le {
-	__le32 state;
-	__le32 bytes;
-};
-
-struct bootrom_id_le {
-	__le32 chip;		/* Chip id */
-	__le32 chiprev;		/* Chip rev */
-	__le32 ramsize;		/* Size of  RAM */
-	__le32 remapbase;	/* Current remap base address */
-	__le32 boardtype;	/* Type of board */
-	__le32 boardrev;	/* Board revision */
-};
-
 struct brcmf_usbdev_info {
 	struct brcmf_usbdev bus_pub; /* MUST BE FIRST */
 	spinlock_t qlock;
diff --git a/drivers/net/wireless/broadcom/brcm80211/include/brcm_usb_rdl.h b/drivers/net/wireless/broadcom/brcm80211/include/brcm_usb_rdl.h
new file mode 100644
index 0000000000..bf6665d33f
--- /dev/null
+++ b/drivers/net/wireless/broadcom/brcm80211/include/brcm_usb_rdl.h
@@ -0,0 +1,78 @@
+/* SPDX-License-Identifier: ISC */
+/*
+ * Copyright (c) 2011 Broadcom Corporation
+ */
+
+#ifndef	_BRCM_USB_RDL_H_
+#define	_BRCM_USB_RDL_H_
+
+#include <linux/types.h>
+
+#define BRCMF_POSTBOOT_ID		0xA123  /* ID to detect if dongle
+						   has boot up */
+
+#define TRX_MAGIC		0x30524448	/* "HDR0" */
+#define TRX_MAX_OFFSET		3		/* Max number of file offsets */
+#define TRX_UNCOMP_IMAGE	0x20		/* Trx holds uncompressed img */
+#define TRX_RDL_CHUNK		1500		/* size of each dl transfer */
+#define TRX_OFFSETS_DLFWLEN_IDX	0
+
+/* Control messages: bRequest values */
+#define DL_GETSTATE	0	/* returns the rdl_state_t struct */
+#define DL_CHECK_CRC	1	/* currently unused */
+#define DL_GO		2	/* execute downloaded image */
+#define DL_START	3	/* initialize dl state */
+#define DL_REBOOT	4	/* reboot the device in 2 seconds */
+#define DL_GETVER	5	/* returns the bootrom_id_t struct */
+#define DL_GO_PROTECTED	6	/* execute the downloaded code and set reset
+				 * event to occur in 2 seconds.  It is the
+				 * responsibility of the downloaded code to
+				 * clear this event
+				 */
+#define DL_EXEC		7	/* jump to a supplied address */
+#define DL_RESETCFG	8	/* To support single enum on dongle
+				 * - Not used by bootloader
+				 */
+#define DL_DEFER_RESP_OK 9	/* Potentially defer the response to setup
+				 * if resp unavailable
+				 */
+
+/* states */
+#define DL_WAITING	0	/* waiting to rx first pkt */
+#define DL_READY	1	/* hdr was good, waiting for more of the
+				 * compressed image
+				 */
+#define DL_BAD_HDR	2	/* hdr was corrupted */
+#define DL_BAD_CRC	3	/* compressed image was corrupted */
+#define DL_RUNNABLE	4	/* download was successful,waiting for go cmd */
+#define DL_START_FAIL	5	/* failed to initialize correctly */
+#define DL_NVRAM_TOOBIG	6	/* host specified nvram data exceeds DL_NVRAM
+				 * value
+				 */
+#define DL_IMAGE_TOOBIG	7	/* firmware image too big */
+
+struct trx_header_le {
+	__le32 magic;		/* "HDR0" */
+	__le32 len;		/* Length of file including header */
+	__le32 crc32;		/* CRC from flag_version to end of file */
+	__le32 flag_version;	/* 0:15 flags, 16:31 version */
+	__le32 offsets[TRX_MAX_OFFSET];	/* Offsets of partitions from start of
+					 * header
+					 */
+};
+
+struct rdl_state_le {
+	__le32 state;
+	__le32 bytes;
+};
+
+struct bootrom_id_le {
+	__le32 chip;		/* Chip id */
+	__le32 chiprev;		/* Chip rev */
+	__le32 ramsize;		/* Size of  RAM */
+	__le32 remapbase;	/* Current remap base address */
+	__le32 boardtype;	/* Type of board */
+	__le32 boardrev;	/* Board revision */
+};
+
+#endif /* _BRCM_USB_RDL_H_ */
-- 
2.53.0

