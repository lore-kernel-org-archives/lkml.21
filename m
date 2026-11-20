Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795184140;
	b=KF/A/2P90O4V7QirmwpJRuYpLJEyVarab3Te22jkvB/kVhu6dV43LlZo34L+q6ppeXmt
	 Uzlo643u1FCrpSbwdGpajinRSYN3r6lqXu4ZBEha57eDxkV39nxvgRikhvIWEXNNkpuf4
	 rktfSEVPCR1JKlmQSJnEM78e5M3lcfYEcOvPa2FoIu/EsoaXsXqgrPenTcjpOzKSeyKhE
	 CjYKdhBWyfsCHoUWOqOlZp46cgpI86IV5QcBTKk4fzb1LGbipM1LOt5HiM+wUhMCx15iY
	 RYHYmGPxxviotSuVW633ncGtJ2tnyPZvriGcTUE9icl8X+ixQb2Rm+qfYsHtYFIRIXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795184140;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4Vx4X2Fvkx/Dd8Nyf178SX35TtePddMWESDoKM0WmL0=;
	b=0e1SfIYZHlfihvAlZUqsWlxMGGzFR3a+J/hEF0s223npAaK9IVgaXjxKDVHwoxbLHCa6
	 irKSF+bOJ3fppJTpvJvieQM/xZrR39Q53FW76rd+nhOjkwLHf0vdQ+em05Il+LdzaoGbV
	 o5CxNVtiWQqVqS0MMI3mgjLxR2VLrYQeg5/vGjLL59GGJwciUs7E7hesZPG1jirkjaegt
	 0j1sy2UllyphoEGL8G1Afkun9xEhxtIn91zDF/6NS5/PrvtSfKi5yOYGtlaLhwRl74ifn
	 nOS0DjvJNaFyJqaJtnEULkLnzU8cN0mGGKHODUIi8zhe1hbigpwIhQbeMlBF27kKVVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LqAdtutt;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85B6606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:15:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D85B6606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LqAdtutt
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2eff92780daso6605965ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795184139; x=1795788939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4Vx4X2Fvkx/Dd8Nyf178SX35TtePddMWESDoKM0WmL0=;
        b=LqAdtutthrVfjfAG1Aw6JaW43x/MsBQNo6gU+adMY/X3UcE94J79IZ5Fjmh3Swe7LT
         PkgItpi3W4YHPdruYROz/d8Xub8rRoIC6pyEieoOwJjR/8+NKOqaPr2zm+LMCGJXXz2j
         b1nYe+Cguqq4PwAR3AwRTmhjFSnTFPmFqjO+35Q9VuWB7UdFWcHq7gzizg1/49a2qEqX
         H1roDDKsNPWlKCODGeLKF3R6EkYwRb9slkUyYRRVfgZKQq3nvdGTh6miifD1d7tEKaD2
         Uhif8THAMjtmECglZ8a4s751mJfQFsezOgeH7ahmp3Wh0L5b6XZ6BPKOGs1CqMCm+IOE
         IHjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795184139; x=1795788939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Vx4X2Fvkx/Dd8Nyf178SX35TtePddMWESDoKM0WmL0=;
        b=lkGTW1ay5unWRd/NIV9Non5l5HPg/177DV10vyRP6/v8E6D9N6F4bAUXtT4V+KDSt5
         VDi+p+Ep8FKj3E7lg5QcOkSVSXJG3joDnP85rQhLck4nr2rd1O2y+l+xd32h+xtmzbSX
         HpZDKzcy+q9GwylSQEVMz1r+uEdlEAPakzO+wpHzhjzWWGj0PaWipfCbxYAyp3m5Dcdg
         TwPO/eHOITrIDcmA1p27PjgwW7kUyTK9miylRuFTEr1MaRAz/nvvWHozKUiPw/8ZBZ3z
         5gboPCIoYafnpPuke3Y8wa4/ddXm5L5lVhW5Ma+CUPQmBwXYVZD7knhuO9wnxwj1hLB5
         IxAA==
X-Forwarded-Encrypted: i=1; AL+hErFv8QrYZXj0yp6Nm4diKDFMOkyzF34MOROXtJxR2QF1iAcaEkrqbjdpR2cUvoipaR6AeoBqf0cruVdoIdo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/M8c/KoYvPuGD7qDXY8MFDrERh5qgmPZw1qzBFcfd57r86NiN6
	wO2KwaHxQxJCZOPiO65qMvSQ+7lpI+M7e5Jw82UeAReOS5bSbZoQTxgF
X-Gm-Gg: AZFdTZdpYbEmRXekTyPK9QrbbqgHiIYaTmyidk1XtnVrj0U8sUw4TKQJwxTQ+lakE74
	apyXLTwUcStXT5jUepL0nuWWbTRKJ1vhOITs16QqVuzmFeVu4yqP2BAcHObS90DGiZlKXwI52Cp
	2OE7VxGhzBJ8vOwoX2AcpAwDqgV0WR2RCGByC4h5Ly1oFFrzpUY3mlhxJ7tCHkWPtcvRVork67b
	Hh/ePSxY7fUGr+djDupVYASb7yy8xvy/VQYqf/Ht0LldF77pMxlSiRWNpzmUWKRE3vLxzDT19Me
	nWUUpTHP8eCJk+1OZeFr78zdWV2tdxHEdAw+/0V/gkR3brIUD+8gK5/YLD1JqCtWNv7+slHEDm0
	qf8CIYpHmexNDztfq7fieJMaX8Zi9z923JalL2yndVfOXLWWlOirym2qhu02Ddg8NDO+uHQF7co
	Pi57NCzlQ4JRLJMwgGL0VHyqXq84nnMDReb3PqnivjLmhwG25L8QCqUvqBknj8kSpkYKwv+A4Rp
	Udm3uRwbsu5S0VcYvnpHqDHn2qus2h+j+kTQxU+zJrM8lYp8mrp9MyTRu30SCiUXPJXAHps/bD0
	jR/NoiLSE9Dq6gPcEr4EvwzDj0yCelRSccCVwPgZE6AXXa0=
X-Received: by 2002:a17:902:d60e:b0:2e9:7dda:bfc7 with SMTP id d9443c01a7336-2f03f27062fmr30969925ad.66.1795184139137;
        Fri, 20 Nov 2026 06:15:39 -0800 (PST)
Received: from localhost.localdomain ([115.73.20.187])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1f2csm14852005ad.22.2026.11.20.06.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 06:15:38 -0800 (PST)
From: Nhat Tran <nhat.tranminhk2@gmail.com>
To: Nishanth Menon <nm@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nhat Tran <nhat.tranminhk2@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] soc: ti: wkup_m3_ipc: Use the device's own state in remove()
Date: Fri, 20 Nov 2026 21:11:39 +0700
Message-Id: <20261120141139.55783-1-nhat.tranminhk2@gmail.com>
X-Mailer: git-send-email 2.25.1
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

wkup_m3_ipc_remove() tears down the driver through the global
m3_ipc_state pointer. That pointer is only set by the rproc boot thread
once rproc_boot() succeeds, while probe returns success regardless of
the boot result. If the wkup_m3 firmware cannot be loaded, for example
because the driver is built in and probes before the root filesystem
holding am335x-pm-firmware.elf is mounted, m3_ipc_state stays NULL and
unbinding the driver dereferences it.

On a BeagleBone Black (AM335x):

  wkup_m3_ipc 44e11324.wkup_m3_ipc: rproc_boot failed
  # cd /sys/bus/platform/drivers/wkup_m3_ipc
  # echo 44e11324.wkup_m3_ipc > unbind
  Unable to handle kernel NULL pointer dereference at virtual address 00000064 when read
  Internal error: Oops: 5 [#1] SMP ARM
  PC is at wkup_m3_ipc_remove+0xc/0x48
  LR is at device_release_driver_internal+0xbc/0x144
  Call trace:
   wkup_m3_ipc_remove from device_release_driver_internal+0xbc/0x144
   device_release_driver_internal from unbind_store+0x50/0x74
   unbind_store from kernfs_fop_write_iter+0x11c/0x1d4
   kernfs_fop_write_iter from vfs_write+0x2a8/0x3f8
   vfs_write from ksys_write+0x60/0xe0
   ksys_write from ret_fast_syscall+0x0/0x54

The same happens when the mailbox the driver depends on is unbound.

Store the per-device state as driver data in probe and use it in
remove(), so the debugfs entries, the mailbox channel and the rproc
reference taken in probe are released whether or not the M3 was
booted. rproc_shutdown() already returns -EINVAL for a remote processor
that is not running.

Tested on a BeagleBone Black with the firmware not loaded at probe
time: unbinding the driver directly or through the mailbox no longer
oopses, and repeated unbind/bind cycles rebind and boot the M3 again.

Fixes: cdd5de500b2c ("soc: ti: Add wkup_m3_ipc driver")
Cc: stable@vger.kernel.org
Signed-off-by: Nhat Tran <nhat.tranminhk2@gmail.com>
---
 drivers/soc/ti/wkup_m3_ipc.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/ti/wkup_m3_ipc.c b/drivers/soc/ti/wkup_m3_ipc.c
index eb6074a67ba3..224651955cda 100644
--- a/drivers/soc/ti/wkup_m3_ipc.c
+++ b/drivers/soc/ti/wkup_m3_ipc.c
@@ -695,6 +695,7 @@ static int wkup_m3_ipc_probe(struct platform_device *pdev)
 		goto err_put_rproc;
 	}
 
+	platform_set_drvdata(pdev, m3_ipc);
 	wkup_m3_ipc_dbg_init(m3_ipc);
 
 	return 0;
@@ -708,12 +709,14 @@ static int wkup_m3_ipc_probe(struct platform_device *pdev)
 
 static void wkup_m3_ipc_remove(struct platform_device *pdev)
 {
-	wkup_m3_ipc_dbg_destroy(m3_ipc_state);
+	struct wkup_m3_ipc *m3_ipc = platform_get_drvdata(pdev);
 
-	mbox_free_channel(m3_ipc_state->mbox);
+	wkup_m3_ipc_dbg_destroy(m3_ipc);
 
-	rproc_shutdown(m3_ipc_state->rproc);
-	rproc_put(m3_ipc_state->rproc);
+	mbox_free_channel(m3_ipc->mbox);
+
+	rproc_shutdown(m3_ipc->rproc);
+	rproc_put(m3_ipc->rproc);
 
 	m3_ipc_state = NULL;
 }
-- 
2.25.1

