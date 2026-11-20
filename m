Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164080;
	b=OVECWxTnNeB+3/G6NOa39qTMNJ05UmB93B646vhsmtlHVkVGmMDBhDAdRL8K95c6Rd8x
	 3tblRPNzQHSdb5RBqTO57jHB/Wyx+Q2CpdDPpj9r6WyiakiN+DAxUlARVJLOg5riVD/XC
	 OpnNjEKSvAFV66pEZxenjj2oBR7IZTzCxaoeBX9YKYOekua/9QX22gQz4IJHk3rFhJlvq
	 Izpoxs0rTrpZ1vhXkh3ECb9sK9bALiXW5wfWH1NppDGod3yDm/YEJpvdZaQ5H5Z2h/7uO
	 JF5XxxrnWYgwX/GMoWFW1AmPL/Fxrcfd0nqkFOuySop/GMf1+av06Glrz/Fl7g3cwmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164080;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=B3S7G7b9bye8TH3pDQ6FGxRtNzK8TEwIHow/DDgOdOU=;
	b=3FxftaAvScGhwHuKPyfFOEktr24gbzfDBZ/ERGBpxNOYnvpBzLZx6IYsNBYbDJGXZX2D
	 cPyJzp/ESlO3kbT8aDPl5Z/6SdWupnNAE8cgppmrBmcLdY4r8IuA1GgGxd7PVF+EBJ3xr
	 BVuqnpdZx6WDIN1mjSXa8aHwJRB6sZNRFgWRCcxn/zfhWiFDtVGz8Dg6yDlFrlyR2azHl
	 GlTqyWvBZeY+864ZsbSEeA1ywCFvfp2rInBmT7Y0L+tX7pwrzOaesWyDyrKRjk8jPFWLR
	 2uSZWQ95iMWUMwK7IDvgDE0VXPUCaRIcyOJNOCX5t/Q0EQyTnyXuVmDaW6SI6hq9n+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=okn6srFl;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23BB60A2628
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:41:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B23BB60A2628
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=okn6srFl
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-38587f3de36so709808eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795164079; x=1795768879; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B3S7G7b9bye8TH3pDQ6FGxRtNzK8TEwIHow/DDgOdOU=;
        b=okn6srFlkBXzTrb8uFg8Vx6Xl4YtwxPNpldaWNYmjndNTscTMmdlFfzchYc7kU5ms4
         DgGqbDtgYS+D3Wvp8sYZ088ENqY1DRJ8ummDicwi5+SQQlVUQYwqZA3dcRnHNAfi21iF
         X0Dtd3kwKZHPltw2BZlD+sOoHR5Mpo8EfhK45EWoYxRzxR9/YCdpR4ZrEaeQKQhOKuxC
         4j4gH/37z6fo5eConjfUkbMa4W37bjUwmjc3wLlSmmtq8/7hpZ/+Vfe9ICBg8o0XOwbp
         TqHfiS1X/oIM5hZpV4eYW7g+6D9NMIfYqIYNdr6iQ+LZbCGqWST18TGjIslO48oKTzpl
         d9/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164079; x=1795768879;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B3S7G7b9bye8TH3pDQ6FGxRtNzK8TEwIHow/DDgOdOU=;
        b=bYbPGd1afT3QrzGQupjyFmiEDwjf6fCZMquikVbrXKZL3PW1K8VzqOxpA9JLgEzQ9j
         BfPdwGBhTohIXNy9SlDfrCdYXCA7gx5AB5oCqNL7nhKa992qlK8vnMaRiZBeyCgdZSOs
         bmh9TCIprUP4e2FtwhimPYvLWMO/wxY8L0ayrKyGmDnxNRpOU2gy6MiNWwoduSCVvH9U
         zj9nuPMpr3MfAKwzQ1Waa+Ed/b8zQpIiu2jaaTlChECd33XmY95OeLYzbxCsIK6Jix+W
         aQvX1rSL7H3CYFFBY9WppwkWNvSQJ0NuFE0G5dy2AJdvOScx9EMnvFaL1Di55EAWAHFw
         BsSg==
X-Forwarded-Encrypted: i=1; AL+hErHAAHiVrqgDbO76MinC77KlLcn9ffxB8bekW4kK0wfsjTlKjoSQNDOpTK1fm5o/l3cm4pixEQDIDY2ZxCk=@vger.kernel.org
X-Gm-Message-State: APuU4Z99uF03x/HAGEsrL3DIhYVpyCa54ei/5dPGUi9TM2vtnQkr7OUv
	l7xZUZ14wtOe5K+dg27BVesf5nGGzxkbyABPEaWgWGbfOsdKvE/MiT4B
X-Gm-Gg: AZFdTZdED/xqP4yPhnavPWW9XqD79eY/497DT9DMa3h/cNgJXooxYXhgbDiZJ1ByQEP
	AFjrgwfXcbJF4oqoTVXPkgCGyfzu2MgxrHsIJSzEuyTviGfFmbPgaG7r0Jp4Q3LRYOPVXYrSdji
	2ryaPXXSbU/cup5k32W2ZzV+uZtagckrUaL4gcysJuGnDarRCSmnXj3kvuK5xoj/eDWPhP1KeQ9
	DsfwhVPW/+0ZKDkcSpNzBKvTMeJtFMjKB3jFfupxOtF1H2YaxEQKy+aaAZCR+yHuTsf+SKTdgjC
	zI+LKhhYlYjEpmfPPVqrGX/Bhs8/oYRjVdn15O3waJKeKkYfluTrLjOzz1Nw+moBM/xOnh7CE6K
	r5Ew0bbPjrTgurrOjKpMxGVYaNLEq8yaBPjYhUgS8CiEDFY5Eh8Ci3r1v3MG3G8JS5EJg00RuKW
	w27K4sjNWwdR1fbcBQ4haT+rY+2YNl+yeWQcAwllNYwyDQMFfoP6zBSNPdz0jaNtnHtNKTpdXyY
	ZIsfnVQ86DXWQe5QMPJYit0ctvLF7Jg+5AaC7q7rDpSCVZZUyc+SREmZlPfkOGi3A8RvdbSb/PM
	/ES4zCfM01y7B7aqGnsBNck6U7Ak4taTQg5mncU52lLXoDlpRK82+5M9ho08cvWma2EB5MgNQbN
	e1I/vz8hBlaYpW6nKAw==
X-Received: by 2002:a05:7301:6285:b0:369:f182:8e99 with SMTP id 5a478bee46e88-38570554684mr2335097eec.35.1795164078916;
        Fri, 20 Nov 2026 00:41:18 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:ea97:e47d:2ebc:210c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c371esm5793181eec.23.2026.11.20.00.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:41:18 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 20 Nov 2026 00:41:02 -0800
Subject: [PATCH v3 14/14] HID: logitech-hidpp: expose charge_type property
 for battery voltage feature
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-hid-logitech-hidpp-v3-14-cfe2caa1d0eb@gmail.com>
References: <20261120-hid-logitech-hidpp-v3-0-cfe2caa1d0eb@gmail.com>
In-Reply-To: <20261120-hid-logitech-hidpp-v3-0-cfe2caa1d0eb@gmail.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Gideon Heinz <gideonheinz02@gmail.com>
Cc: =?utf-8?q?Filipe_La=C3=ADns?= <lains@riseup.net>, 
 Bastien Nocera <hadess@hadess.net>, Hans de Goede <hansg@kernel.org>, 
 Edwin Velds <e.velds@gmail.com>, 
 Stuart Hayhurst <stuart.a.hayhurst@gmail.com>, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-Mailer: b4 0.17-dev-6b8b8

Commit be281368f297 ("hid-logitech-hidpp: read battery voltage from
newer devices") added support for the 0x1001 battery voltage feature,
populated battery->charge_type, and handled POWER_SUPPLY_PROP_CHARGE_TYPE
in hidpp_battery_get_property(). However, it did not add a placeholder
slot in hidpp_battery_props[] or register POWER_SUPPLY_PROP_CHARGE_TYPE
in hidpp_initialize_battery() when HIDPP_CAPABILITY_BATTERY_VOLTAGE is
set. Consequently, the charge_type attribute was never exposed via
sysfs. Furthermore, hidpp20_battery_voltage_event() only checked
whether voltage or status changed before updating cached battery values
and notifying user space, ignoring changes in level and charge_type.

Additionally, hidpp20_battery_map_status_voltage() unconditionally set
charge_type to standard (or fast/trickle) charging even when the device
was discharging, full, not charging, or in an unknown status, and
hidpp_connect_event() left charge_type stale on wireless disconnect.

Add a placeholder slot to hidpp_battery_props[], update the fixed
property count in hidpp_initialize_battery(), append
POWER_SUPPLY_PROP_CHARGE_TYPE when HIDPP_CAPABILITY_BATTERY_VOLTAGE is
set, and include level and charge_type in the change detection condition
in hidpp20_battery_voltage_event(). In
hidpp20_battery_map_status_voltage(), map charge_type to unknown when
status is unknown, to none when discharging, full, or not charging, and
to standard, fast, or trickle only when charging. Reset charge_type to
unknown on wireless disconnect in hidpp_connect_event().

Fixes: be281368f297 ("hid-logitech-hidpp: read battery voltage from newer devices")
Cc: stable@vger.kernel.org
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index dbf8f15f5a5b..966c5932528d 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -1428,12 +1428,17 @@ static int hidpp20_battery_map_status_voltage(u8 data[3], int *voltage,
 	else
 		status = POWER_SUPPLY_STATUS_DISCHARGING;
 
-	*charge_type = POWER_SUPPLY_CHARGE_TYPE_STANDARD;
-	if (test_bit(3, &flags)) {
-		*charge_type = POWER_SUPPLY_CHARGE_TYPE_FAST;
-	}
-	if (test_bit(4, &flags)) {
-		*charge_type = POWER_SUPPLY_CHARGE_TYPE_TRICKLE;
+	if (status == POWER_SUPPLY_STATUS_CHARGING) {
+		if (test_bit(4, &flags))
+			*charge_type = POWER_SUPPLY_CHARGE_TYPE_TRICKLE;
+		else if (test_bit(3, &flags))
+			*charge_type = POWER_SUPPLY_CHARGE_TYPE_FAST;
+		else
+			*charge_type = POWER_SUPPLY_CHARGE_TYPE_STANDARD;
+	} else if (status == POWER_SUPPLY_STATUS_UNKNOWN) {
+		*charge_type = POWER_SUPPLY_CHARGE_TYPE_UNKNOWN;
+	} else {
+		*charge_type = POWER_SUPPLY_CHARGE_TYPE_NONE;
 	}
 	if (test_bit(5, &flags)) {
 		*level = POWER_SUPPLY_CAPACITY_LEVEL_CRITICAL;
@@ -1553,7 +1558,10 @@ static int hidpp20_battery_voltage_event(struct hidpp_device *hidpp,
 
 	hidpp->battery.online = status != POWER_SUPPLY_STATUS_NOT_CHARGING;
 
-	if (voltage != hidpp->battery.voltage || status != hidpp->battery.status) {
+	if (voltage != hidpp->battery.voltage ||
+	    status != hidpp->battery.status ||
+	    level != hidpp->battery.level ||
+	    charge_type != hidpp->battery.charge_type) {
 		hidpp->battery.voltage = voltage;
 		hidpp->battery.capacity = hidpp20_map_battery_capacity(hidpp->hid_dev,
 								       voltage);
@@ -1795,6 +1803,7 @@ static enum power_supply_property hidpp_battery_props[] = {
 	0, /* placeholder for POWER_SUPPLY_PROP_CAPACITY, */
 	0, /* placeholder for POWER_SUPPLY_PROP_CAPACITY_LEVEL, */
 	0, /* placeholder for POWER_SUPPLY_PROP_VOLTAGE_NOW, */
+	0, /* placeholder for POWER_SUPPLY_PROP_CHARGE_TYPE, */
 };
 
 static int hidpp_battery_get_property(struct power_supply *psy,
@@ -4398,7 +4407,7 @@ static int hidpp_initialize_battery(struct hidpp_device *hidpp)
 	if (!battery_props)
 		return -ENOMEM;
 
-	num_battery_props = ARRAY_SIZE(hidpp_battery_props) - 3;
+	num_battery_props = ARRAY_SIZE(hidpp_battery_props) - 4;
 
 	if (hidpp->capabilities & HIDPP_CAPABILITY_BATTERY_MILEAGE ||
 	    hidpp->capabilities & HIDPP_CAPABILITY_BATTERY_PERCENTAGE ||
@@ -4416,6 +4425,10 @@ static int hidpp_initialize_battery(struct hidpp_device *hidpp)
 		battery_props[num_battery_props++] =
 			POWER_SUPPLY_PROP_VOLTAGE_NOW;
 
+	if (hidpp->capabilities & HIDPP_CAPABILITY_BATTERY_VOLTAGE)
+		battery_props[num_battery_props++] =
+				POWER_SUPPLY_PROP_CHARGE_TYPE;
+
 	battery = &hidpp->battery;
 
 	n = atomic_inc_return(&battery_no) - 1;
@@ -4511,6 +4524,7 @@ static void hidpp_connect_event(struct work_struct *work)
 			hidpp->battery.online = false;
 			hidpp->battery.status = POWER_SUPPLY_STATUS_UNKNOWN;
 			hidpp->battery.level = POWER_SUPPLY_CAPACITY_LEVEL_UNKNOWN;
+			hidpp->battery.charge_type = POWER_SUPPLY_CHARGE_TYPE_UNKNOWN;
 			power_supply_changed(hidpp->battery.ps);
 		}
 		return;

-- 
2.56.1.750.gf70dc682cf-goog

