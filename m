Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794954662;
	b=gHW6SK5SIekmCSzOVJmERcdXnNhDbBZ3naSz0trvpOjr5WYHuS66gHqR6IvYtEGyTTli
	 PSeGE05X4s670Nx8ROfFzREqUp5DQKDbV6srPEVi9E+hbq9mlRkUr9NSqnPPn/s8aU1Wj
	 2MamBOIydv+AkbxJXQtuiRbXj54XmlMZdyrtmG7LwzU0F3RtFpsD5oI50aDVGmXZ8LpKR
	 K02Fsv/Vifs75S9yCbARAlvsWdluq1wQ5xMNPOHO17HV2WFbFMAUxI8D8xWPNo2DvwFn1
	 5LNQ0qBJYSUcOG6QumO6XDcnIe2Ty49KPBOvPJSkwg+psrS3rg5kJSNTpAL3V6cNsZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794954662;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kn41xDmO6K3WsjRaDaey7uBoT48KF1e35QFJgiwKWm0=;
	b=xQBKb01mpvBA5pBKtQZ45xvdN6XcqJursJk3ZHy0lJwocDzaD25mmBrMFsqoI7EGbwyf
	 bLh6baNKN5ztH5qtAc9nKobf/7hMkUVrcJDHiaYDKI55UUqLc/ansrSQaD3ThyCiJZctC
	 DKs0aEjyHQ2jN44i/T25Kq10OSdHyQf9Ylfm0w/A8Dyle0R8z2mkpMhl01MiK/60zt1Qb
	 oeu567rsMsh8DGqPqogh8raYzvB53xiv/M1hoItv1KtHIMj7/TElV4qmaS9XumfK58HSL
	 0SJmtNlYwJL6qQzjZtrMTw9XrsNUlhvN8+8IetPjRhrmKHryzI7+aT6N75Ums6Rd02g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="GiJSTIQ/";
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5DD5606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:31:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5DD5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GiJSTIQ/
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb61185057so3069115e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794954660; x=1795559460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kn41xDmO6K3WsjRaDaey7uBoT48KF1e35QFJgiwKWm0=;
        b=GiJSTIQ/sNteBNs+3VlIyj/NfPGpq4S5n0IbqyE2sU4nKfITtpsT/DgbXvBYkMoqpw
         oC2wNeLrFEjBVqJeKrqC1doc5e5AtMkUm0JB0vBikrE81j42KSsYB4HpTvg+cpEARH14
         XCkxQMYDXnB60W1DHpGPKjIN1jN4YZjVMQAaSytJBHSwxZD+4RKhqf57KginvQzMpTvf
         HgK3cPAbqCvIfoAxbcWDXYXxNW7kbJpkeGwFTb9VFCn2Z33LzxFP8Bc1znIcGitm16Af
         FP08xwsRMRrddLQ/rEejNyw5IpjpCn04qEWy69xFXe4ZToiKCpYMiy8ZMLsX6EwhhJwI
         RkTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794954660; x=1795559460;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kn41xDmO6K3WsjRaDaey7uBoT48KF1e35QFJgiwKWm0=;
        b=EOPLkvfyQLN+W8IxX1BhS3cMlABJE8f1Emy5a93vDgSHc3o0VhGjpvBNAvW9kr56fN
         J3Y/DrMlepa1O90j0onvE2Xq9bMX+JQfVjQAPkK4TSn/sYa1ENYYKvWIlev6VKn7pBiP
         8YH54dB6kSwH3il9Y/HVhKachp9XIsW7WIjGjX2mFvr1WoP3ntmk3SzfCsi1J3tx9aU7
         OMybs1HuLEYsTCJjNzsL/f3qkLUgsN2KAA03NpZwkPVu/YXQ210YlweCENt6xBierxdK
         E328JNUUaXF9bIVDw9AiFLyF++5eMyAPiJr18tBj9/qGjSZrYtaPt/V6qCton1xatz/X
         hLDA==
X-Forwarded-Encrypted: i=1; AL+hErHJRATaPPmnr4eka+2AeEHL5jlSHGXkgOsjnmGiTbqN2huuNvq9VmEmwjIElbPoB7EN+cvLoykrH8X/Sk0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sYMJWQf0v2nlXOxs0nIHrFgJI920WTSgqShNXV0h4mC6C9fqZ
	Ex4S+GS+nzqc/AKJvApaF8/xdxTmZpIFygIQ6C8RNat3wJQoYp/58ymm
X-Gm-Gg: AZFdTZdgp41GnLcnByCguuPi1mS6/c/4nR9azWDFH3yY31cnYl3FvEtlEySuLJv411S
	cP1mPyPec4oXZ7EW2hWrrIzA+Cc9mMth7Tux/lnGsKX0rSI4vWeBrhtx5SBt4aFuqpltNwH3oqx
	qQUOjWLLXbwxGabTLrXTRf3juV7CkYjYgIpfR/KOmG65itHVJJFnviFmjM592YwxO1WrfPKYB7R
	CmFYmekmQRjAXtLrPR8YrUdtJ6S802NpcUeJiNsuD3kIrjwnhiB7EwHCiwFvn/sQcJwL8aXwGLr
	4NIdjRDLJwEPQ7YHgTwA7hDWW/qSTGmGDtnzf8Bpux2Xol37ArmJLCgQRqyGm8Lj1q2v8GwQ42s
	Dm/HAPFofuIzrVPaJmFOKwdPShTAZaF0OlN14BHlShhFbl9c3mgAUMUqf5mQwQ2GDnNraevDU5H
	qKhX7FbPZW+A8ZT1ZYu/pEc2DbCi8uudDJOK3gmNgSpSSeegtiphU8RpzzEenRRuhWC0RJwj8c9
	2NK0iEPReZnhsYK6oIYLdpGkXB0nHQMsexGPJ+gB/vIupFr4B/X+9bXHXUPNTP+HU87sBrP6fjY
	xXNOqfzOqJbft7ZhzK+/GtBK4q+xnMToTksdeeJB2a2CESjJhIV1T0ClvX4PJ3U9jU/npKqHMtq
	VpwlkyA==
X-Received: by 2002:a05:6000:4284:b0:4a5:33ad:871a with SMTP id ffacd0b85a97d-4a62d6d5650mr2165035f8f.0.1794954660052;
        Tue, 17 Nov 2026 14:31:00 -0800 (PST)
Received: from gandalf.magpie-herring.ts.net ([87.74.56.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656c11643sm1133464f8f.49.2026.11.17.14.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 14:30:59 -0800 (PST)
From: Zak Brighton Knight <zakbrightonknight@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	linux-pm@vger.kernel.org,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Bradley Morgan <brads@mainlining.org>,
	Zak Brighton Knight <zakbrightonknight@gmail.com>
Subject: [PATCH v2] reboot: don't rely on the poweroff/reboot helper before init has started
Date: Tue, 17 Nov 2026 22:30:50 +0000
Message-ID: <20261117223050.1433943-1-zakbrightonknight@gmail.com>
X-Mailer: git-send-email 2.56.0
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

__hw_protection_trigger() asks userspace to power off through
orderly_poweroff(true). The kernel forces the power-off only if
running poweroff_cmd fails, and run_cmd() waits for the exec only.

Before init has started that exec can succeed and do nothing. Usermode
helpers work once the initramfs is unpacked, so a built-in driver that
triggers during device initcalls runs the initramfs /sbin/poweroff.
On a systemd initramfs that is systemctl, which exits 0 without doing
anything. The default CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0
arms no backup timer and only the first request is acted on. The
machine then runs without critical temperature protection until the
next boot.

A ThinkPad T520 booted while still hot hit this. Its ACPI zone read
101 C against a 100 C _CRT 0.29 s into boot and the machine ran on for
90 minutes.

Skip the helper until system_state reaches SYSTEM_RUNNING where the
caller can force the action itself. __orderly_poweroff(true) then
syncs and powers off and __orderly_reboot() syncs and restarts.
orderly_poweroff(false) has no fallback so it runs the helper as
before.

SYSTEM_RUNNING is set before do_sysctl_args() and before init is
exec'd. From there until init can handle the request the helper can
still do nothing. A non-zero CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS
covers that window.

Fixes: 10a0a8d4e3f6 ("Add common orderly_poweroff()")
Signed-off-by: Zak Brighton Knight <zakbrightonknight@gmail.com>
---
Changes in v2:
- Skip the helper only where the caller forces the action itself.
  orderly_poweroff(false) runs it as before (from the review Andrew
  forwarded).
- The check moved from run_cmd() into its two callers. New subject.
- Shorter comment (Bradley) and commit message.
- Say which window is left (same review). The kernel cannot tell when
  init is ready so I don't see how to close it here.
- Dropped the Reviewed-by tags from Bradley and Matti because the code
  changed. Please have another look.

v1: https://lore.kernel.org/all/20261107143129.875202-1-zakbrightonknight@gmail.com/

An AI coding assistant (Claude by Anthropic) helped find the cause,
build the reproducer and draft this patch.

Tested in QEMU only, not on the T520. An early trip now powers off or
restarts within a few milliseconds. A trip after init still runs
/sbin/poweroff. An early orderly_poweroff(false) from a test-only
initcall still runs the helper. I can send the reproducer.

Firmware that reports a bogus critical temperature only in early boot
will now power the machine off at boot.

 kernel/reboot.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/kernel/reboot.c b/kernel/reboot.c
index 9a84401adde5..546abe42964e 100644
--- a/kernel/reboot.c
+++ b/kernel/reboot.c
@@ -871,9 +871,14 @@ static int run_cmd(const char *cmd)
 
 static int __orderly_reboot(void)
 {
-	int ret;
+	int ret = -EBUSY;
 
-	ret = run_cmd(reboot_cmd);
+	/*
+	 * Before init has started the command can exec from the initramfs
+	 * and do nothing. Don't rely on it then.
+	 */
+	if (system_state >= SYSTEM_RUNNING)
+		ret = run_cmd(reboot_cmd);
 
 	if (ret) {
 		pr_warn("Failed to start orderly reboot: forcing the issue\n");
@@ -886,9 +891,11 @@ static int __orderly_reboot(void)
 
 static int __orderly_poweroff(bool force)
 {
-	int ret;
+	int ret = -EBUSY;
 
-	ret = run_cmd(poweroff_cmd);
+	/* As in __orderly_reboot(), but only if we can force the poweroff. */
+	if (!force || system_state >= SYSTEM_RUNNING)
+		ret = run_cmd(poweroff_cmd);
 
 	if (ret && force) {
 		pr_warn("Failed to start orderly shutdown: forcing the issue\n");

base-commit: 141b164bbe186423e295b139e40e8e2d11cf1341
-- 
2.56.0

