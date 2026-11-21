Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795267969;
	b=BFpgg/LAhA4sLpeke3r5+VbhBc/f9rF0z9WcJXe6LWGPmTXGNkL/U18AJYZQYyXCkimY
	 HG3C+1/EIJBajOdjn8txpFWpAwLSgsMxu12+uXhZTdK6DNkMHpLlHVdZDxoq1cefQdkFy
	 oT2Pj/UiKL8tNQEusGwx9XQeD8X2/5NBKDfU0TKL82a5lIFCGuLejlEtDxVDJyHnrc9Xo
	 QuM8a+vBdQImU6E7K313T18Xro9vG+CyoonMWxvaJIyzwCiXzFMVLX1uE8BLmlxDdnlqp
	 GA7a8Z89izZImO8sQl3oxe6AqggGI3GO9w4csPukhZT2bRiPbx6inB/7lzOL683GBqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795267969;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yBWQYF06RzN0Kc5fo+W7LuMAcoYlzyHt2HwcS4GXu/s=;
	b=samo16xKUg0XvoTT3x97k+bY8BE2MzQm/P1N3II26Rj7CMWAZOfRNHmgQlbxyRbOY9Qh
	 WzXZ+NT+7FczxLTYitrz16qagl44siPfm5t6eMH7zqovG0Rz9bw9CkI8ktl3r7at3ZOxB
	 9y+6AOyx9XTNgsOpNAu0dgtnlKyDeLmqZzhJ6QXrMoS/LXj2+BxE7QRq2BrhtNH/gMDWC
	 Mv5OvGSb7mTJw5IrlKBU4AHTqfyOPoPkxjbaBuCkOFIQCgyPCZnlkS24eSYnvcspmcJmL
	 dVskv+Aiv2ZeeaiXZTQGO87cF/fGXAygl2+zwFc6WE01YddAGx9Vajq41XAG0sgYupg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QoWu65Ne;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3E1606A33C
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 13:32:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D3E1606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QoWu65Ne
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so22227335e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 05:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795267967; x=1795872767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yBWQYF06RzN0Kc5fo+W7LuMAcoYlzyHt2HwcS4GXu/s=;
        b=QoWu65NeGhSeAkEovw3/LCMVojAy7azK7BS9FdJzBCU3BwWwgbrk1XnqR1k8+CBcF0
         OCrPc50SgPTHd4heTdC+WBRN5vbBL5YR0F4yN6TOHNA4sECpguKqfc/OPNdX9WGxkPcF
         MK0/HZFN6KooROGZIOG6KWBycdKubcUUioanCuPslBJv3vGFnkXarTaXtCs2ElXAfhFQ
         xiQclC7WUt/E9oFdTxWsvx9oc26QmUOXa99QA7m3s5ubxYDI6P19Xz+j8aSMmy8bcCl7
         8hgGACmv6ip+PTxqMvo1U3ui7QOpIfhKUHea//euZDvvDNnBZ1sDl4Ji+0NlLEWWhyf9
         zmLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795267967; x=1795872767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yBWQYF06RzN0Kc5fo+W7LuMAcoYlzyHt2HwcS4GXu/s=;
        b=2ZN/Ws2eqPcOstmFO+gEDa8I9YK/xG5tbaoKeIKBcl0YrE9Z2zqpegsUdCgHKhVQ0z
         Chum32w850ucC5FFsn6721weAdnuRhslUPKBdMKbyr4z/a8DyNbiav5onyFby1AdBZ0Y
         fzYE+7fFkkH67HgjbhYdkofRfLMg5mVgPGwvxqkAmzb6mS097b13FrX8X9UOlu+QjqiO
         6/HOFxWw/mhgXP8ulp1IQUXKPXXiXnUgnRqHkkgy/S2RMssOBbhBtgE5216Dhc7h9q+W
         pc2jiG084jh8rNVvU3VjHylbDqFM72DufnClXTEWM3O+icT1q/5/3YZmk6D+hQqp7TUU
         V0jA==
X-Forwarded-Encrypted: i=1; AL+hErGtZvPZy6yTvntE0kfmtvMDRlLxuVDUKUbbQ1ypjg4nc1Ok148Gm7474ZSDl5tGu06gOXdkI+ab4lCMiB4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Fn1e2FjtK5SCOID9aAwXvppngMd7E7XOx6U7J68kcO3sMLGTJ
	se/4pBU2svHsFXWX+gvbWfUpo4kU+BlLdOQMimxAX3BSO25JD2OeoGLh
X-Gm-Gg: AZFdTZd00Dlpc7ASn756hFmaJzWXoQX6VSpecJYCsT1jDhnChFNxj5bfuxlA7iqX1rg
	DloxW1fO0/zBEVkPsk4Qb/ddp8n3lz4ac5Hb6cBqgIR3g1NrKCkVdB6lzoYjEF9T2BXJBG3G7ef
	NfJYotkoTqdZpPZyeB/kTJO/xhl8OiD623ZFtbKGtjjbP+TF2unseCUd7mC618n18HbfqXTJIVk
	X0iJJklCUouIQMhpBjCFu5xaQXjiHw0lpoL9VOR1zJCQU+xL11/vw6GsDFJt0LoBFHvVEFwt3I2
	gvXBzUXAL+EJlDwzIxTxkgDtBvyC1bt9yx0fn6puzKYO76exqjEdHGOekuLnMWBGN7xU+UoM8Fb
	2an5LYz4HA8oTum6Gt2JFWn2EM6VEgmuSIfkWtmUeLW/uoAxyFtxCmbWZYjMdpIipwjOcZVOPCR
	SrpCxH+q0Iaoc/cF0fLXvMh2weWe+IjmDIfnrV2bmca69jnrw3O25z4VQuvoIc7R7ZfCur60cKL
	R8K0wBcKsIu03nqNMSkROGU/uupA9/UMV8ajHEr4uCvphvXi9IpQ5vRhsnkUpLFbGJtu5CmNc31
	minCdYO0F8eR8IN8PfPlaV1AUS57DCGzi6OIkuba/z8k//XM7+h1Ml/1RkE7DZKfjSF5mrPZTjj
	MeBM0R/sRZaKk
X-Received: by 2002:a05:600c:5303:b0:4ba:4928:8aec with SMTP id 5b1f17b1804b1-4bb88807d7cmr132597455e9.9.1795267967020;
        Sat, 21 Nov 2026 05:32:47 -0800 (PST)
Received: from 1Z10 ([2a02:b123:8010:295a:cf7a:d53b:95ce:c0e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm83345955e9.2.2026.11.21.05.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 05:32:46 -0800 (PST)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v11 00/14] media: Add Lenovo Yoga Book camera support
Date: Sat, 21 Nov 2026 14:31:30 +0100
Message-ID: <cover.1795267528.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Add front and rear camera support for the Lenovo Yoga Book X91L.
The front sensor is OV2740 and the rear sensor is OV8858 with a
WV517S focus actuator. AtomISP ISP2401 can capture RAW Bayer from
both cameras.

This review series is based on media-next. Apply David Heidelberg's
posted V4L2 subdevice release fix first. The prerequisite patch ID
below identifies that patch. WV517S needs it before the V4L2 core
can release the actuator's final reference.

Changes since v10:

- Drop the upstream ACPI initializer and INT3477 ID changes. Reuse
  the existing rear IPU bridge entry and shared Cherry Trail PCI ID.
- Limit OV8858 19.2 MHz support to four-lane R2A. Carry the 2014
  Intel OV8858 notice and record the sources of the register table.
- Drop the per-component white-balance controls from both sensors.
- Use div64_s64() for CSI-2 timing and make AtomISP RAW negotiation
  and enumeration follow the sensor's advertised formats.
- Defer WV517S I/O until use and hold its state through final release.
  Preserve existing camera nodes if registration of a new node fails.
- Keep the OV2740 probe retry as a separate diagnostic patch. The
  cold-boot logs did not show a natural I2C failure or recovery.

The revised sources built the full x86-64 image and modules. The
focused Sparse checks, i386 AtomISP object link and WV517S build
with CONFIG_PM disabled also passed.
The mocked registration test reproduced the previous rollback and
verified that existing nodes survive each simulated failure. The
format and notifier fixtures also passed.

On the X91L, the exact revised 7.4 image bound both sensors and
WV517S at boot. Each camera delivered 30 distinct RAW and 20
distinct Preview YU12 frames before and after lens rebind. The
capture and sensor nodes survived rebind, focus controls worked,
and the actuator returned to runtime suspend. Physical focus
travel, 24 MHz OV8858 hardware and X91F lane configuration remain
open.

Codex drafted the rollback fix and cover text and consolidated the
previously tested follow-ups. Individual commits describe its role.

v10: https://lore.kernel.org/linux-media/20261002-submission-media-yogabook-v10-b4-final-v10-0-817ec765b257@gmail.com/T/
V4L2 prerequisite: https://lore.kernel.org/r/20260917-v4l2-release-fix-v1-1-acbac7f9b78e@ixit.cz/

With Best Regards,
Maurizio Casciano

Maurizio Casciano (14):
  media: v4l2-core: Preserve existing subdevice nodes on rollback
  media: ov8858: Extract digital gain programming
  media: ov8858: Support a 19.2 MHz input clock on four-lane R2A
  media: ov2740: Add OVTI2740 ACPI ID
  media: intel: ipu-bridge: Add the Yoga Book OVTI2740 entry
  media: atomisp: Add Yoga Book camera configuration
  media: ov2740: support 288 MHz link frequency
  media: intel: ipu-bridge: select OV2740 frequency by IPU ID
  media: atomisp: Derive CSI-2 timing from the sensor link frequency
  media: ov2740: release group hold after gain write errors
  media: atomisp: Use struct v4l2_area for padding
  media: atomisp: Allow raw Bayer capture
  media: i2c: Add WV517S lens actuator driver
  media: atomisp: Preserve the capture graph when a lens rebinds

 MAINTAINERS                                   |   1 +
 drivers/media/i2c/Kconfig                     |  11 +
 drivers/media/i2c/Makefile                    |   1 +
 drivers/media/i2c/ov2740.c                    |  65 +++-
 drivers/media/i2c/ov8858.c                    | 172 +++++++---
 drivers/media/i2c/wv517s.c                    | 320 ++++++++++++++++++
 drivers/media/pci/intel/ipu-bridge.c          |   9 +
 drivers/media/v4l2-core/v4l2-device.c         |  26 +-
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 103 +++---
 .../staging/media/atomisp/pci/atomisp_cmd.h   |   6 +-
 .../staging/media/atomisp/pci/atomisp_csi2.c  |  24 +-
 .../media/atomisp/pci/atomisp_csi2_bridge.c   |  36 +-
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 117 +++++--
 .../media/atomisp/pci/atomisp_subdev.c        |   4 +-
 .../media/atomisp/pci/atomisp_subdev.h        |   3 +-
 include/media/v4l2-device.h                   |   3 +
 16 files changed, 748 insertions(+), 153 deletions(-)
 create mode 100644 drivers/media/i2c/wv517s.c


base-commit: ccf78740d63813c452c035b57d17a650492562fa
prerequisite-patch-id: def08de8e36aa31f6d2360428b29f6b0f4c8e1c8
-- 
2.53.0

