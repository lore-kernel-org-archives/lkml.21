Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795271532;
	b=xOQpOT5XStSfuB8dHjq26MXUS48H2rCbuYaRc9wG7iDlUP5A5L3wixiBDntzrBWr96KV
	 AyCnMzAGS/vy8wVhYAsCTwyyuF6zH1DEgUbVKettBtcoofEUbCHObp2PJ8078+OQEQtJO
	 dwvUiVGTzSQnWuJYDNjoqIgPw3Jt5pQBAdgaELRlXoX/WlMrWkdXql7EgNiUgJ243lfuw
	 EVzeVte5TA7Uc05Y3EDs9SxVfx8me9r4MdXNebdnE4r1bBoaG1D9ZBaEao//ad/JBtpXX
	 LLpyi5/X0ciq5r6eGqtYtjGDi6E4psiH+V23T3lwezijix5mDgKnCN5aXVkANJGrl/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795271532;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1E7kAF5/dFESeUun+gH9niuyE7soc5wv4xkKkZEPwpU=;
	b=JQPsgRq8N/m8xDZyivCsSM1mmK4g9Pk3DlTeCMPPr65llQsoJK26zO0LA3uWHb7DnWVJ
	 K2Utp47euGU/lNbMQfFHKOrHdUJdqdQk/aygvm+elOh/c9/DBDVkeMGH8u8kgKxTKdmsF
	 MfPx9+f9s89Z1XBFCSTer7C/ttE7wDG1spqnMmdLdCe0hNKO5VVRZ3ZmZXRvNDhNf1D00
	 X/uVLP1TkyxHM1MmHM5/SghO4styOUnWgPKjDCCl8XkL95LoW4lwryXXts/RJICffZIMG
	 hcV5NIKjeH0j3XIbQYRb9oLH3egwNrFJAJiJl/c1Ap0tOZYoAwNTB70M2Zy0rQHYEwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="e//cDxT+";
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7649C606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 14:32:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7649C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e//cDxT+
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so15948305e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 06:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795271531; x=1795876331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1E7kAF5/dFESeUun+gH9niuyE7soc5wv4xkKkZEPwpU=;
        b=e//cDxT+0HzXsYFWra+iEspFsM2yk7+fyDypY3KOi5OBlQFllD7JXBVR8ylX8WIq39
         fOb21gIXF+fA7EJOnOeUQDj9QU8medaJbzNJ9SXGtX+0G4xSiDqYPytmAbewp2krpB6p
         DZEtsHObdJvNA2Kipl1uw8sF4xpSt7JbYp/Quuaq5jvNFbeRAB6D2i2sDwmgtmDTbodp
         QLhjZ2e/NM3ieBR5jKvAo6QW82fuQQCH0smzydPQDwCv4v66f69lQXKUjhhKkOo1fP6s
         GaOq5sm0fLC5R1GbBz9LfBxuXolceXHDmk+WqAMzckiymZCR36cf5lHWsQins2/jDBu1
         I4Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795271531; x=1795876331;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1E7kAF5/dFESeUun+gH9niuyE7soc5wv4xkKkZEPwpU=;
        b=kDkuZLzoznhZUmGUA+AKy0K13olpaxYGg8FrkzsYzWaq1wf7Q7xCpAPQeYOcXfGOWj
         sH0kuDKXG5wturxNwzjjuMaUlULzclmz0JKf94JfN15TYwILnfj2rO4yw9lJ842RYoKJ
         F5hjoM6oX8sZiEzx7bgU3VkKlyeA3Zk66w6phWiDrwX6SI0DYgYCcpbj4fh4owY8h/Up
         edGIEd7W4juxDls+ts+ijh8g+wcSEA7SqKvDohFPLHmqA7yzSQJ6Ghwmdmh9KLNeRTgs
         vTYZQLhG2JVSctOCK/DhNhStP3rYl+flbg0s5CwXBtKYEgp7dblW9OxD+0KenJlVK5u2
         4Pcg==
X-Forwarded-Encrypted: i=1; AL+hErFeKrCo0EBpN5N/sT8DtUtaE0XNPkxNOZP3loJ00Qxq0aGdQNFxBSnB8rM9CcoXinz9o+CSdFeX6DgtngI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Xb/vUfE2X3omO+bVEE/LVRPeWmohael7O0pfPqYhJZaJJMGcj
	nBncQFG7uyoFa1+NA0v8Z9yk10q8fTXj+ITGm9/fNmPXm5NjIph6UIYAEpiDX9ol
X-Gm-Gg: AZFdTZewfnO0HHnjUhSIYPfepWx7B/Bgup0CgwyexFD06nQMjJFXahcGRBrNYAdP6Dr
	0FwY+pfjr5o1i4cTV3D4Iv2yVv4dp6fVV8p3AuOT7rhXQ/W/cocuZ7bvK3zYR5kWxpiV4aueIKK
	0HxBiXQ7wjpDS+5O6CFs69EN+j5jSUvrW7R5xQyFMumYVOI56+Fc0/aC/x/FuqkM6+0UYsqcmi4
	xgyaVpY1dpcCNil+Xe4JOg9xDvzp5DC2NyGQIM671JK5uOyx7a4YQqgZ0A+Z4j2TNpdqI2J+oNV
	mpEEnRCMmnNBhFU6cOkuJ6RJe2R3XisWeYh3v/35gMPbHWREO/wDByld5jUySza/fyBs+YIiSN3
	44GWcVyrUdWDP9VKw9X4T5AHvjK2lsLYkMWwNGOreHF/Drb/CLglJpgEP4KDH4dLbtF3NAONaIO
	0Pmmc4F8fsfi5tgoMPKxLJPX8WXaiYfg8CKXMM0/sgX/2z0b8e+lFwujnYN6jWFqbnkE8Tnow/s
	ybAdxyb3EtVzp45BluBwliXA+2/3xKm297D2iIfDBD0DPgZkvtLTs4bR4dzllmEv6xqAAl/TQcj
	EVQXDZtHwOEpZBqBD1/hJIKDVl8ZwP0AB8F9lAbbCMIXjyOAiQRYjvC2FjGGoQY=
X-Received: by 2002:a05:600c:674f:b0:4bb:7e4e:de69 with SMTP id 5b1f17b1804b1-4bb88814c37mr143877395e9.20.1795271530692;
        Sat, 21 Nov 2026 06:32:10 -0800 (PST)
Received: from archlinux.dns.quad9.net ([41.90.173.61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a1e8bsm170389035e9.9.2026.11.21.06.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 06:32:10 -0800 (PST)
From: Keane Mbae <keanembae@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	keanehatescoding <159132270+keanehatescoding@users.noreply.github.com>
Subject: [PATCH] platform/x86: hp-wmi: skip unsupported thermal profile and fan control
Date: Sat, 21 Nov 2026 17:32:04 +0300
Message-ID: <20261121143204.35492-1-keanembae@gmail.com>
X-Mailer: git-send-email 2.56.1
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

From: keanehatescoding <159132270+keanehatescoding@users.noreply.github.com>

On some HP business laptops, such as the HP 245 14 inch G10 Notebook
PC, the generic thermal profile fallback path probes
HPWMI_THERMAL_PROFILE_QUERY (0x4c) even though the BIOS does not
support it. When the BIOS returns an error such as 0x6, hp-wmi logs:

  hp_wmi: query 0x4c returned error 0x6

and thermal_profile_setup() fails. The failure is already ignored by
hp_wmi_bios_setup(), but the warning is noisy and the probe should be
quiet when the feature is unsupported.

Similarly, hp_wmi_hwmon_init() applies initial fan settings on systems
that report a fan count but do not support the legacy fan speed max
WMI command. On such systems this produces:

  hp-wmi hp-wmi: Failed to apply initial fan settings: -22

Add a quiet hp_wmi_perform_query() variant so unsupported thermal
profile probes do not emit warnings. If the generic thermal profile
query is not supported, skip platform profile registration.

For legacy fan control systems where the BIOS does not support the fan
speed max command, disable the fan hwmon attributes instead of warning
during initialization.

Reported-by: Keane <159132270+keanehatescoding@users.noreply.github.com>
Tested-on: HP 245 14 inch G10 Notebook PC (BIOS F.16)
Signed-off-by: Keane <159132270+keanehatescoding@users.noreply.github.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 44 ++++++++++++++++++++++++--------
 1 file changed, 34 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 52077833a..e0bb828b3 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -730,8 +730,9 @@ static inline int encode_outsize_for_pvsz(int outsize)
  *       buffer = kzalloc(128, GFP_KERNEL);
  *       ret = hp_wmi_perform_query(HPWMI_BATTERY_QUERY, HPWMI_READ, buffer, 1, 128)
  */
-static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
-				void *buffer, int insize, int outsize)
+static int __hp_wmi_perform_query(int query, enum hp_wmi_command command,
+				   void *buffer, int insize, int outsize,
+				   bool quiet)
 {
 	struct acpi_buffer input, output = { ACPI_ALLOCATE_BUFFER, NULL };
 	struct bios_return *bios_return;
@@ -772,7 +773,9 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
 
 	if (obj->type != ACPI_TYPE_BUFFER ||
 	    obj->buffer.length < sizeof(*bios_return)) {
-		pr_warn("query 0x%x returned wrong type or too small buffer\n", query);
+		if (!quiet)
+			pr_warn("query 0x%x returned wrong type or too small buffer\n",
+				query);
 		ret = -EINVAL;
 		goto out_free;
 	}
@@ -781,7 +784,8 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
 	ret = bios_return->return_code;
 
 	if (ret) {
-		if (ret != HPWMI_RET_UNKNOWN_COMMAND &&
+		if (!quiet &&
+		    ret != HPWMI_RET_UNKNOWN_COMMAND &&
 		    ret != HPWMI_RET_UNKNOWN_CMDTYPE)
 			pr_warn("query 0x%x returned error 0x%x\n", query, ret);
 		goto out_free;
@@ -801,6 +805,13 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
 	return ret;
 }
 
+static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
+				void *buffer, int insize, int outsize)
+{
+	return __hp_wmi_perform_query(query, command, buffer, insize, outsize,
+				      false);
+}
+
 /*
  * Calling this hp_wmi_get_fan_count_userdefine_trigger function also enables
  * and/or maintains the laptop in user defined thermal and fan states, instead
@@ -2760,10 +2771,15 @@ static int thermal_profile_setup(struct platform_device *device)
 
 		ops = &platform_profile_victus_s_ops;
 	} else {
-		tp = thermal_profile_get();
+		int val = 0;
 
-		if (tp < 0)
-			return tp;
+		err = __hp_wmi_perform_query(HPWMI_THERMAL_PROFILE_QUERY,
+					     HPWMI_READ, &val, zero_if_sup(val),
+					     sizeof(val), true);
+		if (err)
+			return 0;
+
+		tp = val;
 
 		/*
 		 * call thermal profile write command to ensure that the
@@ -2771,7 +2787,7 @@ static int thermal_profile_setup(struct platform_device *device)
 		 */
 		err = thermal_profile_set(tp);
 		if (err)
-			return err;
+			return 0;
 
 		ops = &hp_wmi_platform_profile_ops;
 	}
@@ -3222,8 +3238,16 @@ static int hp_wmi_hwmon_init(void)
 	}
 
 	ret = hp_wmi_apply_fan_settings(priv);
-	if (ret)
-		dev_warn(dev, "Failed to apply initial fan settings: %d\n", ret);
+	if (ret) {
+		if (!hp_wmi_fan_control_supported() && ret == -EINVAL) {
+			dev_dbg(dev,
+				"Fan control not supported by BIOS, disabling fan support\n");
+			priv->fan_count = 0;
+		} else {
+			dev_warn(dev, "Failed to apply initial fan settings: %d\n",
+				 ret);
+		}
+	}
 
 	return 0;
 }
-- 
2.56.1

