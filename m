Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795315721;
	b=FfA3QA1I3pkbsv20rXawTVr1Kn7MxWTrD4zSyn0v3DUeCAgh5rzPMWvRsEKt6ZBoWwse
	 u6kvtKEXTfUekjY/oYUf5GrR0UFNfUtxNvQ2NfYsZhqTMOVbaDKVZ1M1nsY3XazQUXGlc
	 CWi3KA9DfXlNvrOjqxoXndKDvhhXTf3o15gwX9vw7JuPJRzifYOqm1706j6wq/BTVxIIn
	 7jfaRqN3f+wQJbYbXFRmemm35WyfHy6a50OnTqAtjO2O9rN95F324vcov5gCob30DpkEe
	 uRcIk6f3076mL/Xx7sNOs7+ZuEmajXOHBhiJPQquz+sEcSvW/0eUF14mvXp5VqTJMgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795315721;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=yOipYhHuZqMstdAIaVGJeVvfGnYpJyJlLJYOZzJsGs4=;
	b=VCdha7R0+Tlobj5uqeRPCf3hWGUH9y4fcTkStydzW+DcayBoauI6RsJn/gzgndz8vhm6
	 q01ClsVzJT2RkrvGVmK/2sttys25ngV5cjh811qXBJZnOw20jelXh/x7ZsbNVX+kv998j
	 ecL5sNfYZGTHEqTM2SQM+8HUEIiqegZDbPWECmj8TJVw7DNcE/IPmitiy7QxrYH/ZtGvl
	 rgQjTr38XjIql8MbdWwefIc51TBbY4gIm9Ov+WgQGuf4zShBBJVo5fYnDmSVv3MnJBWFB
	 SMy8bixQNZ5DlrxmItR1wLGg7DzproenYa6lDGRnOwMWiEpCVlle2rA2SQTjdCwXziQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QltfMwLf;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9FD606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 02:48:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E9FD606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QltfMwLf
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-15ea896ddc8so3563820c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 18:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795315720; x=1795920520; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yOipYhHuZqMstdAIaVGJeVvfGnYpJyJlLJYOZzJsGs4=;
        b=QltfMwLfZdn7tH/22ZU/RbfBA8TAAyW7z1jyl4LyH4pf2vMAu5V9gP3f7DcIms059V
         CQbJPdsyPp2j7LVbnaSZZ896K2TanBu/kmp8IWM43LuAldG/+vhWSRDpqc5PgX3/DqP8
         IrBE+v61BmyFPp8THD5kzjD7y28yVlcP4l94VMW9G/0wlrcKhLXCvEtEgVykIE1uoVTR
         +UhoppKwH58Q7f8xBIOisYJcAvdzSsViKIpug4T3r5BoWMkPIdMaEnrJOLgGkqLqwOtK
         XpTiz78ix+HHZ5ED8HficmPbmWVO+YD2X6/sl19xAg6v+vbRBc16kUHeSvt2/Ap4kgJW
         4o7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795315720; x=1795920520;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yOipYhHuZqMstdAIaVGJeVvfGnYpJyJlLJYOZzJsGs4=;
        b=f3jQv/JxJNu5AJZ6avTQ0NpWyWAis/oLn8N/uZCNh6RmzvrBExXJLo8nL+QSC/viYz
         y7Awph/AehegSWU8DjamBH1oBaaJLWlOSnyUyc3azfZNa0DNrd+Crmb/1bMumAvc/jF0
         hlS/f5QPhP9H1kngnsRAyKDppJjw4/uW83ITjKZn4Ou+443UyGXyjiu8iZgQLjTB6hYc
         3AU7m6b6c40kzmIGAhVl5hGW3bsp6Rw83/V8Lhfpscg9GaU1m85HirO6c33tT245qEkS
         hOxrnWOLA5mOd8513uaoGqXPS6DYlo3kwjw5TMBchLkJcno3yX3SS0z9mH6km01h2KzU
         +vCA==
X-Gm-Message-State: APuU4Z8KO1sxsCWhzDt6CEPtsbGvQsccKJifZeRVw1HgG6Cx0JXMhFiw
	z9wRpWpIIEyCWxAlvhuxitKPbxPuBQ4x6YzGKso9GL2g4QNsP/BEhKNT
X-Gm-Gg: AZFdTZfaTvy+aP9U4cywhHTivnqKUq1fnBtwyiSM27nvSNmXrZw8RXk/o4mOGEVH1GR
	4G41Zle0imOZ5ARVvMzOCtSu/hDyQiqZgjm9Zfl/ptIMxJiDrwYJsbPgvHfS2OmG1+rv2xsCjWN
	ndiVptYS3PghGd0aPtOZzP2KSHtksTdqv2ivRTqlg/THfa27eyt4o+qvADJFcCZPMC2tGsIiERU
	dF9MOU+hyX96H+9M/SQU6FMpIvAKflU+QBT0V35Pqo1j5g8X2juBmT2TIZcYYzflUgs5dNzohtV
	6iPfaVc79Fj/R3KV39C0pNR4j5dsf3nur2l3jQZUO2dYU7wtd1JtJ+PxtqeHKPULI8a8J/15WLF
	7YtXaODa2fUypW9wFz5o3k60UOtHbDiwIziOmXnnnq3b9wsJgr1O4QmNgjyVhNAQbOHUbEEC//5
	Ea7K7UFAKOJ6fDISIRj7GAT9lCRHsaPcpd3Smp8bGdUKzsKJfFPcdC6ZATur36Ft/TyHBtaBJWK
	XhRQn6Wo00ySA82aA4aFAHW5EcVMWZhA1/9+trwAyyVl5DMu5X3V0YjAeLMfGSlrMHkR+D1DHUr
	3dRKV2bhSHi5TU1qMIVfF/OD1kkggiJeuZjJf/le6nOakmyoDT2P7PhgD75PnVX1z1aBGA==
X-Received: by 2002:a05:693c:83ce:20b0:384:8726:fcdf with SMTP id 5a478bee46e88-3856f65b3damr8532637eec.12.1795315720043;
        Sat, 21 Nov 2026 18:48:40 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:8bd:8d0f:cb70:907c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm21722846eec.15.2026.11.21.18.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 18:48:39 -0800 (PST)
Date: Sat, 21 Nov 2026 18:48:36 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [git pull] Input updates for v7.4-rc3
Message-ID: <awJX_vVgR79DxVuw@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull from:

	git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v7.4-rc3

to receive updates for the input subsystem. You will get:

- A fix in input core to tear down force-feedback devices synchronously
  on unregistration, preventing use-after-free and faults in unloaded
  modules if userspace holds an event node open across driver unbind

- A fix for the da7280 haptic driver to stop advertising FF_GAIN
  capability without implementing gain control, preventing a NULL
  pointer dereference when userspace writes a gain event

- A fix for the goodix touchscreen driver hardening backup reference
  length validation against malformed device configurations to prevent
  invalid memory writes during probe and suspend

- A fix for the max77693-haptic driver to disable the chip bias if
  enabling the motor regulator fails when opening the device

- A fix for the cyapa touchpad driver to release its runtime PM
  reference on interrupted lock acquisition so autosuspend keeps working

- A fix for the Atari mouse driver and m68k IKBD glue to treat mouse
  movement deltas as signed bytes, restoring proper cursor movement
  with unsigned-char kernel builds

- An update to the trackpoint driver adding a new JYT_NDT variant ID
  found on Lenovo ThinkPad X14 Gen 1 laptops so the device is not
  misdetected as a generic PS/2 mouse

- Updates to the xpad driver adding support for Hori Real Arcade Pro 4,
  Hori Taiko Controller DX, Hyperkin Xenon, 8BitDo M30, and GameSir G7
  Pro controllers.

Changelog:
---------

Dmitry Torokhov (1):
      Input: destroy force-feedback device on input unregistration

Haowen Tu (1):
      Input: max77693-haptic - disable bias on failed open

Ivan Verbovoy (1):
      Input: da7280 - do not advertise FF_GAIN

Juan Parrado (2):
      Input: xpad - add support to Hori Real Arcade Pro 4
      Input: xpad.c - add support for Hyperkin Xenon, Hori Taiko Controller DX, and 8BitDo M30

Liu Chao (1):
      Input: goodix - reject a bak_ref length that cannot hold the checksum

Miro Kropacek (1):
      m68k: Fix atari mouse movement

Sergei Kuznetsov (1):
      Input: xpad - add GameSir G7 Pro support

Wentao Liang (1):
      Input: cyapa - fix runtime PM leak in cyapa_update_rt_suspend_scanrate()

Yuan Yao (1):
      Input: trackpoint - add new TP JYT_NDT device variant id 7

Diffstat:
--------

 arch/m68k/atari/atakeyb.c                   |  2 +-
 arch/m68k/include/asm/atarikb.h             |  4 +++-
 drivers/input/ff-core.c                     |  2 +-
 drivers/input/ff-memless.c                  | 23 -----------------------
 drivers/input/input.c                       |  5 ++---
 drivers/input/joystick/xpad.c               |  5 +++++
 drivers/input/misc/da7280.c                 |  1 -
 drivers/input/misc/max77693-haptic.c        |  1 +
 drivers/input/mouse/atarimouse.c            |  6 +++---
 drivers/input/mouse/cyapa.c                 |  4 +++-
 drivers/input/mouse/trackpoint.c            |  2 ++
 drivers/input/mouse/trackpoint.h            |  1 +
 drivers/input/touchscreen/goodix_fwupload.c |  4 +++-
 include/linux/input.h                       |  3 ---
 14 files changed, 25 insertions(+), 38 deletions(-)

Thanks.


-- 
Dmitry
