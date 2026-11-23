Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795455158;
	b=GlDg3UYjW8W6mZY0/X2n+UlI/rUUeLRCgHoSSjlv4VXffua2566yGkgpWcpt6LVDrt6I
	 mSED4MLjr5YUfEhpya7LQiIVFChgkpHtjKgiascZx6EMY9efgobuIyKGP/zgBXxfxeH9E
	 yIxO+Prnu/j3H9cXW+yuYE+mBZbqH7rjA4g2mpNCJAbIsqRCODoDr6kjJh+J6Og0oyUEy
	 EfF8paPHZ052bR51VhjigxQO4fCcmF2VgOVQU5Qls2H4vOmLlcVhkv1HkBoPBR+62yahK
	 ZhNkYxIRF30vdmds0UKalukfG3ab1q4Oa1BTsouPdlkUPtL8FZjeYZUS1B3bVINXswA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795455158;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Scanned-By;
	bh=Dac1FERf1Emk9l+Dj72gPWmV4FN/j45L9H+ZPXsL8co=;
	b=UeMRgN32fBjTtftPD/vZ+kA+lFP3+bRHYi9G/YHBPbJEu6GQGOh/SPxUAy70SY6wGafC
	 wcOwz1AdQgxnaaNpB1EfHRkQZK2rrKtbutQp+kTKlfPHrUNkbYLna7k6t4O8MeiU2pMOp
	 TiV6edQo2aao81iitrEqJVUPOUSbat8JJp8Fqk8oHXiZ3iyY2PSW7rFEZn4uuq+jPsvkA
	 5MhPJHxT14qaLU+kws/5obOgwabFt5a5WnaRD6As3kyEpJFHJJkUglud8bFzrI1FK3Wlg
	 RY06owcckyT345pVIY/C+CslixLh8fcAKzYjQaJ8Ulgoq5HvYC3dnqvu6dM2YEYLPjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KR0pgCCq;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DF8606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:32:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02DF8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KR0pgCCq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795455157;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Dac1FERf1Emk9l+Dj72gPWmV4FN/j45L9H+ZPXsL8co=;
	b=KR0pgCCqewGwO6MeDTQ5jp+IrJ3pQcHU4ZF8NhJ/TT8i9uR4MiOPsb97IL6tWXdjSnWhPf
	Sj0TZ4qB+7Pgb0PNlgZbAD8l+IMWS52TMHghnlDdLFy6m+C9gGYk/mDliiUlkn4LFiNTl6
	CvK67SCm5qmZG3pD9jfEmYVEhqP85V0=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-691-TP4QAAtUMu2j5Hiba3cvAQ-1; Mon,
 23 Nov 2026 17:32:30 +0000
X-MC-Unique: TP4QAAtUMu2j5Hiba3cvAQ-1
X-Mimecast-MFC-AGG-ID: TP4QAAtUMu2j5Hiba3cvAQ_1795455147
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 735EC180289D;
	Mon, 23 Nov 2026 17:32:27 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 1BA621955F01;
	Mon, 23 Nov 2026 17:32:22 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Mon, 23 Nov 2026 18:32:27 +0100 (CET)
Date: Mon, 23 Nov 2026 18:32:22 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Keenan Dong <keenanat2000@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>
Cc: peterz@infradead.org, mingo@redhat.com, acme@kernel.org,
	namhyung@kernel.org, mhiramat@kernel.org, mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	irogers@google.com, adrian.hunter@intel.com, james.clark@linaro.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH] uprobes: clear extra_consumers before pooling return
 instances
Message-ID: <awR4plQC_oIvoc2R@redhat.com>
References: <20260408100247.2065245-1-keenanat2000@gmail.com>
 <awRRgnRmeMDUvUWz@redhat.com>
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
In-Reply-To: <awRRgnRmeMDUvUWz@redhat.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On 11/23, Oleg Nesterov wrote:
>
> Andrii, can you take a look? I never understood this code in details,
> and today I forgot everything...
>
> On 04/08, Keenan Dong wrote:
> >
> > ri_pool_push() returns a return_instance to the per-task pool for
> > later reuse. The pool reset clears cons_cnt, but it leaves
> > extra_consumers behind.
>
> So at first glance this doesn't look right no matter what...
>
> > A reused return_instance can later grow a fresh extra_consumers
> > array and then reach the cleanup path with a stale pointer from its
> > previous lifetime, leading to a double free of the recycled object.
>
> Can you add more details to explain the possible double free?
> This is not immediately obvious, at least not to me.

May be this has something to do with dup_utask() -> dup_return_instance() ?

If cons_cnt = 0 but ri->extra_consumers != NULL, then
dup_return_instance() -> kmemdup() will copy old->extra_consumers, but
but kmemdup(old->extra_consumers) won't be called?

Damn this code is too complex for me ;) Anyway, I think the changelog
should say more.

Oleg.

> > --- a/kernel/events/uprobes.c
> > +++ b/kernel/events/uprobes.c
> > @@ -1945,6 +1945,8 @@ unsigned long uprobe_get_trap_addr(struct pt_regs *regs)
> >  
> >  static void ri_pool_push(struct uprobe_task *utask, struct return_instance *ri)
> >  {
> > +	kfree(ri->extra_consumers);
> > +	ri->extra_consumers = NULL;
> >  	ri->cons_cnt = 0;
> >  	ri->next = utask->ri_pool;
> >  	utask->ri_pool = ri;
> > -- 
> > 2.43.0
> > 

