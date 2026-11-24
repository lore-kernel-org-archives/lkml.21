Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795500051;
	b=WN61whpi4MznkwatccUIdKyWgznZ7R7qJqSocEYAQotaBtDFaSKd78BzUzyfW4PiE5ZE
	 n98BgqBwqeBPE3sfx3JJXLDaOn1iYX9fL7wj3pv6m7g5M7vHrwtBl2LqorOlthMXRAicj
	 YNlunfsoTOrA5k8e0xIlbTEXh+qIkiXGKABjHhANuZT9+lOSbKAWACH2riU3wXQZMlKJi
	 i5GkGk6BY5tLfmjS0uy9dTyV3d9A+mU37f4OMAN1O4kGzOYSK59KOb7z829OXTTYG2pBG
	 Cdai4pOSg9f26cscfDNvi7rvhR9Nx6xkCxvNTa4Svf1v/b6yjlup0PPB5DG9uyet+Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795500051;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:From:To:Subject:In-Reply-To:References:
	 Content-Transfer-Encoding:MIME-Version;
	bh=/SLHfkNsrCjSRx5Wz9p+DTV861mq73QFj5nkNZKg5lU=;
	b=sad0QujdTZ2bGYthAaOBVaEBW870Ue/ibO9GSHgxGaTeqVF+OTHWz85m4b/XY8N2eqIt
	 2joLegjVE7LhJZgsECaOG/YsA0WxPS/pofnT9AW+pckLOsXJZVAx//ci3JmPapv4e6RPL
	 uM8dPyPykz8u5JH7YD10qZnr83T8OYv0hXz8YIXkFaP0nEMsalsYctzidZQL05oAyHdqa
	 A+LVPWbYhaXi3MrObwbQN0SqEQDxVfswYJME2hPBsUiyglDpWek2oNtUxe6HyJMcC0kAr
	 dh7fBTMPDHll86n3dYMF0J30LLwIZkZa4GCoTM94sxS2CX57YmWR5cSdTJUpU4ucLyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q1+Zpv7v;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF36606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 06:00:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEF36606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q1+Zpv7v
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a9f9473029so3080235b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 22:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795500050; x=1796104850; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:to:from:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/SLHfkNsrCjSRx5Wz9p+DTV861mq73QFj5nkNZKg5lU=;
        b=q1+Zpv7vRdLuNryjubIcK9p1C6hYtJyM8s4Ya+V8PgQONvpdTC7Ua853SGJTsIUcXQ
         M0pFVL8Do2Ry2wiXUj3cxeKtoqtmO0eJBjUj9twM08oj3aaj/1mWJSU3N4CXDAYxBpCK
         on+bdLfyiTexuyK1b6zmgwGoqKXFL4GeCN4DTr+jWK4djxI0BL1/DadGxeBp6DK7jASk
         tRKgLLfGrF8S9KN1UlG+krPmugZz0AWnplxbg1kncJbcJLBXntvKA8UjrUbEBTdBxIUf
         JruoLYhZMGVzT+PZrzx9sT1rk+fc369T12hC6PaBt2ez90GghipDT83vmsUcG8y9Od5P
         M7qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795500050; x=1796104850;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:to:from:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/SLHfkNsrCjSRx5Wz9p+DTV861mq73QFj5nkNZKg5lU=;
        b=tY/kXvfzWiP38nOaaH9VUFF41eVpuEqKBbavniRqZcLLRVrTuT0FZkOdFPzBP+g7Jz
         IDyL7Phi7XQWB/KhwMe36ct4qhGrV9Ygw1mzvUQ2vcUtYvX7hxVuU69+dA8DJKm28/Zn
         uHh4cCVGFW4EXLTpSSwDy53NauyIYhaR4vJtDBRW8D+1BofWEQEsOmUMWC6HAzaJpL82
         U4h4Gbeivn6jKtu15PMFyjyHy2WHC55kBxIH7uICaDwopyyzT5ztYP2qKkgH2V+DjRCP
         JbiHH6clTE//fXCpQVBjE0REiGIlCW/C8jC1YFC9cbt/bKMS9Thv+IxHETopZOpFGQb5
         HBLw==
X-Forwarded-Encrypted: i=1; AL+hErG1xlXUTaXH2bK60nYp723dicj+TGtX6B3g0as2Sttkob6mGCVvqca+7TiGubUjMtIbTlvCAA/RAspUSRg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yJ5fSCg0vMhHLpTx2Nps75nVjRMtvH5vUtDFFNq8dNZaWKB74
	o9liww7bcmSzpiarCZCSgVXsBo5YY6WuY4FP46dPkcd2VLWAZ8apAUMO
X-Gm-Gg: AZFdTZd/kVzLFeR71VM4VR+WKkkZ0YMbbg3POghSc5bmTSBZixsH1AYxCEJUeTbj/Hq
	4/GzSZkDg4+MNeq7yfUrJnADVFH0woMaCY2g64/Q3X7yWEs/nOK4bDWT8wYh896/SZNjBM5aEL9
	GmYN9vTUEuRg0TehKYhSkEp1qfCk5ZUb/gzht9LM8VPhA9xzMKweNKbdKOElcGUprc/Ac78FItP
	yeFVPH2Ep6K+PKDdyJ9BFJp6XmuHk1sf6vlK9Cml6cR/wCgsYNZnTJV07AImOxKsRicftF5mHd6
	WeQJISZzQ/lA5aNNiEV32REfFmg3ol2FstLCu6g5TPZKerpblfCZigmgfCRTWdV5IlRu/nb2cJ3
	PAgeYdxrirb+sWnCD82DRhbdyBjtMmcHlj5Q0EcDr8n4eEBEPlrqOgQCvEloWv8qg1aBttRbZrG
	L+UUNzDWmKorLNw4UMIoJFZPREpcJy2v19/cr2Cz7vKEVpWQ/3rB2YaptYpU94YlvvG9nrYyXmi
	AW+KOlwztyXrXXWOBGKtbOEBY2R1D7Wo2ZglqI8vGBhxooR0PxU8fdP60lHv6g/2Br8h5VIpY/j
	GS212D0JbtaXnL6TL6xGJpVZrM13mhwL3hPN1etue9a8JxI7X53LrWBmAzcEVLFEAjS4U35jDw6
	ity+BId0XsLNYUat0Ko9WOCmjPS3SpDAZ7b8=
X-Received: by 2002:a05:6a21:780a:b0:3e2:8b64:2ca0 with SMTP id adf61e73a8af0-4014d35f1bamr11982201637.49.1795500050075;
        Mon, 23 Nov 2026 22:00:50 -0800 (PST)
Received: from localhost ([153.61.198.255])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d03adafsm6596544a12.23.2026.11.23.22.00.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 22:00:49 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Nov 2026 06:00:49 +0000
Message-Id: <DN37NBGPJJG9.2DSVDCKS3UYTV@gmail.com>
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "syzbot" <syzbot+b6f8640465bdf47ca708@syzkaller.appspotmail.com>,
 <akpm@linux-foundation.org>, <andrii@kernel.org>, <bpf@vger.kernel.org>,
 <brauner@kernel.org>, <daniel@iogearbox.net>, <jack@suse.cz>,
 <jmorris@namei.org>, <linux-fsdevel@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-security-module@vger.kernel.org>, <netdev@vger.kernel.org>,
 <paul@paul-moore.com>, <penguin-kernel@I-love.SAKURA.ne.jp>,
 <serge@hallyn.com>, <syzkaller-bugs@googlegroups.com>,
 <takedakn@nttdata.co.jp>, <jhs@mojatatu.com>, <netdev@vger.kernel.org>,
 <tomoyo-users_en@lists.sourceforge.net>, <viro@zeniv.linux.org.uk>
Subject: net: act_gate bug. was: [syzbot] [tomoyo?] [mm?] INFO: rcu detected
 stall in security_file_ioctl (9)
In-Reply-To: <6b051681.58b41460.7037.0590.GAE@google.com>
References: <6b051681.58b41460.7037.0590.GAE@google.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mon, Nov 23, 2026 at 08:45 PM syzbot <syzbot+b6f8640465bdf47ca708@syzkaller.appspotmail.com> wrote:
> rcu: 	         hardirqs   softirqs   csw/system
> rcu: 	 number:     5264          0            0
> rcu: 	cputime:      138      52351           25   ==> 52490(ms)

It's not tomoyo, mm or bpf. Looks like act_gate.
Zero new softirqs in 52 sec, so one hrtimer_run_softirq() doesn't return.

> RBP: ffff88807ed35538 R08: ffffffff91be1bbf R09: 1ffffffff237c377
> R10: dffffc0000000000 R11: fffffbfff237c378 R12: ffff8880b8228600
> R13: ffffffff89fd0480 R14: ffff8880b8228600 R15: 1ffff1101704514a

The registers with lockdep struct sizes:

  reg       value             points to
  --------  ----------------  --------------------------------------
  R14       ffff8880b8228600  cpu_base
  R15 << 3  ffff8880b8228a50  clock_base[HRTIMER_BASE_TAI_SOFT].seq
  RBP       ffff88807ed35538  kmalloc-512 + 0x138, tcf_gate->hitimer

act_gate has the only soft hrtimer that can be on CLOCK_TAI.
bpf_timer_init() rejects that clock.

TCA_GATE_CYCLE_TIME is an unchecked u64. In gate_timer_func():

  n = div64_u64(ktime_sub_ns(now, base), cycle);
  close_time = ktime_add_ns(base, (n + 1) * cycle);

With base = 0 and cycle = U64_MAX, n is 0 and close_time is -1.
The timer restarts in the past and __hrtimer_run_queues() runs it again.
It's there since
commit a51c328df310 ("net: qos: introduce a gate control flow action").

Jamal,
taprio's INT_MAX limit doesn't fit. tdc uses cycle-time of 600 sec.
The diff saturates the sum instead.
Here is a potential fix:

diff --git a/net/sched/act_gate.c b/net/sched/act_gate.c
index 711cf24..5422d60 100644
--- a/net/sched/act_gate.c
+++ b/net/sched/act_gate.c
@@ -45,8 +45,9 @@ static void gate_get_start_time(struct tcf_gate *gact,
 				const struct tcf_gate_params *param,
 				ktime_t *start)
 {
-	ktime_t now, base, cycle;
-	u64 n;
+	u64 cycle = param->tcfg_cycletime;
+	ktime_t now, base;
+	u64 rem;
 
 	base = ns_to_ktime(param->tcfg_basetime);
 	now = gate_get_time(gact);
@@ -56,10 +57,9 @@ static void gate_get_start_time(struct tcf_gate *gact,
 		return;
 	}
 
-	cycle = param->tcfg_cycletime;
-
-	n = div64_u64(ktime_sub_ns(now, base), cycle);
-	*start = ktime_add_ns(base, (n + 1) * cycle);
+	/* cycle is an unchecked u64, the sum must not wrap into the past */
+	div64_u64_rem(ktime_sub(now, base), cycle, &rem);
+	*start = ktime_add_safe(now, cycle - rem);
 }
 
 static void gate_start_timer(struct tcf_gate *gact, ktime_t start)
@@ -107,15 +107,8 @@ static enum hrtimer_restart gate_timer_func(struct hrtimer *timer)
 
 	now = gate_get_time(gact);
 
-	if (ktime_after(now, close_time)) {
-		ktime_t cycle, base;
-		u64 n;
-
-		cycle = p->tcfg_cycletime;
-		base = ns_to_ktime(p->tcfg_basetime);
-		n = div64_u64(ktime_sub_ns(now, base), cycle);
-		close_time = ktime_add_ns(base, (n + 1) * cycle);
-	}
+	if (ktime_after(now, close_time))
+		gate_get_start_time(gact, p, &close_time);
 
 	gact->next_entry = next;
 
