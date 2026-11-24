Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795562302;
	b=0xKqOmZpI5Ot6496CAZGOCxlGGgxuJZJ+Df3OVOLgr62INTaEmZGifO8jhWa4TyIAeLF
	 kUbLXZphcro3wySDU3ZN0ThTqWes7cShFvu3JvIqJSxqnIbN2rYwmRM1ExZr8IdVZp0tz
	 0xtfYpDNfer27Q9xhJqtq9dQAGTksm8ctg0MfWYhtruwoucjV2NPl0JTiNrRv3jYsrQNi
	 mgQQfxFKsI4++c8jDb6qJUNakEhcNwUCAGuyZr1BWAuZx1LvJbhoyi7wBW9ltqPKS3252
	 cZQOcHLLIKjIJ5H4Muq+pGbbxQSt/cl/nGZh/44qvuQY+l9fJSXcMvNjAyBXwOAbLjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795562302;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iWZIDWFZDrgdj+iFZJoNVu3+9PRbzvVq6QXzZKzwxgM=;
	b=3cJm5WoEnqPSAvrrmhql3wqSbWtwgZeL6lTxIbOzrOD06XFGOxSjUmnojcKxj+Q3Wr8t
	 ouj2hhbZCWbrdrAoKtTJVkgnuOV2IT9kD96YDpNrYGf4gq2s9z/4tURqcwKedjOYMZYoo
	 dq8SS55l+VoCTQ12qUj6jDNnkYLTfqioKwQPgn5SWPuIrbH4HIY/q0avsDH16+WKXT4cl
	 eT3tmMPwnSt7mzNWX2WQW/I5fnH0YX8O6iBSTogtiEB29FM0/GDFPjsiM36Q0+jXv9QlA
	 mjZbfMUDivy3HK27PM7NPkkYWS4Z0ZJcG4qZJ/K4wBJYnb+hcbWMoMTtPWEI38pk1JA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DOgQ3NpE;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47DC606A327
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:18:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D47DC606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DOgQ3NpE
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb9d8e8e90so22891745e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795562300; x=1796167100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iWZIDWFZDrgdj+iFZJoNVu3+9PRbzvVq6QXzZKzwxgM=;
        b=DOgQ3NpEzCbCZHBNopzI9L4pY6W1mIKYTtDbgTvdg+TVgzmSA9nd4ObNa3ZiqOV9SJ
         6w1rHmZRwxLzH+KM41443RQQ2wSunBU0GbTxCcvaj7+SgGbiMwtRSj+ZRkZkDuq8JcdJ
         uMH5ojswndafo4c6Y9JAaCF0q5L1HSNw5GDUAyznzzLTEmVuARW/wPPdvYqxcTTXt3uw
         nF8OrGFmBosbYbD6VyeRcoExSMFBlh8aY9U9Zh56iucC8OizvRPtcDe5FKje0zDZZI2h
         6XstjlFN4cycHu1LVRs8S4issiFBHhup+vqmXxkpcbAPZVtvrq20b3vfweZjMEVCmbfB
         U2aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795562300; x=1796167100;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iWZIDWFZDrgdj+iFZJoNVu3+9PRbzvVq6QXzZKzwxgM=;
        b=OoIgQzzkfWhRoaTt8ZccnmjXtl6DrFlCVaCGoNZtKI42CndDUcsblVp9O6VHycGPG6
         e9Tw5lC+jvT50SUMjnt7+NyJCDelLst/WAwHziOixCs2aN+pt62W34DNDk2TazBTgdNS
         sk8MflY794t6vqj63wgPrDrQM9icPie8JhSYf66lb9ivpGbxdYM1Abm9B0xeFgFhNGcM
         Otz2/L+h/8K7s0TKtk8DbtDSwoPjI9/62x9fS8Xa2oddVjUugaWStq4e1lECKaKBG0r7
         RO23mog1YZuuKo5ZYYOAYsLn0ifNO5tm1EHmiM5dNgYrCplcRP6AcrdsEabw5nptA8j6
         OrpQ==
X-Forwarded-Encrypted: i=1; AL+hErGzMIgpv5yC/8dUE4HZ1XuesLZYL7W3P+5goIAMw7TbVnWwdjXijgvfh+eiHuGTRBT8VSrt7HduPlbDWEk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CybdgsZ5kyyO37nda44lc5ZpL/MLbtzC+ZoGkWG4jrv/RU/RR
	9oE+W+oUiad62xrgvgBVNAov3YdDS1V9eOQzf1CoNIju/fXDC5B2nzLB
X-Gm-Gg: AZFdTZdw/E2pq0GIHiVfLBtOg2gm7t0TEwIOTGMiN2682B+nYch6f1JdjnUXK5GjO3T
	dLJV1nGS/iE3vU6ZEo4lxbBdlz4NtEX0mqoTABKLrFyLL7p3kplhduFsIgZXE33rUfgdnuQVbIb
	/ZKyEpMZMD0fAMP8BA057MGi+nBFecjbSs+kDjTF/xE70I8iih/fPAvs3/SxrZVYxxdWbFZaHcU
	Nmvz7cn0vL4gmO1FxjiV13GMePAVVGOOp3gQQ1aghCYxsCM2Nz1e9a/qhiHZj5JYxxJLL7XqLmh
	e5bp8EbMpe5Sws5pqJSgFiuqFkYhIkEFuGaVLc2LmDf/RRt5XzVHhVZvtNDxhbxJZHyopK5SC1i
	J1ZlKz7c9TqvdOkRFsCe1L4rQIp/Dw3V8hNf2xLjJHWydKxfBwtX4azDCEIori+vS4wyTyvLLWV
	1W5zuL2SLL3UQLm3CouDgA/PM2m7qdUTaKfRBmGqCi9WbbA0w1lZFZxio3a4AfimiXzWtoulSF1
	qqibzSauwQJgaW8pwn3CzmBLIlvuH7H2rflBCHBG4fKK8+Uhb2cmd5J1kSks32AVZMdlM0+B5fp
	hFODPANyADvAuH26hO/eh0UZ1E/bTZhpzb9CdA+3+aP7CHWt8sNlZ22ehpQE0tS6RudLWH+V
X-Received: by 2002:a05:600c:4755:b0:4bb:7033:de79 with SMTP id 5b1f17b1804b1-4bb8881dd02mr336047105e9.35.1795562300065;
        Tue, 24 Nov 2026 15:18:20 -0800 (PST)
Received: from localhost-live.home.vlan10 (053d9243.dynamic.tele-ag.de. [5.61.146.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm554400825e9.11.2026.11.24.15.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 15:18:19 -0800 (PST)
From: Joshua Covington <joshuacov@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <masneyb@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	linux-clk@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joshua Covington <joshuacov@gmail.com>
Subject: [PATCH v3 0/3] clk: allow a clk_hw to be registered again after unregistering it
Date: Tue, 24 Nov 2026 23:17:48 +0000
Message-ID: <20261124231751.83938-1-joshuacov@gmail.com>
X-Mailer: git-send-email 2.56.1
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

Drivers with statically allocated clk_hw structures cannot register
their clocks again once they have been unregistered, e.g. when the
device is unbound and bound again. __clk_register() sets hw->init to
NULL, so the second registration has no init data and oopses, and
clk_unregister() leaves hw->core and hw->clk pointing to the clk_core
and clk it releases. On the Raspberry Pi 5 / CM5 this is hit by
unbinding and binding the RP1 southbridge, whose clk-rp1 driver uses
static descriptors.

v2 worked around this in clk-rp1 alone. Following Brian's review, v3
fixes it in the clk core instead, so that the other drivers with
static clk_hw structures benefit as well:

1/3 keeps the init pointer in the clk_core and puts it back into the
    clk_hw when the registration fails and when the clock is
    unregistered, and clears hw->core and hw->clk on unregistration.
    Init data on the stack of the registering function is not handed
    back. This is decided at registration, as object_is_on_stack()
    only looks at the stack of the current task.
2/3 adds KUnit tests for this.
3/3 resets the cached rates of the clk-rp1 descriptors on probe, which
    is the part of the v2 fix that is still needed in the driver.

Testing:
- CM5 hardware (arm64), 6.18.64 backport: the new KUnit tests pass, and
  repeated RP1 unbind/bind with all RP1 drivers loaded runs without an
  oops.
- x86_64 QEMU with KASAN: the clk KUnit suites pass (138 tests,
  134 passed, 4 skipped as before), no KASAN reports. Without 1/3 all
  four new tests fail and KASAN reports a slab-use-after-free in
  __clk_register(). With init data on the stack handed back on
  unregistration, the stack test fails.
- arm64 defconfig with CLK_KUNIT_TEST, MISC_RP1 and COMMON_CLK_RP1,
  W=1, GCC and clang: no new warnings. checkpatch --strict and
  kernel-doc are clean.

Claude Opus 5.5 (Anthropic) was used to help write the tests, the
changelogs and the clk-rp1 change, and to run the testing above apart
from the CM5 runs. I have reviewed all of it and tested it on CM5
hardware.

Changes in v3:
- Fix this in the clk core (Brian Masney), with Brian as
  Co-developed-by
- Do not hand back init data that was on the stack
- Add KUnit tests
- Reduce the clk-rp1 change to resetting the cached rates
- Add Fixes: and Cc: stable tags

v2: https://lore.kernel.org/all/20261121181650.143474-1-joshuacov@gmail.com/
v1: https://lore.kernel.org/all/20261121163915.86681-1-joshuacov@gmail.com/

Joshua Covington (3):
  clk: allow a clk_hw to be registered again after unregistering it
  clk: tests: add tests for registering a clk_hw again
  clk: rp1: reset cached rates on probe

 drivers/clk/clk-rp1.c        |   6 ++
 drivers/clk/clk.c            |  23 +++++
 drivers/clk/clk_test.c       | 191 +++++++++++++++++++++++++++++++++++
 include/linux/clk-provider.h |   5 +-
 4 files changed, 224 insertions(+), 1 deletion(-)


base-commit: 8d7fe9885c62fc9a95bf55d9db244d9672a8aadc
-- 
2.56.0

