Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795698228;
	b=O7Uqa1ZgLQdZYwyOO4hPWoHXuzfmFhDQKrBVTousrolq3tjdVIY1M4iUHB8m+CC16CQ5
	 ag9SWZC3IAOdtDOt/9DiQawFxrjqO2/WD/ZUOiHqM6AhoHLC44JlV5JDp98ySJ7ixu4JS
	 njix/3+hC5DVWSHJb4pZi1rGm5BebMfzjN4sr5DPhZDXBZ3w4i1mXs0t2q4LNYAvmFJNw
	 +20fHjitPD0N+X1yXS4FLE2e++szgMk2WXLNuWDXG3A1aYYwfX2WVm3twX6RU0ujzEY4K
	 vazcZXrj92Q0elT5M3LEa7yEgFbp24HZC5Ng/Lyg8gVYXhUh0RSjnA2F9LjJJjZOSXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795698228;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=OeRjPPZqNacTwo8Qqr0CJwW7bzppscpQmV9mkBf/Brc=;
	b=20jAlIOoQFnQszg76D+R4pQ3TJwG2CyK65ngdIJoN/twORDAm9AE3sqrIg8cnj8OGYsS
	 pU5A8OPhPhh3wuSqVajP6ToV9qWDQl7hJOsJvSLhiWX+50rM2Xe34Xu4k74lb82Ppe2Fm
	 nefh2Gm61X9MiYr7faOyrZXjWlQDWa1vFr5OZerVp4iSFDdgk0Wwyd4vXLxumo4KXYpud
	 a6rfxCgAI/1apN0SOCerflXotu9siw8WgRXD5SOmFGTKKNGlsF9lDo7dhnMoqBfijJhVl
	 kttDlebT+NwXdWOzyLtIp+uHVK1WBjXiLda8VDbp2kbj1UvZ3tkCwR35+sPpiZa6GjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tCSI7GjG;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0397E606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:03:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0397E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tCSI7GjG
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so70043015e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795698226; x=1796303026; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OeRjPPZqNacTwo8Qqr0CJwW7bzppscpQmV9mkBf/Brc=;
        b=tCSI7GjGk0P3UCYE/Z2zC3FFcRRFNPQVRswKNCpXjvaV5wXDaLpeinnEhPNbANWZsN
         A1vLB6eJFQfLGxqlq7STxYaMU3l+F6RJOnE9ccVE74gug/pxkiuHmHF/NxAkdquR2LOR
         kCSmqA28ZxgRArJRu4YLsA96w2gyoQVVBzQBnoRrvOHahHWNeIhGGNoj+vYqafvgpzTY
         AhhIF5pWq9EMLt0IrkDWToPoKbRnvuqYV+CJBNt7t+X9Nozzmvygirc7qX8+q1SEOE24
         VGFP06eEjW+AosS+GgG/aIJWGJdc/9hKJ4OTB3zzvREs2CDaxM1/55zvCQJmU8D+Ew4L
         QfHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795698226; x=1796303026;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OeRjPPZqNacTwo8Qqr0CJwW7bzppscpQmV9mkBf/Brc=;
        b=WVKCnyNqhzkFirsA2XTAN8DfDEYT1Xd8LLtLdQ3y6A0xkHmqbs3/CRaehVD4krfXkY
         FRByJaFnbQ2zOGGxDkyAlmV5KWTopDU9I4GdBLXzFc2/2OYy/aNyS1U4A/DNCGvZBiSw
         4UcbQDjaRyrIp7izh9iJy8X9oXFvlCA4O5VEQnEzMqBc5h/rrXjqTOYQbl/PKCz8eQqM
         7tz1c985pwRikawnK7yOQzTpxvAxtDGziSi1i1/NOB+u2xuH6KacWd2uXDsbBaHurmx7
         Gdfq2a5scnCBgVMS08UzctgijwtfOvwCj/3L0VDllAVPJk+sHamlGQNXIuRqwExGL1Cl
         /OXw==
X-Gm-Message-State: APuU4Z9i1sJ70/JfipkrUYfo4G9IAchEIj4AvGuf0/OMfQWJKu/Y7IC7
	VLbZN4UfHKMDf6UHttQeyvslFH42f2h50U3Ns2xKVONxEjUfwUcIY7hp
X-Gm-Gg: AZFdTZeO9YsXKrlGu6UJr3rQ9XuvCmf+1d+/pxwO7Xigztt5aVrUwgW+gznIrOLpGTa
	8dYv22ScZ+AnpWqvLAXgXgaL4cuhL7QVXLYrZOmz04rP0EY3DAuHMNxUOYPoKm4GlsMUux/qFt+
	Aut2kt1SNfgbOoUyxqoKVBUmDmwCwhsPjJRJt2RVsjRQcxOpJjZPKGe+lfKUTCuV5CLYuVm1Fsl
	v778rres4MhRRVSffChGklEHUvi/OC+E2eLZn9oaVAMl4wuMll7tQHul9C0VdZtuxvtJXQF2DFd
	9DFPw4Hg3RCDPGwViz1cyRWtZmXsZ4cmijH4gR73W3FU0tYODRCYEE/W3p1O2C5JgsNvK5+r9p3
	icmZmj04uRcYTEfHLbgDdwxa7I5DcSssA5HqgQ9fyVnVkOIJn6wQU45O6xLHeHtCnhM5S0fsnHo
	9koXnRBREp+O7C5toLTCX3a3xWShy3rlPLOb2UM5pav4+6vliKtBVaUvUPl9Q9biCT7TQyEilJB
	ESdSmYOSxpQH4ooBCbSKDC+OmrdifyGdD266on0tyqzIgkL2+09HXUuTqpVkpx4I7ehykGz7ns4
	HbjsA2GcWm7vVWulbbphLjwiCbIennl/V0H04gVlsZg04x182EPbn2cFQklEJ5912czdvF3C9Z0
	DpIom5iRN6bU95WU=
X-Received: by 2002:a05:600c:8486:b0:4a6:4d6b:a840 with SMTP id 5b1f17b1804b1-4bb88819468mr432182315e9.31.1795698226066;
        Thu, 26 Nov 2026 05:03:46 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6ae2dd55sm39331425f8f.30.2026.11.26.05.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 05:03:45 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Subject: [PATCH v5 0/3] hwmon: add Raspberry Pi 5 PMIC driver
Date: Thu, 26 Nov 2026 14:03:28 +0100
Message-Id: <20261126-hwmon-da9091-v5-0-0c3570ba9133@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/32Qy27DIBBFfwWxDjYYA8Gr/kfVBY+xjRrsBIibK
 sq/V7Y3UVRlN69z587ccYYUIOMO3XGCJeQwT7hD4oCwG800AAkedwg3tJGMMUXGnzhPxBtNNSP
 KABgn/RH6Iz4gfE7Qh9sm9/m15wku15BD2YvYmgykJIAOjaWcc1fXQyjVN6QJTtWchvp8tXV2s
 T6F6Xqr98Y6U09wK3uVrGE1hIKiyQXSunoTdnOMoXRIecHAGu17ozynxhpLrRJCUdC9klRwKaE
 VFq8mx5DLnH63Fyxsc/n/tQsjjPRC9NT02knDP4Zowqlyc9yEluYZ1i9wQyjx0smmbVRjNLzC/
 B3MCSVMaCEpF15Z8Qq37+CWUEK9BN4Kx6WUz/Dj8fgDiWJDVwQCAAA=
X-Change-ID: 20261117-hwmon-da9091-7aeeac6d8ef8
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2788;
 i=sander.speetjens@gmail.com; h=from:subject:message-id;
 bh=U0sVFyBC3QFd3x50V6URzXzlIDLOye/rcYLW6iCW/8g=;
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBrCC4x8u86m74sL2YYNiUcSPAW5L+l6TUbqXZ5E
 mNZvw2J2eGJAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCawguMQAKCRB4zXhFDAXI
 ZwUGEACO5KfOjKPSb0GGpDmYGtb4Jqi8x00+CRsbRIv2B/iCwnIbqgV8H0AKiBHygp2yGx8Pm9b
 yBTaH2fwAezjZeows5pbvv3daCCXNBsRl2PJUBRSWogpsbeesifseRm4tY25agNO7cBb390Z9A0
 juLfBKsJRTkTmC8yD3Y0UjIrQX2UuAVZlk/K6tQCruhbW5cm4dOQIIqi36YnvdQ1qbOQpTR//4P
 OKBGXbVp7ocFGMA3kUgOAjlSbSutnlKpukbo9dhDMxiBMpSJnS2MZTFsdOK+KMifQufI/0k2Rwh
 huIMmkAvdB0seIVI4sNEcLecLSWaZrangpzbxBT0eaE1rJMDfrCWPQU0eugp5i3r34FpqD8LK6P
 YBWjpPPLzI3DVq+8HFjU9ZuE0GR93OXIHC69W0t+yuGJHmcOx1jDEhb1yriuEEIeNNgau9EcLsz
 Cv0ZJv0PW5JigRl4rRqcoKZ/uf3mHRw0mIOcluoPl/evUGSryDfYN6uhtfaaL/gg37kfC3XMcnU
 KQxsaYDf0cdSqctKiZifa4IyqjS6X14xYUYhUXYiodtnkiSCCMc/uJ7nol7BtdodRigJuy0pEJA
 HvFNQ7W0obmOREl452Xr+4yMJOwP3rx24HoGvN9fV2YcqQo6BiItyhc9LYQdB3zza+Ea8h8dE3Y
 n95KUz3kU+wV4Nw==
X-Developer-Key: i=sander.speetjens@gmail.com; a=openpgp;
 fpr=56524A8B001A11C3EEC9510178CD78450C05C867

This patch adds an hwmon driver for the PMIC used on the
Raspberry Pi 5.

The PMIC exposes a set of voltage, current and temperature sensors.
Access is only available through the VideoCore firmware mailbox
interface; there is no direct register access from the ARM side.

A structured property tag (0x0003009f) was recently added to the
firmware. It returns the ADC values in binary form (index + length +
array of values), which is much cleaner for a kernel driver than
parsing the text output of the existing gencmd interface.

The driver follows the same instantiation pattern as the Raspberry Pi 5
RTC driver: the raspberrypi-firmware driver creates a platform device
at runtime, and this driver binds to it. All channels are read in a
single mailbox call and a short refresh-on-read cache is used.

The sensors are exposed through the standard hwmon sysfs interface so
tools such as `sensors`, collectd and node-exporter work without
modification.

Dependencies:
- Raspberry Pi firmware that implements property 0x0003009f
- CONFIG_RASPBERRYPI_FIRMWARE

Tested on a Raspberry Pi 5 with recent firmware.

Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
Changes in v5:
- Split include into a separate patch 
- Move the firmware registration before the driver
- Link to v4: https://lore.kernel.org/r/20261119-hwmon-da9091-v4-0-0d6e345c3666@gmail.com

Changes in v4:
- Fix sashiko reported bug 
- Link to v3: https://lore.kernel.org/r/20261119-hwmon-da9091-v3-0-15956035d7b5@gmail.com

Changes in v3:
- Fix sashiko reported bugs
- Link to v2: https://lore.kernel.org/r/20261119-hwmon-da9091-v2-0-d6c624272a9e@gmail.com

Changes in v2:
- Add documenation
- Split firmware in a separate patch
- Remove DA9091 mention
- Remove extra lock
- Use 64-bit jiffies
- Remove lookup function
- Link to v1: https://lore.kernel.org/r/20261117-hwmon-da9091-v1-1-f55f0af9c6a3@gmail.com

---
Sander Speetjens (3):
      soc: bcm2835: raspberrypi-firmware: Add PMIC ADC property tag
      firmware: raspberrypi: Register PMIC hwmon driver on Pi 5
      hwmon: add Raspberry Pi PMIC driver

 Documentation/hwmon/index.rst                  |   1 +
 Documentation/hwmon/raspberrypi-pmic-hwmon.rst |  49 ++++
 drivers/firmware/raspberrypi.c                 |  21 ++
 drivers/hwmon/Kconfig                          |  11 +
 drivers/hwmon/Makefile                         |   1 +
 drivers/hwmon/raspberrypi-pmic-hwmon.c         | 296 +++++++++++++++++++++++++
 include/soc/bcm2835/raspberrypi-firmware.h     |   1 +
 7 files changed, 380 insertions(+)
---
base-commit: 7d51eba9dfa7d30abab0b75570e9f7605366e45b
change-id: 20261117-hwmon-da9091-7aeeac6d8ef8

Best regards,
-- 
Sander Speetjens <sander.speetjens@gmail.com>

