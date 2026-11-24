Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541720;
	b=alAiV0k3WbLLoDNMQNep6PnKhoBqIJwoWeq+1IsiMk+xmhNsSWujB69W+2plo90AQDky
	 2V/zDjwAc+NapqcWWoI9ZZ+XwFE0oR4ecXPasYyfz+NANNq8k734g378O1QCAqAiFnWsd
	 8/2kHWdaAnZ43HaWIh7mLgjyW1MessFwAsxsp7/PAFJ8nNqAatO0vmn+Sy9BiIQkOwbUE
	 S213gqJeeJv4hh5Ky2wZfJWpdTLlsMLZGsMqjscF2C7RQm/oSKk4FON+auCDWqFmYB7Gu
	 jR/DsXK5/tdsDBPuSQc9a0cta9sOfrURiIb6lOhxjLaW/mx0Tam9y7aj7YaEphWjBCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541720;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DmBwmrmEWgysYKtSDSRrr9hV9wxgIOlNWVL3lTij1CU=;
	b=Do8Jx19LdwIj4VdsKgWYgWoBqgXe1Un3tMomhHmfqC9G2ePZJoTc/T39H1mcvOs3HOgW
	 KPBDtdMxKyLG5oqeonWTMjNwnbLYRLkF8f5KIH5XX8MJqi+CxkWWYWAlyZEwJCrLSsTz9
	 ngA+8O8/Qq9kw3DI/GtcMl9TqEdiTdiI/oCUnzVxIBvpfU9b8hzkwdmLlIuiUYzmLOWn8
	 xbLxpb/PGNiMagS7QCzGR3fd9g4lOSTNXbWQwUZGuIGHUkqYXKwM3uFSjevsiW48woZ9I
	 o07R2EOMDe6FIg5jTsPbtmGUAue8C5WtWTA5jGeB/HcqZYyqJpX1okfqYuQIM8kU6nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="OmDIg5/y";
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E87606A33B
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:35:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30E87606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=OmDIg5/y
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49d05d51553so35092945e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795541718; x=1796146518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DmBwmrmEWgysYKtSDSRrr9hV9wxgIOlNWVL3lTij1CU=;
        b=OmDIg5/ygmndD+Kv5JZu155dClMlLF1P+Gd3Gn+MXXxkkH9P++zAq0uJKz7MJzb9Ep
         9GAOFzNT1AiHFEb6YOH7An1RM5Kq3wKKivuk4nuQ2F26uGAsn26+eKf47b2vNUBiLy2o
         yP7/7A+G9S+n+sSz5kEIYc0UjZhSJvbHU/YoXUjrUU1PrBb0qhXyaiW1jNz3XiXKNMPJ
         ftLnedCmAW9WeUTEO1ihLGasy5eI6rs360qul+IGcrXJSktAlmICnamarnC/z0xWRbud
         x156i62ARhcbuRiMmhd3W+b9uhcIWJ0YsWm3wC7Ad+cY1/U/8deDAuJYKwx5DiRFMU0f
         pJ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541718; x=1796146518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DmBwmrmEWgysYKtSDSRrr9hV9wxgIOlNWVL3lTij1CU=;
        b=CXPP2LEkOiq1BjlhR3+lKiQUl9KcBxqzPaxqMKsOin3gQwwPw0/Z3h/j/xCSV7VfI3
         HeDZqxjjI2dDqjjsVf8b+9125MZE/7d2biWipODrOZrinixansZopHvFjgLpVw2BkcKM
         kB2o40YSCDTZ7XMvRF84lbcU+0CHSTXOuap/jmvTsd05AMkWXBQxqJS5MZqSZkV4VB3m
         QMg6MQoS0F1fKoSKG1mwecCg11Hv6gDq7KhahSzpKIPRToynMeAX7yHND/fLZI/M+3AO
         doJb9R7YIIWTwUNv1v6S/Az4XgRh40Frn0K6lwfL0PS7LW+DKr3JwIRldSAXdYlo8ba0
         h7GQ==
X-Forwarded-Encrypted: i=1; AL+hErHnBy0u7D28vWwDY8IgTc2nYPRuzNkn+9HSk1t27SSGSSl9obE95l0eqOX/ixz1+rUvzoEsj1NfbKF1bws=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4A4zy52syVRwI37zGq0drCvLTsFcHXkFVs1zccujEIgQh34Ji
	imlt09nrpSVxqBIvLgGEYO7fLURf62KwzhmxnoO3sX1dZ3t66QlQSoJl4+Nie9iRmyU=
X-Gm-Gg: AZFdTZf3OdnG9yESWRKSxv1IOzVEGTP4F8OOXs+6iPmNjl/Qg6g/gtZhaCN8+IywKa1
	lPLfq76969iqd7jM7glij0+VI1v6Ou9h+GTbHDeoWclED1yBbch6yHS699NqRr0/l4X0VU6RChQ
	6igNSh44DBhhnrS/0zd+YEmjgu2qn0bInn8HaEOZbvX/5t/rQM4pHw5SJBVKARwIPYyBLdpVFpK
	HS29DgFOPM0WVT6jqCPyx3PHpl+u5lp07XX0Tri3ZE+ZeyfmfcWEiazyTyw28/OBqKml/HHKVEJ
	uqp5exqi3Ee88lqssoYbcOEJZrP7Md83sT2nvsdYuS6ukadeJQv+qNJvMvFGZpuMDoDTOuNPhQC
	yjw9ecnL2iHJZ0kYYu5E0+xWaINhZ2PjeQe3CZoqD0ZNd2YS3+JDCVRWMMXNC9dudEPQkDQlxjg
	XZW2VvcSUKoxqRPYlNmxe/cNV1WeX/BsSOFilBhPpw4IZNvXNkFoI5L37W8v9xWzTUG4JgIsYlw
	fvaRe+iUdTATNV4cIW3BHdzlma18WLRDEFcDxkN3GBkQgsEyjB6RCeXw8wrSaVRcTq/We8o9GWv
	rgw9TPEzA1Gr3umD5iuL5LcuqUs=
X-Received: by 2002:a05:600c:a08e:b0:4bb:647d:dabe with SMTP id 5b1f17b1804b1-4bb887c3afamr345794445e9.3.1795541717677;
        Tue, 24 Nov 2026 09:35:17 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865a2sm460171975e9.3.2026.11.24.09.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:35:17 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org,
	Gary Guo <gary@garyguo.net>,
	Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH v2 0/1] hwmon: Add fan tachometer support for Raspberry Pi RP1
Date: Tue, 24 Nov 2026 18:38:59 +0100
Message-ID: <20261124173900.31266-1-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
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

Hi,

This patch adds fan tachometer / RPM monitoring support for the
Raspberry Pi RP1 southbridge found on the Raspberry Pi 5.

The fan speed is measured by the RP1 Cortex-M firmware, which writes the
computed RPM value into a register of the RP1 PWM controller block.

Following the discussion on the RFC [1], the driver is now implemented
as an auxiliary driver: the RP1 PWM driver registers a "fan" auxiliary
device (pwm_rp1.fan.<id>) and this driver binds to it, reading the RPM
through rp1_pwm_read_tachometer(), exported by the PWM driver in the
'RP1_PWM' symbol namespace (as suggested in the auxiliary bus
documentation and agreed in [2]).

This series depends on the RP1 PWM series [3], which provides both the
auxiliary device and the exported accessor.

Changes since RFC:
- converted from platform driver to auxiliary driver
- dropped the 'raspberrypi,rp1-fan' DT binding and the DTS node: the
  device is now instantiated by the PWM driver
- dropped the DT phandle lookup, device link and reference handling:
  the auxiliary device is a child of the PWM controller, so the driver
  model already guarantees the correct lifetime and unbind ordering
- rp1_pwm_read_tachometer() now takes the auxiliary device and returns
  the RPM through a pointer, separating it from the error code
- Kconfig: depend on PWM_RASPBERRYPI_RP1 without the COMPILE_TEST
  alternative, fixing the link error reported by the kernel test robot
  when the hwmon driver is built-in and the PWM driver is a module
- removed <linux/mod_devicetable.h> and the other unneeded includes (Uwe)
- updated Documentation/hwmon/rp1-fan.rst to reflect the changes
- added a dedicated MAINTAINERS entry for the driver, instead of adding
  it to the RP1 PCI driver entry

[1] - https://lore.kernel.org/all/cover.1792748690.git.andrea.porta@suse.com/
[2] - https://lore.kernel.org/all/ae9a4df9-b1f2-4f00-ab86-d9cf8d9bc387@roeck-us.net/
[3] - https://lore.kernel.org/all/20261124173658.31030-1-andrea.porta@suse.com/

Thanks,
Andrea

This version has been prepared with the help of an AI coding assistant
(Claude Opus 5.5).

Andrea della Porta (1):
  hwmon: Add driver for Raspberry Pi RP1 fan tachometer

 Documentation/hwmon/index.rst   |  1 +
 Documentation/hwmon/rp1-fan.rst | 43 ++++++++++++++++++
 MAINTAINERS                     |  7 +++
 drivers/hwmon/Kconfig           | 11 +++++
 drivers/hwmon/Makefile          |  1 +
 drivers/hwmon/rp1-hwmon.c       | 78 +++++++++++++++++++++++++++++++++
 6 files changed, 141 insertions(+)
 create mode 100644 Documentation/hwmon/rp1-fan.rst
 create mode 100644 drivers/hwmon/rp1-hwmon.c


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
prerequisite-patch-id: 8a9c7c53e94bfc4dd1dc40e8277f22c1f410f404
prerequisite-patch-id: 3053bded44bcd6a78ecae5a255ae876c5a9cb49b
prerequisite-patch-id: ade915a82dd15722ecb44802d307ff9d60a79228
-- 
2.51.0

