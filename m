Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794960420;
	b=oa+MNGVbHgzbDb3yDdG4sXo60l/Of8dP/yXA9iOwLiN6oO+p0GO5qiHpsV4NtGecUIsU
	 COBesY0LjmUbh9wXeDg4HVa4mvJuvlSSatqH30+RjigjDrlleolOx0fQtaic/5Ph6EcJF
	 4uiQiRKL3JCELdCT1/nIzfvRZXlKcYFwLPsefGu7itBZJQz+5cMqMm4kfd186K06QE/rr
	 RSouNlOxXHA6lhpjI9AjuRUmSpEz2TRlBfEd8sCq34SuZTCBoFopU/Fdd/Bw6/0o5hq8u
	 8rM2EjB3UNlGpNCyN4ROTtLM2c4Vp+4sK9wuRxAOykounVAodfu0WDSl0hyH964xjAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794960420;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=N/B1sjXPM6N0bv9HvSYi6EQTNoI4RCAMfAyFSx2pQDs=;
	b=STkBlIc0yaMC6nsZ3ZWMwKCUvEi1moQ+4Re0gFdIrr+l3kbCn6W4jKEXEHs9aKHIGIw1
	 pdXvDJpY6iXc3+Cio9Opce57pmHOy+SqJ2NNV8BmDFP16vhvhL3Bt0aK0oWDC8DDcJyEQ
	 oPQT8su+tk7t7g9eCY87LiYwbSPrT++t5l6jKrLhXQ6VVuo8NlYboldW8jQH1qAwIihRU
	 WOAQEeR62ONjAtFFIwox9b+hk600s8T0zML59rrYnLfwivKBYWxWb9sXS7vK+L9AsuXTu
	 Dan7wgsBD1zKa8MIwFOOUknzwAx38Qu+mhwCvRQTgibmLXUNSairgL4fsvzgPRJp4nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="K/+DGL0Q";
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B95606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:06:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5B95606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K/+DGL0Q
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso3852365e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794960418; x=1795565218; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=N/B1sjXPM6N0bv9HvSYi6EQTNoI4RCAMfAyFSx2pQDs=;
        b=K/+DGL0Qba3TT7jpZFmvmzggDrv5dKh1dmlASDsl0mz/EHL3sFMyk7TkN5oSuLvxi3
         vT3LwFgE4bPCcWgx+Hg+gsp5uTV8YmfMyUGdFJKfmR6sOMufy5BpliExVRf1ch3feJTZ
         /PUyrz4EFtxvZ4kVE1AK4L06Rx3issKxYRU3guk3Ol74p2Nh+okik4lRoJul4D3mPyXW
         Jcvizh56ONQmYWUF6no0tBV2e7K0HEF0cWGIfI9S7ozNHCGQQ+CHUzrV8isZ7J/eiPeT
         cR74ni7yrCpI5SDBRNUfjkONWzyat9/AvCK4ugrv4pZhtNQFByEVJwBwdeJHaAuDu869
         2kxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794960418; x=1795565218;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N/B1sjXPM6N0bv9HvSYi6EQTNoI4RCAMfAyFSx2pQDs=;
        b=IXBFc8WfwFC5sSiw98a4QxVf+ZX1OhQIqpajl4vlkI0YHKslf3ag5rfVwd4bID/T5i
         YfQiSXmnWRIbjpCGEPHmBFBdq/xJ1k7z4/oduLFtvXFf14Ys6pq0Yea0szJI+NQlsnDZ
         01gszxybwzwEUbcrf8GmN8BW40F2ixbO9iZeneSkFj/XfEpqhN7SCz6UfwS0NNC1LWFe
         ZQVMcLdfomkPXYaod2ayrl9XHAKqiQMHyMgtgcz2elfHhcnjk3dnmwUs4f4LowmS7YBQ
         UjuiuW7az1jViA91wRNqPfi3S7Oz+IPXOGSCWZjJBX1du59t91gBeSh+WF52VK3owYA9
         ancw==
X-Forwarded-Encrypted: i=1; AL+hErGL94lhspUf/Cqw3AM2Rk4iwl70napaUicsM6/DfAsorj8/QYs12cAzDp0nSfnt/wsU/YtcCMlzFTuVPYU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ILz+qGKFvNHyrSeVCbyQJyjo1+g8adKxI8sCZQwaop/CjCrIQ
	fu3OxeLno4nr7vLHvvS1wuycZAY4VEaYGJq+iTmQD4vMooaV6aGLfpsI
X-Gm-Gg: AYBFou1tmMyVpQXsL+157ZTcIa8FvrLk48EXxP3vrfWZbJCcZRRkgzLTMlYtHfnYqDp
	q0MpjLj/8t3ZhEwn/posPZi8tcJB8heIcZ3taStPzlX3zfLN4Z8oxh7AVF+3BlA0aeqlhG+oD0G
	bs8ICgZsNVR8VCXsZNfufQdQp8642ITZwIpRToCj9EalUYzkG7g4Ij5i8sTpN0qg12UoNysc9Sc
	J0kBXLwLmYL3+nGvdZWB4KEO+L6M17HuaIOKdHcQpVZjPGCOlchKnS3pscvHpuqRVQsRtAGfIYr
	b56Ko9R1O62ZTcKyeyxNuNLB58c8jtxja4VJ0LW1rBLf3Uit6+4wjV/LR5OeiAtwKiUm5+BaoE+
	QyjiEGZqJaqxRcVn6TxMbhHIAQ/vN/VPlXn1zmoF4DfQR1RAIhBXqYHeaeomoEZoD2/XrII5Sv9
	m8ElCa+GXcTpQNcerS7VFoZ468fxVxy/1bL3tRisZqcf8wvFkZNGSnORLWnpdpKRDuGdjh9D6Ct
	MWNBewDLea9BsocnwDHQR64nYqrHTYbr5SKHTsv0jGw0Knd0Ju3pnTGxs4LQcgMzmH7ZlKmDrEY
	g69iABpJSftDSe69X4ivm+BuFOxaUjWKSSksleckzvMApJpaUJ/JK3G1V4JaAt8ChWzUvoGxGKJ
	LnA==
X-Received: by 2002:a05:600c:a41:b0:4a4:3a2d:15da with SMTP id 5b1f17b1804b1-4bb7da1c81emr15978925e9.15.1794960418021;
        Tue, 17 Nov 2026 16:06:58 -0800 (PST)
Received: from fedora.fritz.box ([93.93.22.191])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7defa59csm7563865e9.3.2026.11.17.16.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 16:06:57 -0800 (PST)
From: Stefano Munari <stefanomunari.sm@gmail.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: nic_swsd@realtek.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v1] r8169: fix RTNL deadlock in runtime suspend
Date: Wed, 18 Nov 2026 01:06:31 +0100
Message-ID: <20261118000631.17771-1-stefanomunari.sm@gmail.com>
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
Content-Transfer-Encoding: 8bit

rtl8169_runtime_suspend() and the paths that resume the device under
RTNL wait for each other in opposite order:

 - The runtime suspend callback runs with the device in RPM_SUSPENDING
   and then calls rtnl_lock(): it owns the suspend in progress and waits
   for RTNL.

 - rtl8169_close() and the ethtool ioctl/netlink paths run with RTNL
   held and then call pm_runtime_get_sync(), which sleeps
   uninterruptibly in rpm_resume() until the device leaves
   RPM_SUSPENDING: they own RTNL and wait for the suspend to finish.

If the suspend starts after the other task has taken RTNL but before it
reaches pm_runtime_get_sync(), neither can make progress:

  ip link set down / ethtool              pm workqueue
  --------------------------              ------------
  rtnl_lock()
                                          rpm_suspend()
                                            status = RPM_SUSPENDING
                                            rtl8169_runtime_suspend()
  pm_runtime_get_sync()
    rpm_resume()
      wait for !RPM_SUSPENDING
                                              rtnl_lock()

RTNL is never released, so every later RTNL user blocks behind it.

The suspend is the delayed one scheduled by rtl8169_runtime_idle():
the interface is up w/out link and runtime PM is enabled
(power/control = auto).

Blocked tasks, "ip link set down":

  task:kworker/u66:4   state:D
  Workqueue: pm pm_runtime_work
   __mutex_lock
   rtl8169_runtime_suspend+0x1a/0x70 [r8169]
   pci_pm_runtime_suspend+0x78/0x230
   __rpm_callback+0x56/0x1e0
   rpm_callback+0x30/0x80
   rpm_suspend+0xe7/0x630
   pm_runtime_work+0x57/0xb0

  task:python3         state:D
   rpm_resume+0x1d0/0x750
   __pm_runtime_resume+0x43/0x60
   rtl8169_close+0x32/0x100 [r8169]
   __dev_close_many+0xaf/0x1b0
   __dev_change_flags+0xe2/0x1f0
   netif_change_flags+0x27/0x70
   do_setlink.isra.0+0x367/0xe70
   rtnl_newlink+0x4c6/0xab0

Use rtnl_trylock() and return -EBUSY if RTNL is contended. The PM core
then sets the device back to RPM_ACTIVE and wakes up the waiters in
rpm_resume(), without recording a runtime PM error. In the deadlock
scenario the RTNL holder is the task holding runtime PM reference, so
the suspend is rescheduled by rtl8169_runtime_idle() when it drops its
usage count. If RTNL is held by an unrelated task, the device stays
active until the next idle check (usage count drop or link down).

This issue was found using an AI code review agent.

Tested on RTL8168gu/8111gu (XID 509), net tree 7.4.0-rc2.
Setup: interface up, cable unplugged, power/control = auto.

It was reproduced with the unpatched driver by timing
"ip link set down" to the expiry of the 10s runtime suspend timer.
It was also reproduced deterministically with a debug-only msleep()
before rtnl_lock() in rtl8169_runtime_suspend() to widen the race window
and "ethtool -i" issued during the sleep.

With the patch the timed reproducer completed 100 attempts, hitting
the race window in 12 of them, without deadlock.
The deterministic msleep() variant no longer hangs.
Kernel selftests were not run.

Fixes: abe5fc42f9ce ("r8169: use RTNL to protect critical sections")
Signed-off-by: Stefano Munari <stefanomunari.sm@gmail.com>
---
Race window (RTNL held before rtl8169_close() reaches
pm_runtime_get_sync()) on the unpatched driver, measured with kprobes
over 200 x "ip link set down":

  idle:           median ~175 us, 95% below 250 us, max 3.1 ms
  moderate load:  median ~165 us, 95% below 2.1 ms, max 6.0 ms
---
 drivers/net/ethernet/realtek/r8169_main.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/realtek/r8169_main.c b/drivers/net/ethernet/realtek/r8169_main.c
index f151ab681393..c60d87015eb9 100644
--- a/drivers/net/ethernet/realtek/r8169_main.c
+++ b/drivers/net/ethernet/realtek/r8169_main.c
@@ -5975,7 +5975,14 @@ static int rtl8169_runtime_suspend(struct device *device)
 		return 0;
 	}
 
-	rtnl_lock();
+	/*
+	 * Do not block on RTNL.
+	 * Other callers holding RTNL may wait for suspend to complete
+	 * in pm_runtime_get_sync(), which would deadlock.
+	 */
+	if (!rtnl_trylock())
+		return -EBUSY;
+
 	__rtl8169_set_wol(tp, WAKE_PHY);
 	rtl8169_net_suspend(tp);
 	rtnl_unlock();
-- 
2.55.0

