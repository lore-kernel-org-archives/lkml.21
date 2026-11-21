Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795244585;
	b=HuG64ia6GgSIzADxUhzaa0l1BLb62No/2WcUGtvELaJx8c3dEWbzooCK6j0aiBW9EZpY
	 gN/TjxLQwfOEcxwg+QokdLCvsgEAkc1bxBGV6jn4NLq3Wr3A7aX+PWMj1DNYmZKtrkKh3
	 5lZTd8Xx9tCH+mvu9tXfm0R5fhu/lBVqMYVx3ZrcczsodmwByLy8giR2ZRnXzdHTS2a6c
	 IEsMFxQhsD/bNKeRw/6YbM4CvAFhqFebRJVZ6LWjypTg7zNaekbrz8QgoIT2wHo55S8z7
	 6wuTIRLNmSCokSqOZSab9bO49Zd7ehuX5ETMQKomfIeijfGD6aJiHCEg7VpmD6lNREA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795244585;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nEJcc2N7i/qeRLdr+wgd+TOtAum7vq9L8QCB+1qczhU=;
	b=ctz8Af09IywcUKI+76KBr+IoY6miyXRSi6h3NbvdVKCTC4gTnqWmTRimAm7dAsb8Apux
	 dLtp6ug0mMwHMUb5MOH3bUsk2FSOM9MuxqftJsQmiwLhHnRZKeeomzeRcECmnketqzsGl
	 UWrsfaXy28QxnfIU4fKQ2OMuY64YIEIgv4p28cXClxsatZSYxqBIO59Wcd5+hzzFnHwqH
	 2QY6mpbxqd3IcWskS42Kj+OBmqM4Oz050GUOuGSL8PMTKTlCXBp/FPFh5m2Ixz1PZWxwJ
	 uSsgpHDnDjiijHsOrt3dI2FvqQJzaOtZeH3oEcoVtAXBTyOIy1xjCHGIyj7yuzQQ/bA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="tX6U/6jU";
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2303606A338
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 07:03:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2303606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tX6U/6jU
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cdb684859cbso977660a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 23:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795244584; x=1795849384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nEJcc2N7i/qeRLdr+wgd+TOtAum7vq9L8QCB+1qczhU=;
        b=tX6U/6jUz7vDCOfLVdIjOqPHfPD1dm430ZabHV+PfK3F/r5ZmJrcBAkmmVgZZMKr7c
         RQS32DjrXLxvundJ5IAld86RmP+wyoIWNrpUEqs+z+j95zKTIFgvr7anVZC++diOaU1I
         9U87HVlmmzL7y5UeEJZdMwffT9nVpKRoLCYo1n8XHWHMBb+he7sbfO6BZjQKLyZtkMRP
         vYRVU/WEPidvIdDBYwqXZQ4UN2V8zto9rfT0rWdHKnqlhesGdKE5h9YuNMUYSHRIwdvf
         1D6Fzq4xzAU8EV/RAVznkfw3e/QfGVlXJi77OC6fS4FjsTmUlJBLAkqcHaf+Y0NaVBpq
         TuXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795244584; x=1795849384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nEJcc2N7i/qeRLdr+wgd+TOtAum7vq9L8QCB+1qczhU=;
        b=AYPsWJytnuesILCWFhB30hbTyuYspXG9y78dyhpYNwvNobA8tYnIP+vZ+j7NxhWvrz
         vJRgXooge7H3wpTmF7KIx8ivF/xBNyxN3p7idRX6UiLE+l44PmWoDtrk6fL5x/tecyrK
         2PjPPVba84H0eX6ohQyTU7yr7BlaP+m0McMiWxkOPGeA7aObQ0FG6my8lQUuIBiOS87f
         NcpjVGiEK9kwleu1q87SKgptGGk7BRXphyASwbjs1EYFDvdAkiCu9pekMSQJogSvzBO+
         iYm4ml7AREXvdJmlW00IKrkAMzK80hkZGRNdDXRTJYgNh5tkGbTbzTZZNaMdmmsyfrw2
         9EzQ==
X-Forwarded-Encrypted: i=1; AL+hErFahfZc+SSZgerC2pfJNC3SNZpsiMjSBTdRzPp6+MrhRAKQK/bMn9CcqzZD0zmKErSMcFb3mghqZujYXQ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lB+gMlWCN1ShhlXBDfp9pBdIilYjVe+eqDZH+Yl8KzJeX5oj/
	ShU6JAE+9UWvKbRXdzV7I7/eMYo5bUrG3youewZ96BONGyYNOAjtPCbN
X-Gm-Gg: AZFdTZcsYzq7FPBOBY4tQKfjrH7vLziVX3bCYJDaM2pZHJ+lR4ZJc+ArH/a7JTXTFJH
	lRdcum+m2o2zVMk0gBKzVZ0hdIGvUdf5I/RA2WRduJERtEyv9F/3jjeaKq9UEWfSamAJY6sEMCQ
	CD2rxkl4FaIUiBUbYK7MLY+qijiJk5zoAj0QsNlPasxJBHNyAOmmBfdaRuqh0+qCRWzLR+dAXvj
	V3TixQOEJN1IUKKigi8hqNIUT/RmMdGcjkYbCnOPEX+MKK/Uat8LukgB1LygFZD88awdVhl0OZf
	Q16txC1q4gJDe7qVq1EBL68iJfDvXwlKc/yRTxBpcEbj18jyY0s25/80slyKwr/elRu8K3sNvbR
	xPaExAcp0PdCKHHq5w3s53MT6RPS8xSvMyC8JNTUP5LReviAMYLykvU4PkWbRl2xXdmS4mtDYGp
	nTKhgQKSeyuuX5YzuEtVnQu1k9y8NmLMPbCiekXeRp8idUwBCklUKnuB+rICHL7BU6nU8Mt2dQa
	ZV732VtXNs7Gge6pqyQtcenWzGZcUkxI3iFJ0TaFDBz/sS+H46FHLnzODfDTriQXYGJvS2aQ6TV
	DEN29SNTppJFnT5C09N9GHWW
X-Received: by 2002:a05:6a20:914b:b0:3e0:ca2a:f9e with SMTP id adf61e73a8af0-4014c05d475mr6448666637.39.1795244584024;
        Fri, 20 Nov 2026 23:03:04 -0800 (PST)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c89dsm2477793b3a.13.2026.11.20.23.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 23:03:03 -0800 (PST)
From: Cen Zhang <zzzccc427@gmail.com>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH 1/2] Bluetooth: RFCOMM: Hold the listener across child unlink
Date: Sat, 21 Nov 2026 15:02:51 +0800
Message-Id: <pm-bluetooth-objects-candidate-0218-v8-da37c8a6b33c9d2d8efc-1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <pm-bluetooth-objects-candidate-0218-v8-da37c8a6b33c9d2d8efc-0@gmail.com>
References: <pm-bluetooth-objects-candidate-0218-v8-da37c8a6b33c9d2d8efc-0@gmail.com>
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

rfcomm_sk_state_change() saves the listener pointer, unlinks a closed
unaccepted child, and then notifies the listener. Once the child is no
longer on the accept queue, listener release can finish without waiting
for that callback:

  RFCOMM callback                   Listener release
  lock child socket
  save parent
  bt_accept_unlink(child)
                                    drain the empty accept queue
                                    drop the last listener reference
  parent->sk_data_ready(parent)

Take a listener reference before unlinking and release it after the
notification. Track that reference separately from SOCK_ZAPPED so a
different state does not release a reference it never acquired. Drop
the DLC lock before either socket can be destroyed.

The excerpt below retains the headline and stack traces.

Keep the socket reference across accept-queue unlink, as commit
4bd0b274054f ("Bluetooth: fix UAF in bt_accept_dequeue()") does for
the dequeued socket.

KASAN report as below:

    BUG: KASAN: slab-use-after-free in rfcomm_sk_state_change+0x3a4/0x3f0
    Read of size 8 at addr ffff88810bc8b188 by task krfcommd/75

    Call Trace:
     <TASK>
     dump_stack_lvl+0x93/0xd0
     print_report+0xce/0x630
     ? rfcomm_sk_state_change+0x3a4/0x3f0
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __virt_addr_valid+0x20d/0x410
     ? rfcomm_sk_state_change+0x3a4/0x3f0
     kasan_report+0xe0/0x110
     ? rfcomm_sk_state_change+0x3a4/0x3f0
     rfcomm_sk_state_change+0x3a4/0x3f0
     __rfcomm_dlc_close+0x1a6/0x6d0
     rfcomm_run+0x1b7c/0x5390
     ? __pfx_rfcomm_run+0x10/0x10
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __pfx_woken_wake_function+0x10/0x10
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? lock_release+0xc8/0x280
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? trace_hardirqs_on+0x18/0x160
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __kthread_parkme+0x175/0x220
     ? __pfx_rfcomm_run+0x10/0x10
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

    Allocated by task 513:
     kasan_save_stack+0x33/0x60
     kasan_save_track+0x14/0x30
     __kasan_kmalloc+0xaa/0xb0
     __kmalloc_noprof+0x2d7/0x770
     sk_prot_alloc+0x13e/0x260
     sk_alloc+0x37/0xb40
     bt_sock_alloc+0x40/0x3b0
     rfcomm_sock_alloc.constprop.0+0x56/0x290
     rfcomm_sock_create+0xe6/0x170
     bt_sock_create+0x171/0x330
     __sock_create+0x2c4/0x730
     __sys_socket+0x141/0x210
     __x64_sys_socket+0x77/0xc0
     do_syscall_64+0x115/0x6a0
     entry_SYSCALL_64_after_hwframe+0x77/0x7f

    Freed by task 515:
     kasan_save_stack+0x33/0x60
     kasan_save_track+0x14/0x30
     kasan_save_free_info+0x3b/0x60
     __kasan_slab_free+0x5f/0x80
     kfree+0x307/0x580
     __sk_destruct+0x64f/0x790
     sk_destruct+0xb3/0xd0
     __sk_free+0xdd/0x370
     sk_free+0x51/0x80
     rfcomm_sock_kill+0x108/0x310
     rfcomm_sock_release+0x122/0x1a0
     __sock_release+0xb8/0x270
     sock_close+0x21/0x30
     __fput+0x39f/0xa60
     fput_close_sync+0xff/0x200
     __x64_sys_close+0x8c/0xf0
     do_syscall_64+0x115/0x6a0
     entry_SYSCALL_64_after_hwframe+0x77/0x7f

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
This patch was written with assistance from Codex (OpenAI).

 net/bluetooth/rfcomm/sock.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/net/bluetooth/rfcomm/sock.c b/net/bluetooth/rfcomm/sock.c
index 3ec2fb4ce5804..948f0da417bdc 100644
--- a/net/bluetooth/rfcomm/sock.c
+++ b/net/bluetooth/rfcomm/sock.c
@@ -65,7 +65,8 @@ static void rfcomm_sk_data_ready(struct rfcomm_dlc *d, struct sk_buff *skb)
 static void rfcomm_sk_state_change(struct rfcomm_dlc *d, int err)
 	__must_hold(&d->lock)
 {
-	struct sock *sk = d->owner, *parent;
+	struct sock *sk = d->owner, *parent, *parent_ref = NULL;
+	bool kill;
 
 	if (!sk)
 		return;
@@ -82,6 +83,9 @@ static void rfcomm_sk_state_change(struct rfcomm_dlc *d, int err)
 	parent = bt_sk(sk)->parent;
 	if (parent) {
 		if (d->state == BT_CLOSED) {
+			/* Keep the listener alive across unlink. */
+			sock_hold(parent);
+			parent_ref = parent;
 			sock_set_flag(sk, SOCK_ZAPPED);
 			bt_accept_unlink(sk);
 		}
@@ -95,11 +99,14 @@ static void rfcomm_sk_state_change(struct rfcomm_dlc *d, int err)
 
 	release_sock(sk);
 
-	if (parent && sock_flag(sk, SOCK_ZAPPED)) {
-		/* We have to drop DLC lock here, otherwise
-		 * rfcomm_sock_destruct() will dead lock. */
+	kill = parent && sock_flag(sk, SOCK_ZAPPED);
+	if (kill || parent_ref) {
+		/* Socket destruction takes a DLC lock. */
 		rfcomm_dlc_unlock(d);
-		rfcomm_sock_kill(sk);
+		if (kill)
+			rfcomm_sock_kill(sk);
+		if (parent_ref)
+			sock_put(parent_ref);
 		rfcomm_dlc_lock(d);
 	}
 }
