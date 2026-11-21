Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795262488;
	b=3olMT4qplYXuanHgbOyHNKntgHI4QHuj5VBHYjrJEW6NkLRAO71O16LoPr/x92nLp5Gr
	 8nz8lvN5kH5T8YC3+xIPVqHA/CAvfChZmx4Qu0o6dNY92Qckg/nkymhb1/S5gXDUn5peI
	 Htx3smdofJu8KW9haaIKrzx6LTRmaiW8ZBMiTTeEvSQzA71zcpVnkTsU6ciYk48jO1eAx
	 WcoTeNdiyYprN9RiTFxvAEdMiYMfMdgLgiEDLU/zN3YID4sMBgCoDWzabkAI2i9O6lej4
	 PfP93YfZJ3h10zFrajDbQPVm72kvNoHqhTqx4e5UstGu0nDMFIXolCJ9rafjp5LXdKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795262488;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ci3P64xa38O00hMX/k7f2bmsUDxwfYwySYQ2yHWRji0=;
	b=qOHayqBpdDoj9ZcNMJi1DTe9ZILSeqb/cYMhtSHYSs7wSxx7VNCYmURbg+wgxRxsegLx
	 WYF0Siw18yaoaASyXgw/ThxoeMUxvOqteJ08wHp5eOPTPn0RZADny6dJYAxgkKJlEXVy2
	 fEIQK+2fXpliW56ZWVzkAbjGWcyTK1+St0qLDZ9cXu+CBaGd4bNQZE1sz2Sizzqi7x/sm
	 ZOliv5yU+v1KB+nMAAOloqEq8LrOf76CZCrmerkjYO3kYmeptAHFqOB0YYFkVPLxh1VPO
	 N07qJdXFmxzgv1YVFg1lzMYYjUl+MznkSsKcHncgyLt6ZQvtU1OmBfwqEQsvH1JRN+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W4uGXw7W;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C78606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 12:01:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08C78606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W4uGXw7W
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b3fb193c03so847705a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 04:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795262487; x=1795867287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ci3P64xa38O00hMX/k7f2bmsUDxwfYwySYQ2yHWRji0=;
        b=W4uGXw7WjyTLVvD7OZJuIB2YeKLFjPrWw5X+YKHFSrHJQjc/OMA9EWQwAJb2IW86Wm
         P4Vhx2n/cGvLhIBQm9AdWD44IYWujl/6iuHlWKVdESoMhDIXeE45gpRsFkn8zbEdJQWe
         4/rKwPdmu/wkojfZgKv/UWNjZ8WY8cbq+1tANxLRm9PK1tPxmX09SLHRZ5evQ+hmEsz3
         uGTURAfyV+8c8hWFP8OzsB497zq7AlLSgfeAfrFlTLloAyW5mXHdmJOrlHCBjru9gVAx
         684/gd/33kLxJW338CCnEFqLkJ7rg9COazFu+3zgT7CIU2Rsk9F7kqR4nHg7ZxtaasGz
         SU4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795262487; x=1795867287;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ci3P64xa38O00hMX/k7f2bmsUDxwfYwySYQ2yHWRji0=;
        b=XuV7w8SyOxHRFOYu72zKxvaylFavo3+u/lxnRDnoGSrv4we8GatWksaNQvigRp+Og/
         oIao/HSYlPRlYeThU+7y6Lxqnj2OC9ol381tiUwmhXSTZ0jV7BMlQsUKtj7dexh4AnbQ
         Fu5VX1j2NGz474YNSVdcx/1miRFlHgCf0Zmc4pKJu0oXL2U87JvvrFt3WFAFlsBuQAdI
         /hLsfiSq0vcC3KK9X9ByWnakhrvCxRAgScxKT5O5L3b3JU5PsZ3/Ou3Nqogj22Pn/SUM
         pugHLfle3N7TNuZVYf0aS3F0E3BeoxoKjQebRNcdUORu5idNz+uh2Ui4d1FKB1VxmVIa
         BcYA==
X-Forwarded-Encrypted: i=1; AL+hErFIF1/+j+No5U0OECL8xRI81lLglp4AOdGf+/Pw6qlzEs3ZIbwelM6weGIVUcFGOR9k9vactXjt/dmAGwI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9oKGEG5Dp8ZAvW5GphQzFxUhevucgUIGCst4RLkhMAvAjlb+Fy
	Qe3vNx1/BpNBj9x7lymfywAwrxzH27fWqmTM6Yq+G4zQGnxl0J/yCJ02
X-Gm-Gg: AZFdTZdyfn0g55gOhPSozbBSosMfmWHmHpt8xOjwNhH2VWj+togOw+WFKKNW2H4UeIg
	uz9Csak9G+Cf7J8TVL2LGlkX9BVBYcIT4eG8iLS4xMTN3DWy/sikNUfXrCcve2MBUTwJa6wKCdd
	xd7mjgFUnCuO2rRnKlvFc3wtsIRO7MOjdJARl+Qs12IcCOgfyYFfog0t9OyZLFA1YGgDyTZB7cJ
	irJ9Sp5ccB2xabDg6m/+XRye3c43uLRJW7iSKnD+Q0geTAh5Qlp4FEy10PomBEqjpCHBtjZkITN
	lcYPcKt7dkJuVuf4LxnvN27nFB3696oe6NLmUjyLUiJoueD+8zvrWg+WbWJkWx8ESYYKyuPQkgs
	J5uJSnXXf7ftIRyudAmL4LY9zO/WHqwBw3Xlx6h9bqnIX4jFfqM0Xb90LP3N+6e1zMpfYKhl7jI
	OJ+8B/na+LSBgsV2sh44/Qyh+pMJqNgKQnrc7ZnhFvkniBWmVRHxQBPMPxYYAyBSMcrmBdWAZSI
	zhDSXqJe/bkiAL/XazHbXDzwvOMAex9IM/sdR6JXZxDuPnITcSGifQP+/C2NFAuqtuWzp3aZX5v
	PaKkLFiYI+OHUiEwZMmt7MY3Qo9RlPlBrqcwq7sj3oMBBB9SWss1hA==
X-Received: by 2002:a17:90b:4b:b0:3b4:1265:740b with SMTP id 98e67ed59e1d1-3b41c9cf6efmr4903980a91.28.1795262487338;
        Sat, 21 Nov 2026 04:01:27 -0800 (PST)
Received: from DESKTOP-UCPRL76.localdomain ([113.200.174.114])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b8733e6sm1573965a91.3.2026.11.21.04.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 04:01:26 -0800 (PST)
From: Zheng Shuhao <viennaoffh@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Bluetooth: hci_sync: invoke destroy callbacks outside lock
Date: Sat, 21 Nov 2026 20:01:20 +0800
Message-ID: <20261121120121.576-1-viennaoffh@gmail.com>
X-Mailer: git-send-email 2.43.0
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

hci_cmd_sync_clear() cancels queued command-sync entries while holding
cmd_sync_work_lock. Cancellation invokes entry->destroy(), and
add_ext_adv_params_complete() takes hdev->lock. In the opposite direction,
le_conn_complete_evt() holds hdev->lock while hci_update_passive_scan()
queues work and acquires cmd_sync_work_lock. This creates the circular
locking dependency reported by lockdep during controller teardown.

Detach the queued entries to a local list under cmd_sync_work_lock, then
run the cancellation callbacks after releasing the mutex. This keeps
queue updates serialized without invoking callbacks under the mutex.

Testing:
- Lockdep-enabled QEMU baseline: reproducer completed twice and emitted
  the circular-locking warning once.
- Patched QEMU kernel: reproducer completed five times with no such
  warning.
- Bluetooth ECDH and SMP self-tests passed in both kernels.
- Both kernels built; baseline build logged a timestamp clock-skew
  warning. checkpatch.pl --strict reported no errors or warnings.

Fixes: 1c66bee492a5 ("Bluetooth: Fix race condition in hci_cmd_sync_clear")
Reported-by: syzbot+fc55a609cd9deea4ea37@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=fc55a609cd9deea4ea37
Signed-off-by: Zheng Shuhao <viennaoffh@gmail.com>

diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
index ea2014e74..65b8aa4ad 100644
--- a/net/bluetooth/hci_sync.c
+++ b/net/bluetooth/hci_sync.c
@@ -683,6 +683,7 @@ static void _hci_cmd_sync_cancel_entry(struct hci_dev *hdev,
 
 void hci_cmd_sync_clear(struct hci_dev *hdev)
 {
+	LIST_HEAD(cancel_list);
 	struct hci_cmd_sync_work_entry *entry, *tmp;
 
 	/* cmd_work is disabled, the pending request can only time out */
@@ -690,10 +691,13 @@ void hci_cmd_sync_clear(struct hci_dev *hdev)
 	cancel_work_sync(&hdev->cmd_sync_work);
 	cancel_work_sync(&hdev->reenable_adv_work);
 
+	/* Run destroy callbacks without holding cmd_sync_work_lock. */
 	mutex_lock(&hdev->cmd_sync_work_lock);
-	list_for_each_entry_safe(entry, tmp, &hdev->cmd_sync_work_list, list)
-		_hci_cmd_sync_cancel_entry(hdev, entry, -ECANCELED);
+	list_splice_init(&hdev->cmd_sync_work_list, &cancel_list);
 	mutex_unlock(&hdev->cmd_sync_work_lock);
+
+	list_for_each_entry_safe(entry, tmp, &cancel_list, list)
+		_hci_cmd_sync_cancel_entry(hdev, entry, -ECANCELED);
 }
 
 void hci_cmd_sync_cancel(struct hci_dev *hdev, int err)
