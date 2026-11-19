Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795048442;
	b=xpyrWCVnRKjhW72QsuB6/F4lnTQ7hbPV9Nyjbo9NIfZMejE07d4MnBfOXtKcAZAzXphJ
	 uKh97eRndqCtaHmwUhOuMnziNFmGjcPqZ9+yDJ9wFuPcPnyLh6pcpCCodtaSBa4HlqqCl
	 RMRjn6EnCUo4NgYop8hozanLn9KlJ05unNI1UQvI3gO6hK/bO/8mudOBHwol4yZ6T/ftn
	 myr1CdP3jmxYHjPBV/XiYc4b58Q+OJqh3zyHrmy6sb10uz5gSEJQJBuF+mBwtO6XwKVCW
	 CX/mPeyWEiil1V2D//fHsW3rYkxZQkCnoJqEaJ+NzxL4lPi6Pqu3gAZgJGbdplQH2sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795048442;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hLSsPIlra4YMwrm28ZebumgoTQDJjA67OcbFcKrOT5M=;
	b=iLtO4rlaqc+D48Zi2xbVklzh0X1xusw7LsK73B7sWs57a9GiNlSsVvw5W2AdxyRZoEh3
	 uhnlYDUx7Wa5yXiA6t0U/6nhTmIkricIPJS+TEnCijIf1ond0n3q2MjpRO2wIdzVVXlbc
	 5ypVX/mm7RFVZbjrEkXggBtI9j3VJSPVuuKMakWHE86BvY01xvMSViPgrkTY1rGxZY9j8
	 6FARojwow4peaRmvCmIZbHjjV2e/RP35lNOsoYFyTpvNlq1cRJX4dvEBWVTrsyQDw3VdZ
	 k81k80mEWObr5uyj7JWpEc1Aut3u/QxF7BXUEmOgPmxxr8K5HKew/shmEsZq12SvmeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=afyCzZXV;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9290D60A2621
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:34:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9290D60A2621
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=afyCzZXV
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8a06e79e152so1050884b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795048441; x=1795653241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hLSsPIlra4YMwrm28ZebumgoTQDJjA67OcbFcKrOT5M=;
        b=afyCzZXVyLBph5dVe5bpnm/pjGhwXjAWKcscjUPDWwCD1d/4wi8uDJOP+xCVu1ACbf
         SL9gf++mWjGHz3xLt2s8qPHHKZRnGbi8h4/6uk23ZVWeHjLszA67W5yNlXMdbjMIP+66
         wlCvDo3HCKK1CppXf9cs7pccm7JMInTu6nNaCxrZqETnP/Fc9GMGawXxbEAeGXy3xmfI
         n/Pbru1JjlmAbDtP/wtdDN2FjAi5iJSsqV/pVpg8awUgs4A+YAIw9YeRSJNr8qhes4uy
         kR7R52jOGrmyvdS7XKwSe2Y8DkRMiWp53/3yNzCg4xeX4l+YBkNbD7JTKDpdsDVA8qbF
         LWJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795048441; x=1795653241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hLSsPIlra4YMwrm28ZebumgoTQDJjA67OcbFcKrOT5M=;
        b=CBPSgQF0KPmIjVm76DveaxoEerTXtyq7URfUGW0gLFNj2bk1mFv03KxNbALeil1K8/
         ruVKoLbCcRTAD88ZXG1DTKCdeL7QOUgErW26lsuNUN747AWyaS2xGbIES8rXOkBoeVzh
         M0xzOofB0O1fJnC3J7DiJRcYbPOr9b3lRbK/Cxax/pzx3SYGCKDO3oXlrBQ108Ks9pp+
         AfoJoW6zOPY2z2ZF/0bL+WK/yvcbivHbGKCTcWnosJxyQObyYsQ8pUKOYqm2V4f7LQHX
         C9kbiDsRAPo2qtyBTWCXvbtrEPmx5cJuPE8AOw3by6aTQibfYxW+aYIsUcg4GObPh59G
         rVnw==
X-Forwarded-Encrypted: i=1; AL+hErEwExJbykMfv1EfvluZ3F5MiIPv/PPCSRab+y6Y+9dRBbnOUx/GKmuf/urPF+KRVnCDvU3ox2gkT+BJdls=@vger.kernel.org
X-Gm-Message-State: APuU4Z8G3p/8dUTcANgjTsT6ccMVf6tgtEwjPallKGXzbhsvB1MOKzKG
	Dh5Fd2UN7I+LsP7H5Gm+mgT4bgt7rgMy7y1m3cN969npjSGA0WD0GkFY
X-Gm-Gg: AYBFou0/GcbDAa1zwDKKTJC2AKNj2ehD6IfgyBTLB4s/jGJhj8xk735UwrQyfvAHsW6
	Sha+Uc8N34TC7cWdR7oAXRI1R4ioHNXrW3JX0cUCGIQ0kvXHsHGwuFKtho6WozrhM5FRSabCPUP
	2Q5aR/7qSyk+3uVTW1DCCk4BofdiyG6xW82P8GGSGfmCyULw+on6sZlXxdCNsuAcEay3pl4O9yf
	FmM+pAa74wjdhXHmxplkuCTO1eH5xoY3MqhRyha8VWIq2Nk7t0rVwSGLSRwHTRBp83ptc540jro
	7k3b1wA75vY0nnYxpmF4dGNPhzYCiRDFiTbqfnrBqtV9qSywU8cMbwal2Yfyplh28/8+C4aL30f
	YjDxId9MivBJVaWI/Xe3WiahUzmQL7svTfnko328MqBoAQLIdP8rS7w38ST99yG5vgsGYjWbEvA
	jCpKiC5RoGSmU8iAuevjriObkBknS4VKlFCTcTNbcgdtjZ4braq+Ck3WEZiDaLro3GanZrU9P8o
	aJqzR92Qxop7/PSVnmJpdcWoAluCf8VIsPMFFNGwmyWxL2BEk+xZHBeCVTTDpAnkFhKQYhob+l6
	vaD9R0/vTQejeRjoA4ZOt2dQ
X-Received: by 2002:a05:6a21:3e0c:b0:3fd:c1f8:30d2 with SMTP id adf61e73a8af0-3fe8a12100emr3188100637.30.1795048440884;
        Wed, 18 Nov 2026 16:34:00 -0800 (PST)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5c7f99f91sm1906491b3a.5.2026.11.18.16.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 16:34:00 -0800 (PST)
From: Cen Zhang <zzzccc427@gmail.com>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v5 4/4] Bluetooth: SMP: Serialize root channel replacement
Date: Thu, 19 Nov 2026 08:33:43 +0800
Message-Id: <pm-bluetooth-objects-candidate-0184-v12-e80229724d6ad14ca88c-4@gmail.com>
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

smp_register() replaces the SMP root channels when they are still
registered from an earlier power-on. This happens when management powers
on a controller that is already up with HCI_AUTO_OFF set:
hci_power_on_sync() clears the flag and runs hci_powered_update_sync()
again, which registers SMP so that the channels use the identity address
chosen for this power-on. The WARN_ON() in smp_register() fires on this
path, and the old channels and their SMP data are freed while two kinds
of users can still hold them.

HCI event handlers read hdev->smp_data under hdev->lock, for example
smp_irk_matches() when resolving the target of a directed advertising
report:

  HCI receive worker              Power-on request
  hci_dev_lock(hdev)
  smp_irk_matches()
    chan = hdev->smp_data
                                  hci_powered_update_sync()
                                    smp_register()
                                      smp_del_chan(chan), chan freed
    reads chan->data

SMP receive callbacks run on hdev->workqueue without hdev->lock and use
the ECDH transform of the root, for example smp_cmd_public_key():

  HCI receive worker (SMP)        Power-on request
  smp_cmd_public_key()
    tfm = root's tfm_ecdh
                                  smp_register()
                                    smp_del_chan()
                                      crypto_free_kpp(tfm)
    compute_ecdh_secret(tfm, ...)

Before commit 2ff13894cfb8 ("Bluetooth: Perform HCI update for power on
synchronously"), mgmt_powered() called smp_register() synchronously
under hdev->lock, before submitting the HCI update. That excluded HCI
event users, but did not exclude SMP receive callbacks. Those callbacks
already used root-owned OOB data after commit 33d0c030717b ("Bluetooth:
Use OOB key pair for LE SC pairing with OOB method"). The later commit
4ba5175f2c10 ("Bluetooth: Use correct tfm to generate OOB data") made
the ECDH calculation use the root's transform too.

Queue registration on hdev->workqueue and hold hdev->lock while it
replaces the channels. This adds exclusion from SMP receive callbacks
and restores exclusion from HCI event users. smp_register() waits for
the work and returns its result. Its callers hold the request lock but
not hdev->lock, including hci_power_on() when it updates a controller in
the HCI_AUTO_OFF window. No work on hdev->workqueue takes the request
lock, and hci_dev_close_sync() drains this workqueue only with the
request lock held, so the registration work cannot be queued while it
drains. Users that run under the request lock, such as
smp_generate_rpa(), stay serialized by that lock.

The reports below come from test kernels with scheduling hooks that
widen these windows. The WARN_ON() in smp_register() was printed before
each of them.

KASAN report as below:

    ==================================================================
    BUG: KASAN: slab-use-after-free in smp_irk_matches+0x2fb/0x310
    Read of size 8 at addr ffff88810c35f4a0 by task kworker/u17:0/520

    Workqueue: hci0 hci_rx_work
    Call Trace:
     <TASK>
     dump_stack_lvl+0x93/0xd0
     print_report+0xce/0x630
     kasan_report+0xe0/0x110
     smp_irk_matches+0x2fb/0x310
     process_adv_report.part.0+0x2ce/0x1680
     hci_le_direct_adv_report_evt+0x2f8/0x4c0
     hci_le_meta_evt+0x30c/0x5c0
     hci_event_packet+0x4e8/0xc70
     hci_rx_work+0x367/0xf00
     process_one_work+0x908/0x19c0
     worker_thread+0x65c/0xe40
     kthread+0x34f/0x460
     ret_from_fork+0x659/0x940
     ret_from_fork_asm+0x1a/0x30
     </TASK>

    Allocated by task 522:
     kasan_save_stack+0x33/0x60
     kasan_save_track+0x14/0x30
     __kasan_kmalloc+0xaa/0xb0
     __kmalloc_cache_noprof+0x251/0x610
     l2cap_chan_create+0x47/0x930
     smp_add_cid+0x120/0x4f0
     smp_register+0xa7/0x400
     hci_powered_update_sync+0x88/0x720
     hci_dev_open_sync+0xae0/0x2060
     hci_set_powered_sync+0x2a9/0x720
     set_powered_sync+0xaa/0x150
     hci_cmd_sync_work+0x1b3/0x450
     process_one_work+0x908/0x19c0
     worker_thread+0x65c/0xe40
     kthread+0x34f/0x460
     ret_from_fork+0x659/0x940
     ret_from_fork_asm+0x1a/0x30

    Freed by task 522:
     kasan_save_stack+0x33/0x60
     kasan_save_track+0x14/0x30
     kasan_save_free_info+0x3b/0x60
     __kasan_slab_free+0x5f/0x80
     kfree+0x307/0x580
     l2cap_chan_put+0x273/0x3a0
     smp_del_chan+0x9f/0x170
     smp_register+0x2e8/0x400
     hci_powered_update_sync+0x88/0x720
     hci_set_powered_sync+0x5e5/0x720
     set_powered_sync+0xaa/0x150
     hci_cmd_sync_work+0x1b3/0x450
     process_one_work+0x908/0x19c0
     worker_thread+0x65c/0xe40
     kthread+0x34f/0x460
     ret_from_fork+0x659/0x940
     ret_from_fork_asm+0x1a/0x30

    The buggy address belongs to the object at ffff88810c35f000
     which belongs to the cache kmalloc-2k of size 2048
    The buggy address is located 1184 bytes inside of
     freed 2048-byte region [ffff88810c35f000, ffff88810c35f800)
    ==================================================================

KASAN report as below:

    ==================================================================
    BUG: KASAN: slab-use-after-free in compute_ecdh_secret+0x856/0xa50
    Read of size 4 at addr ffff8881071f4f00 by task kworker/u17:2/500

    Workqueue: hci1 hci_rx_work
    Call Trace:
     <TASK>
     dump_stack_lvl+0x93/0xd0
     print_report+0xce/0x630
     kasan_report+0xe0/0x110
     compute_ecdh_secret+0x856/0xa50
     smp_recv_cb+0x3acf/0x93b0
     l2cap_recv_frame+0x13cc/0x8830
     l2cap_recv_acldata+0xe9f/0x10e0
     hci_rx_work+0x5a6/0xf00
     process_one_work+0x908/0x19c0
     worker_thread+0x65c/0xe40
     kthread+0x34f/0x460
     ret_from_fork+0x659/0x940
     ret_from_fork_asm+0x1a/0x30
     </TASK>

    Allocated by task 497:
     kasan_save_stack+0x33/0x60
     kasan_save_track+0x14/0x30
     __kasan_kmalloc+0xaa/0xb0
     __kmalloc_node_noprof+0x2f2/0x7b0
     crypto_create_tfm_node+0x92/0x390
     crypto_alloc_tfm_node+0xf5/0x220
     smp_add_cid+0xc1/0x4f0
     smp_register+0x9d/0x430
     hci_powered_update_sync+0x82/0x680
     hci_set_powered_sync+0x4f4/0x750
     set_powered_sync+0xb8/0x210
     hci_cmd_sync_work+0x1b3/0x450
     process_one_work+0x908/0x19c0
     worker_thread+0x65c/0xe40
     kthread+0x34f/0x460
     ret_from_fork+0x659/0x940
     ret_from_fork_asm+0x1a/0x30

    Freed by task 497:
     kasan_save_stack+0x33/0x60
     kasan_save_track+0x14/0x30
     kasan_save_free_info+0x3b/0x60
     __kasan_slab_free+0x5f/0x80
     kfree+0x307/0x580
     crypto_destroy_tfm+0xdd/0x230
     smp_del_chan+0x8b/0x180
     smp_register+0x29d/0x430
     hci_powered_update_sync+0x82/0x680
     hci_set_powered_sync+0x4f4/0x750
     set_powered_sync+0xb8/0x210
     hci_cmd_sync_work+0x1b3/0x450
     process_one_work+0x908/0x19c0
     worker_thread+0x65c/0xe40
     kthread+0x34f/0x460
     ret_from_fork+0x659/0x940
     ret_from_fork_asm+0x1a/0x30

    The buggy address belongs to the object at ffff8881071f4f00
     which belongs to the cache kmalloc-128 of size 128
    The buggy address is located 0 bytes inside of
     freed 128-byte region [ffff8881071f4f00, ffff8881071f4f80)
    ==================================================================

Fixes: 33d0c030717b ("Bluetooth: Use OOB key pair for LE SC pairing with OOB method")
Fixes: 2ff13894cfb8 ("Bluetooth: Perform HCI update for power on synchronously")
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
 net/bluetooth/smp.c | 36 +++++++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/net/bluetooth/smp.c b/net/bluetooth/smp.c
index e605ee8d20586..8df155566cea1 100644
--- a/net/bluetooth/smp.c
+++ b/net/bluetooth/smp.c
@@ -3459,7 +3459,8 @@ int smp_force_bredr(struct hci_dev *hdev, bool enable)
 	return 0;
 }
 
-int smp_register(struct hci_dev *hdev)
+static int __smp_register(struct hci_dev *hdev)
+	__must_hold(&hdev->lock)
 {
 	struct l2cap_chan *chan;
 
@@ -3509,6 +3510,39 @@ int smp_register(struct hci_dev *hdev)
 	return 0;
 }
 
+struct smp_register_work {
+	struct work_struct work;
+	struct hci_dev *hdev;
+	int err;
+};
+
+static void smp_register_func(struct work_struct *work)
+{
+	struct smp_register_work *reg =
+		container_of(work, struct smp_register_work, work);
+	struct hci_dev *hdev = reg->hdev;
+
+	hci_dev_lock(hdev);
+	reg->err = __smp_register(hdev);
+	hci_dev_unlock(hdev);
+}
+
+int smp_register(struct hci_dev *hdev)
+{
+	struct smp_register_work reg = { .hdev = hdev };
+
+	/* HCI event handlers use the root channels under hdev->lock, and
+	 * SMP receive callbacks use them from hdev->workqueue. Replace the
+	 * channels from that workqueue while holding hdev->lock.
+	 */
+	INIT_WORK_ONSTACK(&reg.work, smp_register_func);
+	queue_work(hdev->workqueue, &reg.work);
+	flush_work(&reg.work);
+	destroy_work_on_stack(&reg.work);
+
+	return reg.err;
+}
+
 void smp_unregister(struct hci_dev *hdev)
 {
 	struct l2cap_chan *chan;
