Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794939213;
	b=y0ndUc4d/od6+fHcTxHGMm+g+RQAwoRMEJf4XXkHsR8WRHZGedMmgCrxxWcQoODlTkOI
	 gL8JSRRYNSZCoZieuhLxDP2TdmanW+KjCHLbd7L9v0j+bDj1BczYZOjzvQFitL8wyGsi8
	 YGHBQeV0KAXP+TLujOcOGiP0khnJk1glFAMGWQDKdAxo/rxh5ZsW3A2Sfi67hUwst9+wE
	 Kthn23I2WOVn+ajwSROL6PFU9lJ04VOnH7StK7TRvgA1LptkI3/4kUXKuytiqdHj6QTss
	 R+sF58Lh+HEY3boWqWCFu9QuanVMv4dSq6nrZrcd10LcycDRKc9YgoIsLt83ViNR8Sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794939213;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=qYI+mRtKZV9UtpxqtLIVKCpJPhMRQgiO7jm/7Ia+5NQ=;
	b=R/PIiyEG7tU/Ktqp2QdbfcnIYKwbxD9kLTHdEdyP6yl4RzH5oGdRRs4VLS9WmxVBzM9M
	 JDhnsAbr82Ct+tXPyiL+88M186BZ4mYAZPJ/WE5/KTHl31Vvt9yxdDZhm6VoW6fp8GPof
	 obng2cz6KUMUieCNWyOQM3snpdEH4Bwg87fqpr7NChT7REvVDzn15wQQljgG9WaBPnRdx
	 T354Klt7LvgnAqd0TAWcSdW0kijEZwpUxEDbBDwKqfZ+xBaKCYlVPt3DLtKzH8w8I3qT8
	 Y+pYdjRgM3DtKCyCBG4N6FJabkq5x7Eyy0rpfCKNNrzNk4esl008y4AevPxSrVjeyug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ank3qD0Z;
	arc=none smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7B4606A334
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 18:13:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF7B4606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ank3qD0Z
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8b4e04eda5aso236247b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794939211; x=1795544011; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qYI+mRtKZV9UtpxqtLIVKCpJPhMRQgiO7jm/7Ia+5NQ=;
        b=ank3qD0ZWcEjB90MF684wTGo9+qxPE/A9EE+B5XaZk1tgwsfpsLKAB66NZ8LTD75Zk
         hyvMmfXg7NePxjO71pXggBnNbu/WPYAhKgUJhZ1veGH52i2Hk/LNsecgoShydNmmLCPs
         cl/QpeWEntG17eTsoyguTWfjL9DYLpz2C2jkMoSC6l5HeCu0dtGfy9rI69lty+vst0JD
         oJ9Z0qbo+GMWuie+YdpfwMhY5Wqz0hizujJ67KqInIMnSUBG5RBh4szvIQKqhoXze4IO
         hXDe83uuyqzFh8ca56XomKxm8DT4vV37joVIQdD+WNQz8QuPrR2wQ+vGuOguix3Kn69v
         YJyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794939211; x=1795544011;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qYI+mRtKZV9UtpxqtLIVKCpJPhMRQgiO7jm/7Ia+5NQ=;
        b=VCsf6PWMPC2ubDMrZTqElQUimBxjCHVhX7JKeATOzaqSKpGL1T3bTdc2sIsodU71XO
         9nbqkoqkmd8D3ui9fB6E+E6lcCgZn0yhsAM/IGtLlyTS34Jv67yyg1Wy+qOgMJumrqna
         YuHsFaChc9NAqrdZYpnwth5fd5zZkjUHUqULaq767t0fMR5FF6u7tQog+n6WPkTBIxyc
         UEgzQwV9By5Twji6lEg3jUG53GWzkaCAghU5doJCYjRFpzRSsWGx0aT3mlZEJ6a681Wm
         BogDtIJMkN218ERCUmtD3G5DGsrVS3dwYBTjeSUjt/rViys9UjIFpwa07MZ8SiqDRCLO
         T5/w==
X-Forwarded-Encrypted: i=1; AL+hErHNGttXHtNflWVbubxbLU8g8crqeY9uQDlAFVluTH0CFXYt/qedHlOjmj5r2KOYsxSg9j1p01uLDOv4d2I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8eM2m2l0Nw2GRsIMQSCWBgnpcVvgADW3s2L+YnCiOEgus3WnZ
	b1wX837KHyN8iwohNFdMjiZy2T27khK8fkCZMUGKBCz09ywo6Qn+JmNt
X-Gm-Gg: AZFdTZfRjrtmkN/Mye46r65OTxVo79ochZEA5dlqVAU6d2Yth1WOK8h4XFaBdtZrePX
	5xSSy4yWx2lbmMdALmCfdsEo1HItx+mh2i73h5sS5cKwBl46V7zPEuz39wUbpnUhECR9bu5Bw+5
	6qxknyOgLQeVl4v6PMPjOQBzcTvVE4gfEEx/rNjp1PFkxfpk4KhFL3gxO5AaSXPiDgk/8SJe/e1
	MRV+3p8IcFIf/1EBbC98U/YAOH+bK0xIKpA30l2CGl8NtDHgtY1veQl8emoc+EM6wScFA15ShTR
	JM+ywU+8BrTwy04UnIBZpmN29C56Rji6a3j0QpfT0NSBrHILNaN03xFwvfYbQ5o3oAqIk8s1ybZ
	sbksbT6wtLNfMCHK2jjVWtkybwtTfki2AepYYDUuGHI9/9UzhpbzqNfwDD5k3Edt96rzwyXEFDq
	BXLAWhDu65GcmKwEJQrlu1DYDceqHcGv7ifUrlL1S3aDtG+RIvCV+S/UFJP91LTUas28jEDyKIS
	3HH4boEPPkXu3FplqzRvaTFsc/aPxuReG+4fKF4LmXrmXrZox2wekKbgB7i24rLO6dCL1fs0iZW
	tjecwRX90uEGZk49rqVfd4KR9iVLdNjifAqfILFRB3ga0etnWJrEmJXKGgv6K4POAOWtFl7w055
	gq1J4nAejEMcZD08xeAQaqjlVjmc6hZ6lRoqg7hlRQOUe0omxqetKs1OoPVcZ5R4t+wUX7K6XdX
	II8Mb2wIooUinXPomHBa1BWyAngTcdLTNtJkeQNIY=
X-Received: by 2002:a05:690c:3682:b0:8b3:33cf:1fdf with SMTP id 00721157ae682-8b4fed08bfdmr538427b3.14.1794939210615;
        Tue, 17 Nov 2026 10:13:30 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4fe0d541csm2717837b3.26.2026.11.17.10.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:13:29 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Subject: [PATCH v3 0/7] alpha: marvel: environmental sensors
Date: Tue, 17 Nov 2026 13:13:27 -0500
Message-Id: <20261117-marvel-env-v3-0-0edc370fdca9@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22Nyw6CMBQFf4V0bU0fWMCV/2FctOUC1/AwLTYaw
 r/b4gYTl5OcmbMQDw7Bk3O2EAcBPU5jBHnIiO302ALFOjIRTCjOeU4H7QL0FMZAaybKyhZSGS1
 JFB4OGnxtsevty/5p7mDnVEiLDv08uff2Fnja/Q0HThktKyZFCbkp4HRpB4390U4DSeEg9qr6U
 UVUoVE8ByOgaPheXdf1A6Uo8dvxAAAA
X-Change-ID: 20261114-marvel-env-d0289c736ba3
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5273; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=eqBGttjSTvFfg298IibMRQsEBgA3D8rXLrhSjnbj5ys=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLL+zPR4+izn6Irb4SJRDvUuzzfxBz1mr7K7w7/ZstDqi
 jrry+95HR9ZGMS4GGaKKbLErVdkmdW2Y6nPaelfMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 IZChYxQPkdNj0MgsLi5NLdJNKyhyyMsvSSzJzM8r1ssvSM0rSC/QS8tMK8nIyC8qTgUaoZeXWmL
 q6uhmZGhgYuloYeZk4Whq4uzsZOjk5ujo7OpkZGluYuBs6WjiamnOwMUpAHNNpBMjw8TFFg2r2K
 o4n+9N5o2I8Ps7L2gFm9+axwITj65TNKg4d5vhr8CNS7Zhh7e8O/9T9b3Ys0Nrd26bqdmmzsh5O
 btu468rOxkB
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The service processors of the Marvel AlphaServers (GS1280, ES80, ES47)
monitor temperatures, fans, voltages and power supplies. Linux can't read
these sensors, and the events the firmware raises when one changes state
are printed only with CONFIG_VERBOSE_MCHECK, and then decoded wrongly.

Patches 1 and 2 fix the event reporting. Patch 3 adds the SRM callback
that refreshes the readings of one config tree node, patch 4 passes the
firmware's events to a notifier chain, and patch 5 registers a platform
device. Patch 6 is the hwmon driver, which polls, and patch 7 makes it
reread the sensors and notify userspace when the firmware reports an
event.

The hwmon patches depend on the alpha ones, so I'd suggest the whole
series go through the alpha tree with an ack from Guenter.

Tested on an ES47, where sensors(1) shows the temperatures, fans,
voltages and power supply status. Disconnecting AC from one of its two
power supplies raised a system event that set the supply's in_fault and
woke poll() and udev, and reconnecting it cleared the fault the same
way. No voltage is out of range, so the voltage alarms were checked by
forcing the warning and failure states in the console's packets.

I used Claude Code to help write this series: working out the packet
layout, drafting the code and changelogs, and checking the firmware
documentation. I reviewed and tested the result.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
Changes in v3:
- alpha: put marvel_env_state() under CONFIG_VERBOSE_MCHECK in patch 1,
  so that patch builds on its own without it (Magnus)
- alpha: declare srmcons_callback_lock unconditionally and restore the
  SRM check in marvel_cfgtree_partial_update(), as in v1, which fixes
  the build of a Marvel kernel without SRM support (Magnus, Sashiko)
- hwmon: check the second walk of the config tree against the counts
  from the first (Magnus)
- hwmon: prefix every label with the cabinet and drawer if any unit is
  outside cabinet 0, drawer 0, as documented (Magnus)
- hwmon: drop the update_interval attribute and refresh a unit at most
  once every 10 seconds, since update_interval is for intervals
  programmed into the hardware (Guenter)
- Link to v2: https://patch.msgid.link/20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com

Changes in v2:
- hwmon: report the firmware's states by their documented meaning: a
  sensor's warning and failure states are its reading reaching the
  warning and failure limits, not a broken sensor (Guenter)
- hwmon: report power supplies as in channels with only a fault
  attribute instead of power alarms (Guenter)
- hwmon: depend on !ALPHA_LEGACY_START_ADDRESS for generic kernels,
  which leave out core_marvel.o (Sashiko)
- hwmon: drop the private mutex, rely on the hwmon core lock and take
  hwmon_lock() in the event work (Sashiko)
- hwmon: notify each alarm attribute whose value changed, and only those
  (Sashiko, Magnus)
- hwmon: report a voltage outside its limits as in_min_alarm and
  in_lcrit_alarm or in_max_alarm and in_crit_alarm, by comparing it with
  the nominal voltage in the console's packet (Guenter, Magnus)
- alpha: define CCB_CFGTREE in asm/console.h instead of the uapi header,
  since it is a Marvel console extension, and say it comes from Tru64
  (Magnus)
- hwmon: return -ENODATA from every alarm of a sensor that became unknown
- alpha: drop the unreachable SRM check from
  marvel_cfgtree_partial_update(), and move the GCT node type and
  subtype the driver uses to asm/gct.h
- Reorder: fix the event layout before printing it unconditionally, and
  put the alpha patches first
- Drop the Assisted-by trailers, describe tool use here instead (Guenter)
- Link to v1: https://patch.msgid.link/20261114-marvel-env-v1-0-890328e4b7e5@gmail.com

---
Matt Turner (7):
      alpha: marvel: fix the environmental subpacket layout
      alpha: marvel: report environmental events without VERBOSE_MCHECK
      alpha: marvel: refresh environmental readings through the console
      alpha: marvel: notify environmental events
      alpha: marvel: register a platform device for the environmental sensors
      hwmon: Add driver for Marvel AlphaServer environmental sensors
      hwmon: (marvel-env) Notify userspace of environmental events

 Documentation/hwmon/index.rst       |   1 +
 Documentation/hwmon/marvel-env.rst  |  73 ++++
 MAINTAINERS                         |   8 +
 arch/alpha/include/asm/console.h    |   5 +
 arch/alpha/include/asm/err_ev7.h    |  16 +-
 arch/alpha/include/asm/gct.h        |   2 +
 arch/alpha/include/asm/marvel_env.h |  17 +
 arch/alpha/kernel/core_marvel.c     |  59 ++++
 arch/alpha/kernel/err_marvel.c      |  39 ++-
 arch/alpha/kernel/proto.h           |   1 +
 arch/alpha/kernel/srmcons.c         |   3 +-
 arch/alpha/lib/callback_srm.S       |   1 +
 drivers/hwmon/Kconfig               |  12 +
 drivers/hwmon/Makefile              |   1 +
 drivers/hwmon/marvel-env.c          | 678 ++++++++++++++++++++++++++++++++++++
 15 files changed, 897 insertions(+), 19 deletions(-)
---
base-commit: 0b4cadbe7c39d830dec35c4a2655483de0dae568
change-id: 20261114-marvel-env-d0289c736ba3

Best regards,
--  
Matt Turner <mattst88@gmail.com>

