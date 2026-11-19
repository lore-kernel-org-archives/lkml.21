Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795115090;
	b=PcGUp/U8vH59zO1PPxGfVoBhqQW8qOxmCqUMtFqR7lCoDyRCZ8EBPXY9qxcb1b/yzBOc
	 nW/3zner3NUCBDizwBcGHgMa1d5v8x7y8hsOqMI4EjMyjvvwR2dZXpzl1junPeRhwwJTO
	 gpFvKyauE4hpcB6tzh4syh6Zc/DSxxzxKIg7/ku01JUMlcEMj5dq8BCAc5qiM/rMuvDrW
	 2yXhWPKk4ckReMqhnb4m1q3YWyo9XlAaNC72+9pid30BMOUPjXV8jS4yw8Y87DmSlAyEI
	 FTTwb8n98gr1IdrJDmA6akaUOWr/LcaOnrfvPmDzipYjouQZY/TLQelonK5xRE+CBpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795115090;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=pDDz7EktSP59XcLYqPQZ3j+F7BRb1cRhTmRMviCYCf4=;
	b=phfDqRX7wuPqWNreb24FLMyRrd/qlVJn4eqdujR9v+mnT19j7uWxY7ZXixFdXfk7FIQZ
	 BrmRRQ9F8958YhbFJXhEgUK7in2DMFAF6X2Rq3dVk5t6ND6sRLms1Fxy5HIYnlFp59nid
	 7I+vAzYHHZZyc45m3jwZ4Zb3QajlSCRjOM3LqUtuSjzn4e9+CUCAIsfPVeBXqSFa+0hXo
	 WPwENCtxD0V4htpSOP+1VlIjbcO6odb0fwI4PMovp/w9M67BBOZXFsHMnQjCSP5+/Zc6e
	 jq87gFHlLx/yYeF7KqlooJ5jRfKiI9c71ps+UvK4deHPtl6D6qvEQlJnZmCK/v/E2xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q1VNm8wg;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A857860A2605
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:04:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A857860A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q1VNm8wg
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-49a92144733so26993f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795115087; x=1795719887; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pDDz7EktSP59XcLYqPQZ3j+F7BRb1cRhTmRMviCYCf4=;
        b=q1VNm8wgj7l4AzXVWj6kaK9bPM0GhK9rTAX3CUFlL4RqDuPJVp8DrkZxIKLQpFKMyA
         YSDfE6Jf/WI+E937M34nYYnLwNCBDbiH/SHSQJyK5Mj19ZmToTYP7nmDB3FsiYFGb/xE
         hgRDK1H68EYLQJI/NemyC1rH6m5mQdQIw9H+wvfzpwtMz3GcdemNkMkLucqBxq6mmYam
         t0AMQ4/CSJ21ye6KOc+7/L8yCk93+g4V3o1MULIOEYDX1Vm2OWhQKzka/4gI58Xpxx2x
         DCueL35x6X9+BcHPWNy0vrpWJPQ/7YSutemP1DnJMCX/MNK5jQScJJv6gCQLWtpdB97b
         NzIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795115087; x=1795719887;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pDDz7EktSP59XcLYqPQZ3j+F7BRb1cRhTmRMviCYCf4=;
        b=HDb5s22wjs7/nm5UKGmnckhICVBO4GkOpxY7itQI21XEceUQ73ejl8ROk8DaywIIan
         A/jtBxFitYEQ3IY3yNo+1c2FUH8qiYhrnuKDktlt0XPTwWqbeepeoL5jYhZhy3KyntAS
         cTmoWrz9djvoFqVTGpTk4M/xB4cpFhbYN2cgu72Occ4AJbmRuDXnNwyLc2NIQ6y78Q37
         BI2b+hE76XgXs7+4QjoTBCNydfKHZimK0wQ/U5URO7cDtS6omGp4WDr8gZIILt4qVO3d
         fu9RTKXfxODuUPXy7CgZdZ+UrzskMY/2RG5Pt7OpP81sHCiUq495fdX/v/hhEwqfpctG
         mWMQ==
X-Gm-Message-State: APuU4Z/+wkFkv7b0F2tnIpWnuVH6u+LqSOiM6Wgy69YeLiUOo22fM3w2
	ehPSihS4M5LqRWj1Yzc3bso1IWIUBNI4NndaunPnXTEtwjiCvlF+ovQF
X-Gm-Gg: AYBFou2VkBQC87AY+xoNw9yliqTFlGpwSA4XhATKyO1kOa9jFLdvXoDmJExWAcjLyzI
	2TdkEGwkDuH8kE1p/nQiVaeoBk8J6UxvzS08nNAIJJmL6f6ptPjp87oV8TPKxbOdjpuMyGk1nsb
	GGDVzGOylyqRHUbpAbdgC7ReXKkBzNFSq7/QCxjWFBQLEbJKqhfqrXYKDi2v6JkNTjoK5lGg/lh
	/d/Biyo0BFWxLKODVVRCUobRv3JPthb8sUitXi35q3awIkUQ10dcZ+k9Po1dtgH06oK0+vHVoTs
	BFvoEQkk06wU5684dzKqTdRjiGe3LH6pDa9HsTyNS8OokBVl1yDgqdzzxZQLTwOI4LMgR0y0VDw
	g8DxymNs7LbLRE6SFMGa7DAAZyGEO4hTrOdn0IUa2PgBo9DbnTZdA1qf9EOBYDhhURKOJL3hI1M
	EKjZBwDjgNo3zMZric4EEkGX8yO43hypve2sXC7QscQjPvT5RzgX6N1MeOACHhk0Fb0Buwkb4pK
	bpTtqG0pP8i83yb/BBWGuQ3OaEixy3HE/TKqkwYlTdusbS2nzxE1T7QFd62FFXiahATObJWjzxi
	S9FtL5ekz4pFUZ1yIDFmoa4saVgfgjMUIGvAou/UPmVgUDPNYY1n68LRuYTbboPIWz0x+XgI34t
	SalJPkJk5bKtpv2Y=
X-Received: by 2002:a05:600c:b90:b0:4a7:76fa:87e9 with SMTP id 5b1f17b1804b1-4bb8892cb02mr9574505e9.21.1795115086809;
        Thu, 19 Nov 2026 11:04:46 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849247asm19124775e9.7.2026.11.19.11.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 11:04:46 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Subject: [PATCH v2 0/2] hwmon: add Raspberry Pi 5 PMIC driver
Date: Thu, 19 Nov 2026 20:02:22 +0100
Message-Id: <20261119-hwmon-da9091-v2-0-d6c624272a9e@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/21QTXODIBD9KwznIJAUiZ76Pzo5LLroTgMaINZOJ
 v+9o1572/cxb9/ui2dMhJm37MUTLpRpirxl5xPj3QhxQEE9bxk/q3OttbZi/AlTFD00qtHCAiJ
 0dX9Ff+UnxueEntY97ut24ISPJ2UqB8kdZBQlIbZsLGXOrZQDleobU8R7NaVBzk8ncxfkneJzl
 YeweWTEtRys2MZqoMIC5IJpW70Hd1MIVFpme6PRQdN7sP1FgQOnnDXGKmy8rZW51DV+GMe3kiP
 lMqXf/QWL3lv+f+2ihRbeGK/AN10Nl88hAN2rbgr89n6//wBMnwp1TQEAAA==
X-Change-ID: 20261117-hwmon-da9091-7aeeac6d8ef8
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Guenter Roeck <linux@roeck-us.net>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org, 
 linux-doc@vger.kernel.org, Peter Robinson <pbrobinson@gmail.com>, 
 Sander Speetjens <sander.speetjens@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2242;
 i=sander.speetjens@gmail.com; h=from:subject:message-id;
 bh=fFksgnBQWB00eHnASxdxeUteEXHeuBQCQ15IXKORuiI=;
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBq/0hNMInIZvh+foa/m0C+DK7QywAYwMx3Oyj4B
 jegXlUSgAKJAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCav9ITQAKCRB4zXhFDAXI
 Z9WiEACGWtjwPpW1T2M8XP2Z7+frbRA4HCfF+uwJnRlGGWi8nOwaJ1rM2mS8GEUG2rSlU2D4T1Y
 Hbn2+3uxvs4U4+moO16OYVhh4msOTQY8LwhXGnC5oZ/jMov39laTFEM0Tph66QVcuFsUO7ZbOBY
 WOb+rZR/xD4zFlWco/b9hDEkk3ANlkxfCOT85yGSRRlcdRn+B/ZDCmezGiolycgL/NpoM5KDTfP
 qeDnA7rSZS50Zkr8Ok0pU16ic57AdC0pu7CwLC9LzSFB+l/pAYmLZGYUhzCGpsXDLC0KsEpaLy6
 vuvEUBp3PLtaY/zWlTYak75VJrETb5vR0joP5igmqC4V8fByLLRdvQNFg4n6Tjv0QN1tqyUX9AW
 9OOkj2JMQoIZspSFdAlj2EAnxGQ/Yu0FPnE7YX5kBmPGl6WrIsOiw8JB7oxdAswQPX9CqKmrhbC
 j5BS+E8RK1HrEQvpEN92DL84tOdwG54ODLlHwGAk6LSHbBgy+0Jo0ral7oE7fo9Jm/aGYiRP4ZV
 +hmfGVSMq+YuUNPuwld5c5WfwtyuzOvaMvBsXRv+7196C0gTMMCmFjou1VZ9Cwh44XaIKHa3wm4
 DLeUzEUkeLgb5QnL1nuxfhcydWqJv/SmW9gNawjlMpWIbcecbye2KmW7wL1OhKSZCTwuMYAqxt2
 w9nT+IrdviT/vKg==
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
Changes in v2:
- Add documenation
- Split firmware in a separate patch
- Remove DA9091 mention
- Remove extra lock
- Use 64-bit jiffies
- Remove lookup function
- Link to v1: https://lore.kernel.org/r/20261117-hwmon-da9091-v1-1-f55f0af9c6a3@gmail.com

---
Sander Speetjens (2):
      hwmon: add Raspberry Pi PMIC driver
      firmware: raspberrypi: Register PMIC hwmon driver on Pi 5

 Documentation/hwmon/index.rst                  |   1 +
 Documentation/hwmon/raspberrypi-pmic-hwmon.rst |  49 ++++
 drivers/firmware/raspberrypi.c                 |  21 ++
 drivers/hwmon/Kconfig                          |  11 +
 drivers/hwmon/Makefile                         |   1 +
 drivers/hwmon/raspberrypi-pmic-hwmon.c         | 299 +++++++++++++++++++++++++
 include/soc/bcm2835/raspberrypi-firmware.h     |   1 +
 7 files changed, 383 insertions(+)
---
base-commit: 7d51eba9dfa7d30abab0b75570e9f7605366e45b
change-id: 20261117-hwmon-da9091-7aeeac6d8ef8

Best regards,
-- 
Sander Speetjens <sander.speetjens@gmail.com>

