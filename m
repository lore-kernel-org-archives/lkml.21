Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795661121;
	b=fnDUtofdvfS2/Ut/grJ6rwQpgWgy6DorboFy1Woih+yMfAUj5QKiO+BJGMOi/iYneveJ
	 9xBRXB3i2Bz8wtWn0mYRYV7kt586F3NDQMUAc/gU226xGkZELNpY9YFs6eUWvuQekLLH4
	 C4P1RKxTbixgC20BorFIMxRfVOQoqw3Rt+EXiPZn0kN/aWgygr6Mvenfg+c+htCs9Fgw4
	 rK4I+q4K/LDFhDLhsOEHgHlKy6J8UYyFPCNFKLRcbH+Za70UbEnXs8c/dke6Rub+zldGS
	 O7DH7gPscBc7wRI94rqxBp49MWvFgbig5z2xSOfgAnpm4z8RX4q8hv1yGYocmdmMjqQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795661121;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=BVVtxRQR2c1odrFLqnW3DKGczk+oTc7j4hOWGW8oEfo=;
	b=zM7ousr4i4f12XTKKzZm7umez2uj/g7bRrh37GhtfHGm0QEjx6UFYdw9P6RIEfLg7cJN
	 H56v6565jmATpZ/PkDDwBhwMDK/aoizKj01E5ov8GlRx4hlZF9WRAiN1W6qtwMYJY9qFn
	 TXR26WbnSuXcRu7vqUfCtddq1VIZYZykUz3PSvOLGmHd8ftHmCRVevsQahixC2iigBZXb
	 fSbuRfEF6gIrr6VyufVknh3ip2aqSSW+5nnKDswas6zyRYMOA1pvKBT+wXaXoM4Lk5+0f
	 FKBlcZXCMtm5ipwNst17iRvZnGX97Nk8tbl+Swtor+2fbKZd38xHzjZmaVzTE1XmnVA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=certik.com;
	spf=pass smtp.mailfrom=certik.com;
	dkim=pass header.d=certik.com header.i=@certik.com header.a=rsa-sha256 header.s=google header.b=LVP9T3D1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B49606A6B6
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:45:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6B49606A6B6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=certik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=certik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=certik.com header.i=@certik.com header.a=rsa-sha256 header.s=google header.b=LVP9T3D1
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b4cc793704so51251587b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:45:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795661120; cv=none;
        d=google.com; s=arc-20260327;
        b=iZteeAcp+3b+QhpBvCb9ikBcrYwsD3aQgIB9C5id7/R+LfloMy6gBJDMYxUq+hIeAj
         NfHaDqo41YdIX1mPmNJzPWtP8fgocMSWvxi1fx9mqsS7Y53g5lNxZPUmG+1/lC7hZc2p
         BmFI9BNGUprisUO5jXh4vbMN4ocMRPrjiMeuQMcsvyqkv7MXPfxfyaYi/Rt3eLkTEK+/
         DuqjlkOzsB9CeREnWW29EdeZAOnczlinpSEVUnpDoMLw6b+vj/z/7XXHsZ5HYSrYq0iQ
         rbufP9cZpRk2zXhjpSwcQLAcaZkuhSPeFXKsafreOiEn4eM/967nP4XbX7wli0vnljva
         nXYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=BVVtxRQR2c1odrFLqnW3DKGczk+oTc7j4hOWGW8oEfo=;
        fh=Wcyw+9zpcWf7LcC/LTZZ3niuGcw43kywsFwND1hSW9c=;
        b=ADcr0dHy4Y5ksjWXdixphN6a4tkv/DbK8duAnOAgC+YeNQ7QUnam4Xc7BAAS9n8nC6
         wnfTgi0LCsYf6NmE9iUSsEe1rrpXAc50vINAl1BkRL4SVQbiuCN+uJodWSdr/qcdEzSb
         lj/IEJy5zXJkUaJJkrOAAYT+IvMD3Q5Xij51iXE9AkRgzgIUi/dvqlVnPO0jSn7IVTGo
         xN+r4D9OV0oaqqCG+IgyZ+r/wupX85dEGuVQYdznLni+rczimxY6mlO19Yovx1FjRtDC
         cQc4tb1X8cc4Fz1Zo0t0nd9L+hDJqcAfsd4Cfe3u2mxY8zxL8FQ8shRPontaNwuCB6s1
         zNqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=certik.com; s=google; t=1795661120; x=1796265920; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BVVtxRQR2c1odrFLqnW3DKGczk+oTc7j4hOWGW8oEfo=;
        b=LVP9T3D1P2CORJjI2mzNo2E8aivFJEsj5ZCMu0hVJFF+WOXBJZGvTJGmLusLXs1jHy
         Y2Zfk93H3xYQtAjJACTq9Io604Ujq8OwQOncjeyIpR7aUUC5HFeYjxK9Dfw5xmYpa2XQ
         TcHUeU9LG6VF4DrplhkVa0dAd/XU00pcIk4CA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795661120; x=1796265920;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BVVtxRQR2c1odrFLqnW3DKGczk+oTc7j4hOWGW8oEfo=;
        b=FO2hNl0SnF9XeL79ZEH/gvyh83Tg1Ba42ZQxOO2Z5z3ixWSEuSzc4+eKpmLYSN1UFI
         Kxe//6yLui/vsTB/N3XWU3e/has34qT2mtHFAp4pCDQH3n9VNAx8aIrTxFP43XiciQVP
         3Dy/63DC3ZklE+V6vHSPjqb5NaxtMQdqJdXCrOx9z46Uparf4X0L0BZ9VbDsOsoJwel3
         clS8qPTcb1D/dPfu3FhpjajJB8OehRO8LrYE1g8fs3yyTh6uWlUVD11CJ3PB0/KRBn3x
         O0c552ynQuVv5IX0NgXLDrmkduEkQZWvS7DaP4tawfz+bon8zJAT8tkarLfSFELEDH/U
         dmBA==
X-Forwarded-Encrypted: i=1; AL+hErHqX4mVdl38i/JycvX8L5xJm170USQKR8DiUomK3+BzB/6QF7qIO0zL3yoTu1U6eS5S54bRZt9T6xZnqtk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kyUyKkW5eeoIWMrWMrHcHPXldo4AaiAdLgTIeW2bRO52BkbBt
	l4tnMYdrF00IoceBuO5CxL9zgnGGE8bkseYZhcAd3O/rT1P47tCUYeHZDLSECGyrgCdHD2gIQbT
	xS3923bDskzzcdgQ8op5ZV8C76odjbKt+aJPeKbKQzQ==
X-Gm-Gg: AZFdTZfjVe868+AKNzGEdBM45PPI3b/jXCz9uRyerFCNkt4ayHBCiItX0v5XPNjKnTL
	aMZ4vK/S+k7gFyGs/Y8Ay8RuRYfZSQ7NT1CbmHQ6HAIFbuQYRcLnfWCQLIdNyJ92NS6PUSuMR4T
	oM8cpkTA/91ip1E43hgpF0WcHzbH7H0L6GOEb0jr+JHSUFiSYxSQzCNWlZbZRyT2Mvzw3gyW/Fd
	OpUHmuAbvkdsf5Yy9aFgAaVlMgy7bFtSedFgLcas4Ei3ThovljBWzYIxX0BSsjxUquIZADiwOKm
	AwmWzAQK+gefv3iuUDmxZWysFh17H36sPBtXPvcTqxmANkTS5FVPFKZZqH6q+Nc9CD8ByeU5KlS
	Wo9ht0kUlPFQncfcpIm5t1Euvesrb5J2taQ1ankg1mnz0O+H0VVjKj3/U6G54CSHq71Dyq5ivDa
	TF1MojVuYGUnfRk3iZMq8vjL3t8U86j4OdC2sg+4q7gAb7fxOsX/fgnxai2cYQC1UTemWwUkjtD
	ATEBKlYe0KxRP+eKx2vVKFEDwHe/6yBEAw6
X-Received: by 2002:a05:690e:400f:b0:67d:ac2c:4002 with SMTP id
 956f58d0204a3-67df4426038mr7064542d50.52.1795661119519; Wed, 25 Nov 2026
 18:45:19 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 26 Nov 2026 02:45:18 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Dickson Wu <dickson.wu@certik.com>
Date: Thu, 26 Nov 2026 02:45:18 +0000
X-Gm-Features: Aa3M54o1btClIfGPqi_HHsbGj1g4M5yJF-L-0_Xbeo7jA-sEsC8ThBYnsY2FlOk
Message-ID: <CAFaZ9epucF3AKE=B3mB9JD1sAcorBQDsgre_Wnv8Sati=tomPg@mail.gmail.com>
Subject: [PATCH 5.15.y 2/2] pid_namespace: prevent TIF_NOTIFY_SIGNAL from
 interrupting the reaper
To: stable@vger.kernel.org
Cc: Christian Brauner <brauner@kernel.org>, Oleg Nesterov <oleg@redhat.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Christian Brauner <brauner@kernel.org>

commit 5c0985dd3c32fc2bbd0e8beaf13cf52cd97376a2 upstream.

Since commit 7fea700e04bd ("zap_pid_ns_processes: clear
TIF_NOTIFY_SIGNAL along with TIF_SIGPENDING") zap_pid_ns_processes()
clears TIF_NOTIFY_SIGNAL before every kernel_wait4() call. Otherwise
kernel_wait4() doesn't sleep and returns -ERESTARTSYS if
signal_pending() is true and the reaper busy-waits.

But clearing TIF_NOTIFY_SIGNAL doesn't fix it. It can get raised again.
For example, klp_send_signals() sets it raw against any task that hasn't
transitioned yet. And it keeps sending it until the livepatch finishes.

The sleep loop waiting for pid_allocated to drop has the same problem
and it doesn't even clear anything. So a schedule() in
TASK_INTERRUPTIBLE returns immediately.

Use a no_notify_signal guard. signal_pending() will ignore
TIF_NOTIFY_SIGNAL and the pid namespace reaper sleeps until a child
exits or free_pid() wakes it.

Link: https://patch.msgid.link/20260824-work-tif_notify_signal-v2-5-6609e42b3157@kernel.org
Fixes: 7fea700e04bd ("zap_pid_ns_processes: clear TIF_NOTIFY_SIGNAL
along with TIF_SIGPENDING")
Reviewed-by: Oleg Nesterov <oleg@redhat.com>
Cc: stable@vger.kernel.org
Suggested-by: Oleg Nesterov <oleg@redhat.com>
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
[ adapted to 5.15: explicit save/restore instead of guard() to avoid a
declaration-after-statement warning ]
Signed-off-by: Dickson Wu <dickson.wu@certik.com>
---

diff --git a/kernel/pid_namespace.c b/kernel/pid_namespace.c
index 40b011f88067..d3e860d3678a 100644
--- a/kernel/pid_namespace.c
+++ b/kernel/pid_namespace.c
@@ -167,6 +167,7 @@ void zap_pid_ns_processes(struct pid_namespace *pid_ns)
 {
 	int nr;
 	int rc;
+	unsigned int no_notify_flags;
 	struct task_struct *task, *me = current;
 	int init_pids = thread_group_leader(me) ? 1 : 2;
 	struct pid *pid;
@@ -212,9 +213,10 @@ void zap_pid_ns_processes(struct pid_namespace *pid_ns)
 	 * kernel_wait4() will also block until our children traced from the
 	 * parent namespace are detached and become EXIT_DEAD.
 	 */
+	/* Task work must not busy-loop the reaper, see signal_pending(). */
+	no_notify_flags = no_notify_signal_save();
 	do {
 		clear_thread_flag(TIF_SIGPENDING);
-		clear_thread_flag(TIF_NOTIFY_SIGNAL);
 		rc = kernel_wait4(-1, NULL, __WALL, NULL);
 	} while (rc != -ECHILD);

@@ -270,6 +272,7 @@ void zap_pid_ns_processes(struct pid_namespace *pid_ns)
 		current->signal->group_exit_code = pid_ns->reboot;

 	acct_exit_ns(pid_ns);
+	no_notify_signal_restore(no_notify_flags);
 	return;
 }

-- 
2.43.0
