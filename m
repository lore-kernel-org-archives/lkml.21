Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630447;
	b=iXt8mvn1AFFGXsKoI63MSymm34Z1p5QQHZY7kmNGS8PvTd0JcaPbHX2GTM4/Kzylj5Qb
	 yTnqvblT//bjhr9tlAn+hyrSpHUW5sKlnYSnUghBsmnkOBQfczeNY70TopIekWGWEtAyz
	 TKtQH/LuJVBuoIG3ysrt/0e7gWYg6xQYgLJ5xBZKFkxt6LLE5RdZ3ZDUrcjGsUkoaxZL5
	 vqMNoJpBuZVNxU61F5IkME8lLDTbCpKvt5hbgoxX8sdeChxh5AX/TgJJUUHsp80bqwUpO
	 fkN694c5ZzVmfjefrjuMvmNVmwA5dfyNvUgGJlOvwSsWrdlzGvLS3o/cl1GnFaw0xXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630447;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=ZwRGu5/OnsrkftCiXnzxko3YG0ZahDFZFdz2PcRV2x8=;
	b=tc19LD9mR+U0OYQXHSOwm8tA0Jo7uO7QPLdxpYlAaJK7A7TivQqp3kLylin+qv8tvvxl
	 EpOAloa97FwKCqviKQneRCWZGtvBZ0BYVB9OpORFgJM5GI+IYhjeetHvo1RYyIrOVMDk+
	 M0ktQf7p44geIyEeP8AQntPzO3nxVnEP+hvzSTuc7JNtjXsxONHg2kEELWb7r2xGt57YC
	 BKN6Cvx47ilHzVcVK11qAqf+efeOJl4JVP/YGGfbvZaZnFWYRWKe3h/HPC4oJkb4Xfd6R
	 Ge157crR62zQbq82QqXSrM9B+UId5zenNpGiJe3HAt6wffDDi7MvK3HSYmo4i8rHwFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--akorn.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eOzAl2Tn;
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4433F606A332
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:14:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4433F606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--akorn.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eOzAl2Tn
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2f05b674e3eso44088435ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795630444; x=1796235244; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZwRGu5/OnsrkftCiXnzxko3YG0ZahDFZFdz2PcRV2x8=;
        b=eOzAl2TncpyH0MDYvjHHt1nSPJ7GabZAUU2kqZ391oP7GKOVwJOmJMDoD3XA8feSQL
         8CSxH5+4KtqRbjakuWvVcksHs0/N3DvEjJFfYhenBr+vvIdUYKj0K6T3rT1JcR0KIFKP
         pzZH/lBSZZRKmzpy9zq0z+OvDZGnELuNvifmz7kekVgOQJyAhNYV3ugufwgmHkCXxS0C
         RhJTzrYxHqHQGpzoPJv92Xz+chgeZtXkcYHosGiqQcBJVNhTqC6fJWTXSI7iCDF+yzEr
         HBA+Xh/bJUjwrrjorUlbEvSwriZe7xNDnxkrdZAalIOB2y48Aj/Ux9KcfiVXOjCH93lJ
         vP4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795630444; x=1796235244;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZwRGu5/OnsrkftCiXnzxko3YG0ZahDFZFdz2PcRV2x8=;
        b=nle1aU2it8VengzD/0zFf4WP9j206QPfcXzWhuIdrDocimO+2PPFjw43pelRQeRpFJ
         GphPv7yauzbh0aopYritZLYVz+Z4bCLSEAVYfN7aVZGDPTwDu6OHO3z6XCquMxo528P9
         AuaZWK9EvTlWfJUcWGnNiOH0Rk/zyUvtuwJ/Q+DC3yRUpbGZwFcp8iPwDZyS1PzuMc+1
         Of4jTUERhb/4ZR3IQsPYa1Pl2YtRenX7mgSouMwBXQJh/v/LychelVIG5g88zlpywpkU
         81CkClq/mFMumFTBwebnwyQfao0vbYPMSr8wujm2/PqI+mExdljFRMpjdeWQ96NcLXQp
         65qQ==
X-Forwarded-Encrypted: i=1; AL+hErG8b072Q6tLwufXWWnEgpvK/ccDc5wYWzAHWa3QrSLyQUfo6LPfkX1WFDchIScVrKsoq/OhaKtOr1JU6go=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FvfVYQKVmXOP8vcRgW18rKRuMqQv+00A51uZW4FzI8V8eUJUs
	z0liRG3dInAb2Fdn3UCh5WbEIshUEFky2hLp8lqdtcrZvZ0Lbd2ISH1GNt1PiTiYXO2kVsmb79W
	MTQ==
X-Received: from plha17.prod.google.com ([2002:a17:902:ecd1:b0:2f0:6f2e:4b9f])
 (user=akorn job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3b88:b0:2ef:de6e:9877
 with SMTP id d9443c01a7336-2f03f1fd49dmr195687415ad.57.1795630444372; Wed, 25
 Nov 2026 10:14:04 -0800 (PST)
Date: Wed, 25 Nov 2026 18:13:35 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125181336.3298961-1-akorn@google.com>
Subject: [PATCH v2] hwmon: (pmbus) Fall back to CLEAR_FAULTS when STATUS_CML
 is read-only
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
expected or cleared unconditionally. If the write succeeds and either
bit remains set on readback, disable STATUS_CML write-1-to-clear for the
device and fall back to pmbus_clear_fault_page(). Do not clear
has_status_cml when _pmbus_write_byte_data() returns an error, so
per-page write failures (such as -EOPNOTSUPP on read-only virtual pages
like max16601 page 1) fall back for that page without disabling
STATUS_CML write-1-to-clear on other pages. Skipping the readback on
supported register probes (rv >= 0) avoids extra SMBus traffic in the
common path.

Tested on BMC hardware across ADI ADM1273-1A (adm1275), Maxim
MAX16600B.04 (max16601, 3 virtual pages across VCORE, sensor IIN/PIN,
and VSA), Renesas RAA228234 (isl68137), Infineon XDPE1A2G5B (tda38740),
ADI ADM1266, and factory write-protected converters.

Fixes: d9d30e1cb9ca ("hwmon: (pmbus) Clear only CML command and data faults during probe")
Signed-off-by: Arthur Korn <akorn@google.com>
---
v2:
  - Only clear data->has_status_cml when _pmbus_write_byte_data()
    succeeds and the post-write readback shows PB_CML_FAULT_CLEAR_MASK
    still set, so per-page write failures (such as -EOPNOTSUPP on
    max16601's read-only virtual page 1) do not disable STATUS_CML W1C
    for other pages. (Sashiko, Guenter Roeck)
  - Verified STATUS_CML W1C and virtual-page behavior on MAX16600B.04
    (max16601) hardware.
  - Link to v1: https://lore.kernel.org/linux-hwmon/20261125053711.3098007-1-akorn@google.com/

 drivers/hwmon/pmbus/pmbus_core.c | 41 ++++++++++++++++++++++----------
 1 file changed, 29 insertions(+), 12 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 2772860..b7f2f01 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -727,15 +727,32 @@ void pmbus_clear_faults(struct i2c_client *client)
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
+			if (ret >= 0 && (ret & PB_CML_FAULT_CLEAR_MASK)) {
+				data->has_status_cml = false;
+				ret = -EIO;
+			}
+		}
+		if (ret >= 0)
+			return;
+	}
 
-	if (!data->has_status_cml ||
-	    _pmbus_write_byte_data(client, page, PMBUS_STATUS_CML,
-				   PB_CML_FAULT_INVALID_COMMAND |
-				   PB_CML_FAULT_INVALID_DATA) < 0)
-		pmbus_clear_fault_page(client, page);
+	pmbus_clear_fault_page(client, page);
 }
 
 void pmbus_clear_cml_faults(struct i2c_client *client)
@@ -744,7 +761,7 @@ void pmbus_clear_cml_faults(struct i2c_client *client)
 	int i;
 
 	for (i = 0; i < data->info->pages; i++)
-		pmbus_clear_cml_fault(client, i);
+		pmbus_clear_cml_fault(client, i, true);
 }
 EXPORT_SYMBOL_NS_GPL(pmbus_clear_cml_faults, "PMBUS");
 
@@ -776,7 +793,7 @@ static bool pmbus_check_register(struct i2c_client *client,
 	if (rv < 0 && (data->flags & PMBUS_READ_STATUS_AFTER_FAILED_CHECK))
 		data->read_status(client, -1);
 	if (reg < PMBUS_VIRT_BASE)
-		pmbus_clear_cml_fault(client, -1);
+		pmbus_clear_cml_fault(client, -1, rv < 0);
 	return rv >= 0;
 }
 
@@ -793,7 +810,7 @@ static bool pmbus_check_status_register(struct i2c_client *client, int page)
 			status = -EIO;
 	}
 
-	pmbus_clear_cml_fault(client, -1);
+	pmbus_clear_cml_fault(client, -1, status < 0);
 	return status >= 0;
 }
 
@@ -821,7 +838,7 @@ static bool __maybe_unused pmbus_check_block_register(struct i2c_client *client,
 		rv = pmbus_check_status_cml(client);
 	if (rv < 0 && (data->flags & PMBUS_READ_STATUS_AFTER_FAILED_CHECK))
 		data->read_status(client, -1);
-	pmbus_clear_cml_fault(client, -1);
+	pmbus_clear_cml_fault(client, -1, rv < 0);
 	return rv >= 0;
 }
 
@@ -3094,7 +3111,7 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
 	if (data->info->pages)
 		pmbus_clear_cml_faults(client);
 	else
-		pmbus_clear_cml_fault(client, -1);
+		pmbus_clear_cml_fault(client, -1, true);
 
 	if (info->identify) {
 		ret = (*info->identify)(client, info);
@@ -3742,7 +3759,7 @@ static int pmbus_write_smbalert_mask(struct i2c_client *client, u8 page, u8 reg,
 	 * Clear fault systematically in case writing PMBUS_SMBALERT_MASK
 	 * is not supported by the chip.
 	 */
-	pmbus_clear_cml_fault(client, page);
+	pmbus_clear_cml_fault(client, page, true);
 
 	return ret;
 }
-- 
2.56.1.750.gf70dc682cf-goog

