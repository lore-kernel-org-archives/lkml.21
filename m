Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795245085;
	b=g4VRZLPas5inTLSdX/d3ZIxlvtYv7fIwP8PazXpvbXoGqF18WjY3SCWtto7TnDUNMmvb
	 A2dXbcDB3AAPSG2Oe3Djuf+Pj0YET879sGnTmPEuihr96N6rDR5Qc13IXCmsY3TK/Zo89
	 jyWwAZ+bhpw4P1zuyhYrAPkAR3cHKqCIGVx/djRnUHDExoIAseEkBnpHsX6CyPMaqiSyk
	 UNBvHpeTnN/2SBDn/Q1sPtUEpTkxYTtzIvAkI1eD4x7EN9lXw9sovNBrZTs0LOHV2u+FY
	 Gd0mAWAwCHA3LnwwUQngHZd+PNZwUjky0UVc9IaHDZvScWfDAI8VlffVTgTXDeYt0eA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795245085;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LHVGDWh/sS50wYe3wF1hYQAVIGOU8i5LOcYT/8mME6Q=;
	b=U26SeojBQ+Sf/EBJ3FhnY85FlT/asAz2As1b0KlUonTPDkA0trbR+b+kZMFEZcgmlW7Y
	 Ta+VSREaesgKToYlr0elyD9367HeZnY+bMtM53WtMBzA/yZWPIRalUnTQ6ON6N9k6bUF1
	 BgE7+JtV8qcKih/KXySVji1eWwTx+oBkY3I5Rm0n3aaQ6pi9ooLDLr0GaYXUCteOGmEAw
	 Q5tKekg7eGvtkXEN6o5I9HCwoGp6wLMNgH6Ut0uQsvgeTcJocJFLfGcA7e/xLhjhNQoAs
	 c9dPJNGV2ehCpRfFLBT6RHjsONfRy46hKYDoEZaIdHJJYPgZ+aW49BqLfSeJQI5d1Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rFXBpNZO;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22EB606A325
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 07:11:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F22EB606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rFXBpNZO
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cde7e8abf9cso105820a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 23:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795245084; x=1795849884; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LHVGDWh/sS50wYe3wF1hYQAVIGOU8i5LOcYT/8mME6Q=;
        b=rFXBpNZOFLOly12r8x3SMfVJrgLh8ga5krVEA9J+19fIPWpDyZZkEJN1EH9mSzejR2
         OW2GXCrM1TeQ35SHBaE+YV2bDvbh1lgnqbYymFsvOaGgsEPV1qHNpQJ1A3CE1JFYR/OJ
         bmQTdiSERS2Q7b7Vo3JCAnm2FobQYHt+Ra5PteDqAzkZ4eOaONfHi+qgHoDzicU4G+Xh
         MjfumGI3g3Ic0NFPJ56NJvnWD/X/3KG+SxIBQ9B9mcJ3MBdXmyhJ5snlCC7Hy9112xur
         8lzKEkgLm3Nj26MQ0wQ5M9kM9y2zOOKexKpamaw4E5xucyCJth3yZakW9TQ0nFZLU6pe
         d0PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795245084; x=1795849884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LHVGDWh/sS50wYe3wF1hYQAVIGOU8i5LOcYT/8mME6Q=;
        b=ISmBWPBJvgQj5M7VI6gHfhT7lkXGTwL+fe0WjuvWyk2tSb2r444HoCvL4UgO1gxPyl
         SqWayuMi5/MHgTzl2AIb2RXqyAO4VpMtKARTgEPH/YAkd7uDWdzeT3GlSwbgh1in1buf
         7Gimcne4jtSf6oq41zzD39p8Ix/sVn9R1cGszRck0a28OcUJCK+QSrphBUroCvU+8c4p
         AFLpNP6OSMf0F5Hcj21pxzQXObjCu0Vlf82ZE3USGP1AXllbgiZ1VBX9Lcndi6KnANfk
         iCf454lIaIIDs0wzCQZuN5JY8NIHnzRSPfFzfxUZ5jmumMLoS+p7hqvGS5j8xcd8Czyn
         I6gA==
X-Forwarded-Encrypted: i=1; AL+hErGtgBVl4C2JlkIcT/DuWNzGGfebQxwhg9SCLI0pQFcgbO3Ut7xkVgLPMr6kADE6gEEJcTlh3KFWYS3Jr5Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zFclSoeC+gLZNr6BOeSaOw8xp+1S4OIDU4fEm/LX6tMv4F7M5
	NT2kvT1OF5G9yiP5MD7oSdIjo00uoux5Lnia/JvkyeHaklCh7OLP5a4n
X-Gm-Gg: AZFdTZfYZHuZl1JbJ0kopMVSAGZGuRFlIDC0gk+HdduGKixw/sh2pRt1rrnxS1+FbdS
	tzRmipwTKOoyNkPBiwViiwUp4nHSuIu7Y7YNBS0MZu2OZEukxFex6EFeX5C6TuxHz5cF7Hlfr0E
	qwm53232vNL29CVtlFxNSDyf2ZGWXRWfGlECGgozP6o1V6DTnVYkXNOPcX6h1EWyDiiDvExNCVQ
	Mu8M0jXt6hLRz/VabJrIBlt6meNs7g5KoB0lwU6bz3R9tCG6a6BdtXasUWPowbRPg1m48Sl1lc9
	oGOJdL5LhF1o17rmtZ74rMx2lDgjfS2sgcpOa4Bkh6h2TYl6fScWH/3ZepXumsq10HVg1JmmW1n
	XbGrZzTeFMLv4pZhUcn/90O+ow1LD0WsI7V2SWym/oyEhcAKSjzdh9CFrTVRNN5+8FcFU/wiAwv
	Ihv4z2371Ebw3jfZxWWZ1iBXba2ZzWSBm8N+e3ijTGnWu9y8redpdGQ2Y0AxIUnd2WW9VvWr+w/
	MFJwc0v/ndO35ssWyXis5LZbEIip1Lt0MDgeKv3tBs2ICM4IoqsJZbWg4GlD+NgvWBN0zuxfcNK
	N7lud/fhbmF7wYVIY+PhPAuA
X-Received: by 2002:a17:90b:390c:b0:3a7:9e3d:b3 with SMTP id 98e67ed59e1d1-3b41c9beafamr4862865a91.66.1795245084275;
        Fri, 20 Nov 2026 23:11:24 -0800 (PST)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d11753sm10614548a91.5.2026.11.20.23.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 23:11:24 -0800 (PST)
From: Cen Zhang <zzzccc427@gmail.com>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH 2/2] Bluetooth: 6lowpan: Disable notify_peers before netdev deletion
Date: Sat, 21 Nov 2026 15:11:10 +0800
Message-Id: <pm-bluetooth-objects-candidate-0228-v10-f6ced931e2322aa5c7b3-2@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <pm-bluetooth-objects-candidate-0228-v10-f6ced931e2322aa5c7b3-0@gmail.com>
References: <pm-bluetooth-objects-candidate-0228-v10-f6ced931e2322aa5c7b3-0@gmail.com>
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

The last-peer close path cancels notify_peers and queues adapter
deletion. Before deletion removes the adapter from the list, another
ready callback can find it and queue the embedded delayed work again:

  Last-peer close                   Later ready / deletion work
  cancel notify_peers
  queue delete_netdev
                                    add_peer_chan()
                                      requeue notify_peers
                                    unregister and free the adapter
                                    notification timer uses freed work

Disable the delayed work synchronously instead of only cancelling it.
This both drains an existing callback and rejects later queue attempts
for the adapter which is already being deleted.

The excerpt below retains the headline and stack traces.

Use disable_delayed_work_sync() before teardown, as commit
d236517c264e4 ("Bluetooth: coredump: Quiesce dump work on unregister")
does before freeing the Bluetooth coredump state.

KASAN report as below:

    BUG: KASAN: slab-use-after-free in do_notify_peers+0x63/0x70
    Read of size 8 at addr ffff888117711030 by task kworker/3:1/50

    Workqueue: events do_notify_peers
    Call Trace:
     <TASK>
     dump_stack_lvl+0x93/0xd0
     print_report+0xce/0x630
     ? do_notify_peers+0x63/0x70
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __virt_addr_valid+0x20d/0x410
     ? do_notify_peers+0x63/0x70
     kasan_report+0xe0/0x110
     ? do_notify_peers+0x63/0x70
     do_notify_peers+0x63/0x70
     process_one_work+0x908/0x19c0
     ? __pfx_process_one_work+0x10/0x10
     ? srso_alias_return_thunk+0x5/0xfbef5
     worker_thread+0x65c/0xe40
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __kthread_parkme+0x175/0x220
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __pfx_worker_thread+0x10/0x10
     kthread+0x34f/0x460
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __pfx_kthread+0x10/0x10
     ret_from_fork+0x659/0x940
     ? __pfx_ret_from_fork+0x10/0x10
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __switch_to+0x74f/0xf80
     ? __pfx_kthread+0x10/0x10
     ret_from_fork_asm+0x1a/0x30
     </TASK>

    Allocated by task 500:
     kasan_save_stack+0x33/0x60
     kasan_save_track+0x14/0x30
     __kasan_kmalloc+0xaa/0xb0
     __kvmalloc_node_noprof+0x353/0x930
     alloc_netdev_mqs+0xa0/0x1250
     chan_ready_cb+0x4ec/0xeb0
     l2cap_le_connect_req+0xccd/0x11a0
     l2cap_recv_frame+0x467f/0x8830
     l2cap_recv_acldata+0xe9f/0x10e0
     hci_rx_work+0x5a6/0xf00
     process_one_work+0x908/0x19c0
     worker_thread+0x65c/0xe40
     kthread+0x34f/0x460
     ret_from_fork+0x659/0x940
     ret_from_fork_asm+0x1a/0x30

    Freed by task 11:
     kasan_save_stack+0x33/0x60
     kasan_save_track+0x14/0x30
     kasan_save_free_info+0x3b/0x60
     __kasan_slab_free+0x5f/0x80
     kfree+0x307/0x580
     device_release+0xd7/0x280
     kobject_put+0x1ad/0x610
     netdev_run_todo+0x91c/0x13a0
     unregister_dev+0x82/0x280
     process_one_work+0x908/0x19c0
     worker_thread+0x65c/0xe40
     kthread+0x34f/0x460
     ret_from_fork+0x659/0x940
     ret_from_fork_asm+0x1a/0x30

Fixes: 18722c247023 ("Bluetooth: Enable 6LoWPAN support for BT LE devices")
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
This patch was written with assistance from Codex (OpenAI).

 net/bluetooth/6lowpan.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/bluetooth/6lowpan.c b/net/bluetooth/6lowpan.c
index f01eb68cbf5a9..f3f4e4b2c5f46 100644
--- a/net/bluetooth/6lowpan.c
+++ b/net/bluetooth/6lowpan.c
@@ -824,7 +824,8 @@ static void chan_close_cb(struct l2cap_chan *chan)
 	if (!err && last && dev && !atomic_read(&dev->peer_count)) {
 		spin_unlock(&devices_lock);
 
-		cancel_delayed_work_sync(&dev->notify_peers);
+		/* Prevent a later ready callback from requeueing work. */
+		disable_delayed_work_sync(&dev->notify_peers);
 
 		ifdown(dev->netdev);
 
