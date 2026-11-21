Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795245329;
	b=0M/7YrhFDYU00UI9S4DUP2P6N47L6uy/nU2+fxFT5kdBRHGg+vF/5OLl7XLmDnl1a2BM
	 ncRUlapInZo+1BbAqorrTUMft6B4xdQXqrE5Jes7oE3IHFcZKE1nYDoOAEMSZ2Isco0xY
	 DZr3IZP7OnUwPZu50UPhx3VGFFTmjUKFNvdKhF8OYMpdkUDFlvbK9e+bStzkEDmj1h977
	 t+sql70EjIWufxaZtIk+XcLwSI/oPu52+CHB+C1SdtQIQb7LelZ+0ES1jIgjjbLGTFQun
	 bKobEeYYMXI0Jboy6AtDetFL4fvTjg4nkcKmnu9znYvcOyfD40yNdH+g0ZQ+Fk3c7Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795245329;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vDOLv6BwGP2Cbxhx8fC3lIchijWC4x5VUkIvFlq4Bsg=;
	b=a6LKe1GGTnmVeMySNyukLOh52uA23LOQ9h7OPIEGZAfkbbWZJHXw6IJOqO652ikkHKYi
	 vx8HfpC+i9802988Mjuvf5dtYiI4dqJyQY9zia3/dh2r0QQIyOlSuxf1tMZ6nSQXwiN95
	 Oj+DWPXlTBNsk3hiJzzLIFIsn70OAb66b/DAekb/z5/m6apZwlrhvOtwQMIg/gy3hynrP
	 qk6Ftdyu6mvmhd2KLU2Ai5pfzFQOHhLepN0nHBgpMjkTxn07WO5GrXx1vkldVULgLVjvM
	 0LfMppNfGCotqSHq2+Bj11DeBdBF61XoRZXGyEhXEt44Le22CxtTleYLm6U7LxY9ZLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pMKryPek;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B65D606A334
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 07:15:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B65D606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pMKryPek
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2f02ee04378so13351715ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 23:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795245328; x=1795850128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vDOLv6BwGP2Cbxhx8fC3lIchijWC4x5VUkIvFlq4Bsg=;
        b=pMKryPekOhfe6XYWnp2OwKsk7EgsXCmEPimyEMGWYfAdcPl7qhSdSM/nCgQZFNy2Jt
         MP8crQM4+1IAiSIO/qzfyVmBxPGVahrBtCVm2PyXoN9G6R90M6xKcszkis60grzTewyz
         8qVWw60LkL+NLzK0QlAensvolm3bGHaj9BQmCckHDGCfEL/RPDeE346ZPxNjlxOUjan+
         SjvPWXOJDJSYd8ylzz5JLscWhUX7WObsOT53yXUkIwHLyoM7VvpMd0o48fJ8lgAm0Pzy
         MbsGHhbgkON0YGNPtB2Y3ULafFMGU1WLZdFt0CXLGMdlv5lHC9ckewFnLj+N2XWc8pkP
         LpZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795245328; x=1795850128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vDOLv6BwGP2Cbxhx8fC3lIchijWC4x5VUkIvFlq4Bsg=;
        b=LrECwh4wJHyMzQOjpfqkwgwF4/hOzuHKotkH/0PXhqtlwYgUALjpSxDOO0bp0mINWr
         7b9pFe02xZS7nPF/7I8MxcV24oIvmVFhcyYq2OOtbxml5GLBVerzcUBWzc0c7RXx9kte
         3PzxsuH30RGwjiqP8BhAi8jwfYoL6XIidAS+wOJXPVk/qB2AWv7XGXdQ6Kgq/VBui67E
         AtLNfSNX56Or0PabtzPz5ynwd9nHqB0SDqGrYYBCCWZzyZRkMg0a0QfhHoHnMpCVdCOq
         wOBdKY5QREAYTLwqnDJOKklCCUCuSzrSKWdbMvEdldqMVI00ZnM9NvqqqG4EtIruWR67
         whMw==
X-Forwarded-Encrypted: i=1; AL+hErHZNdjrcs5Xvi9thS6ZZhwgH+VQli898273wqjlmaufUqLnt3oiP7owu9MvPLWTvM29VuNX8Ce3RvNcbbA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Q18SoAMkhuKWuSzy47Jm0yWS6DFKfX8Xwhd/PIguSYdI/Bj7b
	ZED3l/HzdqgdPmVrAgTmnYNl+pzb8PhyyUOzll+m0wgxSsL1r6Ux3iib/kzgfWnE7mE=
X-Gm-Gg: AZFdTZf2SJvLFBMJqPfVx6TPP8OKFknIZMprpUENFDBkj1sa+2atBp+q8DDibRDK+Wi
	STgKwz3Bz55fVnTsw3EwTGty3TwYSdoVxxnNbXttc1DorPg/WtwK0sZt4lwhellYkpvVNzvlncX
	BniNAtxhXZlTW2GHuGp9KdDQ879LRqfeMaLQwj4YPvGfXXTCmCK21ln2h6wRO4I+p/CApaewIpE
	vBdHtqK9ksldgCwsVYU7m3IAmTqbGwVobHgeL3efxLDmg+IRx8ckEWtyviwB27xas5mQzdEeflU
	58CCO9F7VkLnLFxTDtEqwj6xISEX32F/pElExUdjGUh9dN6g7NZsWSH6ZvHRxMNb+o+TOM6ULyg
	0OXfXLwMCBm51WAXbKA3n9F7ObXn/rPFUPHDBnCAJCX+H4OmLrqdAihZN1cFpqlHgMiEJEHO4lF
	2ob2lTRJJIg9he97WvnLzRNffNsQL3PSGobWust2KCI9iTBV5oNeFihkTVIe3XMkGEskz8HDdME
	I30/KnpbRgWhK0oijP3W6A30P7ySAFgqIP/qj0ZTxzeM7X04rTxXu5R47Hstd7Im9SdJPszirAl
	8Rm9e/FS/H1zoG2wUtL7iIQM
X-Received: by 2002:a17:903:4b0c:b0:2e2:d77b:e586 with SMTP id d9443c01a7336-2f03f26bea1mr52144395ad.60.1795245327828;
        Fri, 20 Nov 2026 23:15:27 -0800 (PST)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f04f6049dfsm13508675ad.19.2026.11.20.23.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 23:15:27 -0800 (PST)
From: Cen Zhang <zzzccc427@gmail.com>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH 1/3] Bluetooth: MGMT: Fix use-after-free in set_le_sync
Date: Sat, 21 Nov 2026 15:15:16 +0800
Message-Id: <pm-bluetooth-objects-candidate-0167-v9-45c99868af18e41665a3-1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <pm-bluetooth-objects-candidate-0167-v9-45c99868af18e41665a3-0@gmail.com>
References: <pm-bluetooth-objects-candidate-0167-v9-45c99868af18e41665a3-0@gmail.com>
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

set_le_sync() checks its pending command and copies the mode under
mgmt_pending_lock, but later reads cmd->sk after dropping that mutex.
An HCI USER bind can remove the index and free a running request's
pending command; dequeueing queued work cannot stop an already running
set_le_sync():

  SET_LE request                    Index removal
  validate cmd; copy mode
  unlock mgmt_pending_lock
                                    remove and free cmd
  read cmd->sk for advertising removal

Copy the socket under the pending-list lock and hold its reference until
the request's last use. Pass that socket to advertising removal and drop
the temporary reference on the common exit path.

The excerpt below retains the headline and stack traces.

KASAN report as below:

    BUG: KASAN: slab-use-after-free in set_le_sync+0x44a/0x450
    Read of size 8 at addr ffff88810679d8b0 by task kworker/u17:2/497

    Workqueue: hci1 hci_cmd_sync_work
    Call Trace:
     <TASK>
     dump_stack_lvl+0x93/0xd0
     print_report+0xce/0x630
     ? set_le_sync+0x44a/0x450
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __virt_addr_valid+0x20d/0x410
     ? set_le_sync+0x44a/0x450
     kasan_report+0xe0/0x110
     ? set_le_sync+0x44a/0x450
     set_le_sync+0x44a/0x450
     hci_cmd_sync_work+0x1b3/0x450
     ? srso_alias_return_thunk+0x5/0xfbef5
     process_one_work+0x908/0x19c0
     ? __pfx_process_one_work+0x10/0x10
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? lock_is_held_type+0x8f/0x100
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

    Allocated by task 527:
     kasan_save_stack+0x33/0x60
     kasan_save_track+0x14/0x30
     __kasan_kmalloc+0xaa/0xb0
     __kmalloc_cache_noprof+0x251/0x610
     mgmt_pending_new+0x60/0x230
     mgmt_pending_add+0x3b/0x180
     set_le+0x8bc/0xb10
     hci_sock_sendmsg+0x128b/0x22e0
     sock_write_iter+0x4c0/0x550
     do_iter_readv_writev+0x59c/0x860
     vfs_writev+0x30e/0xc10
     do_writev+0x241/0x2f0
     do_syscall_64+0x115/0x6a0
     entry_SYSCALL_64_after_hwframe+0x77/0x7f

    Freed by task 491:
     kasan_save_stack+0x33/0x60
     kasan_save_track+0x14/0x30
     kasan_save_free_info+0x3b/0x60
     __kasan_slab_free+0x5f/0x80
     kfree+0x307/0x580
     mgmt_pending_foreach+0x1ea/0x2c0
     mgmt_index_removed+0x13b/0x2e0
     hci_sock_bind+0xcf3/0x1790
     __sys_bind+0x18f/0x240
     __x64_sys_bind+0x77/0xc0
     do_syscall_64+0x115/0x6a0
     entry_SYSCALL_64_after_hwframe+0x77/0x7f

Fixes: d81a494c43df ("Bluetooth: hci_sync: Convert MGMT_OP_SET_LE")
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
This patch was written with assistance from Codex (OpenAI).

 net/bluetooth/mgmt.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
index a5eaa1670b46d..68fc33542645d 100644
--- a/net/bluetooth/mgmt.c
+++ b/net/bluetooth/mgmt.c
@@ -2141,6 +2141,7 @@ static int set_le_sync(struct hci_dev *hdev, void *data)
 {
 	struct mgmt_pending_cmd *cmd = data;
 	struct mgmt_mode cp;
+	struct sock *sk;
 	u8 val;
 	int err;
 
@@ -2154,6 +2155,10 @@ static int set_le_sync(struct hci_dev *hdev, void *data)
 	memcpy(&cp, cmd->param, sizeof(cp));
 	val = !!cp.val;
 
+	/* Keep the socket alive if the pending command is removed. */
+	sk = cmd->sk;
+	sock_hold(sk);
+
 	mutex_unlock(&hdev->mgmt_pending_lock);
 
 	if (!val) {
@@ -2163,7 +2168,7 @@ static int set_le_sync(struct hci_dev *hdev, void *data)
 			hci_disable_advertising_sync(hdev);
 
 		if (ext_adv_capable(hdev))
-			hci_remove_ext_adv_instance_sync(hdev, 0, cmd->sk);
+			hci_remove_ext_adv_instance_sync(hdev, 0, sk);
 	} else {
 		hci_dev_set_flag(hdev, HCI_LE_ENABLED);
 	}
@@ -2190,6 +2195,8 @@ static int set_le_sync(struct hci_dev *hdev, void *data)
 		hci_update_passive_scan(hdev);
 	}
 
+	sock_put(sk);
+
 	return err;
 }
 
