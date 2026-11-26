Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795698229;
	b=Ne0AXUExa2UvZqvPoHS4ZQIwrOk7/MG/Y3lGkUqerJZxwYyln6rqA1RO7ZrgPQpSq41x
	 wnYzAXMuvHpmq+6C3J8Tci+UoiwZegBW3KsdLO7z5ez5LQLWTURrRpGpK4FEwkWdKxw/l
	 vUkROB2fUHppqOtJi4fAqLuw4iUz3EIV3/HSNAkslgn447YIxCYegsVeV7bBNAUWqvWyu
	 ej/Ji+D1SrAL7nL8pcaAIGVM7YkJKez2LIgPGpphM0jrJfZjfyBEvgUxaxs+Ox06yI4xs
	 eG6UESa8GdD/KnBJnqTO48fpfYQFc4IIjJbFBtzhRlZr8POwwrOq4l2nAfx6/UdAwLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795698229;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=Pgy/LqViivjz+vBeamFRAxJjrlPLa2NnrUA8TY0Ipuo=;
	b=A3X7kMApT4INGOhju/qBqbEkAJN9RoIe/NtGQEIj+pnz9UG6bbr4RpykuF7MpBS01wDo
	 e3Mqf52CMuZuX4nf+51RUuSzuugfrH/gg25exMJGbHxHcuK8IkeYrD99R3HuuI1MgnduL
	 UpmSE2fzA4Ubqtmud+CTcIdIn7w7cI53u/SxaDqjnLB3FkgH8om2+NFZRpwkSINW+YK0v
	 uw/P1/yLHGqNc1DEx81gXLGnPhJ85hUiCtKoVog4p9rYYJVSrtN+Z+WX6wR+OJDMb9Rab
	 jvV8X46+LXREsNg12Vb5lyWixi1yLDA0rz2AU5hRJLkurdksY2g0rH3E7MamaC5BQFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="x/peqbeB";
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE55606A329
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:03:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BE55606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x/peqbeB
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-491971ac844so6226310f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795698227; x=1796303027; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pgy/LqViivjz+vBeamFRAxJjrlPLa2NnrUA8TY0Ipuo=;
        b=x/peqbeB55gWorimKoGuMgAbuxLB1FWa7z+7d4eQogwmahuKJakcftf5bsdqvOo57W
         Wif8V+dxneKbL5i4KouqalEX27nZgNu89OYqK+98mECwaBB46a36REDDDfYjRJ7z6WPj
         TkcvJv8EjfXJmlvxD5iMIKZeDHwEDEIXdk0b+JAUDoYglwKmXwcYTGzPB+xtA/m5lKx0
         jDV+cgDOO9g/pCSzZHYvdw4Eo9toRZajnHXObw3eCrfV5jfJvAAmsVO+yNpd4Bgc2yUT
         HY6wIfaIhK1N3K6DRvSXWa2fK9IWJ9PmAN2G7lWLDF28Jh9IizYVKEABwbziyzvokTVA
         vn3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795698227; x=1796303027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pgy/LqViivjz+vBeamFRAxJjrlPLa2NnrUA8TY0Ipuo=;
        b=grOzM7SckjcR/gd9/v7bycpEhVr6Goai4eGV7Zrj/aO/Yglqk+Ja9q47R9QUxFgyA3
         JtOGfv1U72ztoUeNUgsA8ihW3iBl4OcGLRrZpejQ8Jx/bSmq3T11Btjr7rjhLh0MBtup
         qkC47M2LGYuwJSZX1U9cGllBtOaiw0Sh5zNFZjhlv4fzVfMEz7/XDwRCENSj8A9ylFSG
         GotqNJO+Y1C1QiQ8qXOasAfTi2x/xqZd+oYzaH0AUsOQZf1nm6K1QggObN/i5SNggwAX
         fLt4eDbAZIA09M6sd+LNqfOqVveWtaC0BopCllIWXaTByubcFtE5jE1x6IAG/6HQhIW5
         mmFA==
X-Gm-Message-State: APuU4Z+287pQ3VV4GffU7VGsmB/214/Ft7bycePCvAXORc4ruK8ZTanK
	yhIOMRm+0W6K1wtMMrU2qLA+9gapIyWYqjagKGPYwPZGF8mQeKi7Xh1AGgURYDuZSBM=
X-Gm-Gg: AZFdTZdIIXYRlI1EOulEglwWN4BSvAhB6FGFYtjDVBiHszKF23Fhcp33OZRMzEoMhEd
	l3Dch6Kuc4sIwS6V8/fJ2KkbzTbts9h6QJRAp2o0x9b48DWmsD5vfGYNKOFtWuGDBxbsTxl+7KB
	xfM23UADp0DNV84EUaz/+ynh9tfA1LJV13hpFifoQLh/Vhg091r50pOvAqSayXg9bJQgg/xwV8H
	sxBEpAdBpBqRWQ21gyYqgqsh8REycKFS5nCUmBBxpLMs0Ys5ppd20S7yae78z0fygMVM2/DoDPY
	SgcNOryYzDlzg5jAstOucYfhQ2zBsTQ6qFSTehDCn7j3KMMGXNOFaDV+/fb3NSzmPuINiONVrPQ
	3UkqkyfdUE1f4DEnnm0WVF7TBEs3tjiOsF1n8dFGni8/Dh4EFBj5961aR0wU+BJB/xtmWMHXFdq
	Jtt2NshpEi3VuzCRBC7UC5VRMnD+eoARY+Y1w2UsGErbxr9OcJxIVqrncDusdQfboT+TTTTgxqS
	kaKikUiitj7X796X8QVCNv58sEDVT1/zS67REgNmWmSRn4GWDcKbcMisocxjoOjTov+syP5E0AW
	rMxXWFuRhsBec0QwgtMU3sUD9zPmQb2mo5ZKSynvEGYLGFQ8wecS1fmO+bS20x4nzSsR5Wsgmve
	JsZTtTZzegNk2/UM=
X-Received: by 2002:a05:6000:990:b0:493:ec0:861c with SMTP id ffacd0b85a97d-4abb0c5d53fmr39049675f8f.16.1795698226719;
        Thu, 26 Nov 2026 05:03:46 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6ae2dd55sm39331425f8f.30.2026.11.26.05.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 05:03:46 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Date: Thu, 26 Nov 2026 14:03:29 +0100
Subject: [PATCH v5 1/3] soc: bcm2835: raspberrypi-firmware: Add PMIC ADC
 property tag
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
Message-Id: <20261126-hwmon-da9091-v5-1-0c3570ba9133@gmail.com>
References: <20261126-hwmon-da9091-v5-0-0c3570ba9133@gmail.com>
In-Reply-To: <20261126-hwmon-da9091-v5-0-0c3570ba9133@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Stefan Wahren <wahrenst@gmx.net>, Guenter Roeck <linux@roeck-us.net>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org, 
 linux-doc@vger.kernel.org, Peter Robinson <pbrobinson@gmail.com>, 
 Sander Speetjens <sander.speetjens@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1334;
 i=sander.speetjens@gmail.com; h=from:subject:message-id;
 bh=/iUxca9FTu0bgiQQeq8SBVCAGFP6lu621MvCErbuE0Y=;
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBrCC4xNEx4B4+w47Y6KIxfaxL7O51qs8bnihmov
 1fup0sxu1eJAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCawguMQAKCRB4zXhFDAXI
 Z+MiD/46w5hTMfyhn4m39PvQETjkM33y7fxz8RsI96szfIvy31g1+2HfYzpr/qavjjnOw75LoKd
 XlkZVtPWoZ2D0h6fQKjCxfAc4faI2Jcaw76XaZuJCT95fLzAFeXPHZHp/KawJaoNQcQj/av+zoE
 h7gQfnhRTLPYQIXFz6oazBY+MzPmBoUZ/MW/XPl9o8nIpveCXi5//Qu/iG7PE3B8KqDpGjBRrxT
 ulKKDu7ga5hj3gR+GFwGd4z9oJhVXsfXVM9TOjMrrx3LwHhZviUe5H+uIf6H6tcedKHbXGo9udo
 EI3dP3yFy0NFJjUy2zONdxKU01sec/XYelCLf8W+auYJZvSatkpnawQbYiF+wpQ40Av/tKZacVC
 te9+fmlU0kKwLq/6ASwljDjKomGFulcwaS/5CimW8G5jY8N0vVVMB41N9l2TrVkD+g+s0sOc2lo
 xqeb29TF7WbUZiaB77bWifC6k5NoT6MMnpTDPjyktDaKd4bK9fhOB59Mos7wVKSogOsdTx6+IVz
 cIn1KmqP1qtRmLueWZ+LmSSsnyguANaEaOjc71jOaur1sr+xZdtqxO6/+4gFEvuY9DSwPQelNaG
 oZuPQpRKiUAABqOS0Cbi8MtYXOWAYLnNqTJGPYRlg+CcynVEAU5dsjAryEun5MdFMdwnpmzsfJv
 DsbZ8j75xwgtE5g==
X-Developer-Key: i=sander.speetjens@gmail.com; a=openpgp;
 fpr=56524A8B001A11C3EEC9510178CD78450C05C867

Add RPI_FIRMWARE_GET_PMIC_ADC (0x0003009f) to the firmware property
tag enum.

Recent Raspberry Pi firmware exposes a structured mailbox property
that returns PMIC ADC readings (voltages, currents and temperatures)
in binary form[1]. This is required by the upcoming hwmon driver for the
DA9091 PMIC on Raspberry Pi 5.

[1] https://forums.raspberrypi.com/viewtopic.php?p=2391319
Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
 include/soc/bcm2835/raspberrypi-firmware.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bcm2835/raspberrypi-firmware.h
index 20141eb2cb67..90d7b66b96e3 100644
--- a/include/soc/bcm2835/raspberrypi-firmware.h
+++ b/include/soc/bcm2835/raspberrypi-firmware.h
@@ -84,6 +84,7 @@ enum rpi_firmware_property_tag {
 	RPI_FIRMWARE_GET_REBOOT_FLAGS =                       0x00030064,
 	RPI_FIRMWARE_NOTIFY_DISPLAY_DONE =                    0x00030066,
 	RPI_FIRMWARE_GET_RTC_REG =                            0x00030087,
+	RPI_FIRMWARE_GET_PMIC_ADC =                           0x0003009f,
 	RPI_FIRMWARE_SET_CLOCK_STATE =                        0x00038001,
 	RPI_FIRMWARE_SET_CLOCK_RATE =                         0x00038002,
 	RPI_FIRMWARE_SET_VOLTAGE =                            0x00038003,

-- 
2.56.1

