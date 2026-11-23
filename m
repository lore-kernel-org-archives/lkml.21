Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447294;
	b=yA6eifjJ/az8/WCL4/AHimdRfZbtzo2AJCctSBrlWgwgcRW944GKbTX307hSNNZ/ZJA6
	 vuY9LaZMq0CSoruwxK7b66A5xuP67/IMsKWt2glvl5/rIPa0VI/sUiDCaTDXwl6WE+kG0
	 sXrxf9pGy+bqwIZ3edTRiiNXH8nqAzjeuDqkmmacl3GDDk7bYLzd6Fvbftl83knLwvzbv
	 PT7sYksHJCc/eQO6IdkwQ2cQstm4HaXESuYHYnGbuMsbiP/atvn7E9lY/lhXQZkzIyvCf
	 NX6mqXR/T32j/ORPPSvdFR+sQH6WYHcgD3j/ZKixlOrUTmobjXQlrZU7r6kfKOo6qiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447294;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=uzen249UIQm/8PK5gYDtm7rMzMeyssG43QW925C4YsA=;
	b=ly0UCimOEIGaYmWpDBciFluiYTSjOLn/N900zWJ8M39Gxfz7ZsQNP5+ko3QnB1oVAwJq
	 i+ifMiQNXW83Ld/ayKm28j9XV6GZYUR31+ONy/ZsczETR0hTlY76lWfvmV1XKg6EPVPRH
	 JkOdQCjVPYPf5GctEoxnXjyWXDkAqYGdIMBZ/TArDeHawmqUgSdFWqQkQPP0DvkA7bBmV
	 Y3lKg8nX4SjH0OoTOlA+sS53stn5RJkG4wD1aqBRZZRjy1vPXt5ZfnCKLrDMYiWJB2t18
	 pQuSDyALx5IWGWtxKVTD0zflrlVFhoyE6jMZdcUYTXYlgE/4mll3EnWgrs3oiULrt8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Yh0Kqd2W;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37898606A33D
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:21:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37898606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Yh0Kqd2W
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so31493815e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795447290; x=1796052090; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uzen249UIQm/8PK5gYDtm7rMzMeyssG43QW925C4YsA=;
        b=Yh0Kqd2WwJ3abPyPsFK8w+wXkhbaJ6LyUe7kU73OJE/Uz0ve19EeOSsW/hU0LUz7qF
         wlH+ceqn8InaQfM5URRnUrNL06XbfybNo3ATAwn44ArohVqQcHBhkoz169G6ofSpDdKN
         WG+WyvyQay5ag4VZbchHjKquyq1b1LoTBJLtcTv6BnyIJQj1VqYhpSQNNmVNOmZOZu2F
         MmUm1+ZHvBuFOHQP2SnM1kSK1W2Az0bSSMZXHDmW9wQw6AiHNPjdiMrWgyH0NWj/V0/2
         MV8fxm6r1PJgpKi625zwWqpCqe6cw/ZMrPMRNhIP3KJM8B45BhPEvPctgq8XLvO7d1vo
         wh6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447290; x=1796052090;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uzen249UIQm/8PK5gYDtm7rMzMeyssG43QW925C4YsA=;
        b=bwbLBK31scQsn+mt95JcjL5xLnhlOZ/EUCRtiUybY2RCV68Gt4Es2B0UdmAS5LyAgC
         zwP9PJbundvl3V9LturAIGsR609xZoNA2RMcJq/wrDaaQy9SyAa0MF4HDj8EIABiT5va
         ESnsXVpPlG6Pwyg6mLUNWLa3fGCXFx9HMepICB9RkuHCqUqdbZPWxJT4q5kECoWbaStP
         F5QMvAIuNUbWydF5qe3o1fOOL3s2H+YDMNVOi6mfr3nO6V/vvyFCi3LlueJ5PeFgg4JU
         5IF7FLyrUtzd1Svf6J46ZMjMP+TDtSfbaz7YWxxt+yNZYNSCzB/uf0oG02VqcaV7Y4UB
         zyVA==
X-Forwarded-Encrypted: i=1; AL+hErEtDcZdJd48hI2HYct48UfxEYGVljmw94SYZ70u7Z/xKvKOUtBborSlCspj/O01FtM8L1GJOc1+WnHoELs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ljs+s7eWAN3Q9gru1Yv3Y1xpRxu+1n/IscfJrljKRWJFa47bT
	DVuko4zcnGk0LAG1yC+H0M9Va233qk2+ploBXe8G6CxohgyN+F1ZZybajfVFgu3x0DGeMpibZ1u
	87qTFZto=
X-Gm-Gg: AZFdTZdeDac9J9Cwg1N9oOu8HJHh3r2cRFjfvtsBXWmDQMUJYJrbGECETfQ9Kg/lehI
	IndKtH0HxByoTwuRaqWzpEQ6F5pYKOnUbpmksyJnC9atZYLnki49OUZ3sVV1gdO+2gZdorBogOj
	XUkI0bCYBx04+FSEW9Q5SKZbcqTYwtLazPvQnDRCXAvah++2gUp8jLLAxpJFToiYJ9hfx0dSNEP
	BLD6A3ZGMpIqfjvvHUM2xdMttB9XY+RDJv6eTfQpbkOZygCKlDxn6eqHJ56E1puxmrEPo0Zp5tT
	9t20umWry6regDYE/rf+4TGBB9BAztbIzeX0YFfmhP+G8RR9B95OFNs+X/N0Yfv95cdYLxE6oOs
	2R9Ufiz5msFjRAm7OuUxhsJwQIYwFBvPexdThrr7t/px4dUoMqg9AUFuDqBoUOvSgvTxk8jiDBo
	8UKwQHnoblwoclA+GW3ScPvYVS9Yqsrs6cOBbPM8ic5WpsmOmnEVYRFmDBDHBCsstUfobXFKILb
	PBWPJCsn2YbolqWwiXicgN+vyuiPvN4RZutPr749dykabAbV4ttiA8dKpc1a00WZePQkWm4RdA4
	o6G5PfMMtyU18VLfTaVyrkfPA2nqD84cJxDqhNAhe206zRAAvME=
X-Received: by 2002:a05:600c:4f42:b0:4bb:5c5c:8130 with SMTP id 5b1f17b1804b1-4bb8881c726mr304536705e9.5.1795447290177;
        Mon, 23 Nov 2026 07:21:30 -0800 (PST)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm26542178f8f.21.2026.11.23.07.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:21:29 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Subject: [PATCH v3 00/10] pinctrl: scmi: fixes and GPIO function support
Date: Mon, 23 Nov 2026 16:21:22 +0100
Message-Id: <20261123-clegoffic-pinctrl-scmi-gpio-v3-0-d61f039be008@baylibre.com>
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
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPJZBGsC/43NSw6CMBSF4a2Qjq1py8PiyH0YB/RyC9cAJS0SC
 WHvAg5MHBiHf3LynZkF9ISBnaOZeRwpkOvWiA8Rg7roKuRUrs2UUJkUseDQYOWsJeA9dTD4hgd
 oiVc9OZ5osChkYoyUbBV6j5aeu369vTs8zB1h2MhtUVMYnJ/2+1Fuu/+eRskFT1WZK53ERZmfL
 qaYGjIej+Batp2N6sNJGf/m1MrZAsAkmU5Lrb+4ZVleA+JU0ioBAAA=
X-Change-ID: 20261030-clegoffic-pinctrl-scmi-gpio-48cfe014bb11
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.17-dev

Fixes first: a setting the platform reports off read as set, a drive
strength in milliamperes that is not exact was truncated on get and
could overflow on set, the protocol layer read past a
PINCTRL_LIST_ASSOCIATIONS reply larger than its receive buffer, and the
pins of pin-only functions were registered as groups. Then the drive
strength conversion uses MICRO / MILLI.

Then GPIO function support: mark the GPIO functions, and select the GPIO
function of a pin on a GPIO request.

Patches 1 to 5 are fixes for v7.4, patches 6 to 10 can wait for v7.5.

Tested on R-Car X5H with a v6.18 backport that needed adapting, all but
the schmitt and enable settings, which the platform does not implement.
An LLM was used to review the patches and to set up the tests.

---
Changes in v3:
- drop patches 1 to 3, applied for v7.4
- patch 2: new, refuse an inexact or overflowing drive strength in mA (Geert)
- patch 4: Fixes tag, patch 5 (v1 patch 7) needs it
- patch 6: new, MICRO / MILLI (Geert)
- rebase on v7.4-rc4 (Linus)
- Link to v2: https://patch.msgid.link/20261113-clegoffic-pinctrl-scmi-gpio-v2-0-faccb4685d88@baylibre.com

Changes in v2:
- patch 4: keep the enables value on get (Sashiko)
- patch 5: error out on a truncated reply (Cristian)
- patch 11: unsigned counts, loop variables in the for (Andy, Cristian)
- patch 11: dev_dbg when no GPIO function is found (Cristian)
- join the lines that fit in 100 columns (Andy)
- collect Reviewed-by tags
- rebase on next-20261112
- Link to v1: https://patch.msgid.link/20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com

---
Clément Le Goffic (10):
      pinctrl: scmi: report an off setting as not set
      pinctrl: scmi: refuse an inexact drive strength in milliamperes
      firmware: arm_scmi: stop reading past PINCTRL_LIST_ASSOCIATIONS replies
      firmware: arm_scmi: report the pin-only and GPIO flags of functions
      pinctrl: scmi: give no groups to pin-only functions
      pinctrl: scmi: convert the drive strength with MICRO / MILLI
      pinctrl: scmi: mark the GPIO functions
      pinctrl: scmi: report whether a function is GPIO
      firmware: arm_scmi: add an operation to set the function of a single pin
      pinctrl: scmi: select the GPIO function on GPIO requests

 drivers/firmware/arm_scmi/pinctrl.c |  51 ++++++++++++--
 drivers/pinctrl/pinctrl-scmi.c      | 133 ++++++++++++++++++++++++++++++++----
 include/linux/scmi_protocol.h       |   8 ++-
 3 files changed, 174 insertions(+), 18 deletions(-)
---
base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
change-id: 20261030-clegoffic-pinctrl-scmi-gpio-48cfe014bb11

Best regards,
--  
Clément Le Goffic <clegoffic@baylibre.com>

