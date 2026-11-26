Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795683605;
	b=bgnpBW8/3VXOKbTouSj6JIrnHh8bo7ul8N3iv+u9I5MtivuC8Q5EafXKMTBJ5vlMXFxH
	 +KGrtTotzb3HamKlYsqIbKImlHsZQzoabHVhIevgnSgq/xZS7XiZS1u/Lr4Jr1k3//nhf
	 HIlVU7kDfWNXikDE4CU5RS1bzh7W7KyN06sfGcXkKAoRvZcnATLTVmvMp0XFq3N2UyDVA
	 kQXc+UEjIYAMrkbQJF2ly/FTy3NSDYNtXcO8YxEuv5YuFf2vNzAmgzf3IfQ/7crccZLmj
	 eMkBv58MkFGWVsB04U2FprMHjYJNGMqQGXDvyf5vjo8xdwRD0e1Qw4ZTep8YLzc9VFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795683605;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Yh6+sXWyFXYfKUalssHUgOWkgYxwHId/9h6FjzDeYnw=;
	b=PCkvN4TRdthjNcvFdTuk6qoLrx79h+FNQ6f53vMeuSRI6BJreLrxHGCaGW4Ocx4TQyz6
	 R9XsPYuqVsjJQRrC/v+GuRoByxVCsoZTSXRHwtqSxwunKyFZYgvZPacop/BsXsHgMjlI4
	 byxO0dzmMWzugy42UrlEf/f5oiyM3IWMY0YH4iY+NNZ9Z+3P/K6Yvv29JVpfkXIpO3FBV
	 Y6wh9bVWn1KEQWEzMvbAyfmMl1cfjx4EvOh09uBVfES4wwdQ3JgZS3SplTsKfEa7+zp00
	 CuKf2/xTPMIF7hyfnOFiiw50Iy0BJe8GhLK3pSqgj57yGTjfujq5fav3oAk/8U3mGig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SYyUkC9p;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C1C606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:00:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14C1C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SYyUkC9p
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2f07a960666so46663955ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795683604; x=1796288404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yh6+sXWyFXYfKUalssHUgOWkgYxwHId/9h6FjzDeYnw=;
        b=SYyUkC9pyDvvYV8Jf92kRJ6WhPuREuUiQIUkxGQFo4JSwJ3/7amNxqy4amIcd9Ffro
         TxlCQ58zYSWFxwpX9ixk274Vnf7t76tuf/9jtHs3IEu71zdmOppL4O7WcUWi5cFNjMzH
         SqjvnmomCq2gBqkY7e+3fri6BuHLpaAgiZh+3MvCWGEqo5L/tDNOJ+OlEOhnEoZ5i1Sq
         qMIn6qp164UW1QbKh/xoRZ0JKQOcVNGtoNQFKJda8yUysJg02rl3yr5f8Qlrr6U1gteE
         ZqkQ5oaM+eEcOme6qok3l8vwUn4yWZVwrwrr54edEIM8TS7A67aidHnmPnGuoKkCu033
         v+LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795683604; x=1796288404;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yh6+sXWyFXYfKUalssHUgOWkgYxwHId/9h6FjzDeYnw=;
        b=qUcfQaOxCKfk4/d4hR+zQCtabERaQ4OTcOn9UbJg8fvGeRW9AQTrXvlRbrOoivKmsQ
         T4lGzde5i1lKTujW5R8YqDbOUdnkBMYM+YZs0bvSqCnLwAhM8MODIF3cUCTl1UpCSQ+7
         OxRamau2R3avFHgnODRHrSeX9uYSJF6CHdM++4BhhQ4IOD7LttbjnuZxkiEfKzFGyj5w
         p9VppzL+paN60xT5bqYX+pFdOTCq8qnHGyWE9PjpA0wCd2ojEUBWthvTga3euu6oKXM1
         wO/IQ8csaVrBks05jRwCqNJtnQQdaLIvBwBaa2F8m6srCVbkz7B0+SCZ8F3sHjRPDd4k
         jW4A==
X-Forwarded-Encrypted: i=1; AL+hErHAQfWHjR45pHUM2i6bUNOL9uDdjlQS54nLwqOrcLBHfxHqDpdIjVEBM8gooSkJXQmdOtaJp+LPFpwUan4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FuLR7UksB4kflsMlyRPBtt3dtHuFqZLvexjEzfIVpgVOwbOBp
	ZccVXZ8wMuCn+fccJrvSo3rd7aAWNMWPGfqBUMKN8Z8IPzUu9KvgCsdoAvfNFW8Z9YM=
X-Gm-Gg: AZFdTZfKBZ4OULcw8uO2OdHayLV8p29WF46f2+Jnn8d2CwPkG7bZu0zC93qNKQVDPgT
	LF+z4znbu7P+JOWYvt0hB3P+UtWep791iy2H5sX0KrfbUQ5iFgP9CephYp7NSn+0hS93AZzG7z2
	54a7bkxyLZS305ttL4LmUh7kw16uZOmCJLjyKVNczVgyFEVvTzYRK9n16UGLJEw2eVarRDz1jJC
	Km+xGwHA1jKtjkwpVfpfnONPtvbRxOgZyPOI2wEQSiRH80vZtMe4ZZpIrmadjvjLtFhtkswTKXQ
	XWo8aLN5RiabAe+O0PWiCuK1lf8RFlO1fmklmvkeF4xoAWIXJ9tXUEtdd4WEpUhW01BG8Q/rCqB
	40tpb/Ftd0tGbo3m0vHtt84362yF6i23+CpTVK43ALBKyLN1jzD+fvB521pH8S7CbMzzJ+FddwK
	sxFGhnENpcFUAaacY/8AhEd2qieyKoiSuqdsgS3EnHMfdmclqW9WTSOBfHvwBJwGTx+PJLjWf6c
	1PCFaHGigY8cVZIILhpjwNeQlx/y5WtDgHQGGzawVnZXODlAh2/ELAHMWXBeYWCKjdiHZBzXjfQ
	ONgiHv0eZS+vEuGMMEpFPAHVBIkXkLQns7w/2+TXw6QEHQ0i+dmn0bVESdYgqClS4byOW7vYs/R
	oAVBTWYU++s5WMe62xgS3BYoU20WM2BxW+Tt8Mk+Qlw==
X-Received: by 2002:a17:902:da83:b0:2ef:e5b9:5841 with SMTP id d9443c01a7336-2f050c1d8cemr196509805ad.35.1795683604307;
        Thu, 26 Nov 2026 01:00:04 -0800 (PST)
Received: from aster-ThinkPad-X9-14-Gen-1 ([2400:2410:5f2b:700:da16:d35e:74e2:c7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0ff28fda8sm424145ad.56.2026.11.26.01.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:00:03 -0800 (PST)
From: Vishnu Sankar <vishnuocv@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	Rong Zhang <i@rong.moe>,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
	Huang Wei <huangwei@kylinos.cn>,
	platform-driver-x86@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	klorico2@lenovo.com,
	vsankar@lenovo.com,
	Vishnu Sankar <vishnuocv@gmail.com>
Subject: [PATCH] platform/x86: thinkpad_acpi: Fix fan speed reporting on X9 Gen 1
Date: Thu, 26 Nov 2026 17:59:37 +0900
Message-ID: <20261126085937.53711-1-vishnuocv@gmail.com>
X-Mailer: git-send-email 2.53.0
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

On the ThinkPad X9-14 Gen 1 and X9-15 Gen 1, the EC reports fan1 RPM
in registers 0x84/0x85 and fan2 RPM in 0x82/0x83, and does not use
bit 0 of 0x31 as a fan select. As a result fan2 reports fan1's speed,
and every fan read overwrites an EC-owned bit.

The EC also does not latch either register pair, so a read can combine
the LSB of a new value with the MSB of an old one.

Add two quirks: TPACPI_FAN_2REG reads fan2 from 0x82/0x83 and never
touches 0x31, and TPACPI_FAN_UNLATCH re-reads an RPM register pair
until the MSB is stable. Enable both for the X9 Gen 1 models.

A single fan level write controls both fans on these models, so second
fan control is disabled when TPACPI_FAN_2REG is set.

Tested on X9-14 Gen 1 (BIOS N4DET42W, EC N4DHT39W).

Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 79 ++++++++++++++++++---
 1 file changed, 68 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 4f81855ad721..266f774b8ac3 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -7964,6 +7964,8 @@ enum {					/* Fan control constants */
 	fan_select_offset = 0x31,	/* EC register 0x31 (Firmware 7M)
 					   bit 0 selects which fan is active */
 
+	fan2_rpm_offset = 0x82,		/* EC register 0x82: LSB, 0x83 MSB (fan2 RPM) */
+
 	fan_status_offset_ns = 0x93,	/* Special status/control offset for non-standard EC Fan1 */
 	fan2_status_offset_ns = 0x96,	/* Special status/control offset for non-standard EC Fan2 */
 	fan_rpm_status_ns = 0x95,	/* Special offset for Fan1 RPM status for non-standard EC */
@@ -8012,6 +8014,8 @@ static int fan_watchdog_maxinterval;
 static bool fan_with_ns_addr;
 static bool ecfw_with_fan_dec_rpm;
 static bool fan_speed_in_tpr;
+static bool fan2_with_own_rpm_reg;
+static bool fan_rpm_unlatched;
 
 static struct mutex fan_mutex;
 
@@ -8073,6 +8077,9 @@ static void fan_quirk1_handle(u8 *fan_status)
 /* Select main fan on X60/X61, NOOP on others */
 static bool fan_select_fan1(void)
 {
+	if (fan2_with_own_rpm_reg)
+		return true;
+
 	if (tp_features.second_fan) {
 		u8 val;
 
@@ -8093,6 +8100,9 @@ static bool fan_select_fan2(void)
 	if (!tp_features.second_fan)
 		return false;
 
+	if (fan2_with_own_rpm_reg)
+		return true;
+
 	if (ec_read(fan_select_offset, &val) < 0)
 		return false;
 	val |= 0x01U;
@@ -8202,21 +8212,48 @@ static int fan_get_status_safe(u8 *status)
 	return 0;
 }
 
+/* Read a 16-bit RPM register pair (LSB at offset, MSB at offset + 1) */
+static bool fan_read_rpm(u8 offset, unsigned int *rpm)
+{
+	u8 hi, lo, hi2;
+	int retries = 3;
+
+	if (fan_rpm_unlatched) {
+		/* No latch: re-read until the MSB is stable */
+		do {
+			if (!acpi_ec_read(offset + 1, &hi) ||
+			    !acpi_ec_read(offset, &lo) ||
+			    !acpi_ec_read(offset + 1, &hi2))
+				return false;
+		} while (hi != hi2 && --retries);
+
+		if (hi != hi2)
+			return false;
+	} else {
+		if (!acpi_ec_read(offset, &lo) || !acpi_ec_read(offset + 1, &hi))
+			return false;
+	}
+
+	*rpm = (hi << 8) | lo;
+	return true;
+}
+
 static int fan_get_speed(unsigned int *speed)
 {
-	u8 hi, lo;
+	unsigned int rpm;
+	u8 lo;
 
 	switch (fan_status_access_mode) {
 	case TPACPI_FAN_RD_TPEC:
 		/* all except 570, 600e/x, 770e, 770x */
 		if (unlikely(!fan_select_fan1()))
 			return -EIO;
-		if (unlikely(!acpi_ec_read(fan_rpm_offset, &lo) ||
-			     !acpi_ec_read(fan_rpm_offset + 1, &hi)))
+
+		if (unlikely(!fan_read_rpm(fan_rpm_offset, &rpm)))
 			return -EIO;
 
 		if (likely(speed)) {
-			*speed = (hi << 8) | lo;
+			*speed = rpm;
 			if (fan_speed_in_tpr && *speed != 0)
 				*speed = FAN_CLOCK_TPM / *speed;
 		}
@@ -8238,7 +8275,8 @@ static int fan_get_speed(unsigned int *speed)
 
 static int fan2_get_speed(unsigned int *speed)
 {
-	u8 hi, lo, status;
+	unsigned int rpm;
+	u8 lo, status;
 	bool rc;
 
 	switch (fan_status_access_mode) {
@@ -8246,14 +8284,16 @@ static int fan2_get_speed(unsigned int *speed)
 		/* all except 570, 600e/x, 770e, 770x */
 		if (unlikely(!fan_select_fan2()))
 			return -EIO;
-		rc = !acpi_ec_read(fan_rpm_offset, &lo) ||
-			     !acpi_ec_read(fan_rpm_offset + 1, &hi);
+
+		rc = !fan_read_rpm(fan2_with_own_rpm_reg ? fan2_rpm_offset : fan_rpm_offset,
+				   &rpm);
+
 		fan_select_fan1(); /* play it safe */
 		if (rc)
 			return -EIO;
 
 		if (likely(speed)) {
-			*speed = (hi << 8) | lo;
+			*speed = rpm;
 			if (fan_speed_in_tpr && *speed != 0)
 				*speed = FAN_CLOCK_TPM / *speed;
 		}
@@ -8873,6 +8913,8 @@ static const struct attribute_group fan_driver_attr_group = {
 #define TPACPI_FAN_DECRPM	0x0020		/* For ECFW's with RPM in register as decimal */
 #define TPACPI_FAN_TPR		0x0040		/* Fan speed is in Ticks Per Revolution */
 #define TPACPI_FAN_NOACPI	0x0080		/* Don't use ACPI methods even if detected */
+#define TPACPI_FAN_2REG		0x0100		/* Fan2 RPM in EC regs 0x82/0x83, no fan select */
+#define TPACPI_FAN_UNLATCH	0x0200		/* RPM registers are not latched */
 
 static const struct tpacpi_quirk fan_quirk_table[] __initconst = {
 	TPACPI_QEC_IBM('1', 'Y', TPACPI_FAN_Q1),
@@ -8908,6 +8950,8 @@ static const struct tpacpi_quirk fan_quirk_table[] __initconst = {
 	TPACPI_Q_LNV3('R', '0', '0', TPACPI_FAN_NOACPI),/* E560 */
 	TPACPI_Q_LNV3('R', '1', '2', TPACPI_FAN_NOACPI),/* T495 */
 	TPACPI_Q_LNV3('R', '1', '3', TPACPI_FAN_NOACPI),/* T495s */
+	TPACPI_Q_LNV3('N', '4', 'D', TPACPI_FAN_2REG | TPACPI_FAN_UNLATCH),	/* X9-14 Gen 1 */
+	TPACPI_Q_LNV3('N', '4', 'C', TPACPI_FAN_2REG | TPACPI_FAN_UNLATCH),	/* X9-15 Gen 1 */
 };
 
 static int __init fan_init(struct ibm_init_struct *iibm)
@@ -8959,6 +9003,12 @@ static int __init fan_init(struct ibm_init_struct *iibm)
 		tp_features.fan_ctrl_status_undef = 1;
 	}
 
+	if (quirks & TPACPI_FAN_2REG)
+		fan2_with_own_rpm_reg = true;
+
+	if (quirks & TPACPI_FAN_UNLATCH)
+		fan_rpm_unlatched = true;
+
 	if (quirks & TPACPI_FAN_NOACPI) {
 		/* E560, T495, T495s */
 		pr_info("Ignoring buggy ACPI fan access method\n");
@@ -8993,9 +9043,16 @@ static int __init fan_init(struct ibm_init_struct *iibm)
 			if (res >= 0 && speed != FAN_NOT_PRESENT) {
 				/* It responded - so let's assume it's there */
 				tp_features.second_fan = 1;
-				/* fan control not currently available for ns ECFW */
-				tp_features.second_fan_ctl = !fan_with_ns_addr;
-				pr_info("secondary fan control detected & enabled\n");
+				/*
+				 * fan control not currently available for ns ECFW,
+				 * and not needed with 2REG: one write drives both fans
+				 */
+				tp_features.second_fan_ctl = !fan_with_ns_addr &&
+							     !fan2_with_own_rpm_reg;
+				if (tp_features.second_fan_ctl)
+					pr_info("secondary fan control detected & enabled\n");
+				else
+					pr_info("secondary fan detected\n");
 			} else {
 				/* Fan not auto-detected */
 				tp_features.second_fan = 0;
-- 
2.53.0

