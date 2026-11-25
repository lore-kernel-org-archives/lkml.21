Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795635521;
	b=2nDdNqjuoM190S1Vni8jkeTZ/UewReJDIO6EOGPtpbvkigBpxlxwJYNmGCbdkS0/LF6T
	 Mn6eyD24OnrmNtZcAmOI4q80UVZBbdyg6O//SdF0vcJBHP1wBkXlKhVXS44Orl7pM/ynh
	 SB41ByEtqtqj4nTYJzvjk32rx+pUJS6fbrlaE8Sy0Xch2tYW16y6I12SCYRptQI5f7JqM
	 4l8GmZBCjIaDGktVzBYU4VrMrXikvPwSPVonC3of3p/7xlPoaXuC/rABr+N+OYsCU1jI3
	 UwTSmAIPVU/Gyg+VI8ZtCF8gQV3hRYpft406io+KEqbO9RRhEywQtUxubfAPSXHLGwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795635521;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6wTnULH75vJSwiwoODIMLxKb+zlMScOTEx4i9CMk/nc=;
	b=Lqcnec/5uAnRrVQtI0CgRkBa63oQuYtPIUfVZLldeD6223VDLr6niBDZoCEb6+KmuXxm
	 V9zCMNtbMSKWqHrLS8ex0aRbwABw+oUNBqBuLwoTzjOsm/Po/R3+ITQyq3Q9RFyBrwGaO
	 I6l/mVcKI9KBDpRZTndX8pAMgxFNS/4z/NH4t6E4A+Rj+Vf+H4XFoPI6kaklnM69DeNno
	 bgVb7SjoavMZ5gtwpDN2jcXeffR9xCh/hRvZzR1l2TE7EVq/gjQbWTgbQBs3v+3SSe7Mn
	 PcjqAbkA7E7uiS+Uw+OCK3B0BAQXxKcZHHu9uAlnXquAjM2wGUQ+GndXaZEWU4KLhMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k+FCSUCv;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A012606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:38:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A012606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k+FCSUCv
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1b563e32936so2163375c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795635520; x=1796240320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6wTnULH75vJSwiwoODIMLxKb+zlMScOTEx4i9CMk/nc=;
        b=k+FCSUCvDpX4i/W8kPyZVk3YdLizmtnxCmt94XBilrEbAtxCeVAY0AZqZt4CSnwLLi
         NFh9VxBs4haSQhz5kcrOua4Gbeu0Fk3cMgDmu9kMFJqpNA48JBcEFTy8O73hnL6dfM6X
         FXct+cBNtBbtY/8mha1f9bwXKySLUk6pgCUC359CSmkyDlqo5vVrYk5aSZJw2dJLFaRx
         /OZrrv2nu8YQZXVG8G99mW7fiyQS6Ok6WD7UhGvNilS6uH9V2AgOx71VikZtni7Ql6gD
         IeF6TVXz42LTK9s6NEGpIytWKWuoZxFZiJz34oX1uKgyfotGNoEpmEGdegbv8n17iUrd
         scpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795635520; x=1796240320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6wTnULH75vJSwiwoODIMLxKb+zlMScOTEx4i9CMk/nc=;
        b=W83Eb+oBDObYj1l2CgY5TWS8Qtq/gmqEaxljt/cMWe2hbuKRzgZzgfIIDZBNRUjnKU
         ZFOD7VSH1mBlccFMmOW+W38DKZazbXODPX1pm6vhdyojuyIQPRcogqCtkZZvwz1Sx2Zj
         DNfuEGtkqtb184CxxnjrAQfoIJGCUXP2QVZqKYbC6yFC8W3HR/pYh4pcL7iYYYiUmoQD
         KGXh26PT/Vn+vwlbNr5GbZK6m4t42DjFg1nGQF7su+bGBkbsoosjybVY12GqoxdLol6y
         Zgw8QB0+rfxrrypQR8I0I6GfiUYvfj63A7LN+lsWC907xkxR8vM/Dh8ZYQZB6v0fVxvw
         mS3A==
X-Forwarded-Encrypted: i=1; AL+hErGHr7pY9NDiZML1UjpYUPm6fvFnWD8tvIwAcoxlGPtbfyWsbN6XhLuqejiaPWdwd5Dd/zO9DZUIVBDNFLc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9TpZntGAnCZUoVJzHSvasi6x5qJxk81HXzsRayc8qOJ4/jyzwF
	tti48DUytufwxZl659qFqqPha+4uBVny/vtSlmVTJzy9G6rUT04dgG8E
X-Gm-Gg: AZFdTZduapqU170LY+9gic7ulEieo2Uy9mG38WQfNyjWJyGDsBZmaH4qQGtPVUkvMm5
	8GrKTyqQPj/HvaglvlBjObExAvBaFKiURMrFiBUwUbOgjJ9Muh9FFSvrggMyZ+Wre1rjdq6G93P
	G6RiIDMUZGMp0H0tBsWJio6iSl8ZsR9mKS5+UOJKBtGZ9hRWKLycVGQkLzTsSNJMUdBaG3T4kT0
	sbfCmNaZ9R0ICcikzU2ZUlCaQMgHUR4+9Bo2FTsqSv8HjTqmhhW505yyNzGiTw+DNMsKPDHMauX
	S5/6cHC33HYY+wDrIHaWs40hNJjcvqEDw1coF+t+DDAJaYd60E0IsL8tsHP98f5IWlzjbJDGJ6v
	GVKy28tDuRh5FHfDZ8hxti168w21qmnbShVmdn24qZWSh9esn9PPXUr6ZHUQDN9bm4Frz4x990N
	hMpnMx4CIyxsulEgoOUA7aK/Wjh3SOc/FQd/vM/ZU5zTA0GLh53Rkdsgz6CmagsTCe/ox0lwWeM
	VH6HwogALOWPXNTCgDcX1YKr90JV8IybBCsK2m8cRk2OjUxSgez3S4oPsMBo574FDsL0rXR7P9p
	cxwSp9l/DE8HlBmTHzDIK4vJGpZq46iZMYuPTha0YZhQhNBw//69RdRvUls9pVvozpg=
X-Received: by 2002:a05:7022:170d:b0:1b5:1c22:6fea with SMTP id a92af1059eb24-1b5566a60efmr17005635c88.0.1795635520254;
        Wed, 25 Nov 2026 11:38:40 -0800 (PST)
Received: from localhost.localdomain (wood.seclab.cs.ucsb.edu. [128.111.49.37])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b562a82b3fsm50810012c88.5.2026.11.25.11.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:38:39 -0800 (PST)
From: Praneeth Balasubramanian <praneethb2002@gmail.com>
To: Lee Duncan <lduncan@suse.com>,
	Chris Leech <cleech@redhat.com>,
	Mike Christie <michael.christie@oracle.com>
Cc: "Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
	open-iscsi@googlegroups.com,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Praneeth Balasubramanian <praneeth@ucsb.edu>,
	stable@vger.kernel.org
Subject: [PATCH v2] scsi: iscsi_tcp: Take sk_callback_lock in the recv work
Date: Wed, 25 Nov 2026 11:38:26 -0800
Message-Id: <20261125193826.3466197-1-praneethb2002@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <4fc02402-4ab3-42d0-8dbf-d0a36a125e43@oracle.com>
References: <4fc02402-4ab3-42d0-8dbf-d0a36a125e43@oracle.com>
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

From: Praneeth Balasubramanian <praneeth@ucsb.edu>

With recv_from_iscsi_q=1, iscsi_sw_tcp_data_ready() queues
conn->recvwork, and iscsi_sw_tcp_recv_data_work() runs the receive path
under lock_sock() only. The data_ready path runs it under
read_lock_bh(&sk->sk_callback_lock) and returns early when sk_user_data
is NULL. The work does neither, and that causes two problems.

First, on teardown, iscsi_sw_tcp_release_conn() calls
iscsi_sw_tcp_conn_restore_callbacks(), which clears sk->sk_user_data,
and only then flushes recvwork in iscsi_suspend_rx(). Work that runs in
between processes a socket whose callbacks were already restored. If
the socket is in TCP_CLOSE or TCP_CLOSE_WAIT, iscsi_sw_sk_state_check()
then dereferences NULL->session. With a delay added at the start of the
work to widen this window, a target-side connection close gives:

  Oops: general protection fault, probably for non-canonical address ...
  KASAN: null-ptr-deref in range [0x0000000000000010-0x0000000000000017]
  Workqueue: iscsi_q_3 iscsi_sw_tcp_recv_data_work
  RIP: 0010:iscsi_sw_tcp_recv_data+0x219/0x420

Second, the receive path was written to run with BHs disabled. For
example, __iscsi_complete_pdu() takes session->frwd_lock with
spin_lock(), and iscsi_check_transport_timeouts() takes the same lock
from a timer. From the work, BHs are enabled. With lockdep, an
unmodified kernel booted with recv_from_iscsi_q=1 reports as soon as
reads run:

  WARNING: inconsistent lock state
  inconsistent {IN-SOFTIRQ-W} -> {SOFTIRQ-ON-W} usage.
  kworker/u10:2/55 [HC0[0]:SC0[0]:HE1:SE1] takes:
  (&session->frwd_lock){+.?.}-{3:3}, at: __iscsi_complete_pdu+0x4f7/0x2420
  {IN-SOFTIRQ-W} state was registered at:
    _raw_spin_lock+0x2e/0x40
    iscsi_check_transport_timeouts+0x4c/0x5d0
    call_timer_fn+0x19f/0x630
  ...
   *** DEADLOCK ***

Take sk_callback_lock with read_lock_bh() in the recv work, as
iscsi_sw_tcp_data_ready() does. The receive path then runs with BHs
disabled, as it does from softirq, and is skipped once sk_user_data has
been cleared.

The unlocked sk_user_data read was found with an LLM-based tool that
checks callers against the locking rules stated in kernel comments.

Fixes: f1d269765ee2 ("scsi: iscsi: Run recv path from workqueue")
Suggested-by: Mike Christie <michael.christie@oracle.com>
Cc: stable@vger.kernel.org
Signed-off-by: Praneeth Balasubramanian <praneeth@ucsb.edu>
---

Notes:
    v2:
    - Take sk_callback_lock in the recv work and skip the receive path once
      sk_user_data is NULL, as Mike Christie suggested. v1 passed conn
      into iscsi_sw_sk_state_check() instead. That avoided the NULL
      dereference but still let the work run after the callbacks were
      restored.
    - I went with taking the lock rather than calling iscsi_suspend_rx()
      before restoring the callbacks. Taking it with read_lock_bh() also
      fixes the frwd_lock report above, which reordering the teardown alone
      would not.
    v1 and review: https://lore.kernel.org/all/4fc02402-4ab3-42d0-8dbf-d0a36a125e43@oracle.com/
    
    This was found by an LLM-based static analysis (GPT-5.6) that checks
    kernel code against the rules stated in its comments, as part of
    research at UCSB SecLab. The patch and changelog were drafted with
    Claude Opus 5.5. I reviewed the patch and take responsibility for it.
    
    Testing: two QEMU VMs on next-20261023 with KASAN and lockdep, an LIO
    target and an open-iscsi initiator booted with
    iscsi_tcp.recv_from_iscsi_q=1, using CHAP and continuous reads.
    
    - The teardown race: both initiator kernels had a 20 ms msleep() added
      at the start of iscsi_sw_tcp_recv_data_work(), and the TCP connection
      was closed from the target side. The unpatched kernel oopsed as
      above. The patched kernel ran three times with no oops and no lockdep
      report. In one run, a test-only print showed the work reaching the
      new check after the callbacks were restored, with the socket in
      TCP_CLOSE, and skipping the receive path. The race needs the delay to
      hit reliably.
    - The frwd_lock report: it appeared in all 10 unpatched runs in this
      mode, including runs without the delay, and in none of the patched
      runs.
    
    The patch applies to mainline 9ba46df34488 and to next-20261116.

 drivers/scsi/iscsi_tcp.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/iscsi_tcp.c b/drivers/scsi/iscsi_tcp.c
index 9260b1c9b0e0..6d802b84f7ad 100644
--- a/drivers/scsi/iscsi_tcp.c
+++ b/drivers/scsi/iscsi_tcp.c
@@ -160,7 +160,15 @@ static void iscsi_sw_tcp_recv_data_work(struct work_struct *work)
 	struct sock *sk = tcp_sw_conn->sock->sk;
 
 	lock_sock(sk);
-	iscsi_sw_tcp_recv_data(conn);
+	/*
+	 * Teardown clears sk_user_data under sk_callback_lock before it
+	 * flushes this work. Take the lock like iscsi_sw_tcp_data_ready()
+	 * so the recv path never runs after the callbacks are restored.
+	 */
+	read_lock_bh(&sk->sk_callback_lock);
+	if (sk->sk_user_data)
+		iscsi_sw_tcp_recv_data(conn);
+	read_unlock_bh(&sk->sk_callback_lock);
 	release_sock(sk);
 }
 
-- 
2.25.1

