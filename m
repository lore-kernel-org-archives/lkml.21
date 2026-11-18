Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009926;
	b=PmWtW6GO5hZIZ5RRKf+CAHFddIJu74S+2lPTYuPmow9axQPEeu4xnRSb1jQjcMPPgwLv
	 bMg/cXRMPhd7OKbR9tYkSwYoKQv0bCDWUdrDNwJ0EMw0IWTfBpgDaCEEj1bZDiCHTj/jK
	 zcEc+SBmifxQJ9YJiojSPm0BwAQwf1PBnuhq9fbROYwumIAgGmEqIThi+/KyiiVHcbV88
	 91pwEI5Fh/t/VqdwbTFjTeaSpYmIcEJCJbX7kJVcSP9Q8XuYah2mfKWXVnPsYB9ceCC6B
	 Li6g9oWBU/US+QZT1kiG9e2GaBuapqqo+jROmMtz8IPn6o9qbNRobobNN91fpffO0uQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009926;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=PM3UlJlcv8z+zqBrOKfrn/t7+7YdeOarS2V1pVOK/10=;
	b=t2C9wccJUZA6VDYx9IUJf3K41RbNwb7qm4wQY93gLaoIs6jNY95At5RYAG0EktQnEgnC
	 26QWWMYLQTBnDlK32apCie+/fVMK6PsXbahIGrzOlaMMuAPJHSiXW84iiDrlm7hvGcQtv
	 iwqfAptutvd0wAUqJ4yoy2X//Yvj22gx4LCw4Fqzhi5+W64ZDVUEN1UegrLG/AZpJnA7T
	 PMVf26ect1dff5d4XayjbrHsG76kNS4eN8fvWDFaIJpY3eXh62qBBSOgSRuKCGxNT+qld
	 FlVL1f2NI5uQt9z5UEVCK/DqqFlThnAahnwro59OJ+C+0EYMG4jvqh3ZR73tOGPk3Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K3ZCWwQg;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FC2606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:52:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11FC2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K3ZCWwQg
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-38318d69173so523631eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 05:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795009925; x=1795614725; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PM3UlJlcv8z+zqBrOKfrn/t7+7YdeOarS2V1pVOK/10=;
        b=K3ZCWwQganD7R7aMQRi3QnsNh0InV0y7tDoUu83xVtqjiOF5cHEXJT6Kx6QZrG5otC
         8rgVqtE6WFYtOW9kEKxmeL+YAm6t2e1qSMeDAdJ0UB9g4OxYuOheJW6nohBKdNEiaD64
         HEZcIDlHunuhO4IRmNonSBvt1Cy405FdJoRh28vo8Cj0nyrTtb6dfmtUjgdy32XXxRtI
         5FF2CQGsOM0ZJ2mod7fVqXyuRNzVLAOEwuFwdHRIBtdFVWHDS+xr5xKHLpjI9i0+7Wie
         1F6Mow2iZISa9VQb8fyGEDsGNaNpNtkXOm7VEHfg2ru5wNlQDBlCWXScVV0/YMsGKqsD
         gP3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795009925; x=1795614725;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PM3UlJlcv8z+zqBrOKfrn/t7+7YdeOarS2V1pVOK/10=;
        b=MnSxiWUN0yWIOO7RtdIwhPnx27fK7/m+dAsILdOpqKy4gWB8fxrjiz5YFuWK2YP84U
         8giZzZFQ3hNcEoB0yFT87dyFXmaQvh7WoGgnlbkN/tFvP1xQKg4Ma2A5heEcngUmBvy/
         q1ALIGvyZPWhwydItxgdKUqFXjYIzF8kPfQDYHSvZxIYFjGYQKzfUBmXsLmvJlibS2QN
         WcBUtDDqDfDXGLg+oANmbh6y7krQZoOq4K9p30aMwIJAqS5rdY88boc8X6OKgi2OIIt2
         D6bKuTIfbeNR7XSbYfEnHQVck9PXzJGZPMC10ePnbkf7BteLlQezAcTjno7RnJGQcCR2
         bRXw==
X-Forwarded-Encrypted: i=1; AL+hErHeU3IENDU/Nkg8wx3NBwrspoGMwPz7inmCpobTlrpJ2ke3yf1F1Nw91GYgQFuxf4YLlbdCpzmyS6N70hU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sdJPGIrrfWrozUgJmQihFONtd61sJ0b6FYT2dXIZDfuiOmoFg
	SLC5BNyVSJhpdRgmSAYvqzbSRH1jZslDFhPDpAPzyWH2qHXEGm+S6qQ=
X-Gm-Gg: AZFdTZeBIjid+XKbtSQF/pAwXp5q/03IkDtJ349DgMxNwGEF4tp7U/OO1QiRb8IGks9
	wr3KGZZ8AvuxtwZCUw+ey3o5XpHa87jcJPSKXe+Nnq1JS8QP+/8ijXkkaZCFNSZBxXMSZGNovFz
	oIUlvXVvk+1TsR2M7dvMo5aKF2NV18yqF1xkiN+m/0IFV2/VG5HtpFdJuZM82ftXMV9rbTfTQWu
	VYKfCzlUzxhMCre4BYdSZpbxfJVF2hN+zCAC8idqkfOiAsiJ1BGcqV9U9cZFnTKwdcl73As35Pu
	QfxWZT1SYxg8MkItRmfLMKEisHcGSBD8m7M3q+FFziduy2mlhjPtvGMyfzyKkh/qF9EColi/70F
	VsKpx2Wp9lPfrxyg8Z3GhyboX6iWq/4SlohV66ckBg9sXH33kg9njC2XFG9x+qc9laqxwrKvuon
	GtemPyi9NwFyrPAW51je42qlfSNEG/7MKC54YOp7RQk2bDTNitWWv+jkrilrblez8FY8fL6xf7f
	f+E3opAsidLw0usiiYwM1quXgs4zrRiXywcS6VQdC26iAX8Y5Md9JTMRE7gHkrDCiJ7VjS6Nnpz
	0LzazlNtmlcc/Eq8wILQMF38uLEG1APngNKcS+5gpbuG48jNHku3hWIhneJ7jL6MC0kQLX1JaqQ
	e4vJ8wg==
X-Received: by 2002:a05:693c:821b:b0:376:a6d7:8f6f with SMTP id 5a478bee46e88-38280c34ba5mr2865954eec.17.1795009924614;
        Wed, 18 Nov 2026 05:52:04 -0800 (PST)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7eaf3b3sm9576421eec.27.2026.11.18.05.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 05:52:04 -0800 (PST)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Brigham Campbell <me@brighamcampbell.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Shuah Khan <skhan@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/2] Add support for CH1115 Controller
Date: Wed, 18 Nov 2026 10:48:52 -0300
Message-ID: <cover.1795008752.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series add support for the CH1115 Controller [1].
It is a monochrome dot matrix OLED controller that supports several
interfaces such as SPI and I2C.

This driver only supports the I2C interface, but all common parts could
easily be put into a common file to be used with other interfaces.
I only have I2C to test with.

This is the first driver I write. The work is based on the driver
located at:
- drivers/gpu/drm/sitronix/st7571-i2c.c
- drivers/gpu/drm/sitronix/st7571.c

Tested with Raspberry Pi 3b+ on:
- Linux 7.4-rc1.
- Linux 7.4-rc3.

Note: rc-3 was tested by pulling the changes of drm-next into the
rpi-7.4.y branch of the Raspberry Pi tree. rc-1 used the Raspberry Pi
tree as it was at the time of rc-1.

Patchwork Link: https://patchwork.freedesktop.org/series/171799/

Changelog:

v7:
General:
- Patch series based on drm-next branch
  commit 601c30449c80 ("Merge tag 'drm-misc-next-2026-11-13' of
  https://gitlab.freedesktop.org/drm/misc/kernel into drm-next")
Driver:
- Changed default contrast value to 0x80: It was 127 (0x7f) by my
  mistake (0x80 is the default in the datasheet).
- Added sleep (100ms) just right after sending the screen on command
  (AF). This is stated in the datasheet but I missed that before.
- Dismissed Sashiko review: "[Medium] drm/ch1115: out-of-range display
  offset 64 sent in ch1115_oled_init()": This is a false positive, the
  datasheet [1] states that the formula for this command (D3) is 64 - n,
  where n is a 6 bit number in the range [0, 63]. I did not use a mask
  for this because the unused bits get ignored and the value is
  constrained to that range.
- Fixed Sashiko review: "[Medium] drm/ch1115: missing DC-DC disable in
  ch1115_encoder_atomic_disable()"
- Modifying MAINTAINERS file in the driver patch (removed patch 3 of the
  series).

Link to last Sashiko report: https://sashiko.dev/#/patchset/cover.1793735996.git.nico.antinori.7@gmail.com?part=2
Link to v6: https://lore.kernel.org/dri-devel/cover.1793735996.git.nico.antinori.7@gmail.com/

v6:
General:
- Patch series based on 7.4-rc1
Driver:
- Fixed KConfig dependencies: added depends on MMU because of
  DRM_GEM_SHMEM_HELPER select
- Removed unused constant CH1115_MAX_PAGES.
- Removed unused ch1115 struct member pages.
- Fixed width and height checks error messages
- drm connector: use atomic_create_state and remove
  drm_atomic_helper_connector_reset: This change is because of [3]
- drm CRTC: use drm_atomic_helper_crtc_create_state and remove
  drm_atomic_helper_crtc_reset. This change is the because of [5] [6]
  [7] [8]
- Replaced devm_regmap_init(...) with devm_regmap_init_i2c(...). Deleted
  related unused code. In this driver `I2C_M_IGNORE_NAK` is not used.
  The way of communicating was carried from an old version of st7571
  driver (and me not understanding better). This change is because of
  [4].
- Early exit on failure in ch1115_encoder_atomic_enable
- Removed "CH1115_CMD_ALL_ON" in shutdown sequence. This was a
  misunderstanding of what this command did.
- Fixed Sashiko report from v5: "[High] core: uninitialized variable
  `bl` used in IS_ERR check". Apologies for this, my LSP did not
  highlight the problem and I overlooked it.
- Fixed Sashiko report from v5: "[High] drm: out-of-bounds heap read in
  ch1115_transform_xy()".
- Fixed Sashiko report from v5: "[Medium] sysfs: unprotected state
  modification on registered I2C device"
Dt-binding:
- Removed adding Chipwealth to vendor-prefixes.yml. This was added in
  commit 058ee00216a1 ("dt-bindings: vendor-prefixes: Add Chip Wealth
  Technology")
Link to v5: https://lore.kernel.org/all/cover.1790200427.git.nico.antinori.7@gmail.com/

Note: Sashiko keeps complaining that i2c transfers are called in
atomic_update callback stating that it is forbidden to call sleeping
functions there because we are in an atomic context. AFAIK this atomic
context is not that the kernel is in a non-sleepable state, but refers
to the DRM way of working by doing check -> commit. In fact, the driver
I based this driver (st7571 [9] -> [10]) and others (ssd103x) do i2c
transfer in an atomic plane update. Am I missing something?

v5:
General:
 - Patch series based on 7.3-rc1
Driver:
 - Fixed KConfig dependencies (OF and BACKLIGHT_CLASS_DEVICE)
 - Initializing baclight with backlight_properties struct
 - Moved driver from drivers/gpu/drm/chipwealth to drivers/gpu/drm/tiny
 - Fixed allocation for hwbuf if width or height are not multiple of 8.
   I was allocating less memory than needed in those cases.
 - Fixed damage rect horizontal alignment.
Link to v4: https://lore.kernel.org/all/cover.1788711082.git.nico.antinori.7@gmail.com/

Note: The last two fixes listed were pointed out by Sashiko in some
occasions but when I checked them I dismissed them for false positives
because I misunderstood them.

v4:
General:
  - Patch series based in kernel v7.3-rc1
Driver:
  - Fixed nits found by Christophe JAILLET.
  - Fixed max_width and max_height in modeset to avoid having bigger
  framebuffers than resolution.
Link to v3:  https://lore.kernel.org/all/cover.1787973729.git.nico.antinori.7@gmail.com/

v3:
- General:
  - Patch series based in kernel v7.2
- In dt-bindings:
  - Removed "chipwealth,contrast" property (added backlight_device
    support in driver's code)
  - Renamed "chipwealth,invert" -> "chipwealth,inverted"
  - Added default value to "chipwealth,offset"
  - Removed 'status = "okay"' from example
  - Indented example with 4 spaces as stated in the documentation [2]
- In driver code:
  - Added support for backlight_device
  - Replaced drm_dev_unregister with drm_dev_unplug to cover the dt
    overlay unload case
  - Executing drm shutdown operations before turning off the display
  - Checking that the width (panel-timing.hactive) and height
    (panel-timing.vactive) parameters are greater than 0
Link to v2: https://lore.kernel.org/all/cover.1787321297.git.nico.antinori.7@gmail.com/

v2:
- General:
  - Patch series based in kernel v7.2
- In dt-bindings:
  - Fixed linter problems
  - Replaced first_page property with offset
- In driver code:
  - Fixed dst_pitch calculation
  - Renamed file from ch1115.c to ch1115-i2c.c
  - Support flip-vertical and flip-horizontal dt properties
  - Fixed several things found by sashiko-ai
Link to v1: https://lore.kernel.org/all/cover.1786110720.git.nico.antinori.7@gmail.com/

[1] https://datasheet4u.com/download/1576606/CH1115.html
[2] https://docs.kernel.org/devicetree/bindings/writing-schema.html#annotated-example-schema
[3] https://lore.kernel.org/dri-devel/20261022-drm-no-more-connector-reset-v2-26-0b7e4e85b1e8@kernel.org/
[4] https://lore.kernel.org/dri-devel/87345ckt2n.fsf@ocarina.mail-host-address-is-not-set/
[5] https://lore.kernel.org/all/20260915-drm-no-more-crtc-reset-v5-0-bda007735748@kernel.org/
[6] https://lore.kernel.org/all/20260915-drm-no-more-crtc-reset-v5-9-bda007735748@kernel.org/
[7] https://lore.kernel.org/all/202609260122.KLDd6aW4-lkp@intel.com/
[8] https://lore.kernel.org/all/202609260545.eEm9FCKo-lkp@intel.com/
[9] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/sitronix/st7571.c#n371
[10] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/sitronix/st7571.c#n224

Nicolás Antinori (3):
  dt-bindings: display: add Chipwealth CH1115 OLED Controller
  drm/ch1115: add support for Chipwealth CH1115 OLED controller

 .../bindings/display/chipwealth,ch1115.yaml   |  81 ++
 MAINTAINERS                                   |   6 +
 drivers/gpu/drm/tiny/Kconfig                  |  17 +
 drivers/gpu/drm/tiny/Makefile                 |   1 +
 drivers/gpu/drm/tiny/ch1115-i2c.c             | 862 ++++++++++++++++++
 5 files changed, 967 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml
 create mode 100644 drivers/gpu/drm/tiny/ch1115-i2c.c


base-commit: 601c30449c80926947d4820d50cec974687d1d11
--
2.47.3

