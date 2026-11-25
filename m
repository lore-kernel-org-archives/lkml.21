Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795585037;
	b=Ojezwnf9X20HctZ8wmpjAxn/LGsdEvaWybxAwb3KeAZ4udS2pun6XKhQllPlGsOCzjAP
	 AhfwvUX+fWDDgXxA0cIYosQCeeiGFREcKGC2XPP7Nhh2704l+GMBcXf26LglN7dn2QAeM
	 GlftNUQQAtoogzVwL7N4ZrgmnbHrlxqlTTzEcVb04lFN63dgjTZAuGqf21Rzp9tsSrb7U
	 DusV3wvqKdJaSLib5e9R3blnNNNV+/7DKwmwFuYUPU4fYqE5Lx/o19CqCsqwu3DYGbnfU
	 x8eH1P6FWwlHAKjBfv5Dsn3pyuUJYZQzWLCe6qnT97ztG7oyXwaFW4od8yzer2S6lXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795585037;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=o3rc6H2PJBP0VEIUZixLOQruDmTF4QhjMKpNZAOYmo0=;
	b=0FcDZOaG+m1Bao48nHBq9P4BVfZ2Nz0Bej58sxsOlRf/IFqJrLVbuIoj807jmWrfW9mP
	 bFi6VjlWy09dOpvltkT3tCsbIvNe/oizCB8+q5sNqCKt3XEppVMsjHAt8/A5NPJKIC9TP
	 yvq81qNteQEXalpVX6Ga01RRSE7JkmGvrWdfRnQvWzWuHT6wn7n+Nr5qu8eesJjaWmBmP
	 lhhQWEkBFY8UMJqHDzYOkt+Ccb9+QYO1IxGtpg+G+y6Nf0shIX0LFiOmSHE7HPOv+1oEn
	 iWvTRKtIC1MRRI1NBhYdF6OQBYx5yBjAADdHOpN+4jDenJSPWYNyiOPF5qv4r1pxO7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--akorn.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FNoDj3W6;
	arc=none smtp.remote-ip=209.85.214.198
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59802606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:37:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59802606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--akorn.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FNoDj3W6
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2f04053e460so44125065ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795585036; x=1796189836; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o3rc6H2PJBP0VEIUZixLOQruDmTF4QhjMKpNZAOYmo0=;
        b=FNoDj3W6jHuyyqt8pGsKEdYQuCJvnojzxuQDtySz0KjKhNdMzMjs34zC/skEIqk6AC
         59m9p6OHnWL6Bs1ulXHMUOmDxrSc/NciZYi20oqp3+lSrVkmnX37+mVsQvsaa6Tv240Y
         996EWNmzEn9cne7K51l22ZvIHYbd8bjO+636lGIWmugQye9TaI5t0AUUQ/jjrbgTJeRC
         40a0QQtf3rVkmS5rOgj/1tbtNTCvU6LivlClOO5ODCPDy3eAthr5bA5DuBZF2vaz7d/z
         YdYDiPVf/PGUrgHebaplf+yhb3elhiP+9fB37evg1HRMc4JBOnKBXDMEUY8EEPDx7QbY
         561w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795585036; x=1796189836;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o3rc6H2PJBP0VEIUZixLOQruDmTF4QhjMKpNZAOYmo0=;
        b=tfa2lNwykqr0xf/0IVswjZ/OzT9mvMoIm3jd7jCuX3toZr38byvAs5bEaoSA2NQFHG
         5yTwZjkOTus5swjUQy5E3eopCB5GKE0QG/h0JcohSXJvB2ABvoi1QdO5DgSwcGn8IrAB
         UAIbhoF+Cmy5NOKQytLItVZrlKLOg9wqABsIYpJstYjvpZTOxEbd0PRUi81Zf1M9Sh4L
         hApj9SQEgSu/TbJ3tnRklwiuSgL/JA5hzLhcvPk3S/QAVXs2DblNULy9xYcFMSZIf1K5
         ZpRbTZR81LfsbyzonF2JNysVIe7d8v92vxKoacRMZu9tXZcYaG28mO+qMzaeJk44Op6q
         u7zg==
X-Forwarded-Encrypted: i=1; AL+hErHD/GYQtXQlsDhX0LGkGUmUpa0VEHS73RpYekPc8hbqKD+HTKXvKXbF8i2to8il6wxgUo6aR0VgzErVl80=@vger.kernel.org
X-Gm-Message-State: APuU4Z80823Q6br/cOzd3ANHfrU3wcqHvSyUSTljr3CsuaKrufc6jN1p
	634dBvFGWbU9Njn4f3i5pRyEVO3UExArndVe8xmiOj+xatlCDWF1tuktDvsqoJBZjRdXwKjYskZ
	aMg==
X-Received: from plig8.prod.google.com ([2002:a17:903:4588:b0:2f0:2206:68e8])
 (user=akorn job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:298d:b0:2e9:740c:36c
 with SMTP id d9443c01a7336-2f03f1ba67amr162001195ad.41.1795585035378; Tue, 24
 Nov 2026 21:37:15 -0800 (PST)
Date: Wed, 25 Nov 2026 05:37:10 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261125053711.3098007-1-akorn@google.com>
Subject: [PATCH] hwmon: (pmbus) Fall back to CLEAR_FAULTS when STATUS_CML is read-only
From: Arthur Korn <akorn@google.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Arthur Korn <akorn@google.com>
Content-Type: text/plain; charset="UTF-8"

Some PMBus 1.2 devices (such as ADI ADM1273 and ADM1281) report
PMBUS_REVISION = 0x22 and implement STATUS_CML (0x7e) as read-only:
they ACK SMBus byte writes to PMBUS_STATUS_CML without clearing latched
fault bits, and only clear STATUS_CML via CLEAR_FAULTS (0x03).

During pmbus_init_common(), probing an unsupported register such as
PMBUS_WRITE_PROTECT (0x10) latches PB_CML_FAULT_INVALID_COMMAND in
STATUS_CML. When pmbus_clear_cml_fault() writes to PMBUS_STATUS_CML and
sees ret == 0, PB_CML_FAULT_INVALID_COMMAND remains latched, causing
subsequent pmbus_check_status_cml() calls during attribute discovery to
fail with -EIO.

Verify on non-write-protected devices that PB_CML_FAULT_INVALID_COMMAND
and PB_CML_FAULT_INVALID_DATA actually cleared when a CML fault is
expected or cleared unconditionally. If either bit remains set after the
write, disable STATUS_CML write-1-to-clear for the device and fall back
to pmbus_clear_fault_page(). Skipping the readback on supported register
probes (rv >= 0) avoids extra SMBus traffic in the common path.

Tested on BMC hardware across 130 hwmon devices including 4x ADI
ADM1273-1A (adm1275), Renesas RAA228234 (isl68137), Infineon XDPE1A2G5B
(tda38740), ADI ADM1266, and factory write-protected converters,
verifying clean ADM1273-1A probe/re-bind fallback to CLEAR_FAULTS and
preservation of companion STATUS_CML fault bits on W1C-capable VRs.

Fixes: d9d30e1cb9ca ("hwmon: (pmbus) Clear only CML command and data faults during probe")
Signed-off-by: Arthur Korn <akorn@google.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 40 ++++++++++++++++++++++----------
 1 file changed, 28 insertions(+), 12 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 2772860..82dfa82 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -727,15 +727,31 @@ void pmbus_clear_faults(struct i2c_client *client)
 }
 EXPORT_SYMBOL_NS_GPL(pmbus_clear_faults, "PMBUS");
 
-static void pmbus_clear_cml_fault(struct i2c_client *client, int page)
+#define PB_CML_FAULT_CLEAR_MASK	(PB_CML_FAULT_INVALID_COMMAND | \
+				 PB_CML_FAULT_INVALID_DATA)
+
+static void pmbus_clear_cml_fault(struct i2c_client *client, int page,
+				  bool verify)
 {
 	struct pmbus_data *data = i2c_get_clientdata(client);
+	int ret;
+
+	if (data->has_status_cml) {
+		ret = _pmbus_write_byte_data(client, page, PMBUS_STATUS_CML,
+					     PB_CML_FAULT_CLEAR_MASK);
+		if (ret >= 0 && verify &&
+		    !(data->flags & PMBUS_WRITE_PROTECTED)) {
+			ret = _pmbus_read_byte_data(client, page,
+						    PMBUS_STATUS_CML);
+			if (ret >= 0 && (ret & PB_CML_FAULT_CLEAR_MASK))
+				ret = -EIO;
+		}
+		if (ret >= 0)
+			return;
+		data->has_status_cml = false;
+	}
 
-	if (!data->has_status_cml ||
-	    _pmbus_write_byte_data(client, page, PMBUS_STATUS_CML,
-				   PB_CML_FAULT_INVALID_COMMAND |
-				   PB_CML_FAULT_INVALID_DATA) < 0)
-		pmbus_clear_fault_page(client, page);
+	pmbus_clear_fault_page(client, page);
 }
 
 void pmbus_clear_cml_faults(struct i2c_client *client)
@@ -744,7 +760,7 @@ void pmbus_clear_cml_faults(struct i2c_client *client)
 	int i;
 
 	for (i = 0; i < data->info->pages; i++)
-		pmbus_clear_cml_fault(client, i);
+		pmbus_clear_cml_fault(client, i, true);
 }
 EXPORT_SYMBOL_NS_GPL(pmbus_clear_cml_faults, "PMBUS");
 
@@ -776,7 +792,7 @@ static bool pmbus_check_register(struct i2c_client *client,
 	if (rv < 0 && (data->flags & PMBUS_READ_STATUS_AFTER_FAILED_CHECK))
 		data->read_status(client, -1);
 	if (reg < PMBUS_VIRT_BASE)
-		pmbus_clear_cml_fault(client, -1);
+		pmbus_clear_cml_fault(client, -1, rv < 0);
 	return rv >= 0;
 }
 
@@ -793,7 +809,7 @@ static bool pmbus_check_status_register(struct i2c_client *client, int page)
 			status = -EIO;
 	}
 
-	pmbus_clear_cml_fault(client, -1);
+	pmbus_clear_cml_fault(client, -1, status < 0);
 	return status >= 0;
 }
 
@@ -821,7 +837,7 @@ static bool __maybe_unused pmbus_check_block_register(struct i2c_client *client,
 		rv = pmbus_check_status_cml(client);
 	if (rv < 0 && (data->flags & PMBUS_READ_STATUS_AFTER_FAILED_CHECK))
 		data->read_status(client, -1);
-	pmbus_clear_cml_fault(client, -1);
+	pmbus_clear_cml_fault(client, -1, rv < 0);
 	return rv >= 0;
 }
 
@@ -3094,7 +3110,7 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
 	if (data->info->pages)
 		pmbus_clear_cml_faults(client);
 	else
-		pmbus_clear_cml_fault(client, -1);
+		pmbus_clear_cml_fault(client, -1, true);
 
 	if (info->identify) {
 		ret = (*info->identify)(client, info);
@@ -3742,7 +3758,7 @@ static int pmbus_write_smbalert_mask(struct i2c_client *client, u8 page, u8 reg,
 	 * Clear fault systematically in case writing PMBUS_SMBALERT_MASK
 	 * is not supported by the chip.
 	 */
-	pmbus_clear_cml_fault(client, page);
+	pmbus_clear_cml_fault(client, page, true);
 
 	return ret;
 }
-- 
2.56.1.750.gf70dc682cf-goog

