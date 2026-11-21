Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795239057;
	b=csMSdVFRAGTjP4zFyzeww+g01YLFlYA5wu2UJ+CfSJdYerwyBkdZUfJMCvhHAv5QFyWZ
	 7CKLobwxoutAJFz/zwpBmqEW6B1G1jm/EE9VGHhyyfbSavelHD8wRNZi8UVDf76cZeJQg
	 0yaadV5FOIt+FHzi4UJZwPFJE5Juiod5OMzX9b6rDbSGHCBbiir4YH+9vgn3+J7m79kD6
	 2R2ARpReuN6TpocqDnde0BtzfhPG86bli+utKCFc0GUdBiLj00fLIiqtvhK23sbBAxvDa
	 YInmfeBN7DN6GOIY9VCST5f7jbxMKwBhFwo9w+C4VqKmlP2RYRkLZ8XvpsnxJfKtmPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795239057;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6h7S1Z/Yg4pL1JyrxjPN4A6nDLlEh5v9NxEZIV677W4=;
	b=CH3ECnYperYwRqNWTYt394TC5+jxm6ZWXC6WOHclZNRBiNinJmInZIuJb4kk0nnIgV/H
	 mxG8Ohor0NQh68FmVMGYpTd59A2/6x7dorEKE06leMi/eO4WWkdrBHVCkUuZ4LFXASNuT
	 n/AP79KZdXPygiO1UHqVf1WT3nE5X1Gxn6GWmSfN6MZTRbu/dPRRQc8ed7fU1wzG71Fbx
	 NJX3gQUapUcktVRwuDBqvhhtbXnr8ib10qm3Kc6TnwUn9aOunveaWpLaJSpFDGvq3Sfvl
	 K4eciwBvZVF7YMfdztTqPffuvEHLKTTsunmKnGU4vqmhv+cUBeOogIVI4WlgnPAZmuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HDGIGh8X;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BBC606A6A0
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 05:30:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10BBC606A6A0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HDGIGh8X
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2f05b465cd1so3476065ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 21:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795239049; x=1795843849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6h7S1Z/Yg4pL1JyrxjPN4A6nDLlEh5v9NxEZIV677W4=;
        b=HDGIGh8XXuu6yFs5aKL2Y/+U8+5jXNrGXkzEe0/GwzpL/UTmJWLhS7qFFSs8ym2AfQ
         DbHqnJ5ZwZHpzx0eNkroFT9fd4xzei1MuSH5OL6YnyzbxsFUj9CDnjQO5rqbG3PNPXtk
         KRsryNkz7TqJ9bTVw4zPmpzSm9Qr/y74HZSfMAccWQwylHRQUoRVbFhwFc6RlPqvOHLU
         YXLu2BoGm8Z5UervBGgFhGiRjcriO+KbWDi0ggPNI8+ycvFEw8mSALPMRKrTRrQku3P6
         qP6sqX5lLXmE0ZW98Qdt+ZaIKpAdeVEWdqh4uSIeD5qh4EB1cotryl2Fcc/x5gmynWS9
         +CJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795239049; x=1795843849;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6h7S1Z/Yg4pL1JyrxjPN4A6nDLlEh5v9NxEZIV677W4=;
        b=T5R8SjGZiGmyShoMuYEHoY4jXEavwZ1BH9jpO2QmahgDedYEznJzeXV38x0ijwjJw/
         Q2xHIEVEjg//8YU4rG6b5JCM+fzzAn6AjaV6ZaC4bNklcUEXtWWuFpTLXViBE4vM4MAU
         FhWu1cRfOx4Aj0aYO36Rn6vZVm4c2wVU6ObopPknV0hzIa2q9Hff50iCsNpwJ3INalMy
         TyjsapZ5EPyhglRG6zHMZNlYt/yoXT3qIihsLvr3MnVvtYsCboer74NCWcpaONijh1b2
         0Y6x4o58xK3IqB1X2JYDNCCjJsz/1pvblAC3jW4uqt22ipzbgpD3TeSkgcobakfldg/Q
         +TtA==
X-Forwarded-Encrypted: i=1; AL+hErFvMNRDhGX+eiKj9Lr1SZbKoo5cK3iQCkL9PubmWqE5VJSm1NoDuturf1ibLG6LU1pOjjVEWJ0faEGXK7g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TpHXzSb2IoQkHwdnuvCv0euq0yVREEWVwjYoeAdHZa67MZELG
	xQuZ2jVCTQQCOF90gp6OHUObulXP2QPha/OfGR05qOJv7aL/s1xAU4Vb
X-Gm-Gg: AZFdTZebjaM29S5Yhse55R9xkHTF9VRCWQynrjVo9yQNFzgX5gK/U/nrkKDSdgjrxtp
	Z3Ao8iC7V3jFWjAYjMU9fqsee+lPf73xsqKyRUT8jYC2xDn1zuuhqwfwUtY5z35k2TUp1KVXZTR
	uW3EWt3hJXbQ222SckKnSmQWnv3ooLQdcHLE6N8fIyjuTjbKckY0OPdulkm7WUR2uUcb/hqUzhq
	rwHwiCt8Zs5PDoM4fUDHR97yruIWYGPNVVyY+f5UjFV6oLuYGS7ekN6CHbSBtaB9vD052e3blRq
	Yi2+ulrGf1am26uhjhT2jLqoeBznN4nLePuiQhsVOoJePqNJZ1Bf02e5TPh199q+sFL4IlqF3WS
	k/+iLzXhqQq3MGH/hEOwYRcCwcr1oDCPSp857kGoSnlQwhfCWTJa/Kbk9t3EmixTegCR45NS1qR
	tO9gNC2ReOW2FXMU3z+GxNDjwzN8SS/U+fKhYXf/hDCa4t2S1OWX5hkqE9YipJVMSbYHZsM67ZO
	PVtaG7bf9vyJfzSwSbN6zVorWJYB8Ku0mQT+oAe0CZg1z3rDcDWNUm7sLe6Y/8IMMMdb2lzOE+/
	aO9ppSi/F/+i/APlhF2962U9fkn+Yo3H6VbU7B2HuxUY5PRc
X-Received: by 2002:a17:903:298c:b0:2e9:5714:6075 with SMTP id d9443c01a7336-2f03f117c82mr51260805ad.17.1795239049247;
        Fri, 20 Nov 2026 21:30:49 -0800 (PST)
Received: from localhost.localdomain ([115.73.20.187])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0433a3a43sm18751085ad.62.2026.11.20.21.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 21:30:48 -0800 (PST)
From: Nhat Tran <nhat.tranminhk2@gmail.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Lars Poeschel <poeschel@lemonage.de>,
	linux-watchdog@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nhat Tran <nhat.tranminhk2@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] watchdog: core: Don't report time left for a stopped watchdog
Date: Sat, 21 Nov 2026 12:29:50 +0700
Message-Id: <20261121052950.287506-1-nhat.tranminhk2@gmail.com>
X-Mailer: git-send-email 2.25.1
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

watchdog_get_timeleft() calls the driver's ->get_timeleft() regardless
of whether the watchdog is running. It is reachable through the sysfs
timeleft attribute, which is world readable with CONFIG_WATCHDOG_SYSFS=y,
and through WDIOC_GETTIMELEFT, also after the watchdog was stopped with
WDIOS_DISABLECARD while the device is still open.

Drivers may not be able to access the hardware while the watchdog is
stopped. omap_wdt only holds a runtime PM reference while the watchdog
is running, so on a BeagleBone Black (AM335x) reading the counter of a
stopped watchdog triggers an external abort. Any unprivileged user can
hit it through sysfs:

  $ cat /sys/class/watchdog/watchdog0/timeleft
  Unhandled fault: external abort on non-linefetch (0x1028) at 0xf9e35028
  Internal error: : 1028 [#1] SMP ARM
  PC is at omap_wdt_get_timeleft+0x4/0x14
  LR is at watchdog_get_timeleft+0x24/0x130
  Call trace:
   omap_wdt_get_timeleft from watchdog_get_timeleft+0x24/0x130
   watchdog_get_timeleft from timeleft_show+0x3c/0x80
   timeleft_show from dev_attr_show+0x18/0x4c
   dev_attr_show from sysfs_kf_seq_show+0xa0/0x138
   ...

and the same happens with WDIOS_DISABLECARD followed by
WDIOC_GETTIMELEFT on the open device, once the module has idled:

  Call trace:
   omap_wdt_get_timeleft from watchdog_get_timeleft+0x24/0x130
   watchdog_get_timeleft from watchdog_ioctl+0x494/0x668
   watchdog_ioctl from sys_ioctl+0x128/0xbcc
   sys_ioctl from ret_fast_syscall+0x0/0x54

If the ioctl comes before the module has idled, the read succeeds but
reports 59 seconds left for a watchdog that is stopped.

A stopped watchdog will not reboot the system, so report 0 time left
when neither WDOG_ACTIVE nor WDOG_HW_RUNNING is set, without calling
into the driver. This matches the software fallback for drivers without
->get_timeleft(), which already decays to 0 once the watchdog is no
longer pinged.

Tested on a BeagleBone Black: with the watchdog stopped, both the sysfs
attribute and WDIOC_GETTIMELEFT after WDIOS_DISABLECARD return 0; with
the watchdog started through /dev/watchdog0, timeleft counts down as
before (59, then 56 three seconds later).

Fixes: 452fafed839e ("watchdog: omap_wdt: implement get_timeleft")
Cc: stable@vger.kernel.org
Suggested-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Nhat Tran <nhat.tranminhk2@gmail.com>
---
v1->v2:
- Moved the check from omap_wdt into watchdog_get_timeleft(), as
  suggested by Guenter, so it covers all drivers
- Return 0 for a stopped watchdog; this also covers WDIOC_GETTIMELEFT
  after WDIOS_DISABLECARD on an open device

v1: https://lore.kernel.org/all/20261120124009.24264-1-nhat.tranminhk2@gmail.com/
---
 drivers/watchdog/watchdog_dev.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
index e8c1fcb53c56..b67a68316bda 100644
--- a/drivers/watchdog/watchdog_dev.c
+++ b/drivers/watchdog/watchdog_dev.c
@@ -435,6 +435,9 @@ static void watchdog_get_timeleft(struct watchdog_device *wdd,
 {
 	*timeleft = 0;
 
+	if (!watchdog_active(wdd) && !watchdog_hw_running(wdd))
+		return;
+
 	if (wdd->ops->get_timeleft) {
 		*timeleft = wdd->ops->get_timeleft(wdd);
 	} else {
-- 
2.25.1

