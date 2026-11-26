Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795661119;
	b=sUK+Ji17t4VC8M1rmGU/r7j4ntl5YTCAgnTw9+LGT9PbljMvDGMNDSLlJFuxMff2IJFI
	 EnQQISzw8rDM4fcmFL2aQdj/T5zgwRiOlk2OyMNX21bYIauyAEqOtm30m+9pvYOTWyRKG
	 EDRN8mLU+9efw45OXFDf+/tjnoaYnJM9upabnzwLYofm7ctFGIFotvo2kiDr0zb2ac8bA
	 19WKwZKgnt6VTrYWzs5t6mE/stNA80aRX5W75SEQo636+ckoN0pLfM0v+0F4LfRgXT5iW
	 VzMHEvShWBWuhnwiw8C13MHcwEZVdk1JFFz5RgReg2R1simrx+16XjL412qo4XaPKkg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795661119;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=D0zUcqm0LArVGjUdPeqXQxQsBa36gzl+dj/r8CT2+pI=;
	b=svE1L3spwM8frdtZsnr/kK5xqt/R0Z5ZyDzAknWvgYKfO6Rk6U/DSv5i455X+zS3zlHx
	 2TR7CVQ5uT/ugZioZNccavama0Des7XWRLeivxp1txIsxHKiHlfD20GKNl41QOP+f1UP8
	 Oxy4uwCwl4ajOp17P9R6utahmT48Eqxyu6djMdQLHWpLeGVqx9ODWmpotoDTS0iFBvISF
	 S09g3yE2XYPriWhgd/6Tyd/361xmqATzCcXdwOqtHsYzZrNMS+7UhcutWUs3vcSXOB6QH
	 8FHsg72q2jHQ0sC8SLodLB8xtL8I+/2Oi5Cg9W8vISwxiADVJvGNcDEKpttPt8i42uA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=certik.com;
	spf=pass smtp.mailfrom=certik.com;
	dkim=pass header.d=certik.com header.i=@certik.com header.a=rsa-sha256 header.s=google header.b=T0nJ4ZjR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.43
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F82606A689
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:45:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09F82606A689
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=certik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=certik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=certik.com header.i=@certik.com header.a=rsa-sha256 header.s=google header.b=T0nJ4ZjR
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-675617e81f9so7459573d50.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:45:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795661118; cv=none;
        d=google.com; s=arc-20260327;
        b=b2jLbNSxaZqdheGp83o0h62N6EAXEWDrjO9CJ1e4t5Ss3BpI6TDqMrZBy+T8A9gGst
         k3hp8FD6e/nge0G0WT0E7OwNXWkUsBczYRxsqaK6pYPingf93TdwWMNLRjk2r8tR6lpf
         02gXReG85nHfneJueGtrEhI4qy87FOpTpp7dEmGBdgH/HboZsYtDDYAySSIr66a0s+Nv
         fpej4rwSkrZE2bE+YntL9QPgrIYwFB2EWsy0LXcpvDwKf/yDryyBKg55zRUc5Bq0xMB7
         Vjejpvr/VlAaX3Q86Y17Ueq/3tn5V5MHI/QRqittlTUTj/Dv88NPHdxm7JlOFQKBN8uu
         SzOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=D0zUcqm0LArVGjUdPeqXQxQsBa36gzl+dj/r8CT2+pI=;
        fh=Tj8sHNCC7RVtwcHppTIQGyhWoobliufyClOh6/HQ2wg=;
        b=qijLIhNDxuHIaj9xObz2JNrIxXsm/YSN2m+WxJtY0C24JqqmMXqz3FDFhZDMwpjIX1
         jSvcQyNOxn/2NKzDQfggSYXuH4suhL48BQ/x/brokJOyL3Qs3hEsnV0AM3yGB6DdUTrl
         l7o2EfpcBFiq1pqIGZCjkgZetU0wIDJyfBLXaOXv811OWs+TTVZKlYUJ3h96cEWSXOOL
         nqyi9NNWeHfH0CfQCGQLNcKIREMshnvgg7vJhBuz6YUCtAar6ve0Y13rwJkIUGWYkK38
         yDzjs6ObBT4GPJ2CVyVTUnRgA6f651iDBi6WcLwbldG0Aotwit1Nvy02xASYax6GtIiD
         0dkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=certik.com; s=google; t=1795661118; x=1796265918; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D0zUcqm0LArVGjUdPeqXQxQsBa36gzl+dj/r8CT2+pI=;
        b=T0nJ4ZjRXmyGh2nx7gflbplcqd2MWlUYLwSYxN6EXWl5fspT/s6i3ifGaLew3nt6rH
         8nNqfgZXX+DtxMsNqtlo8ypdAF9vgYp9QYAffWIbDIyVXUBm+jpMHnJrxOvCIHflNat1
         n4qtxmZXMVicuUHyUSV9oEfIRVOQ/9UnFcjO0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795661118; x=1796265918;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=D0zUcqm0LArVGjUdPeqXQxQsBa36gzl+dj/r8CT2+pI=;
        b=kFY3W1xDStkXM2/vLx/vckvuHFTOxz0NcK3P6731qS3As4HIdOwGUCR/AMGg7fbjAM
         Ec1Pc2zlzZDptmUPifH3zeSHy2ILmlD+q/93jo713fy0vSjwV5tH6GOxRULdLjJ781PZ
         rqc3JJMczJiVN12PoeBkBNDzgmTgYLL1YA3zDq8HNt9ndlz2HlkVSZAPAlnNpssyiRpu
         kvGat9qAhLWQWAgrkP/2BpKi+ufDMGxLFgpkgp6AQzUU/MjdjDjtbzw78tV9j77Ftq0S
         UOZPwXBCl3UOtjxXT8STjoULqQa4gC92aZbCRYKebfQ10SLH2w0Gu36K7QqdlCdqu2cd
         ZJ9Q==
X-Forwarded-Encrypted: i=1; AL+hErHOPCMvBm68w8TDaXWx6tQ5RTS6Pd1bnBRI2G7ZrmclNnrhlzXTWJYWO3hUO30GjMnPpbAlNvU94CIfqUk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8KrB12yK8sHIFzIcTukefg8+PiuhdySOJ6cy/Mq5S60a1s5PGn
	8FvXSJFLFaHz0uhqpOCYjhE+1JPISFHR25EIzd4uWhdUqy0kvyeY1sy1SrL+iweBteJfuivD9rR
	60NqsJuIuzjePP5XFS+DR4PMnAm2aIIbPsH9Qwr7BxhpHpw3uAAwklY0=
X-Gm-Gg: AZFdTZcqSr+bvvYAw5u88ifq2YelETQpP4LxAvdZelikoR1t8wi4SpxCEDafsOsJJre
	vSSTQloDMG0A1LNxPz3+FKhugwUxcPRIsLEvD0H0MELG8qpNIUcYH6NTOa6f6ZOfgkUwGJU0QkM
	w3f1QDBclHQVeHlzCJ5ZNqel5EIZrBXvEcECxsQGblCGiMUv22kMSrrYVuQRm1MPqSRYk73fwFZ
	c7SWEn82y8J/Mgc3rN4TwyAK5VD0P6mLSAhQuXHLnZgfa6B6dJgW6nVKyRgUxxwG2+2QFhxbbdJ
	ooLRIe6r69R9+ynegetFTAL3lHe5HN6n3yCNIDE+jiZRddSjyDO+ZJx8zJpsnK5iVmc6Fg1B1NE
	md2aQTUExwSdM96qLQdV3i5E+D6ObyDU6KAcmmrW7mc8lYBKV7SURa2Eh47ow1c9HLeygk0GyhD
	I5kWiQwQlKF5AorjHU3XYT5/tAIpKMkyVFmtoR5ufWACh99qeqXfxgXIwE56l8USCPhItbNSLf/
	LJUUyc7Mnk1XzYvNKuOsnTUdl1X4pstWX4tkRUY28XnwuKnduWaRsj9Mw==
X-Received: by 2002:a05:690e:190a:b0:67d:ebad:8c79 with SMTP id
 956f58d0204a3-67df43cd1damr9240466d50.26.1795661117914; Wed, 25 Nov 2026
 18:45:17 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 25 Nov 2026 20:45:16 -0600
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
Date: Wed, 25 Nov 2026 20:45:16 -0600
X-Gm-Features: Aa3M54o_FkKMyMPQ76iVqaRJQDs_ogTl2m96GprmqGGhavz4dlD9Q5rYhhV_j4I
Message-ID: <CAFaZ9ep64RtaNeyK42OVLSCwD_g-E5RqjP4qbK0=45unkG=Zag@mail.gmail.com>
Subject: [PATCH 5.10.y 2/2] pid_namespace: prevent TIF_NOTIFY_SIGNAL from
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
[ adapted to 5.10: explicit save/restore instead of guard() to avoid a
declaration-after-statement warning ]
Signed-off-by: Dickson Wu <dickson.wu@certik.com>
---

diff --git a/kernel/pid_namespace.c b/kernel/pid_namespace.c
index e032b1ce7964..2c525208b6ad 100644
--- a/kernel/pid_namespace.c
+++ b/kernel/pid_namespace.c
@@ -174,6 +174,7 @@ void zap_pid_ns_processes(struct pid_namespace *pid_ns)
 {
 	int nr;
 	int rc;
+	unsigned int no_notify_flags;
 	struct task_struct *task, *me = current;
 	int init_pids = thread_group_leader(me) ? 1 : 2;
 	struct pid *pid;
@@ -219,9 +220,10 @@ void zap_pid_ns_processes(struct pid_namespace *pid_ns)
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

@@ -277,6 +279,7 @@ void zap_pid_ns_processes(struct pid_namespace *pid_ns)
 		current->signal->group_exit_code = pid_ns->reboot;

 	acct_exit_ns(pid_ns);
+	no_notify_signal_restore(no_notify_flags);
 	return;
 }

-- 
2.43.0
