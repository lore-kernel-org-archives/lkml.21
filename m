Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795451011;
	b=lZhzLnUAxVRcM8wU9JyWj1looauPsxRZxNZ9Ek/gp9KKlI6wnCEi6KzGAUODt67SE8Qw
	 7Gv81EKgeznWeLzqlDtHDYN/rI/NPi++zr+ZkR63Lj3jbwT2QotrCmrBfmtlggYDZeh3t
	 bebMU2VtYUbD3UqGwC4SAEQ4MQ00b47oKyTXG1YXUFUFw6qAnQFZsgMMq97TSpvHgYP5q
	 MDpa3va8IK9ZKP8pGRifk2HYhG/YTXIY3rv3eH1zdyS01B/0FQE8wBy0MCepUIYbcyrrA
	 R8/p64GZyMEal85BW5S5dm0BKJZBZfnoBEJOBcaWMf/S6E25069uReDPE02bSVECHZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795451011;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Scanned-By;
	bh=k7QgSOss2Kakj9bN8uJ6EnWTBBqZf7qQjOyQIsKr5EU=;
	b=gyPSmGjWSYKwtZPZYj4MkONZ95qzI8a75WIXevbhaPvvW/XGjtTAIhpHnld8s1t0YP6+
	 93xbfGobnMNrB0z7QRMA27wPOFw08nJOllqZ7IsZq1vHexWKQ0qDDAGwkSPI8ZFT8ewTp
	 7eERuJq8rn3nsYayFK8+gMltUoqkWuY/ODyTgLEOk+o+Q18O0yWQnAIBcFR6PnZW4QmMi
	 0qeSFdkAmh/Fn3stgBbFoRG6/6xBVM9x1CQCXW6YMeQ6LjgFfrZ7ZRzEAaPcXI9NaxRhS
	 z2gy5u39snEphbposRhLnoiq+rGyTjIcuOkoeGvJLgNYG1ZlJ5u3UxhC02Hs4ngkldg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NYPTgkQg;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9FF606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:23:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB9FF606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NYPTgkQg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795451009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k7QgSOss2Kakj9bN8uJ6EnWTBBqZf7qQjOyQIsKr5EU=;
	b=NYPTgkQgtoWBTkG/K8TUwtFHDwxzLGBIvc7ni8A0jiGU1RmBKxDNIv+TTfJrj6JFX1YGL+
	sNqPee4ZzgAWcGzp12PJHKlC4FVMBq24NwcTuBYBaHXgHqXFUGpi0U4+1Ia8Omvxgy9r4w
	8y1FwiSeZ+GWkoWku2ctX7hMgwKy2gc=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-62-r3Fo4sd0Nx2MEdtBw5uQwg-1; Mon,
 23 Nov 2026 16:23:22 +0000
X-MC-Unique: r3Fo4sd0Nx2MEdtBw5uQwg-1
X-Mimecast-MFC-AGG-ID: r3Fo4sd0Nx2MEdtBw5uQwg_1795450999
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C87721800552;
	Mon, 23 Nov 2026 16:23:18 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 2DC62195B3C9;
	Mon, 23 Nov 2026 16:23:14 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Mon, 23 Nov 2026 17:23:18 +0100 (CET)
Date: Mon, 23 Nov 2026 17:23:14 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Ziran Zhang <zhangcoder@yeah.net>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] sched: clarify ptrace's effect on task_struct->parent
Message-ID: <awRocuwV_7lJHSl4@redhat.com>
References: <20260910133027.8453-1-zhangcoder@yeah.net>
 <20261123111256.18671-1-zhangcoder@yeah.net>
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
In-Reply-To: <20261123111256.18671-1-zhangcoder@yeah.net>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On 11/23, Ziran Zhang wrote:
>
> > The current comment for the parent field does not explain that it can be
> > temporarily replaced by the tracer when the task is being ptraced.
> >
> > This can lead to confusion, so clarify the comment to document this
> > important behavior.
> >
> > No functional change.
> >
> > Suggested-by: Oleg Nesterov <oleg@redhat.com>
> > Signed-off-by: Ziran Zhang <zhangcoder@yeah.net>
> > ---
> > Changes in v2:
> > - Use Oleg's minimal wording suggestion to adjust comment.
> >
> >  include/linux/sched.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/include/linux/sched.h b/include/linux/sched.h
> > index 705970d07..8aad8a8ef 100644
> > --- a/include/linux/sched.h
> > +++ b/include/linux/sched.h
> > @@ -1093,7 +1093,7 @@ struct task_struct {
> >  	/* Real parent process: */
> >  	struct task_struct __rcu	*real_parent;
> >
> > -	/* Recipient of SIGCHLD, wait4() reports: */
> > +	/* Recipient of SIGCHLD, wait4() reports: ->real_parent or ptracer */
> >  	struct task_struct __rcu	*parent;
> >
> >  	/*
> > --
> > 2.51.0
>
> Ping on this v2 patch. Suggested-by ptrace maintainer since September.

Well, I only suggested to simplify the comment you proposed in V1 ;)
So please remove the Suggested-by tag, feel free to add

Acked-by: Oleg Nesterov <oleg@redhat.com>

