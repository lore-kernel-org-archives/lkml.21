Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541583;
	b=y2BNs4WbL5wiB+8dI+PARJu9rI03LyFtHv5Mh0jbhQCpq+oaMue102qQTs2fqLl0EIAC
	 eMQRhoevhm4BVkg32u62liP3iO0V9wxlJ+KQDR6A8+dRnHqUmrb5JVw2/IcHT1gc2pQGF
	 z+wC92xFRl6xf3ELYDPD9wUODFbFj7xZzPPCn3RNUX/ALxjj0ggGDL5NeKXn2NrRv1/ER
	 05O68PFW/JBbtiWxtXNy0Ksucgokc+Poa3vU3XfE+uUgpdlLBltAw0+lyuNKVjWmmeDFT
	 D0ryLQwQp+jt9OxWdQiYJ5NnonALNWuRVsJKVB2ZTbuFWuDNXsTGNW6GMfiMziN2wnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541583;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SGN0CE6hboOJyWQIpluS979Wc6QFsvjzK1IJ9fJlXFk=;
	b=LQOPrSwkrk2prD5sme2yudmxlM0yqewObOKtwB24TpO7ADGcjjZ0ykuw/oPoj6MGFmVc
	 k+CspN6remuZ9lRiEBsyRDcTZxMr55Cl4wzsfaQnQ5VJ8eunPA5VBb9H+6Ty6tpFjDMfV
	 HgGXx7OKNSAB2pYsWdl2AnFUMCZLOglVKHGnWkIK1qRR0zymO3qZXGMIZV7nTW4YOCpYG
	 Z8sxZ8LomAcTW6iG7DutLtYjwnBNTCXqnkmPLg4YkkOVm+RLWAbXNRB6KgCfQivD2YqoQ
	 7AFK0GSRxI3ExvArVtusMET95izb0hKNKHy1mnLYChCCP1x7a7LxW+dFI7HfOVyDIZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=RXwJn5AG;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD78606A335
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:33:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFD78606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=RXwJn5AG
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e3b22e971so2534922f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795541581; x=1796146381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SGN0CE6hboOJyWQIpluS979Wc6QFsvjzK1IJ9fJlXFk=;
        b=RXwJn5AGyO6dganRr8aighjFMZJNJh4XjfhOO2zFgOYt7YFmihqlkoSNP/Sd2qk7mR
         FfbpIqRpuaBVKaT+fMr4hUegmk8cVx6CP0R2/cm5K41diZ5crRoq0LTYsfsSc0xlGEis
         4wTTWUI8MViemNC3LrHUXWWpCCIvfPI8YHfyVz7VNAJKkQIJeYbgJKBnhRpzIckcSeSl
         /l/kI7mn0mx36m4fmMzXi9hpGqVByRsyhWGpUAtHxlchwVQGBJ73cKW/3E0pMSVOeJO+
         6oSjyXnQidug3UWD3+bGNMTRkr5z1+35e6FlZZ9XnGhhqoRHAfbz48Q6kOUeMZGbDIzP
         ARIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541581; x=1796146381;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SGN0CE6hboOJyWQIpluS979Wc6QFsvjzK1IJ9fJlXFk=;
        b=m05SQ+CIuiHEe6gFH+0zwUF7rFIS2Eas/ZTnZGvRZ6xQpOra+3bu9lE6zjkF/skpTD
         b9Ru+b57CHBS7rpybVbNjvHWvNUamXNhVnYUFWebfr87sPQeiDegy++NLrH6uvgrQ2z6
         FHaQL6FpQNQm4MlpXFdd2opFRqjBdneeUM2UXmKfRe2WmCbE9tIX2B9ITBvX14xSgn4O
         K5a7pn1Po8PvfbFNgoeOJ0xYoWN5Jh445oNI/ZDOpaWbEiRAa/YjNR4J5oWvFbBH0Br0
         ftaVDVkeOEb70hXPIh8ZOhTGI3f1IaLpn8jeLiIivfHcMgeXSw6yRKDTLLpiWH3nam83
         bxxQ==
X-Forwarded-Encrypted: i=1; AL+hErHut7ztl6bYCnW8XAnBlJBeN1q7ttA1V/P9ACZyswK9ZTSRYNSoMTB2djv8QKh779bLf4yMvv8WR3ZijqU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8RpSBzICg+af1Zdzl2sRNfCDlPU8G6y0oUEtOSYO9OifcZpo4I
	/tm+gmavwazphTMuwCAdnxrgaV4zPeuBvC14G2728aKFDEYtCysBOMuyTKswsL6hrDk=
X-Gm-Gg: AZFdTZelZvFDo5pZWtgxs2QYoLCCO5+dLMAyLzGWKMteJnANzyDFI5NmFg05RzXRWc8
	jAha6H7MJiFRBaxWPU7pC6cCS4phr5kfynfNI3eKuWRX1bICnpd4gfERIaSLwBqsc4hcD+BHDUY
	GqtM79Kk/MrRFuBdRNH6nVIsIu3dtzVKQcO5N2RNSvH+BgXULaPNmRIC7TA3SEEEgEgOvBPSguE
	PQj+caFutLKvI2zNC9JcZsXCbEhDPiyseiLdkV3BJMNZkTYozZ07myJ+2P9lWwkBV7ewOOHhMPP
	sIxpULHSOoCnMy/zocmO3r3Rg9gNMZrGxwtEyvVPajfwSc5bPMAa2u9QYAS6LqlO792eMRS5RC0
	w/qKG+VRsczub2cizWsCiQD52k7bF3/Zt6vsNGx4nh6eFlSpOPJVy2RuQ3BT3q/y4Hg2jMBZQbE
	DTCuU0ML9vWzSulTntMGmdGvSIbUXyQaqNkZCLFrAv3/CsSG+qVaeXun4W9PF3k3JbQXww2Q2lL
	q52WI9qUAceMnhQ+zf0uh3tTS2rzLIdM0YPChj9rPWvE75bpt8MhvN70TJpkNuOZahIz7VmWQLu
	GAFo81Ghnh+8ZHUEHUt/XP0q6r4=
X-Received: by 2002:a5d:5d87:0:b0:499:9f62:d64c with SMTP id ffacd0b85a97d-4abaf64be07mr33775504f8f.10.1795541581121;
        Tue, 24 Nov 2026 09:33:01 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989e3sm29248480f8f.52.2026.11.24.09.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:33:00 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	florian.fainelli@broadcom.com,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: naush@raspberrypi.com,
	svarbanov@suse.de,
	gary@garyguo.net,
	linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	krzysztof.kozlowski@oss.qualcomm.com,
	Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH v13 0/3] Add RP1 PWM controller support
Date: Tue, 24 Nov 2026 18:36:54 +0100
Message-ID: <20261124173658.31030-1-andrea.porta@suse.com>
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

This patchset adds support for the PWM controller found in the
Raspberry Pi RP1 southbridge, used on the Raspberry Pi 5 to drive the
cooling fan.

Compared to v12, the driver now also registers a "fan" auxiliary device
(pwm_rp1.fan.<id>). On the Raspberry Pi 5 the RP1 firmware measures the
fan tachometer pulses and writes the RPM value in the phase register of
PWM channel 2; the companion hwmon driver, sent as a separate series to
the hwmon list, binds to that auxiliary device and reads the value
through rp1_pwm_read_tachometer(), exported in the 'RP1_PWM' symbol
namespace. This is the approach agreed in [1], and it removes the need
for any dedicated DT node or binding for the fan.

The DTS node for the controller is already in v7.4-rc1 [2]. The DT binding
has been applied by Rob [3] for consistency to v7.4 and is part of v7.4-rc2: as
a consequence, patch 1 is included only to make this series apply 'logically'
on top of v7.4-rc1 and can be dropped when rebasing.

Changes in v13:
- dropped the DTS patch, already merged.
- add patch 3, registering the auxiliary device for the fan tachometer
  and exporting the accessor used by the hwmon auxiliary driver. The
  exported function was originally part of the fan patchset. Since it
  is really part of the pwm driver to be be taken by Uwe, I moved it in
  this patchset.
- Kconfig: pwm module now depends on AUXILIARY_BUS.
- added a macro to define the phase channel number from which to read
  the fan speed.
- removed the 'Tested-by' tag from Gary (see V12) since the patchset
  has been significally changed and need to be tested again.
- the controller private data is passed to the auxiliary device as
  platform data, so the exported accessor no longer depends on how the
  parent platform device stores its driver data.
- dropped the unused 'pwm' argument from rp1_pwm_apply_config().
- added a MAINTAINERS entry for the driver, its DT binding and header.

[1] - https://lore.kernel.org/all/ae9a4df9-b1f2-4f00-ab86-d9cf8d9bc387@roeck-us.net/
[2] - https://lore.kernel.org/all/7c437a10-985b-402c-b3ac-cfa97c53d014@broadcom.com/
[3] - https://lore.kernel.org/all/20261102192302.GA882027-robh@kernel.org/

Thanks,
Andrea

This version has been prepared with the help of an AI coding assistant
(Claude Opus 5.5).

Andrea della Porta (1):
  pwm: rp1: Register auxiliary device for the fan tachometer

Naushir Patuck (2):
  dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller
  pwm: rp1: Add RP1 PWM controller driver

 .../bindings/pwm/raspberrypi,rp1-pwm.yaml     |  66 +++
 MAINTAINERS                                   |   8 +
 drivers/pwm/Kconfig                           |  12 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-rp1.c                         | 477 ++++++++++++++++++
 include/soc/bcm2835/raspberrypi-pwm-rp1.h     |  12 +
 6 files changed, 576 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
 create mode 100644 drivers/pwm/pwm-rp1.c
 create mode 100644 include/soc/bcm2835/raspberrypi-pwm-rp1.h


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.51.0

