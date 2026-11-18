Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989822;
	b=oYX9YgTBZqQT902Xa+AtKIoXWsfDtliuSY2d9fpwWnyLePuykjuyEC3v4NfzfJm1SROj
	 eT3Ze2LrXNjL07UJW27w7+hfdVoaNf4y+iNlNCYH6aOEErzIAKqt2yMXYkvWeR2aly+/p
	 v7Mh8RHjRBaOXqxnYo7nkFOOYCuBm07qTGLVNJQmV+GPCJH24K39M5kwP48H7lbv78akS
	 HLTD9kztwwKN3NXXuuttN1CAaVgkxlzvO7IKWgIQsaGu5RRRGwhqqN+T7u/3SGrc9dyCa
	 SzJo7m1K4gcBlC1EGC+8H7GiyZRADtvY7g5dG1CdsvbHLi7M9TXNRQ3Ig5eTbCn04qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989822;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OJxJeX1TZ4NXl+gWbQJlsLUGfVmetcz7/E4tPwbQkwQ=;
	b=MFJDIfUcmtiuc2u6Dj2m+j8CJF26XQNQci8PyGnUInD4gKmvJk7z2KPtwi8Lod3NUBzb
	 2OvW1GFv2X8Xt2FmhEg7DeB0TqC+E9vifIQVgRP4FYNW5hpYe/oh3AVfStUbqOh8PMpy7
	 zIarEvtdJthRF3H4izLfSNLgTVl/sbg4IT1URW7zFp0/gT3NJdXgPxNmGuIeP7LUr3P0W
	 whdwFzTLFX1d2cZnr68c7F+srsCzVKP72LsJNw6xLG//5/UVTHU0W74HPHGUMGuQ9lKK5
	 E2QevL7ntHekDJSzR8KeBfx11nFPZcQB96c32T/kDUxs2DeeSlaS6agNL2maIXakfew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UfhF9EMK;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1660D60A382E
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:17:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1660D60A382E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UfhF9EMK
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8b66d1a08ccso601394b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794989821; x=1795594621; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OJxJeX1TZ4NXl+gWbQJlsLUGfVmetcz7/E4tPwbQkwQ=;
        b=UfhF9EMKi+sDyZT60N870F8UUlDgrOxOUUPU4PeKpsgBuIJyadVJAL7tHL5B2+RSpj
         5XXBC+HBMV3ELBjlSJf6JaEZcrRUu4CYDB74G2DjvjMxrHQnBThjQRXRk+UF4k0gUgr7
         HnZvzjiyu1D61uAr5GlaCrVMyFo6CHDjxBg58NeBBX4qtQxj1BMEcZ00gEfSqXgfN6NK
         HFGb5taNqJuTaJbKZqcOXu5wimflibVioFDBO/MoKShc1SUQLTQDtuuo0aViNSocixK3
         ZFckPz1YJI03Dy/zqDtTcMCET2J/zJ1TXo9t7bgTbOAZZRHT1v3/M6hxKbaGXWyVfP6T
         6Ybg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989821; x=1795594621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OJxJeX1TZ4NXl+gWbQJlsLUGfVmetcz7/E4tPwbQkwQ=;
        b=CLBTrogAEICFOay1JLjLUPwedo4ozS5xWUOT8y9fMIfNP13xss4xBOzsvDDLxxsseP
         EPWRZHhPSzet6iaxfU5wbWrfZXGX9ale780yXs09qvyMDYlF/zemRnV8bHLi7v2F8FAo
         R2YS8i4ilDYm2ZewUAo9mh3jlLxY/2W4/bRcsWw7I4iPAoDTc+RGqDzafhGke4pTjdpa
         PUe7DCSN/Qnx2vNqlL8O+FgrjfcxLpVUD+qL5vGFcRMfmGk2MbhNyv1zz9w8VbpRbnlP
         WrwBqhsFlHkJA848JghBt4KGxaxI4IpxqCfwZKzF87LKS1t4k2Lh/az5J05kCSCQIv7h
         j6vg==
X-Gm-Message-State: APuU4Z+ByzAq9kGahhsDvRRUezD3UM4FrjGav7xa9SRn0ShrVKQz22q5
	KdaNgI07QaKDO2UvaR8Qyau/Duhh3kQ1SjvjaLsTAhpL9CCMjyk09oDE
X-Gm-Gg: AYBFou265JK0kCXzO8n5QqtZy9ZmDk4a2x4r+8BeJEN5h//x9PwmMDk7dkNEl0yXDmt
	qbNtk7lWrhzmFIB+y6CsORYUwYkiCp4dPkXd7pMmPnPKJUl4nsV3SigDfdRI/LVoVfyvmVpA8Io
	ENjyjF/Smc5a+0qTcPn4iQzbdRO0jpZCOHm/jaC6ujQf131gIQ5fQtgpJuLWtv9MGsTO7rjCati
	KcDGHQgdiij147ZeoqqhEjlkOlpXdksA/kWtDWQYoYtLRpGTREYlZFJdZXPMIy/5Xosqu2NJEMZ
	ZDcSkQPNsLQwG/JaEXclHjeJJ4c540uyh2zhrkdxotC9SDArvHbCFMBgsUnbJFLrrTnfuYGl5Iu
	jFUHxynAt+4RhlRCAOLw+7ulFgaeBoTOEKHCpG4UiYaHcak0Wyc+e4g58n+ta0cHx0ggfsj+Q/R
	YMzUwTKV87pKZ3+L0hG3I1W9cr6CU7XlhexuMJH+dHn1/yyMOqLDxp3+IR2y/qmZjmotBGZ/G/z
	ozJvn0fOQlvgweDtFYIIfjSIdffo2NT0oBBGnq7REP0KJ31o7AoqioZ7zL+g7emKoHekI8oewAQ
	q4fwwDoW4Y5oryaULShTOL8Z+XkeQBpPL6J2qUw1Mtg55BF8bK/z4HRDKTXMpizpnewYUh4=
X-Received: by 2002:a05:6a00:4f89:b0:878:34d7:697c with SMTP id d2e1a72fcca58-8c5d49d1ac5mr1652424b3a.42.1794989821521;
        Wed, 18 Nov 2026 00:17:01 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5cad8cefbsm764401b3a.31.2026.11.18.00.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:17:01 -0800 (PST)
From: a0282524688@gmail.com
To: lee@kernel.org,
	Ming Yu <tmyu0@nuvoton.com>
Cc: linux-kernel@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>,
	mfd@lists.linux.dev
Subject: [PATCH v10 09/13] mfd: nct6694: Rename driver to nct6694-usb
Date: Wed, 18 Nov 2026 16:16:20 +0800
Message-Id: <20261118081625.2399247-10-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118081625.2399247-1-a0282524688@gmail.com>
References: <20261118081625.2399247-1-a0282524688@gmail.com>
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

From: Ming Yu <a0282524688@gmail.com>

Rename nct6694.c to nct6694-usb.c to reflect that it implements the
USB transport, in preparation for the core and HIF transport added in
later patches. The module is renamed to nct6694-usb accordingly.

No functional change.

Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
Changes in v10:
- None.

Changes in v9:
- None.

Changes in v8:
- Only rename the file; the Kconfig split moves to the patch that
  introduces nct6694-core.c.

Changes in v7:
- None.

Changes in v6:
- None.

Changes in v5:
- Split from the monolithic v4 patch to follow the single logical change
  principle.

 MAINTAINERS                              | 2 +-
 drivers/mfd/Makefile                     | 2 +-
 drivers/mfd/{nct6694.c => nct6694-usb.c} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename drivers/mfd/{nct6694.c => nct6694-usb.c} (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index d738990161bd..62517279b5f8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20081,7 +20081,7 @@ S:	Supported
 F:	drivers/gpio/gpio-nct6694.c
 F:	drivers/hwmon/nct6694-hwmon.c
 F:	drivers/i2c/busses/i2c-nct6694.c
-F:	drivers/mfd/nct6694.c
+F:	drivers/mfd/nct6694-usb.c
 F:	drivers/net/can/usb/nct6694_canfd.c
 F:	drivers/rtc/rtc-nct6694.c
 F:	drivers/watchdog/nct6694_wdt.c
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index f8101d2a9ce9..af81e00b3573 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -124,7 +124,7 @@ obj-$(CONFIG_MFD_MC13XXX_I2C)	+= mc13xxx-i2c.o
 
 obj-$(CONFIG_MFD_PF1550)	+= pf1550.o
 
-obj-$(CONFIG_MFD_NCT6694)	+= nct6694.o
+obj-$(CONFIG_MFD_NCT6694)	+= nct6694-usb.o
 
 obj-$(CONFIG_MFD_CORE)		+= mfd-core.o
 
diff --git a/drivers/mfd/nct6694.c b/drivers/mfd/nct6694-usb.c
similarity index 100%
rename from drivers/mfd/nct6694.c
rename to drivers/mfd/nct6694-usb.c
-- 
2.34.1

