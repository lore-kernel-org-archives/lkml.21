Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596552;
	b=dckAmZSy9nLNQZCDsauKOhNAxgU9ct3+yvarkCWbU4yNtq8XgsMZMX5H3lGpNcC7KCa3
	 HtHiF4ydRVA4lMdru4IQN4vrtAJrI8YYfiJVzMFxR5qTIhAGA4J1SSG5WjLPkcWE/Aa/w
	 OajdHxqfP6kDF3RyDdICNO0DTsLCRnp9ypliK0oGZemoRU/847UCtyMgwvD6XKa2aGF2n
	 NmpOajLJqJK5MXeA+PaTgjO4PVfLsO0v5p94xAi/f6MVmWUDJMYptnpw1KWac0NQA2x1S
	 0SFi4zF5V/N4QTqp1dIpWgWxMBiDFlc65WT9xov645jEM6WJYgsNuan78yfOG8mHHTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596552;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dL4HFdKW/phf0qh8s2lHI0j2gQFVuOIUi/IyX3x3o9Q=;
	b=dYwOXq52GgtdmIh8KcIA1Jw/hUggGDaV6vIkRDETuMu+ss8qEGw4wQF6uzr8uzVOAqus
	 p4PINk1/WwkqMaOe6Agfd9IhVqe5LlBHdXxUR5ZafHW+nLxpo+JEVFooVXyiwBZHb8Ds+
	 8ZFVopJgggL28XsNO67Q9vKGteSyuStYz8S/6xYTM5vR96gtq4N58ptRgkIDyrJk8dack
	 K+Z4bGEmICHAOLGt0TY1zvzHIfeFKck5KGLV8CC4E/zi34+U/EQumQHONXBiBtlXMAfqm
	 qVc+QcYPml9nh+mBCoC56PqsVGwH/LlKK44zPu6r3octH2xyJfxvHSnEAe3VGnR6RHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YVdS6NKs;
	arc=none smtp.remote-ip=74.125.229.8
Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5335A606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:49:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5335A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YVdS6NKs
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-382afece6d8so1097770eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795596550; x=1796201350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dL4HFdKW/phf0qh8s2lHI0j2gQFVuOIUi/IyX3x3o9Q=;
        b=YVdS6NKsEgxgMl+WH2rlG2/mN2PT8hYdnHaeuOhQRZG7EfYaK1zmZXJyce0jl2qt2i
         aJiwmc9VH+KmokhJ9ZT+iLHqjlXU8UiUHvyoNMddEPFOlyNpqrp49y6xk3D+JHXSFaTU
         E/9ZUZLsJgMrty4m/xsxSZ07xNRJdc8FRWbVw0WhTYg7ONQG4vzHR8z7p7S+IOzKNJFu
         lN5LTmJE5tK0OFvdscRgKC0Bir+Wh3/mkVmi2g/0QNfdfoCCbYQVjtWjnP8j8qB3t8Lj
         vL77HHSgpry6pIZPKbEzockltK3nluzGXsFBqiXYvdWwDQw7LTJ+N2kMj+pbTJ9lOtt8
         CTMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795596550; x=1796201350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dL4HFdKW/phf0qh8s2lHI0j2gQFVuOIUi/IyX3x3o9Q=;
        b=dfqXxTRDyii6KrrXoPryHKCWtQ0rQ9lll13o53ZymHvqnlHnsVF/l3d2SBKQEuM35n
         ALS+EZ8vtsccjCFCZ+om4LWDQxd5Cds1K4y/CGgwBkZuvvqSqKRHZkzAodhXN4eG1Ise
         0uEZdUq2ah9JofAW7r7k7/+eWtTTM9aoCYsBqn7d42sRMvZRvwgcvhA8sHxmgF0mHXxa
         bA+yg16ON9k3fVZJ7K94HnAkrmeruuQiAQVdqg+eXm2XT74qxJ7b7XnK9Hwrf5x9sm2C
         ynz1vo4tY8dkY+qyrZ+W7YEnA7oArwa7Fsa5ge+1fUHt0oAM5rEyTME/uxahA2EH3CDi
         oNVA==
X-Forwarded-Encrypted: i=1; AL+hErGKinXOTri3UIPbtvk8/aGkfr6/uHgpt4MxzXnVm6v+kyLFktGoVhM60J1i1EfM9F6IPO3NeKXNk5Kbhtc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LFZ8b1qWNj8BLsp8ESVVd0baNJgKngBak/aAudUL5JK/CQEPd
	NX+bMuTNfZr33dWlRhFqbaSNf7JRgkQ36WkG1+MUDJGj3VZ5IYg7ysQU
X-Gm-Gg: AZFdTZdCtjTY71Xdf9x6WvodCrJgl/o1bCLcOaIGo8KIzPcSefYP9UdQLzv/EcNevEy
	OFdqhq0SO2lFNWcEZmIwP3goYThJ6u4bArpFUsVeR6xtRJ2nanRjEdTHpaGRzklbrzDnf801usV
	lvR1PyCRE7V/4YmWVpS6A1aJVhKMjAwLF0KOuucz25FIo7C2JEZENat5Y4JcuV8uLN/qi9RYQ9f
	EM02YQqcpQXhbtt2c0Hai2FX3rgd+DxsLYMc/YOmaDL39Evi4A0nA1Y2zK/as6vxzorEL5T9u2G
	qbphHt8GlWOkU1AZABC4933bz9MD3c1YSO3W18+1L7qINjFkpQSNJHdiAnETj5zSWsX1LUTxzph
	pl8D8rqbSegkRxAB5NWNbaLezjTbq/OFmDGW99bYPJmHrla0MMsw6/xCWsnfpIQf63RADiOYxlK
	jywGPnNxTPVciI5rsYB9XmyYiAQC/RAd0rcSDD9cuufW9epA5WIpTgxolmDGxspo6Yhwftu1fz0
	UPL0Kokjg23u0zXkav5Z0+p9PR+ciQTghJtHFdbcVefh09cIDH94mq/m4WQ65VGo0/wVe/G+sLC
	YbYhymsKMhdfmWtyNjzonJNO18x8
X-Received: by 2002:a05:693c:88cd:20b0:386:a16d:1bce with SMTP id 5a478bee46e88-386a16d1cb0mr11929126eec.36.1795596550406;
        Wed, 25 Nov 2026 00:49:10 -0800 (PST)
Received: from ThinkPad ([192.220.23.71])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b9bdafb5sm18879252eec.9.2026.11.25.00.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:49:10 -0800 (PST)
From: Qiling Zhu <kmatzkaczor244@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Rong Zhang <i@rong.moe>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	linux-leds@vger.kernel.org,
	vishnuocv@gmail.com,
	vsankar@lenovo.com,
	Andrea Rabbaglietti <rabbagliettiandrea@gmail.com>
Subject: [PATCH v4 5/6] platform/x86: thinkpad_acpi: Detect auto-mode capability via MLCG
Date: Wed, 25 Nov 2026 16:46:42 +0800
Message-ID: <20261125084644.137506-6-kmatzkaczor244@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125084644.137506-1-kmatzkaczor244@gmail.com>
References: <20261125084644.137506-1-kmatzkaczor244@gmail.com>
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

MLCG bit 20 indicates whether the EC supports the auto mode of the
keyboard backlight (0 = manual levels only, 1 = auto mode available), as
defined by the firmware.

Record it in tp_features.kbdlight_auto, for use when registering the
auto-mode trigger in a subsequent change.

Link: https://lore.kernel.org/r/CABxCQKuEP5wMSstO0MK1MhaqXTKrPhUSN3V2mrE_42j4cXsXZQ@mail.gmail.com
Signed-off-by: Qiling Zhu <kmatzkaczor244@gmail.com>
Reviewed-by: Rong Zhang <i@rong.moe>

---
Mark Pearson's Reviewed-by was given on the v3 version of this patch,
which tested BIT(20) directly.  The symbolic name was added at Rong's
request, so the tag is not carried over.
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 764b1efa6..ee8f7429d 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -363,6 +363,7 @@ static struct {
 		TP_HOTKEY_TABLET_USES_GMMS,
 	} hotkey_tablet;
 	u32 kbdlight:1;
+	u32 kbdlight_auto:1;
 	u32 light:1;
 	u32 light_status:1;
 	u32 bright_acpimode:1;
@@ -5105,6 +5106,9 @@ static struct ibm_struct video_driver_data = {
 /* EC level that selects the auto mode for the keyboard backlight */
 #define TPACPI_KBD_LIGHT_AUTO_LEVEL 3
 
+/* MLCG bit that indicates whether the EC supports the auto mode */
+#define TPACPI_KBD_LIGHT_AUTO_CAPABLE_BIT 20
+
 /*
  * Cached EC level, including TPACPI_KBD_LIGHT_AUTO_LEVEL.  All state
  * tracking compares EC levels; the auto mode is translated to a
@@ -5189,6 +5193,13 @@ static bool kbdlight_is_supported(void)
 	}
 
 	vdbg_printk(TPACPI_DBG_INIT, "kbdlight MLCG returned 0x%x\n", status);
+
+	/*
+	 * MLCG bit 20 indicates auto mode support: 0 = manual levels only,
+	 * 1 = auto mode available (per the firmware definition).
+	 */
+	tp_features.kbdlight_auto = !!(status & BIT(TPACPI_KBD_LIGHT_AUTO_CAPABLE_BIT));
+
 	/*
 	 * Guessed test for keyboard backlight:
 	 *
-- 
2.56.1

