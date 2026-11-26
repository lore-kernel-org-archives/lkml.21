Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795716681;
	b=P25gmwhpwIOvIe8/E8D4fnxyukcPoStVtIa4wRFol71n+pmnOjsz2uYyt2WOp04EOMi+
	 wWg0Cmn2spawqoVzq8Zi1kNRZi29RZ4mp+637Lqn1yqDAfD4j4v5o5aZaN8/IH2fVGzQ+
	 PfBvt6FtPdl7FbBNoTjGMIXCLKn3NJ/cEMNIQR8XhPuhwKc3Me9KFNJDyuGZOTaj4EplV
	 PRcY4RqOK5fOrU7UnzlGmzwXGwaEBcfIlSyO5uGJZo7VtJxoElHJokccU+9Ix8JFBW5Uk
	 9N2Ow96XGTrCCwa+J9dyzAxOP8Nk4fx0/hVLUj9n5i8iQj/qaktUi3ajw3rWg2i4o0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795716681;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xFsTNbg6lSpPb9VHhNPoPU7xGJLiib7jmQ/aLuF0bIU=;
	b=Xbmi9GWlddLrSj8CdSPJZAfLE9X6WswDSO+eE63o++bu2XkBaxpWYO3mZHyoef5HqHR/
	 MZ5d0T8phHWxKHeNxJ98U/rjFDBZQ2ZZxgx0DRRLMkSOBmQEvVLHVJ5vZQVVi0GCGa34d
	 kEaCAGXGg+QsKy4J6VuyBVCMKhgRzHTR7WtN5tqOzy+GjDPwjrjZ5jHpycOBlWxqKNK24
	 HhA8bSMKqpR3Y0eH90Mp5czduRjdtTeTJJPyp8/mF1brgx3TqzhODMFLfruGujiYxSzci
	 TwqQyePngS70wIv2248bfNaRbNhGy70CpayGNzVgGNLZL/NnZaHBTraZiSk6cYuN1hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M31wEQGj;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCE9606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:11:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DCE9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M31wEQGj
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1b546061d58so16747855c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795716680; x=1796321480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xFsTNbg6lSpPb9VHhNPoPU7xGJLiib7jmQ/aLuF0bIU=;
        b=M31wEQGjQzIIi1au1R2VqEBea5umiPvscksV7YlTPJmHYhnjyZnjM6NSivboIrsacl
         OpMfBHAUKpO17BYKsTwK7jM1uyVYbiZhdI4dOvUcEyTJpWR8J+g9Ozt3KOWjvrTMUJom
         PSeW2cmXdb3dyYsddfvI7XXd7+jOCSVvRHBHYsflxVGKQA7L/NCxEV3koLe+OD0NLAmt
         X8MIFuhQ+dKDWiyLg4Lq/IkNssuh+16aw+2W9FpFU3YjyTaTyQdmmEeT4uE3mh+OzJSY
         k0kc4dgyCvpZ1Fqy/A27s3Juz+UmVrlZHCEhV9xnvTaRoLxI83L/IvlrdPHcD6cJq0t7
         Dl1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795716680; x=1796321480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xFsTNbg6lSpPb9VHhNPoPU7xGJLiib7jmQ/aLuF0bIU=;
        b=D3yjmbKp5Qv65esPDQ0Hm+wwGp6msqyJyX8HWrQjuBurl/pbc+CepaBsQdCAmOO/0X
         Zq5QqrEILsG/sJEs1BznDuph0fq3HyH5LuWWOLiOJoMmVHGfRXME7GMh+Zk5XkH/ZLS/
         QlIjmcUtFH27+Pe/cRaVV4M6+K8G9GW4vP8N0nFDtfMA+rX4boftn9ys9klAb4MTIjbX
         R+nzc+tBhsK5dpeKjSL1LTxs4MarGbmRXkDR71EQ19rFzBsjANq/A7v3TgcYWvy/vjDP
         jNerYMCwTwPppkCgCgdstEVPtL/5nK6rqIZMrgDFrtBYAMKz2ZowM3p8slsyYhmSm3sy
         Hv9A==
X-Forwarded-Encrypted: i=1; AL+hErEXOEF+8gvoAom35jXpkwYDtoECm1F8+SAnNfHaNPEJeEzmGxEaeMptZNCpYPnu+d3CwTKIassp6sCi/CM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FvXU2c1T7z2Lp2yc8LuhL/SYm5CIbRIwgULCYODfoOOy1slkZ
	vkL3S4RWQwE2EoQKkBgtrtBeJqbVkgdzUtC3CkZ5IWjVTFd3YXYAEFm5
X-Gm-Gg: AZFdTZceX6lW+4oaDukRXmDeOxQ/F/YBVERUGDL5NNjjoVek62Q9Hi1k/jg9f7gkhWc
	PtviLmbhWst6h3XEBI1vl36s8W2d4hjgO3pVNvvnUwMOebLvFFXZcvRpe13vHDSuOvNkyoECP2Q
	RLKHLzyrvVbVTI7HVS1dFTK9jYmkS0sBcP/mvVsMS6zgz7t98mTxw2CoGm6lRVegaLm2LEqfmiz
	pUkA0bhGO06hkY68KH9ir3M5w0K1qrgtYnEIi/5XhSrwlN31P1RzzyLm25vDoVb0fiPKsupehhG
	TgbTyGNmFdtBMZm0nRO74uFcn6Pz0dZL0KA9Np3gPID3WvNp1be8usOdKe9sR74VFcBTyL8Bwcd
	kgg9zNEg1eYd4IN643fBOxSYKGTF7GOMGM+IlcALA1uHZNnHlJIjMEuwAiVbk15Epp+dxAFVzoO
	gzt9MtYLA4XZgbWoV2qyuMQNBZt5jf5S4lkxYy7Eygi8DXdEc5KaTXJhymNf93wEpCi2hyv7pdo
	ygEwt78LeRXWpVfU1zZcI+Vmtjnw+WOTToANXGqFylo6LWGMBEIWbbDmpA4+Zh5Y4KOQcimfJ5v
	jW00rCrDmHMiD5iAcvG4aUbv9nis2EBiwxq8n2AgWJejKbXn4cxfeyX5Y7/XejNECe2SWn5ZwgW
	SVnPZORgyrdBy7jymmwTbRqw=
X-Received: by 2002:a05:7022:3b8e:b0:1b5:32d7:7d73 with SMTP id a92af1059eb24-1b5568f3283mr26472626c88.30.1795716680250;
        Thu, 26 Nov 2026 10:11:20 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55681301asm51183875c88.8.2026.11.26.10.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:11:19 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: daniel.lezcano@kernel.org,
	tglx@kernel.org
Cc: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	geert@linux-m68k.org,
	laurent@vivier.eu,
	marscheng@google.com,
	eleanor15x@gmail.com,
	jserv@ccns.ncku.edu.tw,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH v2 0/9] clocksource/drivers/timer-goldfish: Fix bugs and add DT support
Date: Thu, 26 Nov 2026 18:10:52 +0000
Message-ID: <20261126181101.3715754-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
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

The goldfish timer driver was previously only used and tested on
single core m68k virt, but the same device is also present on other
qemu virt machines such as riscv and or1k, where running on SMP exposes
several issues.

Fix the concurrency, oneshot, and registration bugs in the driver, add
device tree probing support so it can be used across these platforms,
and add a MAINTAINERS entry.

Tested on qemu m68k virt and on qemu riscv64 virt with 4 SMP cores. On
riscv64, testing was done by passing clocksource=goldfish_timer on the
kernel command line and locally bumping the clock_event_device rating
above the architected timer to verify both clocksource and oneshot
clockevent operation.
---
Changes in v2:
- Initialize timerdrv->ced.irq alongside cpumask so SMP tick
registration operates on the timer IRQ instead of IRQ 0.
- Set timerdrv->ced.rating to 100 as a base-level rating.
- Change the Kconfig dependency from !RTC_DRV_GOLDFISH to
RTC_DRV_GOLDFISH=n to also exclude the module case.
- Rebase onto latest master.

Link to v1: https://lore.kernel.org/r/20261105161702.3515900-1-visitorckw@gmail.com

Kuan-Wei Chiu (9):
  clocksource/drivers/timer-goldfish: Fix latch corruption with spinlock
  clocksource/drivers/timer-goldfish: Fix oneshot mode spurious
    interrupt
  clocksource/drivers/timer-goldfish: Fix resource leaks in init
  clocksource/drivers/timer-goldfish: Set CLOCK_SOURCE_IS_CONTINUOUS
    flag
  clocksource/drivers/timer-goldfish: Drop redundant max_idle_ns setting
  clocksource/drivers/timer-goldfish: Set clockevent cpumask and irq
  clocksource/drivers/timer-goldfish: Set clock_event_device rating
  clocksource/drivers/timer-goldfish: Add device tree probing support
  MAINTAINERS: Add entry for goldfish timer driver

 MAINTAINERS                          |   6 ++
 drivers/clocksource/Kconfig          |   5 +-
 drivers/clocksource/timer-goldfish.c | 115 +++++++++++++++++++++------
 3 files changed, 101 insertions(+), 25 deletions(-)

-- 
2.56.1.839.g22a8290db9-goog

