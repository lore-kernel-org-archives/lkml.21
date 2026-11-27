Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795810162;
	b=sm2D/HJ3u8FWC273i3kic+cV/2Yc82jffVlHDhW1Wxzro3ytdcxggTG2PSCYD3q+wyaT
	 JJgym3JahHbrhEDA7PNURGz8p99KSmirmk5d8DAiB4L40R8GgRUgiqCqbsPY0EK5ALfBx
	 EQWCx4PXIkbA0Fpzi56Q8ff68IMl/3t/UI3vxhMqZaOqgTMpKHUwrghL+5ECSXIIJ5uZg
	 ZvX0apeD9UeE8LuyOSbjGQaH/NgBa3pqcUugeoiqS6Ai++oiRa9UhofWVAm7DuEwJ7SZ6
	 MRudxd41s5UvHV2SCmhGg3q7J/hbsG+rfy1EkIT30UsxnAW1rSzFF/zJGBuzlii2ORw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795810162;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer;
	bh=Y38Q04n1Lg42IacHDv9k1WiLdqgHkNmu1tUwxnY3Jao=;
	b=ji4FGF5wB5NEeaFCoqrbGC5iBZiL8XWA/7V2ajE1CXrWnxNI6zfb0AfWaOSShiAOsvNg
	 B3q7mjEeko4quG0bQOuNMkrYueiSByuHoGFLwoT7lovYcq4DjYk76nebBGt300aYsJmRR
	 OpYLtJt3TvU4f2Omtg1g12ozDN12lzd77Si4jTJilEyGUmcN5SoPokPNoVpk2vPRJTikP
	 55c82++iH7haE3OsUt2erbYpwjFvgNi/NC3E7JAUtmajl11yAcN0c6sZvzf+xm/qmfu08
	 fOzovB+cFgYGfsmoK609PppHUApg4iMUgXGd2PRUytX8fyfwNLevieJwnaoahpj5z+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h9fPcADU;
	arc=none smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF68606A32E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 20:09:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FF68606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h9fPcADU
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-71ad2c6491fso4806095eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795810160; x=1796414960; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Y38Q04n1Lg42IacHDv9k1WiLdqgHkNmu1tUwxnY3Jao=;
        b=h9fPcADU4GZ5pW3JYwai9NK9vzuNpmzEjJhNICf2zBr12Z6HemYOwt1mXoMQ29Iz5O
         bwpdJ30b0dqIEKoLIM8u85sqZBZtUWOOw/ydYRNFxK6jRWWCjz4l9MEZ7B4h4QAMJkxV
         NmjUOppSxa9bnvLyxvJaT+40EKwsfJV9Wr0/E1ZfMlJKiTeQQ8ST3vh9/S/2XBMR0LUu
         g12dpB4+4gv2uPRH6BPsEhmdYr+pZyieZOAb4j1KXo+4w/GhRRj5ouL6QS+WKD8SuamO
         yNva87j4YMOMe8lU07nUKiUQAmxS7YnY+mhFIe67TpRlGp9Z3L2awVYvbMHvS0X27ncN
         qhkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795810160; x=1796414960;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Y38Q04n1Lg42IacHDv9k1WiLdqgHkNmu1tUwxnY3Jao=;
        b=Dqd5vfBDDL4lR7HzC4g+XoSzoJlO3V0RljGvlA5HLFPF2EqsYKLf1corD+Ig++OJt2
         CA9horHdq2a6wLm4LR+l1hdhYALB1WNStLInT7C76B2mF9EDNeh0x3D7EQTdMJleJcWh
         s9muUW9206cg+p0vQFbB4t4023xMDgVHlKIz6ix9I2zhXrHSnWJMEe1vb0Y0rNOITwGg
         4Q6chYX53CS/X7YWWa9LvPv1FhTEPf2KmyRoKUxfGrClxG54Zi7ToSVCN8wPmM2kcHba
         Yaa5mESjyu+/1A+fGHtPq8bDrsyeLJv0BiyBhzWYYtv4CkiWafJX1bIMZoZhP4082jkJ
         CUsA==
X-Forwarded-Encrypted: i=1; AL+hErEJY0dn43UigN7nR2h7+G0gjHBPX35ymVz/6bFyZj46hu33css0oOSv09s6JcxEhyoWxAZPKEkIMSUy1hY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tiXT7Tz3L4cAWudPnW4qf+C7KBhV4qBJhl5//e2EIHH7kGDsb
	PXKAaHJY/sHmRREenWA6JTyIMZH+MvzXixZqCXM0CxpqdUlvKWRopS9gpbguxBhi
X-Gm-Gg: AZFdTZdI+drSs9t9LxWkzjg4unaq8OkVVkyYpsmaUvv1/U/gOOVjFDQQzChB0naBrPD
	HsYpOOWt2FL5AbN1ueiAKlD5NXYcssmTMSghhrRodmPw4fYWiUc+zrjY3orm/0txp1cI4vOpnoz
	igEuQBrMNWKp7grbwterJQbp4IlOIr5vh9szjBDjtYBUwZAseGvlpMc1dDN86MHLbgnObEqIgOc
	RH53O1bStfdxpMb/Xp5B23Q87uPsBbYpQpP5vQO954aCSCKJsQfw08gJZdtwbEKVhWh4Vb3xbTB
	VfNeJI2K7tE6xzwZcoAy+xk9xwCQ0oAKU5w2kGJdafOFT8qeBBugqoVxKMTzBErVhG8NiES7exl
	F3uuuHrv7O8Cv2sff9Y6QedjYhBpB+hIvzSSeAVDF1eLOWgwB2Au3rKPY1+6D920X8zms8JhPun
	v+Fu2mTYVxY/62gT9T1jLB+E93gJ9kyz0fy+PTzsK6oSeGwzdJhazHBH1JwVHrJki0ZrmFhJi3j
	oY/Ej2+kr8YzZ4q18vjyio6mhea5lTfgJz3/uD2/1mLPOVZTMfMVehD0IjpQ7XN9Q3xGgx3Rl9O
	xJgs6PUt4iegi7U7Uji6wNXlqGdJLXTYYtVcQAWctgKiCa8ZAqk=
X-Received: by 2002:a05:6820:80e:b0:71a:e27e:cfc5 with SMTP id 006d021491bc7-71b394f3c04mr14876291eaf.18.1795810160517;
        Fri, 27 Nov 2026 12:09:20 -0800 (PST)
Received: from [127.0.1.1] ([150.117.174.129])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b8590ba0fsm4834662eaf.2.2026.11.27.12.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:09:19 -0800 (PST)
From: Gary Wang <is0124@gmail.com>
Subject: [PATCH v4 0/5] upboard pinctrl support for device id INTC1055 &
 INTC1057 & INTC105E
Date: Sat, 28 Nov 2026 04:08:29 +0800
Message-Id: <20261128-upboard-pinctrl-add-intc1057-intc105e-support-v4-0-029071f417d5@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAD7jCWsC/5XNzYrCMBSG4VuRrD1DcvLT1JX3MbhI86MBbUJSy
 4j03icKQnHX3fnO4nmfpPoSfSWH3ZMUP8ca09iG2O+IvZjx7CG6tglSVIyhgHsekikOchztVK5
 gnIM4TpZR2X0OD/WecyoTeN0NgnrGlRSkmbn4EP/evd9T25dYp1Qe7/zMXt9PiW8szQwQAnJE0
 zOllTuebyZef2y6kVdpxrUut+oIFKymXR90kKoP3zpf62qrzpuumePS9oNBodb6siz/yIAi0KY
 BAAA=
To: Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Thomas Richard <thomas.richard@bootlin.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Daniele Cleri <danielecleri@aaeon.eu>, 
 JunYingLai <junyinglai@aaeon.com.tw>, Louis Chen <louischen@aaeon.com.tw>, 
 BillyChou <BillyChou@aaeon.com.tw>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gary Wang <is0124@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.13.0

Add support for "UP Xtreme ARL","UP Xtreme i14","UP Squared Pro 7000",
"UP Squared i12","UP 7000" and missing groups and functions data for 
INTC1055 & INTC1057 & INTC105E.

Fix pinmux-select set CPLD GPIO OUT not function mode for I2C pins
on the AANT0F04.

There are no compile-time dependencies for each file, all pin groups 
functions data will forward to set default when pinctrl upboard probe.
It shows an error when run-time dependencies are not mapping to right
groups and functions.

The pinctrl-upboard is provide additional driving power and pin mux 
function through native SOC pins->FPGA/CPLD->hat pins for flexible board
level applications. it's probe from ACPI device id AANT0F01 & AANT0F04.

Signed-off-by: Gary Wang <is0124@gmail.com>
---
Changes in v4:
- Add an index for ish_uart.
- Update the fix patch using a better approach.
- Link to v3: https://lore.kernel.org/r/20261126-upboard-pinctrl-add-intc1057-intc105e-support-v3-0-81d35c9ba246@gmail.com

Changes in v3:
- Update detailed description in the cover letter.
- Update fixes patch detailed commit messgae.
- Correct the I2C group mapping names for the UP Squared Pro 7000.
- Link to v2: https://lore.kernel.org/r/20261125-upboard-pinctrl-add-intc1057-intc105e-support-v2-0-c8079f8f569f@gmail.com

Changes in v2:
- Add missing SoB.
- Fix CPLD I2C pinmux-select by good method and update commit message.
- Link to v1: https://lore.kernel.org/r/20261123-upboard-pinctrl-add-intc1057-intc105e-support-v1-2-f2322a91686d@gmail.com

---
Gary Wang (5):
      pinctrl: tigerlake: add ish_uart0 groups and functions for INTC1055
      pinctrl: alderlake: add some groups and functions for INTC1057
      pinctrl: meteorlake: add some groups and functions for INTC105E
      pinctrl: upboard: fix I2C pinmux-select set CPLD GPIO OUT not function mode
      pinctrl: upboard: add device id INTC1055 & INTC1057 & INTC105E based UP boards support

 drivers/pinctrl/intel/pinctrl-alderlake.c  |  40 +++++++++++
 drivers/pinctrl/intel/pinctrl-meteorlake.c |  32 +++++++++
 drivers/pinctrl/intel/pinctrl-tigerlake.c  |   4 ++
 drivers/pinctrl/pinctrl-upboard.c          | 109 ++++++++++++++++++++++++++---
 4 files changed, 177 insertions(+), 8 deletions(-)
---
base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
change-id: 20261124-upboard-pinctrl-add-intc1057-intc105e-support-e87b40e13654

Best regards,
-- 
Gary Wang <is0124@gmail.com>

