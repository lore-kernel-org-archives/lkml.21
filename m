Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794975721;
	b=gv42Dm9ZV+A4pYd48uHvxjGh3DzAWsyHmu/x3wD88tCG9GtfLsMteDLpjh9ANFifpYD/
	 ob80GwztQxBNGgP/xiPA8woRhnxcbfJmek/Bsi3luvufaLl208z3/AobpLJVH6e/3y7qj
	 cTGcBBbDIUOOTJv2jj0jVmmZ+TmeJwHPcsFIisacqkty4OAK4UudS5Bd1RynTrBkM2a8g
	 i4iuCvJHQ9I40YMrb8eS21rbPqnoBiime4NPVea1QLb/By9iQB0NOb66mHAKYzc+mzYCw
	 sGDUK8WUZs76ciePlvYWL+ix1NmJ+1nEvghNHAWId3ifX/5QI8KtgzvSa9kKRJasuPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794975721;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=W0soVXscY7NccXlE7bIOr4GOlA/q96UF/a8WmsVrNgE=;
	b=TcuD2J5Me4kY6e64AK8A/pk6wiSPcNNbTHuO7ak4EA2a/GC7w6T+g6oSeRj4h705YiSh
	 teKZtZZr3qVJnKd7UqeoMTex7QQnwP4StC0QB63/z8cu/3TZRgZ68kqn+U/AjRsOzMrJ3
	 0iB9rho6xIF8wM/I0rxlRGRMetANH/7uxADq0tp/tIZLGWphN8Gz/qFrfEBa9iigtcfu9
	 KRdP+POzP2vfXrPygSGFeoMW106IDsp+6eIPQbvSbdnqb3n/lsBRHTcG2GcbSSYdlmtrc
	 WklLqcdffrfnLajHqX0n+Hs4MZsq/garoQZHYBNeyPFt/OOFSwg4ArenzwCQFqMO6Aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m7kmnWgQ;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE42606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:22:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AE42606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m7kmnWgQ
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8b904d10882so217384b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794975721; x=1795580521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W0soVXscY7NccXlE7bIOr4GOlA/q96UF/a8WmsVrNgE=;
        b=m7kmnWgQdjDxWyYuC+9r9/2tPKNfa03oEFcJBf0Lhzm0t7Im3V7yt7CXK562IGpUj4
         FxqC4dc4/AOs5ph9uFp59xyGMO/czWzbO97I8nDs7Bq83TAYJUwu+ZYIHfIaIYBpOt44
         JwEJgz6fDlTVd2SWu7nWXbdUYAckNCAIP4GY+F1lKgj60qlUgU+3w2mLSn5eP+bsH9O1
         0a/KyYYDl+PjQjo10hIMPA3UzJZsLOH2Y55iCgf5D0chowkjAdGKfIVt7nNCor9n2Rz/
         Uk7X68+fIpnttjEwkdo6ebtYSQJ9qc9NeA/IklHCHyTBpFW83Vc5Cm1t8JgrgUJyJRi5
         7mDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794975721; x=1795580521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W0soVXscY7NccXlE7bIOr4GOlA/q96UF/a8WmsVrNgE=;
        b=i6K8v+IshLIsDd9JihbAf1daldMwxAkLZAm/q/OUywEXoV17dtnAdnZT5gf1fRmnT+
         CBfqTTAxESb4/Iy/Hil8jX971NY+n2CS/agW9fI+I+z1IROpurX6Pyt3HCdE3s77YG+0
         UldjjsaRdU8HW7wDJE3NeqMMb0JVoXpp1BLJSe169dln2xHxbk+6qPk6JT7/j9i3D8nj
         B/hfwQR6LkuhDMS4BR4IFZoqFXwls/ZFRBSfaa8LFp2n4Os68eIAoDNaV3rOTlQarpqZ
         ZJjBmHa7hrjLBGDrIdszZzIdsrEnddd1XCpQEpIJMn8O4ZYxg1j6i/8fABfWe+RwIQ9U
         St9g==
X-Forwarded-Encrypted: i=1; AL+hErGE9mohp0mLahsyWxeQqtTyLhxMUXXWmik0NaZoc4a9l6vyuDUoa20FwKNHSzcA/fEhjvD1tiAj60tT4HQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z862h/oewMDGpVLb4Ni1BRSLFuc2MUtCSU3g4DV5vP3QRQzHo55
	DevOEOXmcQd2zQ4Ou0pqP0WseseOLmIIY0C3fISY1R5u3YAydfAtbLye
X-Gm-Gg: AYBFou1YM+5q1YUiYmE0QcBLvf0E1ta/R4zDcpX5TR6PC3H4g2LiljbV5vw9yFxRoS5
	oXhQdKIsvclYNDg+QnvfdKzPvzxHSNC6tZ4ZAH74n0++L8mOI1NqzQk1GBrUUgwvaNPvQJWmhE+
	kCl9388JrljAuMN+OrPDcsegMhya6cVWJueq1WcHBb2SAvGFVCss0Ph7fAsa2LVy9ZOOAAZyLgt
	USzmzuU2x1yth7jpIDnydxR2M1+OL6fIKV42xKF/Xr3lngo6T+hwQ/HLYUCgNyvF0NM+6vO2kVg
	suUT4FEnA23o5uv226unZveASAeldDgy/2LTWziuvJU13CG7bzY1xCM/bwlcHD3M5WMyUPD2qcc
	eBntrxHmo3EqvtsrvBaO5bMuoyU7/r58txyZDOQp1MkbyPZdDrf7pVITog0nL7YfA3uBdxkJWGZ
	z+fupuBo+zlAiNBoZQeC010YTD/+8I/I9p5tmSC69+32scRZN8USsLVTgHnZkZlO3Schh3w/+uT
	JD3uRTqGyhFiurLi+DqcJC6hJ56rDyHhAQ1eWqiYxFyrxDxppjG+7nZpLa/gHPj9ZchixsBvnQg
	xz4ztUCguCJCofiMc0Bu+izb
X-Received: by 2002:aa7:9306:0:b0:8a0:5de3:a170 with SMTP id d2e1a72fcca58-8c5d4eb9ef1mr1206905b3a.45.1794975720858;
        Tue, 17 Nov 2026 20:22:00 -0800 (PST)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5ca7aaa8dsm455003b3a.10.2026.11.17.20.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 20:22:00 -0800 (PST)
From: Cen Zhang <zzzccc427@gmail.com>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v4 2/4] Bluetooth: SMP: Serialize forced BR/EDR channel changes
Date: Wed, 18 Nov 2026 12:21:36 +0800
Message-Id: <pm-bluetooth-objects-candidate-0184-v11-900043ed2303656c76fe-2@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <pm-bluetooth-objects-candidate-0184-v11-900043ed2303656c76fe-0@gmail.com>
References: <pm-bluetooth-objects-candidate-0184-v11-900043ed2303656c76fe-0@gmail.com>
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
Assisted-by: LLM

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
