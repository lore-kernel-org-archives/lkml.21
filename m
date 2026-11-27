Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795792217;
	b=ZsqM9QFcjmD9I1F8FnYAyOmqpn3kK5bxWu0TDOz3smrKJwCOjdki/XVFyNHKZvnVLptH
	 J/ldAUa+JA2Eo15LL05KYVOcJLah+XFuj/S9UbfFV0l9kzpjhXkFJW8DrXuGyr8tZlazx
	 U9rQdCYNt/oyMzGEmMBiD/1CRzqDDzT+St8zvXmwQmH7ZtXuZwqC4Sx/wTUhRaJ+Q3tz9
	 Hj6CxTjqkoLLaq5dYGLYj4Op2FIdmPNTcu5lOQjY0aoTNhA7QSIrZR/Lh+qwEORvReB0g
	 SYNZuoCwixPZpqvbK3efEPvOpFt2VMTf4CwqJd5BztyXAiy2KaTGfy7/nzZ8Arcn5bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795792217;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=dB3Mu1p4rL6bAO330MA2e6OIkjqTQSd8YGpfYYCrr/0=;
	b=qo0b5iW/gmhhMmJwhPls7wTy5zyon7AfOlfZYuKUGQNMDF+MvZDwLEMOLp7vspqR4LeC
	 7gYln+2THvfF/vNffGx/LRXEAR7zHTTjGwgzifSSKPxmdniwfsjUhk1eqMZqnXmsl6K97
	 nNKgvqSN/KZ7B3V9RQHKBk5ObgeUPVqHs+uBM0dV9q4N5COXZwOuE9exGsfGC1ENHKkdI
	 q6dBrHTwFJ4uxhAFXEpAgFaJx73EbH7bFO0C0FONzfN3plTknYWCktAvluKWkqeVqBf8U
	 BZiHkCICx3oLd0wgyeD6GHu9zx6reSe0InWp8PshCi2kHj3pGE5MORbZas/tJAei8tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=BNBBToX9;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0A0606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:10:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C0A0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=BNBBToX9
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bba5e17728so27855735e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 07:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795792216; x=1796397016; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dB3Mu1p4rL6bAO330MA2e6OIkjqTQSd8YGpfYYCrr/0=;
        b=BNBBToX9KBOtwdKh9WaJ9mUZLDZorMOpz24pc+Ie7Va4OwK4iffPBdEtrf+IAhTs/r
         RMHWVFmj7aQYIJ4PL4JujOOWTdVODgr3hmIix7XIX8JeVbRP8EyrmzdxI9ihdcxVxRmX
         YJfXkCyYI+9ioSrCpKMUdEmGe1cNXx7B/3yf8+hpb9hH+B2tDqqO1HOuN4Nq3MjPgofw
         kCk7u/CuHzkgPPsl9yq4Q3NK8qwZvU9/2bc8ysn81X3mCDGpLJEkF8Knzevfj+fJrv2B
         CE/0YYW8j4fdZcHmkpjewsVgd59W92doOnUF0T1AhDGFc7qqPcYEPy/B/pdc3vGo7DYi
         1ooA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795792216; x=1796397016;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dB3Mu1p4rL6bAO330MA2e6OIkjqTQSd8YGpfYYCrr/0=;
        b=nSP10S5yGkM0bZ9yfkFWaewrnNZAJJfgpUVRK6K2wqAMGps8Oufab/AJp+hJofqoQj
         00H+kG31i/rk3KiFoMgWw1DJJQHBPOG5yJoYEQin37Dwo45k0e1ehSZwYdsl0GypcD8l
         A9HAXyHWOHeTFBp79LMJnz01Nto8acJrwsN0ejrZ2kmpglSEz0u/x8AobX9cTz+RzOsD
         g8zmqdAOFltMBFjb4jP5OBhxJijMWec8Q74Xym3CxuLz2ZkkuVpBA9VQ6olrn9rsFiRV
         v/B7SY72GO+27NqHPtMYQPx8+tA3qanhNy4JvWW9XJbvA2wgIXCFf28sVIOqmmKE4Ksj
         Exyw==
X-Forwarded-Encrypted: i=1; AL+hErFerjgK+E8AyH6H1skkPH3P0nF8HhR666vH+zt25kXDVwVy8p5XjX6kRZ1fn8H93hynFsdqPzgH9U6NvL0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rY41Kp0D7l1i3zqlu+q9dMqYnBLXlDqrr5ZSCakO/c1nkFveP
	pggPdSeqzMA+SWjmdmLqqUkaKSJRIRp8a2DeIRmW0JwDhLOPxaJCOvTtjKn7ewN2uOc=
X-Gm-Gg: AZFdTZcamMX2UTQN/L6vTYTYFyN4gXZMIgILyXET+Ubz61OaAkpv1E/G2cpjzzKepZj
	QHuQ8JvRyQjDhVdjEnxpY4V7I0NwKXjMlN1sikoQx/wWGlaOwyyEQzczTirXn96THIoX3EkbjAA
	yFjNuEv9duB2QvuJoYlAeKQEobmBNoHBRRqibJDLFDNlljAwIlrCA1pOzAPL8/B0WLULXcpcflL
	NQr6FeI2ghWDj+ZGY9Q3pJV8+VNAODzo4j5VApe1vaOFK4YggfeKA7ktefGcWzpscXETEvgyTvd
	nWnFWVYncrQyRNiFfly8uT+eUkw6L0DqA+k83fGeXFc5pwqRRKPVbnIEDe3LIB16X16LcvNHW1h
	Zs9P2KVQVErpXQVcnMv1Ur+eqvHSNtTvr2gvtYdRJrIupjPPyknu14r4Zt1GUP1h97qRv8EYdBK
	niukyrNcnH2YA1iTfW4CnlnPwSpH3bJNVyBPnBBuUGzd4CrDKZEeqDqaEEtu80HSzlD+yjj21SG
	KlNJwXIezsx7Vkqq9VoushknS0ZTxsC7BXu0g5YrciQcgUsZubA4pHvspgYmrNJJKronFyWVaav
	smwtkGHZkwJtjGNW5YvfTL0BbEA0fGGVnxTAG77a4lB/i73O9bX4
X-Received: by 2002:a05:600c:468c:b0:4bb:6d61:af7c with SMTP id 5b1f17b1804b1-4bb88944bf5mr493578005e9.35.1795792215604;
        Fri, 27 Nov 2026 07:10:15 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a12acsm729529545e9.8.2026.11.27.07.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:10:15 -0800 (PST)
Date: Fri, 27 Nov 2026 16:10:12 +0100
From: Petr Mladek <pmladek@suse.com>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: "Ravindran, Binoy" <binoy@vt.edu>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun@kernel.org>, Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Miroslav Benes <mbenes@suse.cz>,
	Joe Lawrence <joe.lawrence@redhat.com>, Song Liu <song@kernel.org>,
	Ingo Molnar <mingo@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	"sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"live-patching@vger.kernel.org" <live-patching@vger.kernel.org>,
	"Shastri, Jaidev" <jaidevshastri@vt.edu>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"rcu@vger.kernel.org" <rcu@vger.kernel.org>
Subject: Re: [PATCH v3 2/3] livepatch: Include exiting tasks in the transition
Message-ID: <awmdVLfnwgrS9VfS@pathway.suse.cz>
References: <20261125-klp-series-v3-v3-0-b1e0f79af331@vt.edu>
 <20261125-klp-series-v3-v3-2-b1e0f79af331@vt.edu>
 <sashiko-outbox-234405@kernel.org>
 <DM6PR05MB4137C0B5BB4D88A9D5847EBAD1432@DM6PR05MB4137.namprd05.prod.outlook.com>
 <CALOAHbAQuYG__4b054bRobVRyT+v143wBcVAN26T_PtiO-oqmA@mail.gmail.com>
 <awmWExtIJGM805__@pathway.suse.cz>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <awmWExtIJGM805__@pathway.suse.cz>

On Fri 2026-11-27 15:39:15, Petr Mladek wrote:
> On Thu 2026-11-26 11:12:27, Yafang Shao wrote:
> > On Thu, Nov 26, 2026 at 8:58 AM Ravindran, Binoy <binoy@vt.edu> wrote:
> > >
> > >
> > > Thanks, this is right. A dying task reports its quiescent state in
> > > rcu_note_context_switch(), early in __schedule(), and then still runs
> > > traceable code, such as update_rq_clock() and pick_next_task(), until
> > > switch_to(). RCU does not promise to wait for code after that point, and
> > > with expedited grace periods the quiescent state is reported right
> > > there, so synchronize_rcu() can return too early.
> > > klp_synchronize_transition(), which v2 used, does not have this
> > > problem: schedule_on_each_cpu() completes only after the work item has
> > > run on every CPU, which on the dying task's CPU happens only after
> > > switch_to().
> > >
> > > v4 goes back to klp_synchronize_transition() for both waits and keeps
> > > klp_try_switch_exiting_tasks() from v3. I will send it after rerunning
> > > the tests.
> > >
> > > Yafang, this reverses your second suggestion; I hope the reason above
> > > makes sense. It also brings back the v2 transition times.
> > 
> > Agreed. I missed the point that the quiescent state is reported early
> > in __schedule(), and that the code from there until switch_to() is not
> > covered by synchronize_rcu(). Thanks for pointing that out.
> 
> Honestly, I think that synchronize_srcu() should work. Otherwise,
> the comment in rcu_tasks_postgp() would be wrong.
> 
> IMHO, the trick is that there are two interlacing rcu_read() periods
> in do_exit() and synchronize_rcu(), see the comment in
> rcu_tasks_postscan() and the commit e4e1e8089c5fd9 ("rcu-tasks:
> Improve comments explaining tasks_rcu_exit_srcu purpose").

Wait! I might be wrong. I think that it does not work because
the 1st rcu_read section ends in exit_rcu() which is called
before exit_tasks_rcu_finish() where the task is removed
from rcu_tasks_exit_list.

By other words, the task is removed from the rcu_tasks_exit_list
in the later 2nd RCU period. So, if synchronize_rcu() is going
to wait for this 2nd period then it might end prematurely because
the quiescent state is reported by rcu_note_context_switch()
early in __schedule().

But I might miss something. I am not sure which period
synchronize_rcu() is waiting for.

Best Regards,
Petr
