Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795671680;
	b=Q8glSunuGlQjKh2AZz5ZuSHqEwE/N0FvKJ2C+J5D1sKLuuM6ESJ3qL8FAiL/io8v3D+N
	 yP+mLorF2lMcTRdYWzly8GKB5RhUaYwrc3izXqjGapV5QpjIbwbwsZdb+98gZZFom3p71
	 D8MWRMaxC1+C4D9H/zOIPzVj4FEYn/S0FKuatfHW/r1iFJYN7HsldTfQ0SzN6D2PQH1kD
	 mUznbaBK/g/c9Ix7DG0zXxoKerS4sHQiZ95VvktitgaazjilqYjQIwbbzCNEnQqi5BT0A
	 3O/kFESrBE/CtlSyCG/d936a0ReAY/E/SiwLBnU3plKEEhZXWhi8SQniF3Q6T2NJEug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795671680;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:In-Reply-To:References:From:Subject:To:Cc:
	 MIME-Version:Content-Type:Content-Disposition:User-Agent;
	bh=pY8g3Te5pr8+4PaQDY1sqwdBVZLSZwW2B2TIxKwxNTo=;
	b=S6YGDcSahwxa9jh/ykUEdseLlWPbL5TzNlRlnCquqsSM32AO/XQRy6/lH6yGBILhiGO7
	 6I28fyTO4/hUzWgAKSkHhd5YNDS0pdZxL49A2Q/PNaCB6cdODOMKURZzQd9udgPBQOnGt
	 JZMtRBTF0O7oXWFzEhO0LeQKFjPLWRwzlVtfDcuXNMvYiPAKhJYapUesgAJeZz3hxBSuj
	 CjZu3DkXthuHahHRQa47QCic2ECf3nM0RFQS43S9JvcRg9KXWwAI3bTgOIVmCSC9XCCyB
	 MPM22xXvJsp6RoSxEvGD5fwVM1X78rFxOdK7tyF3IsLPz7o+6PPfyrUa206lbeT8eqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=YNdcfFJL;
	arc=none smtp.remote-ip=74.125.224.51
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0EA2606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:41:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0EA2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=YNdcfFJL
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-677bc4704cbso7822444d50.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1795671679; x=1796276479; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pY8g3Te5pr8+4PaQDY1sqwdBVZLSZwW2B2TIxKwxNTo=;
        b=YNdcfFJLT9nFiYuza8Tzo8Mvjb68nbjqLcJWBhigfLjutsKmLN+F37dSBKnqnbJ2uN
         DJjxECB6KL2iQlwgYdkE9txNIC4rdUe9mGfO4Zjq1s2y7ykPKXHcatVt1ERZP6xeACF8
         +2BxQREzX4puwiAfn+P/aQfas4qW7s7nqA5zA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795671679; x=1796276479;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pY8g3Te5pr8+4PaQDY1sqwdBVZLSZwW2B2TIxKwxNTo=;
        b=iDVHaFmElrUU83DsC17P5UrAgMCbrAuu4uP84h8ApkodkQqOXgsQ1R90mnjjUDXFJb
         09eNZoBF0LSHnqyCgFWhGuCC3ZUz6fovqqhHQo7ru5NWyESS2WyUxagzn2nIQZ1q+iEO
         E6GEy48/0mnIj+3OXZng0wuqlUVuVBwVnfMGLu4wFsohGDPktnZ7bdcD3UcuosVggRWQ
         6lRdJMiCX5yQ3VfkZWaN6gkl8QMNRTLe/t1XWu5oEQpB/B9XTvV3DzYjUahBvwuB6Wak
         Mdq90+RRtWhNfo8AKNTpaD3ab5Fx+Ji/uGwtTSWsM6yHMVTkTAKnJGXOTln28BN00aHf
         Dwlg==
X-Forwarded-Encrypted: i=1; AL+hErHiB7y35JX0Di03eht8WQGvghIGQORg7MXGcvom7QBjpMnvvLQ25g/4IzRQ/LgSySsw/dMVHgOjVUktBz4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/y5mfMBXBh4jc4bLXtVyPu0gGj74PJzui3Ohe3MW1aS16xugFx
	5pLPVetkrZFOw146lwaeGNO8AmLcG9xn101J8xiuY+6gVGxLV24OxppOJIza95s7Bug=
X-Gm-Gg: AZFdTZfOidGjoxRjqZRZMd6QdPSX2OCu2JJ09nR/W13CaOLBRQcjPEN3hljRrkHJlir
	wGFZg2wLg9yUK5Fyen34mKMfN7Mj8sxLE5bq5tU4jhNerQWCM6JMvCaoTIq0bUCUOe1vF91pQfS
	45AD4BdliVfZk4RHq7tQNPoaIUPRsAQs0zn+amfiYAW+jfAHWZzppynmq/bvUyAmHn+Vgnnzc+e
	A5fYSjdKbi2UK0nS6RWJBFOHaIetUAdiUVjjU8K16pMSkfPw0RvQ3eyBZNgw1CM3zjpSh1CX39y
	MRMUVfm6QnOGMBgR7KqcECiphZeWn/HioJ+vviZrT19sDDkU0Vugo1VJNPO+vY4VSokg8poJe9s
	EqRYmiFdREUu4qLIaziESX3q3johRCzn0OBRbhIWq5kRPbrS6UyN2OtFmQbpzuuZkVdyDPAdDIl
	uEs5zb/V7CVVNOiC0HmIER7LeCGs9yP0+wXPkSSI/goap8VvaBf2S1ZSOUWuYChcuUYD0o2acwE
	QubJFKv/FxqXuf+tbRmwPIPzmpgeSGk/CwNp5Ik/Z8CFmT8qxSVn47766SQd1vtn8Px49i73rwb
	ATMZgjk9tzDao/hN3ouOvmB7eNjP3GD0xvnIiYFUK+8jtrhjAbL+hl5mhKzyL3keoDp1r7s43wp
	hf5j2mN6SyTNzhXn/Z+Pw6R+t5ay7sUwzz+D0aPMvcf0vFxJfzjFW/e+weQwbakQmI00ITYSw9/
	ELSZeqyFRSAO2zrKEDMldIJeWVu5NYyz+lLn8i2p3j9KEazTE6AI5JtvqIdFSN2ksu/gqTTCgn6
	OeUxmUwRcgvEp5OxL0riWi/TGFP2kHhQjgaQSR4VRkZ
X-Received: by 2002:a05:690e:440e:b0:67d:acd0:4082 with SMTP id 956f58d0204a3-67df43f35b1mr3972170d50.42.1795671678757;
        Wed, 25 Nov 2026 21:41:18 -0800 (PST)
Received: from [172.20.0.2] (c-73-207-185-9.hsd1.ga.comcast.net. [73.207.185.9])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df335b3aesm9571526d50.12.2026.11.25.21.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:41:17 -0800 (PST)
Date: Wed, 25 Nov 2026 21:41:15 -0800
Message-ID: <27716decb1032bb5d00ab8a4560179e082d8a2c0.1795671629.git.chris@chrisdown.name>
In-Reply-To: <cover.1795671629.git.chris@chrisdown.name>
References: <cover.1795671629.git.chris@chrisdown.name>
From: Chris Down <chris@chrisdown.name>
Subject: [PATCH v3 1/2] cgroup: Fix divide error on long fractions in
 cgroup_parse_float()
To: tj@kernel.org,
    hannes@cmpxchg.org,
    mkoutny@suse.com,
    shakeel.butt@linux.dev
Cc: cgroups@vger.kernel.org,
    linux-kernel@vger.kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

cgroup_parse_float() parses the decimal values written to
cpu.uclamp.min, cpu.uclamp.max and io.cost.qos. When there are too many
digits, it rounds the fraction with:

  frac = DIV_ROUND_CLOSEST_ULL(frac, power_of_ten(flen - dec_shift));

do_div() takes a 32-bit divisor, so power_of_ten() is
truncated to its low 32 bits. That gives the wrong divisor from
10^10 onwards and zero at 10^32, because 2^32 divides 10^32.

This means that as it is now, writing "0." followed by 34 zeros to
cpu.uclamp.min or cpu.uclamp.max divides by zero.

The files belong to whoever owns the cgroup, so the owner of a
delegated subtree can do the same without any privilege:

  # mkdir /sys/fs/cgroup/d
  # cd /sys/fs/cgroup/d
  # chown 1000:1000 . cgroup.procs cgroup.subtree_control cgroup.threads
  # echo +cpu > cgroup.subtree_control
  # setpriv --reuid=1000 --regid=1000 --clear-groups sh
  $ mkdir x
  $ echo 0.0000000000000000000000000000000000 > x/cpu.uclamp.min

  Oops: divide error: 0000 [#1] SMP KASAN NOPTI
  CPU: 3 UID: 1000 PID: 178 Comm: sh Not tainted 7.4.0-rc1
  RIP: 0010:cgroup_parse_float (kernel/cgroup/cgroup.c:7553)
  RCX: 0000000000000000
  Call Trace:
   cpu_uclamp_write (kernel/sched/core.c:9677 kernel/sched/core.c:9700)
   kernfs_fop_write_iter (fs/kernfs/file.c:345)
   vfs_write (fs/read_write.c:595 fs/read_write.c:687)
   ksys_write (fs/read_write.c:739)
   do_syscall_64 (arch/x86/entry/syscall_64.c:84)
   entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)

Unfortunately the writer dies holding the kernfs active reference on
cpu.uclamp.min, so subsequent operations deadlock in kernfs_drain(),
even in unrelated cgroups:

  task:rmdir state:D
   kernfs_drain (fs/kernfs/dir.c:539)
   __kernfs_remove (fs/kernfs/dir.c:1578)
   kernfs_remove_by_name_ns (fs/kernfs/dir.c:1796)
   cgroup_addrm_files (kernel/cgroup/cgroup.c:4596)
   css_clear_dir (kernel/cgroup/cgroup.c:1770)
   kill_css_sync (kernel/cgroup/cgroup.c:6274)
   cgroup_destroy_locked (kernel/cgroup/cgroup.c:6394)
   cgroup_rmdir (kernel/cgroup/cgroup.c:6442)
   [...]
  task:mkdir state:D
   __mutex_lock (kernel/locking/mutex.c:821)
   cgroup_kn_lock_live (kernel/cgroup/cgroup.c:1713)
   cgroup_mkdir (kernel/cgroup/cgroup.c:6161)
   [...]

To fix this, stop scanning the fraction as a number, and leave any
trailing digits alone. That avoids needing to divide, and thus the risk
of overflow.

(Dividing with div64_u64() and capping the exponent would also solve
this, but it would keep scanning the fraction into an s64, which long
fractions can still overflow. kstrtodec64() truncates rather than
rounds and is inconveniently too new for most stable trees, so let's do
it this way.)

Fixes: a5e112e6424a ("cgroup: add cgroup_parse_float()")
Cc: stable@vger.kernel.org
Signed-off-by: Chris Down <chris@chrisdown.name>
---
 kernel/cgroup/cgroup.c | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/kernel/cgroup/cgroup.c b/kernel/cgroup/cgroup.c
index b3657e72db99..f6df19241772 100644
--- a/kernel/cgroup/cgroup.c
+++ b/kernel/cgroup/cgroup.c
@@ -29,6 +29,7 @@
 
 #include <linux/bpf-cgroup.h>
 #include <linux/cred.h>
+#include <linux/ctype.h>
 #include <linux/errno.h>
 #include <linux/init_task.h>
 #include <linux/kernel.h>
@@ -7541,18 +7542,28 @@ static u64 power_of_ten(int power)
 int cgroup_parse_float(const char *input, unsigned dec_shift, s64 *v)
 {
 	s64 whole, frac = 0;
-	int fstart = 0, fend = 0, flen;
+	int wlen = 0;
+	unsigned int i;
+	const char *p;
 
-	if (!sscanf(input, "%lld.%n%lld%n", &whole, &fstart, &frac, &fend))
-		return -EINVAL;
-	if (frac < 0)
+	if (sscanf(input, "%lld%n", &whole, &wlen) != 1)
 		return -EINVAL;
 
-	flen = fend > fstart ? fend - fstart : 0;
-	if (flen < dec_shift)
-		frac *= power_of_ten(dec_shift - flen);
-	else
-		frac = DIV_ROUND_CLOSEST_ULL(frac, power_of_ten(flen - dec_shift));
+	p = input + wlen;
+	if (*p == '.')
+		p++;
+
+	for (i = 0; i <= dec_shift; i++) {
+		int digit = 0;
+
+		if (isdigit(*p))
+			digit = *p++ - '0';
+
+		if (i < dec_shift)
+			frac = frac * 10 + digit;
+		else if (digit >= 5)
+			frac++;
+	}
 
 	*v = whole * power_of_ten(dec_shift) + frac;
 	return 0;
-- 
2.56.1

