Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=141.14.17.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795608251;
	b=DAcu15BmNv5PmqTgThnFKIwDjrzSNSQDnUilkIXRDpoT7oEoZ4SdtRK1F2/4J+zigaJ8
	 pe6un8xLqAFn53ctmznx3ciLBDsCNiuVgGJr8rYD/ajD2UFJ5dPKm2sRfSlRnpZI1aNGH
	 O4v1gu4B2y+JRRRVT1BnXAJWgD/BnHjqWPgMK7msoO16Ysdbn/czaxmMRytkGgOpoMpna
	 oQfOEYko94fsyUYAxoUJxpANOYIsBQXD7JkWtf/rheT6sPx0QgqzMirJHC4NhNUshDOmB
	 llTrLkVv+LlQgQT9qKsNxDkT4LVM1+LA4XiHOKVUQlXFJFR6psl6Bp6cmt/+atrhiiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795608251;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:DKIM-Signature;
	bh=cETKf/0FO8l8HZGDJ583CpbS2QtAxwqUO33do4dY9zM=;
	b=IkiUXydKa10usgPMe63euGjrE4U4Q39zaXIed4dbrtH0gS1p9QPcq2UYiV0xhjvN3+45
	 v5f5ROz+VcjmR8rB5jD6+TD7nqKcKv5qbUxRRwtyfa1CEb7J6pvCW1h64cpAnImKFf1a8
	 ngg1FU0/4lIawysRgEIPUPikRko2MadLD+Sxkr2cA5OBvG8ftLlA+v/KyR/zgGmTv7lpT
	 +AXqjwEK92AgNhYOReys+HAGOQw4fY/Ate936o+e3qxKIGJ9Zs087a6x70n5SInrl/ofJ
	 Nx/dpHovC+Q3e9Fqf8kd34PWU5+iAMNEkO71dAx1TnfjOu8ab3KFgSpvjwmLxR0nQLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=molgen.mpg.de;
	spf=pass smtp.mailfrom=molgen.mpg.de;
	dkim=pass header.d=molgen.mpg.de header.i=@molgen.mpg.de header.a=rsa-sha256 header.s=20260906 header.b="a/IEhfPc";
	arc=none smtp.remote-ip=141.14.17.11
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5B0606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:04:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A5B0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=molgen.mpg.de header.i=@molgen.mpg.de header.a=rsa-sha256 header.s=20260906 header.b=a/IEhfPc
Received: from abreu.harnackhaus-berlin.mpg.de (hh-wlan-01.rz-berlin.mpg.de [141.14.51.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id E44854C442F953;
	Wed, 25 Nov 2026 13:03:08 +0100 (CET)
From: Paul Menzel <pmenzel@molgen.mpg.de>
To: Alexander Usyskin <alexander.usyskin@intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wentong Wu <wentong.wu@intel.com>,
	Tomas Winkler <tomas.winkler@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mei: vsc: Probe synchronously to not stall all module loading
Date: Wed, 25 Nov 2026 13:02:56 +0100
Message-ID: <20261125120258.302758-1-pmenzel@molgen.mpg.de>
X-Mailer: git-send-email 2.55.0
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=molgen.mpg.de; s=20260906; 
	t=1795608189; 
	h=from:from:subject:date:message-id:mime-version:content-type:content-transfer-encoding; 
	bh=cETKf/0FO8l8HZGDJ583CpbS2QtAxwqUO33do4dY9zM=; 
	b=a/IEhfPc50zjMlNNbiJAGsEgvwR0T+4f12nTY2kzcaRHSJ/ATQhO01FVoXpDYrmhVG0hodCodvMR
	XIIokhTXdeFh8kqigaXsUxKkThHoEIVnTQSy6Q61VvtXW9+uWlo+d94AXZp5DhldnNk1fxv0VdqUVZ
	iW28fELe5fohbg+UDoFCeJL0Y2zexCI93MQ0rpOQG1Ox5kQUTx6JfY11gutBPfap4Sg3Sql9Vn3b8u
	z92pQmMsqLaxCRABmWqVjvPNw0228FxHkO8Era6IINNv5MyUxWhPfB+BXUJPUatyU0nYFh++7dLhol
	Hjjj4qedlL6667fIL59A/mfwcXcsp0Zg==

On a Dell XPS 9315 (Alder Lake, IVSC behind an LJCA USB-to-SPI
bridge, Debian’s 7.3.5 kernel), mei_vsc_probe() takes about 11 seconds,
because mei_start() boots the IVSC and downloads its firmware (about
1.7 MB) over SPI in 60 byte chunks:

    [    5.144743] intel_vsc intel_vsc: silicon stepping version is 0:2
    …
    [   16.541339] intel-ipu6 0000:00:05.0: Found supported sensor OVTI01A0:00

The driver asks for asynchronous probing, so the probe runs from
async_schedule(). But do_init_module() calls async_synchronize_full()
for every module not loaded with the async_probe parameter, so during
these 11 seconds every other module load blocks, too. Writing `w` to
/proc/sysrq-trigger two seconds after systemd started shows the probe,
and 14 udev workers, a mount and a modprobe waiting for it:

    task:kworker/u48:5   state:D stack:0     pid:93    tgid:93    ppid:2
     wait_for_completion_timeout+0x97/0x180
     ljca_send+0x1ac/0x1f0 [usb_ljca]
     ljca_transfer+0x36/0x40 [usb_ljca]
     ljca_spi_transfer_one+0x179/0x304 [spi_ljca]
     …
     vsc_tp_rom_xfer+0x160/0x170 [mei_vsc_hw]
     mei_reset+0xc2/0x4a0 [mei]
     mei_start+0x75/0x180 [mei]
     mei_vsc_probe+0x11d/0x180 [mei_vsc]
     …
     __driver_attach_async_helper+0x60/0xf0
     async_run_entry_fn+0x34/0x150
    task:(udev-worker)   state:D stack:0     pid:445   tgid:445   ppid:420
     async_synchronize_cookie_domain+0x114/0x160
     do_init_module+0x1c2/0x290
     init_module_from_file+0xc8/0x180
     idempotent_init_module+0x23e/0x360

So the vfat module for /boot/efi, dell-wmi, btusb, the sound drivers and
the other coldplug modules wait for the IVSC, and boot-efi.mount takes
12.5 seconds.

The modprobe of mei_vsc itself waits for the probe anyway, for the same
reason, so asynchronous probing gains nothing for the module, but costs
every module loaded in parallel. Drop PROBE_PREFER_ASYNCHRONOUS, so
that only the context binding the device waits for the firmware
download.

Debian’s config builds the IVSC drivers as modules. The probe then runs
from the modprobe of mei_vsc, or, if mei_vsc is loaded first, from the
modprobe of the driver registering the SPI controller (spi-ljca). With
everything built in, the probe now runs in the context registering the
LJCA device instead of an async worker.

On the Dell XPS 9315, from the start of the kernel:

                               async probe     sync probe
    7.3.5, only mei-vsc.ko rebuilt (one boot each):
      /boot/efi mounted          17.52 s         5.76 s
      graphical.target           21.89 s        11.37 s
    7.4.0-rc3, same config (two boots each):
      /boot/efi mounted       16.84/16.51 s    5.39/5.24 s
      graphical.target        21.16/20.75 s   10.85/11.30 s

With spi-ljca loaded last by hand, its modprobe takes 9 s, while
loading other modules in parallel takes as long as usual (dummy 0.02 s,
xfs 0.45 s). In all cases the IPU6 finds both sensors, and the
ov01a10 driver binds to them.

The firmware download itself is not faster, so the 10 second
deferred probe timeout can still expire for the IPU6, which waits for
the IVSC:

    pci 0000:00:05.0: deferred probe pending: intel-ipu6: IPU6 bridge init failed

An alternative would be to keep the probe short and run mei_start() from
a work item, so that also a built-in configuration does not block the
context that registers the device. Go for the one-line change, as the
asynchronous probe already blocks the modprobe of mei_vsc.

Fixes: 386a766c4169 ("mei: Add MEI hardware support for IVSC device")
Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
---

Notes:
    The analysis (sysrq-w dump, timings), the patch and this commit message
    were drafted with claude-opus-5-5 (Claude Code), asked to fix the errors
    and warnings in the boot log of this laptop, see
    Documentation/process/generated-content.rst. The tests are in the commit
    message; the IVSC was only tested with Debian’s modular configuration,
    not built in.
    
 drivers/misc/mei/platform-vsc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/misc/mei/platform-vsc.c b/drivers/misc/mei/platform-vsc.c
index ef6dcc0438620..030291e7cd744 100644
--- a/drivers/misc/mei/platform-vsc.c
+++ b/drivers/misc/mei/platform-vsc.c
@@ -447,7 +447,6 @@ static struct platform_driver mei_vsc_drv = {
 	.driver = {
 		.name = MEI_VSC_DRV_NAME,
 		.pm = &mei_vsc_pm_ops,
-		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
 module_platform_driver(mei_vsc_drv);
-- 
2.54.0

