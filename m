Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.128.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795502861;
	b=efEy6JnUO2AzYh6aMHDs+Bb+1P8KaQGLimAMk1ewO5jPrFUygZx30SvcASpBe8MAQvuO
	 GUURT+MJH+tB3ZudmccmaIMicsdGg0Fq2T1lMcvMNkppt8Ytkx7u1WR+abaRHs0+J+VhF
	 ko3tgQ4PucT/uQu/imY+RMLZE3Q1rxGy8CX1kjaD/bJEMISngXHSH0oA6j7Mm5za7+1/O
	 oyOqyAvIWZsoYTREBwAnCME5CBwnJA4jZUCOCtgWziiGrkdbHUesBPJNz8A3bpkMyaDOG
	 whLGFPS+GNQyN4YxHBq4qRhR4SBoniRATIoalzQXa9oe3Xsd+Cb++LtlnoHrAsb9mng==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795502861;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VnrZOZlg3BlUOIyh9s4cDgTJrHx2oMwWRpzxMW8e3a0=;
	b=R2Q3XA8mgIGGzDYJfisC99GUKXwY2H/dnmmW6skJJjsMKWk7oWWPSW7ihTwEhCufDYbu
	 S88fh4IFsYcwuYinz6y1Q82qqIDguJHmX2Dj0+XwWhQEIKU5OcK5kEUHusigS9dGrlL4U
	 bUY++iKckR8WVyAvO/gISI4u67TTgul3jEy7d+3mUVX6/FIbpx7KqelfrS4z2VK57I5vl
	 Vv5zEhfK8f0vTh+nqg+L1CiMIGyFOURp+kMMml1bKeTaVxVQiSeOCE0NgGSy00k9Lp1xa
	 /TLmTAAX9/Kun1vZfZyFQls+6p5pPfiypusqBsgV9GLyWSSivB0KNOUpTAyGXDM5R/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l6KiE0vX;
	arc=fail smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D8D606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 06:47:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25D8D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l6KiE0vX
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b4d26094beso37363437b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 22:47:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795502860; cv=none;
        d=google.com; s=arc-20260327;
        b=WZcPFLyECcCZumUvXBhk1TjcySEkWew+vopC4+9M6Dzg1CcEDETMyihaT01wHBQe2w
         jkC9p7KSG4zkQoEtxj44fyKCq0e2ITo548zvru5loxVWMO+2cgowXqwhw3Vc6FwArk7N
         85O9a8gYPuKK09wxXoosncZyBq88u5t1H/jFEkpJEpWObzclt6AbYaQjQawaf/p0QjkG
         ud8ualHYcWjTORq0X6Jxluwfd7M2V3mSs+0wrRhnP+jBY52FO6RECF05HSGy6KRDkEM/
         zgmEL4e1Z1qa9a0rhwFWZmnBX82wbnmc6b/a3eWdRVOHtgodtOvA4Z6NSsCp3ntm3vOp
         trvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VnrZOZlg3BlUOIyh9s4cDgTJrHx2oMwWRpzxMW8e3a0=;
        fh=g9j+rSadmIcdh0qjmKUjxHn2nOf3y6hVwXMjOF+SjoE=;
        b=EHRCtZhS9ZoeA4EM6UL6u6M+mVOuMavF+bn/nj1015xbNEdXBq6I5ccxiyfnLB4Djf
         RlE78n8VSDbntQErDbbzj2LCUjouyu6lGCPgJG9amR00XWw5SDVO46GJbYCtu3lv8FxI
         Zkw6FPApvCHgqS/sPssoPVTlZv65j1kmL/Thj8ZkqnxEuHERQ4w1qxUvSNjPES5eVDR0
         O8CX8inMyRo1yJcWX9oQshP8oSt1YNq3cv2oX2qgZl8SFq5aJhteOEYa/uRNrWGsPK39
         G16MCqSa6ALcEG2OErkWZVbBr9uIa1nH1ylaf1F5+oyN5nvVm4Sl9JmE0N/4ntfk+Zo/
         /0xA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795502860; x=1796107660; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VnrZOZlg3BlUOIyh9s4cDgTJrHx2oMwWRpzxMW8e3a0=;
        b=l6KiE0vX1DJWMgWjM8XEA6zfQmx+6toUGoWw49iNLZ2omHgB1EGKia+KQ9rLVa4EGn
         ICr+sMiZRF53bVRYYmsKeQGoVSR/QUMZ7Z78d3e2Fv464j90HRMgNMOSyWqOC9E7T03Z
         LJR7+upDUr92NJCWACupI+hSqkFt9bicdtGtHWTxpu4YwAoLqO0HlfdzPrCx6gFHWHLu
         xaiTtAkAoAvSuo2mfhCJTa1xc4Cov+uZI/fi6h7jfhpXNIVgyr08nlxdiiX/RA/K6Lnv
         H4OauwOSlcelISEbafEo5XADmEcNT9yKBAS5uQj4Sg7mjzgObOLPWacsXxHWD+hKX9fq
         zF6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795502860; x=1796107660;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VnrZOZlg3BlUOIyh9s4cDgTJrHx2oMwWRpzxMW8e3a0=;
        b=2xCJzyeYmf1RchiUKh+wmR5wKCvbd6BgyBjVJdVtgOoi5+DSV5fn3I7ULbB2MMuOeH
         oZeKRkYMxq+OgnmA2kdjXt08/Apzbna7h/OPDQ4/RrOlMhH3QYhSvHG9WTNA55N9NGiK
         wiLYI/A78Rh3rxokEC7i82PLYsh8AyOlL+t8w7u71UoBb11UL6nazn7MucVuds1PsrGT
         iqMyXL9f0L4ah0kV5PnFDa6YxN9SHJ43mJuf7cm+c5hziFgPRzwZ27QLXRHJ2nUQvg9C
         Vc96hHAUAXp7xW9TD0q7KL+t89cvRAeGbQSg2aYRiz7X41YcxFia2YygVpRvnDjmXti6
         0hiA==
X-Forwarded-Encrypted: i=1; AL+hErG2joTHQVird6MOEZ8vNjt2cRwCDRJWVYzJZAmTz0wxsEnLCCqTdU89ohW7QpLXGA5UtLfYakf448iqg6g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DPX8qEWLoiz2sMRJU+lM1cmxhTDqzlaKvbYBF6y3g7RFDeHG7
	45/Qf7zyQyDjcpwPqTDYAXl86UbVrKAfqZz8F5HGtnVJ5dUwX9cI2IFEXxrjM9e3WqMEApd4fdH
	2S/SuCWUrVc8Fx0eVBJVXhTOkFlvG/dc=
X-Gm-Gg: AZFdTZcQimfHML61zS3EoRrjKZ7uWx7BYTAvR0nMfHePDJ6gq5y2bNqm53eJRy+QyL2
	xqmX/QeJG4Zl+gQmGzvaiONaBpu7xoHbgVPPdt+kgiOZb/KAcK+4y0tPOhKyQ0a2Yokv1Zm6VGN
	6J7d9ONnVJi2hnmNl2bMQAJAM/MMGYTWh3nga/1Jy3hg6DRe/TfSpJIgDFEiW2spxDOy0GYeqOn
	7HTSz0eIBUIqqhOP/+V+KZdgBNw7xA+n8UbUAcWe0rH+vDoQ76GvTJ+qmkiKqo584lU40ppqO/3
	f91N6giyEtLUPiEVGJLwCAK4409iUFUK7l5qnGMyrHHQz4C6Tn2wYA6OIcGaAlXgoJpvH+pTTM9
	x5L65os4uovgrx6sqj6lyPBcw3NZQBAACV05P6NePWe7vptsJ7911+p1gxs+RT4Xs7AVno3qTco
	kyUhHZpEvYo1X3
X-Received: by 2002:a05:690c:f0a:b0:8b0:a8c1:b203 with SMTP id
 00721157ae682-8b5204a4d62mr49738217b3.29.1795502860010; Mon, 23 Nov 2026
 22:47:40 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-klp-series-v3-v1-0-427c95811d9b@vt.edu>
 <DM6PR05MB41373C039888AD13938D3838D1452@DM6PR05MB4137.namprd05.prod.outlook.com>
 <CALOAHbDu5NmVowk4SHzeUDxASaxKkbL_w1dModFWzdi8yK9tBw@mail.gmail.com> <DM6PR05MB41377901DA5182DDFAD6E3D4D1442@DM6PR05MB4137.namprd05.prod.outlook.com>
In-Reply-To: <DM6PR05MB41377901DA5182DDFAD6E3D4D1442@DM6PR05MB4137.namprd05.prod.outlook.com>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Tue, 24 Nov 2026 14:47:04 +0800
X-Gm-Features: Aa3M54o2kD5CAgD6Kh7BeaSGBGBREFHEzSySI0CnyEHkEYGRzmsY1gHwE2Ygmgc
Message-ID: <CALOAHbCDSAuvxHt2jd-f5rvTrxeZ4KZkKUfqxrE09PXk+Te36Q@mail.gmail.com>
Subject: Re: [PATCH 0/2] livepatch: Do not lose exiting tasks during a transition
To: "Ravindran, Binoy" <binoy@vt.edu>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Frederic Weisbecker <frederic@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Josh Triplett <josh@joshtriplett.org>, Boqun Feng <boqun@kernel.org>, 
	Uladzislau Rezki <urezki@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Zqiang <qiang.zhang@linux.dev>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Miroslav Benes <mbenes@suse.cz>, 
	"live-patching@vger.kernel.org" <live-patching@vger.kernel.org>, Petr Mladek <pmladek@suse.com>, 
	Joe Lawrence <joe.lawrence@redhat.com>, Song Liu <song@kernel.org>, 
	Ingo Molnar <mingo@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
	"rcu@vger.kernel.org" <rcu@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Shastri, Jaidev" <jaidevshastri@vt.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 12:57=E2=80=AFPM Ravindran, Binoy <binoy@vt.edu> wr=
ote:
>
>
> Hi Yafang,
>
> Thanks for the pointers to the earlier thread and to Josh's
> suggestion.
>
> > I did not take it for the same reason Sashiko raised in issue 2: the
> > RCU exit list narrows the race window but does not close it.
> > I could not see how klp_synchronize_transition(), as you describe
> > below, completely resolves it. Could you please explain that in
> > detail?
>
> The exit list alone does not close it, and v2 does not rely on it
> alone. The exit list covers the part of the exit path that can sleep.
> The part it misses cannot sleep or be preempted, and
> klp_synchronize_transition() waits it out. In detail:
>
> 1. Where the gap is. An exiting task is on an exit list from
>    exit_tasks_rcu_start() to exit_tasks_rcu_finish(). exit_notify()
>    runs inside that range, and the task is unhashed no earlier than
>    exit_notify(). So until exit_tasks_rcu_finish() the task is on the
>    task list, an exit list, or both. After exit_tasks_rcu_finish() it
>    may be on neither, if it has already been unhashed. That is the
>    gap in issue 2.
>
> 2. What the task can do in the gap. do_exit() calls preempt_disable()
>    before exit_rcu() and exit_tasks_rcu_finish(). After that the task
>    runs only lockdep_free_task() and do_task_dead(), whose __schedule()
>    is its last. From preempt_disable() on, the task stays on its CPU:
>    it cannot sleep, be preempted, or migrate. So once a task is in the
>    gap, the next context switch on its CPU is the task's final one.
>
> 3. What klp_synchronize_transition() guarantees. It calls
>    schedule_on_each_cpu() and returns only after a work item has run
>    on every online CPU, so every CPU has switched context since the
>    call began. Any task that was in the gap when the call began has
>    reached its final __schedule() and will never run again.
>
> 4. Where v2 calls it.
>
>    a. In klp_init_transition(), after patch_state has been set on
>       every task (the task list and the exit lists, walked under
>       tasklist_lock) and before func->transition is set. A task that
>       the walk did not visit had left the exit lists before or during
>       the walk, so it was in the gap when the sync began, and it is
>       dead before any function enters the transition. So when
>       func->transition is set, every task that can still run has a
>       valid patch_state.
>
>    b. In klp_try_complete_transition(), before it calls
>       klp_complete_transition(). A task in the gap can still be
>       running code reached through the old function, and the switch
>       check cannot see it. The sync makes it dead before
>       func->transition is cleared and before the old patch can be
>       freed. A task that leaves the exit lists after this sync was
>       already counted as switched, so it runs the new code.
>
> So there is no point at which a task that can still run patched code
> is invisible to the transition: before exit_tasks_rcu_finish() it is
> on a list the transition walks, and after it, the sync waits for it to
> die.

Thanks for the detailed explanation.
It makes sense to me.

>
> One limit: the exit lists exist only with CONFIG_TASKS_RCU. Without
> it, the helpers are empty and only the final non-preemptible stretch
> is covered.

Is it worth adding yet another separate list for the klp transition?
If not, I think we should at least make the CONFIG_TASKS_RCU dependency
explicit:

--- a/kernel/livepatch/Kconfig
+++ b/kernel/livepatch/Kconfig
@@ -12,6 +12,7 @@ config LIVEPATCH
        depends on KALLSYMS_ALL
        depends on HAVE_LIVEPATCH
        depends on !TRIM_UNUSED_KSYMS
+       select TASKS_RCU
        help
          Say Y here if you want to support kernel live patching.
          This option has no runtime impact until a kernel "patch"

--=20
Regards
Yafang
