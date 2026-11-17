Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794945905;
	b=nxhmBqOECWtF52wPyGJrqshmv1CgbcON79G7BudHBOHuYFHkZZnWinlmg8xTuB9bo2Xy
	 npOPG0JjwHDxc/BgMSindCRvjs1hcRk7VnMrVg8v7FfWRCQrYtRxKMFSLB8mzDs9LmaUL
	 90kZs4xfAde4pugDyJ9HBFwyd5Jp6Fg0jyyg3glDmU1NhuGpSvyXS2EA7Gi96zIv9CxmZ
	 r5heR/fddNX6VBRdJaJeEt+o1q1Q6q8th7Mdx+fP46oGaV0PhwYxT2zLPwjQ1zQ0WCE5H
	 fGo+VG+s32Mx5R3tSPecn3ePtN7859drUXpmAYeEuq+UbdUzOBN5ORgQIhjcsZzVmKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794945905;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rbt3Rhy1XEaIZQdvDh/UUWSNfD774dI3KIhZaPLXG14=;
	b=GCbUGqNANXnFPI920cZF1y+p617WqYGt6xbHka8xkWH/q0TThmqVxylw3IXGR7cWR6SH
	 O83khOSpguEi6XcbP9CCyUnmSloq31OycoDKnuYNWBj57i/Gb0NYEDfHrzZocpr7tSQKJ
	 yGy1+AXf5hY8Xg4/yqOj/C6cTNJHhMaUAI2m+1Ki1/y+/V9JFjyWMkEfgRoDzK0IeOaYK
	 lqwwE77KitXwN2VQUyVd1L28o5rCJIUmyDD+X3cpyr2GTh4ZTT6EaUWE6MNfGepA3Fggn
	 ILZ2x6MTPjLHUeVMvQUolw0E+QvZ9HTCGlz96icbmoUxd9hteZgojI4ubuM6Ovm8vKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Rl3RG/9/";
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFAB1606A8B0
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:05:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFAB1606A8B0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rl3RG/9/
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4a5024b3c28so507748f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794945902; x=1795550702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rbt3Rhy1XEaIZQdvDh/UUWSNfD774dI3KIhZaPLXG14=;
        b=Rl3RG/9/xZYVC0CxWmQNFvRhK2NwjXwdPqGVzkDVM0hVx4uVtIf5s+llV6tvNAe5sL
         j8sg1nBHfVJzwU3v7Iwkm35zWbvB+T0tWqMYr2HCVCV+MdEsTqArWfYtNK013VpVBtBw
         XB10U3MY58xqgocAUcU7JPFon23tpiyycY1uJjcp51uNugRdWgLxDKkVCYMwBCBXcTZ0
         MZcyqBKLsCj394UHMGmbX9LeIWI+tlSD65ls1aIOpa0wEmirfHKlDDJWrv5wEbNU/VvS
         Qbb2KAVJJLoavkN5TLKhapxwJPG9zZeQ8N9cAsic2igbnbSOM2SYO7ERc2hYjlNRqQyx
         DVAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794945902; x=1795550702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rbt3Rhy1XEaIZQdvDh/UUWSNfD774dI3KIhZaPLXG14=;
        b=aOIl+sbv5GfZ64VjUC7af5pe0TtCL3Pi2KXAApp4Yl7s7WioGRXRY/2gishn/ADk7U
         sH+Nd0ZH1Lw98D6No9TklCq7XbPJp9B3kVSXh/NfaHtwEQjfxec37vTnogkgdsE4jbgJ
         AxwngLU2jQbPvmnQCgUfPGCiKGVOnzGUi00DNXWB6u/VSOw6J132d13poS5J/aM3DDFO
         n2qciv3keImN7+9ENPyjLhxXdzrrpUO1BQClVRww25YBMf9h5EdfO/5DVoFf/Eb5pURu
         kiP+y1aHvr31mdlKV8cVlsjyRRU5+wqEiAj+Vab15hwtQg9acPzYRUKR96j9eyZ14aM5
         84ug==
X-Forwarded-Encrypted: i=1; AL+hErGSGSAJQdwzJYyTIcSzgmVoXYwml4f34BcqZ/BnYJBYJSqUYmwVl1ayANflOWNmEp7XMGsNELDDn/opClE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YYT1ln4kbSW9oIGYMROc567EMeUb2RcA5d2ynnOhSHXUY0cN/
	SaE28ExHsZsSzXW/sPP2kDusnXvy4ie/C2RvWMbrec+1UdJdBEtROcFV
X-Gm-Gg: AZFdTZfimtZrY2GKmvII/t4WtmR2KdhOfuE2cHkdEJb0BzIqF2S3xHynepy5Tb+VKis
	SrteO08EvFGrQqsBGwwPw2K5+dMXfemKtUpXV9+BMzV6Aj2yrjJBXCzvn/iHvMOA4w+1c6nxvbU
	kp3EgO3BUIH1bDxlLGo5y44Ft+cP1Pgm0WUmF6rGG5LP4s6RkpeglhU0bre6mYEfKvwYkxwhT3p
	XAuu4IdgQob998SCd1pJDN2HfIkSLfpkrbgbMw7DU7A8DnaNm+O109OamwN+wymIa5HrRZjQk3L
	lFHbmpJXNerlTqPYorWis8uT45j1YnYThn9OpebB8scB9R9eKEnXDZV5SwQstg1h6ISndcGa55+
	JufbOjaJRYZxRHGNo5615gfLrFjAHln3/K44lAYhoRok0n3hC2EaHPFPwUPK2pVuXrBpEIpVGPB
	0Ah31PgVQOn3xcqTEVpzcw9QJ6oGJO98kNKbppXWqmdqHXOtKjlaTMHOxpjKCDBGsagv1IBNhcA
	FhESKQzJYtNL5Mj+LNiBAV0jWVLDIUzmla2WJwbH9uKBFQF3UqvOnNnaHDr8dsXuAe05/kmedVp
	JSVFmqEsqAkOKufcsQS3jBdQsMco
X-Received: by 2002:adf:e18a:0:b0:491:d721:548f with SMTP id ffacd0b85a97d-4a3735b4463mr8160153f8f.12.1794945901961;
        Tue, 17 Nov 2026 12:05:01 -0800 (PST)
Received: from m2.. ([37.142.154.208])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4a64b60940csm625528f8f.0.2026.11.17.12.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 12:05:01 -0800 (PST)
From: Michael Zaidman <michael.zaidman@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Raman Varabets <kernel-linux-20260610-80b7ab08@raman.v1.sg>,
	Germain Hebert <germain.hebert@ca.abb.com>,
	Christina Quast <contact@christina-quast.de>,
	Rio Liu <rio@r26.me>,
	Bruno Giacomazzi <brunoceg1@gmail.com>,
	linux-input@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Zaidman <michael.zaidman@gmail.com>,
	Maarten Brock <Maarten.Brock@sttls.nl>
Subject: [PATCH v4 00/16] HID: ft260: add UART and GPIO support, plus I2C fixes
Date: Tue, 17 Nov 2026 22:04:06 +0200
Message-ID: <20261117200423.19561-1-michael.zaidman@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Mainline supports only the FT260's I2C bridge. This series adds the
UART/TTY interface and GPIO on top of it, and carries the I2C fixes
made alongside them [1].

Patch 1 is Christina Quast's v4 serial driver, ported to the current
I2C code. Patch 2 holds the fixes it needed on hardware and the fixes
for the review findings in the patch 1 code. As agreed with Jiri, the
series keeps the order in which the code was developed, and each patch
keeps its own author. So the UART work is split: patches 7 and 8 add
flow control and the modem pins after the GPIO and I2C patches.

The v1, v2 and v3 threads:
https://lore.kernel.org/linux-input/20260822213941.98882-1-michael.zaidman@gmail.com/T/#t
https://lore.kernel.org/linux-input/20261030223637.86907-1-michael.zaidman@gmail.com/T/#t
https://lore.kernel.org/linux-input/20261114230800.1344401-1-michael.zaidman@gmail.com/T/#t

Changes in v4:

All 5 issues Sashiko reported on v3 are fixed, and patch 8 changes
after Maarten Brock's question on it. The v4 note of each patch lists
its changes, with the same words as below. Patches 7, 9, 11 and 15
change only in the context lines that patches 2 and 8 changed. The
other patches are unchanged from v3.

Patch 2:
Fixes for the issues reported by Sashiko:
- Port marked as removed at unplug; port get, activate and the speed
  change refuse it, so an open that races with the unplug does not
  use the freed HID device.
- Port taken off the list only in ->destruct, so a new device does
  not get the index of a tty that is still open.
- FIFO reset after a failed output report, and .flush_buffer added,
  so tcdrain() and TCSETSW do not wait for data that is never sent.
- Probe fails with -ENOSPC when all tty indexes are in use, in place
  of a WARN_ON in tty_port_link_device().

Patch 3:
ft260_uart_change_speed() does not take port->lock here any more,
because patch 2 takes it for the whole function since v4.

Patch 8:
TIOCMGET does not fail while modem pins are in UART function. It
reports such a line as serial_core.h asks, and RTS or DTR under flow
control as active (Maarten Brock).

TIOCMSET ignores the line that flow control owns and sets the other
one, in place of -EINVAL.

The removed flag is now added and set by patch 2, in
ft260_uart_port_remove() before the hangup. This patch only checks it.

Patch 16:
The scoped_guard() list follows the patch 2 changes of v4:
ft260_uart_port_get() and ft260_uart_port_destroy() added,
ft260_remove() removed.

Fix for the issue reported by Sashiko:
- The i2c_exit and smbus_exit labels removed, so goto and guard are
  not mixed in one function.

Testing:

The kernel is built from hid/for-next 720806515cb6 with KASAN,
PROVE_LOCKING and DEBUG_ATOMIC_SLEEP. The driver is built as a module
from the last patch.

The pytest suite [2] passed: 198 tests passed and 22 were skipped,
with no KASAN or lockdep report. 5 of the skipped tests need fault
injection; they passed with a test-only build of the driver that adds
it. Without the patch 2 FIFO fix, the two new UART TX error tests
fail: the data stays queued, and the unbind waits for the TCSETSW
caller.

For the TN_189 workaround, a HW setup that resets the FT260 chip by
its RESETN pin ran 7,781 cycles. 101 of them hit the endpoint STALL,
and each of these recovered with one USB reset (details in patch 11).

Every patch builds with W=1 without warnings. checkpatch --strict
reports no errors. It warns once, in patch 15, for a quoted kernel log
line.

[1] https://github.com/MichaelZaidman/hid-ft260
[2] https://github.com/MichaelZaidman/hid-ft260/tree/main/tests

Christina Quast (1):
  HID: ft260: add serial driver

Michael Zaidman (15):
  HID: ft260: uart: fix serial driver
  HID: ft260: add GPIO support
  HID: ft260: i2c: reduce driver module loading time
  HID: ft260: fix sysfs store failure notice for big numbers
  HID: ft260: i2c: reduce bus-error message severity
  HID: ft260: uart: enable flow control
  HID: ft260: uart: add modem pins control via ioctl
  HID: ft260: group sysfs attrs per HID interface
  HID: ft260: i2c: fix large write transaction failure
  HID: ft260: workaround for TN_189 errata endpoint STALL after
    enumeration
  HID: ft260: i2c: abort in-flight transfers with STOP before reset
  HID: ft260: i2c: reject an I2C clock outside the supported range
  HID: ft260: i2c: fix i2c_reset sysfs store return value
  HID: ft260: i2c: recover a bus held by a slave
  HID: ft260: use lock guards

 drivers/hid/Kconfig     |   10 +-
 drivers/hid/hid-ft260.c | 2667 ++++++++++++++++++++++++++++++++++-----
 2 files changed, 2390 insertions(+), 287 deletions(-)


base-commit: 720806515cb6921ab05caaa6f470f7054b56385e
-- 
2.43.0

