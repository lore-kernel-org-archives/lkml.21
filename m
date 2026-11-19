Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795048435;
	b=OM2htyfSQENwQs0njE9zqFZgbxxXMaOtP4jH4GjKBIjxR4l/ORD1Z/jKMjjPl5rALO/H
	 jOijBMoY0iYyeHBoyxQfcC4OFSEW6I2jr75QTsgA+Whp8Ns9xGvd490+uP+q+J/vImAFC
	 61z1rA2D7gBo5s2cIBce6ZXnI8LPEM1YFbLM0HYPEHubakPeSDPYXkw99gqOy4KOZIvPm
	 tmi+WUxm6hTKIlTGBXC3DCJv6DpSlpGf4Es0FnFxzTIiGOSUVNCHpcHRYLoXtsCSKsx32
	 W4xUiq1j9T2b/ivADSFUbBHP6+0iBHPLQzkfjZ557fFhijvOFYxK6HRkSeYovL3TMug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795048435;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Mf+Ix0VT3XOHjiXS9UfFNqsbEszPgfXax3HGp3S/DI4=;
	b=1+cSbcKpKn7nwOOlayu92eXDe1r427nxuTxNomKYdrHXsRwZuAPNthZK3wCfjOAvV0eu
	 MZA4R3TvesKMfd2UPwwOUH35HUclumgI7D00XeqmuZZvZpVnJsf4v0rvif3mlVAZsq/Va
	 cMy0QC9kR7Sjfm+xkPkI26jOtYczrx8KGDF5Ow8iCEnnKfV+DFc79pCxBEIXze3zjFP9J
	 nXB7+QtDXcOcvd5re4usFLh2T98D7/ol2ghsScK56PkSG/Zk6Ie3b2PLfXYyYGBaQQ0pm
	 iULpAG/qt/nPp9Ffkwq8t0a12hPPZ5VZCSpUNUnwgZDc3MD32HcHbkQEUsuA4jTqQ0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tk5Jh6Pu;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DDD606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:33:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84DDD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tk5Jh6Pu
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8b904d10882so718104b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795048435; x=1795653235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mf+Ix0VT3XOHjiXS9UfFNqsbEszPgfXax3HGp3S/DI4=;
        b=Tk5Jh6Pu6ato0ErmiuOsS2OlYR5mKEhOBP+WysRa6aXRoKx1e9EOnoAvndLM5Zpxh6
         u68vPOYYcIXRSm2VHb0Rk9/KRaYlW612hULKbmkJbFMldRiYVjmNGpaPgky0wBFrz/UT
         IHEP9dEAKsEWR9X+Zg9yA6ZNlmZ7C+QmDePHEZXFxzzNNJYZttbR6BTghhJf+jdXcioj
         ARaL3KZr3KIDXehEaj4XZkHkzRrEyLkR/cLubhbZ4JKA/wfbaSAPr+NzxE6Eaa/4xS42
         vEqXsq4zEXiUaakrsedZaDBgU1YeYMfzaM8oGSlQfZe8ZzgMy/xPmcvNS+dRxxASohn9
         9DMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795048435; x=1795653235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mf+Ix0VT3XOHjiXS9UfFNqsbEszPgfXax3HGp3S/DI4=;
        b=NP357PiYD8+ON/JmDZGlhXeSGULozroDIEMrR0E0A4z+yVXZvh774DnTiHh9Kq7Kmi
         Ai2whd0Y7N9KOiKmrnoOTIslBA0DPyS62EC8b2ILV2YEhfn78TaFkXGrPRCN5zs4FV4z
         d9FV/EkrZFOFFzZrErghnZ29z6F4/AWNX7rGLNvmKQNZxHRg18qfYOYVfc6Vn1ttm3BB
         UxVDQ+ukNcDs4Ke2m7FRlpgGGnCjGVCcrEWis+jBCv3I6BUK00+KGCSHMNuTzERZ7TCF
         tIZ9rCS8VE1QWe/XDZHjAunL/lsm98i2F1+L6pHN9UsqbQc77PkiJ+nll/VkihFF61T7
         mTHw==
X-Forwarded-Encrypted: i=1; AL+hErH5F3DoHeASd1B2lh8YRTJUVMlBorM8tNFRFYgYnQbCNQXSIjFSpnIVGzzNsGpcFaWGU3n8/sDHgV4JwU4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/EMxhsZ6jwhVGWNf/QGoZaqj739rjNxrqp+fKBY+M2kcoEmyqg
	PiFC8ut2/D/fi1YMH4Enf2x5fI6EJqn4OR8g3/dbtkt41UCYbiPMAt25
X-Gm-Gg: AYBFou2XFaXjsh+34gWOmSChm1As0NlSuSkMu9HsVN9QrV0qYgWzS79w4bgBzgog5ze
	RDWM7T8+F9q8pJN08kO1GP++gzgITzI2x/HCqI4jc0fTtdaEwDGUBcHdWO10ACmUEQeraaUEmjJ
	ntiMF3QWbmtxzpG81L9FBaW/zY1wSnImX2Uw1No11cdgR5gU44DgkLGWIy2LgWgkhsjfvldzXXf
	oBeeDun3p/eUvrPniIf4f763BZqMjG6XWHpsqFmwJr1UqrrV6MEEA+2ZDWg/k9aF5xpMaeZL2nj
	wW6/OusRiNTllND4i2xm7RVz7dXG+UFs5iI5go2SE8BO8vWxG5Ii2lHGfbnJZrhuLZ0FbMvaZw9
	s6rytXIr45zlx7LQhvm/7J/y9n+wh1rkFEtLnGKBIgnfQDVz/v2YQC3QTYgtrHi0/Z2OSkShoFe
	AFn1UpbT3LuF/L+4P058AvTrJ+EB69M2t2F8vCCvYkWX+S4YzfzmT4olvD+IyLDwXkdFap2RVjI
	ywQevxh2Hav0q5d5Ar3vukX+tVrF2PeEOwTaojj7nQQqgVDAKRvOkKzFwz2LpDD8cveqiKANOvb
	payrm4mvzfjZpsadGXpbCC+W
X-Received: by 2002:a05:6a00:1794:b0:89e:43ee:6549 with SMTP id d2e1a72fcca58-8c5d0f248eemr3651410b3a.5.1795048434969;
        Wed, 18 Nov 2026 16:33:54 -0800 (PST)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5c7f99f91sm1906491b3a.5.2026.11.18.16.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 16:33:54 -0800 (PST)
From: Cen Zhang <zzzccc427@gmail.com>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v5 2/4] Bluetooth: SMP: Serialize forced BR/EDR channel changes
Date: Thu, 19 Nov 2026 08:33:41 +0800
Message-Id: <pm-bluetooth-objects-candidate-0184-v12-e80229724d6ad14ca88c-2@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <pm-bluetooth-objects-candidate-0184-v12-e80229724d6ad14ca88c-0@gmail.com>
References: <pm-bluetooth-objects-candidate-0184-v12-e80229724d6ad14ca88c-0@gmail.com>
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

  Debugfs disable                    Power-off
  load smp_bredr_data
                                     clear the same slot
                                     release the channel
  release the saved channel again

Take hdev->lock around the debugfs writer to serialize slot changes with
power-off. When HCI_UP is clear, change only the force flag and let the
next power-on register the root. Otherwise enabling the flag can leave a
listening channel that an already-down close never removes. Skip
deletion when power-off already cleared the slot.

The following registration change uses the same mutex to serialize this
writer with power-on too. The preceding publication change protects
lookups from another controller with the same address.

Oops report as below:

    Oops: general protection fault, probably for non-canonical address
    0xdffffc0000000001: 0000 [#1] SMP KASAN NOPTI
    KASAN: null-ptr-deref in range [0x0000000000000008-0x000000000000000f]
    Workqueue: hci1 hci_rx_work
    RIP: 0010:l2cap_new_connection+0x16c/0x320
    Call Trace:
     <TASK>
     l2cap_connect_cfm+0x46c/0xe60
     hci_remote_ext_features_evt+0x67d/0xbd0
     hci_event_packet+0x894/0xc70
     hci_rx_work+0x367/0xf00
     process_one_work+0x908/0x19c0
     worker_thread+0x65c/0xe40
     kthread+0x34f/0x460
     ret_from_fork+0x659/0x940
     ret_from_fork_asm+0x1a/0x30
     </TASK>

KASAN report as below:

    ==================================================================
    BUG: KASAN: slab-use-after-free in smp_del_chan+0xd2/0xe0
    Read of size 8 at addr ffff888112a2e4a0 by task sh/493

    Call Trace:
     <TASK>
     dump_stack_lvl+0x93/0xd0
     print_report+0xce/0x630
     kasan_report+0xe0/0x110
     smp_del_chan+0xd2/0xe0
     smp_force_bredr+0xda/0x200
     force_bredr_smp_write+0xc9/0x130
     full_proxy_write+0x11f/0x180
     vfs_write+0x25a/0x1010
     ksys_write+0x111/0x200
     do_syscall_64+0x115/0x6a0
     entry_SYSCALL_64_after_hwframe+0x77/0x7f
     </TASK>

    Allocated by task 493:
     kasan_save_stack+0x33/0x60
     kasan_save_track+0x14/0x30
     __kasan_kmalloc+0xaa/0xb0
     __kmalloc_cache_noprof+0x251/0x610
     l2cap_chan_create+0x47/0x930
     smp_add_cid+0x309/0x4f0
     smp_force_bredr+0x17d/0x200
     force_bredr_smp_write+0xc9/0x130
     full_proxy_write+0x11f/0x180
     vfs_write+0x25a/0x1010
     ksys_write+0x111/0x200
     do_syscall_64+0x115/0x6a0
     entry_SYSCALL_64_after_hwframe+0x77/0x7f

    Freed by task 496:
     kasan_save_stack+0x33/0x60
     kasan_save_track+0x14/0x30
     kasan_save_free_info+0x3b/0x60
     __kasan_slab_free+0x5f/0x80
     kfree+0x307/0x580
     l2cap_chan_put+0x273/0x3a0
     smp_unregister+0x59/0xe0
     hci_dev_close_sync+0x4c9/0x1150
     hci_set_powered_sync+0x4a7/0x680
     set_powered_sync+0xaa/0x150
     hci_cmd_sync_work+0x1b3/0x450
     process_one_work+0x908/0x19c0
     worker_thread+0x65c/0xe40
     kthread+0x34f/0x460
     ret_from_fork+0x659/0x940
     ret_from_fork_asm+0x1a/0x30

    The buggy address belongs to the object at ffff888112a2e000
     which belongs to the cache kmalloc-2k of size 2048
    The buggy address is located 1184 bytes inside of
     freed 2048-byte region [ffff888112a2e000, ffff888112a2e800)
    ==================================================================

Fixes: 300acfdec916 ("Bluetooth: Introduce force_bredr_smp debugfs option for testing")
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
 net/bluetooth/hci_debugfs.c | 2 ++
 net/bluetooth/smp.c         | 7 ++++++-
 net/bluetooth/smp.h         | 3 ++-
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/net/bluetooth/hci_debugfs.c b/net/bluetooth/hci_debugfs.c
index cd5ef398f2382..f513731053d28 100644
--- a/net/bluetooth/hci_debugfs.c
+++ b/net/bluetooth/hci_debugfs.c
@@ -525,7 +525,9 @@ static ssize_t force_bredr_smp_write(struct file *file,
 	if (err)
 		return err;
 
+	hci_dev_lock(hdev);
 	err = smp_force_bredr(hdev, enable);
+	hci_dev_unlock(hdev);
 	if (err)
 		return err;
 
diff --git a/net/bluetooth/smp.c b/net/bluetooth/smp.c
index 948a847c0dc23..e605ee8d20586 100644
--- a/net/bluetooth/smp.c
+++ b/net/bluetooth/smp.c
@@ -3433,6 +3433,10 @@ int smp_force_bredr(struct hci_dev *hdev, bool enable)
 	if (enable == hci_dev_test_flag(hdev, HCI_FORCE_BREDR_SMP))
 		return -EALREADY;
 
+	/* A powered-off controller has no registered SMP roots. */
+	if (!test_bit(HCI_UP, &hdev->flags))
+		goto done;
+
 	if (enable) {
 		struct l2cap_chan *chan;
 
@@ -3441,7 +3445,7 @@ int smp_force_bredr(struct hci_dev *hdev, bool enable)
 			return PTR_ERR(chan);
 
 		hdev->smp_bredr_data = chan;
-	} else {
+	} else if (hdev->smp_bredr_data) {
 		struct l2cap_chan *chan;
 
 		chan = hdev->smp_bredr_data;
@@ -3449,6 +3453,7 @@ int smp_force_bredr(struct hci_dev *hdev, bool enable)
 		smp_del_chan(chan);
 	}
 
+done:
 	hci_dev_change_flag(hdev, HCI_FORCE_BREDR_SMP);
 
 	return 0;
diff --git a/net/bluetooth/smp.h b/net/bluetooth/smp.h
index 0537762e2775e..22eabda930ef4 100644
--- a/net/bluetooth/smp.h
+++ b/net/bluetooth/smp.h
@@ -195,7 +195,8 @@ bool smp_irk_matches(struct hci_dev *hdev, const u8 irk[16],
 int smp_generate_rpa(struct hci_dev *hdev, const u8 irk[16], bdaddr_t *rpa);
 int smp_generate_oob(struct hci_dev *hdev, u8 hash[16], u8 rand[16]);
 
-int smp_force_bredr(struct hci_dev *hdev, bool enable);
+int smp_force_bredr(struct hci_dev *hdev, bool enable)
+	__must_hold(&hdev->lock);
 
 int smp_register(struct hci_dev *hdev);
 void smp_unregister(struct hci_dev *hdev);
