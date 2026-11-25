Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795631243;
	b=jAm2A3w2u3kD8ONriXRebS55qzWxBvMFows1amx9rv1NvuG+aWvot9EYyxdNNz0gqkMx
	 cabtbQaIejv9e25SokgFa7PwYu5YIiag4XlzbKQqfAIyha/a6oFkEJHdQVL6ETCGOwqFx
	 DBhuKdH4nAfakvNQzOJsaUcPL36s7a99N6P312YvrVzS2I8JIBqQAzJC/ggXIFAqUNcad
	 vzXkU4Ma/PSVyCoYIvlqqekz5wBoJbwZ29POCZnmo4KyLl2Dmdj2wuYPTYPp4BtaXyjx6
	 G3hYLW38nILgOM0QuKaDqOukXo6ihdzUdSP6W0zp5uxWGOvi9HYs+k0CgyQQhOYStTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795631243;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Scanned-By;
	bh=AdJ2OcPY7PZL5nLS/dMp3rb5ggUheY55JCQ/vRYqFRQ=;
	b=D/ApTM9LINwnXmWsrSt9R7VcIH8q2gHos0yZ+NOIXw6txPSOJh5vlKsf+JS7xZ/zx6YU
	 +gEHSD4jl6d6nTs7KtU4m2AlJxE86jfxScZGn07GxLQHhN6KLIg8VtEBArmw4HYp608YW
	 mjWZqr3mrnb3UhEWf4HQvBoiW6e7U5qQncANatD2Uhe3akGyKeeRtTiOY0Fl+L+fl5zo4
	 ZSOR/pNSvrW1LOthjXInsSIKe3tEsXsu2F5tIwmITTUufZEaQCuZ4cO9ymuCvM5HNGex/
	 HWhSBgbh88g6y+oGCrM6PR6b/YxXfZuI4IBvzhw7hCbU9equdamvc1/BmwIVNoMSKaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="PF/8Ev/G";
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B752D606A330
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:27:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B752D606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PF/8Ev/G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795631241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AdJ2OcPY7PZL5nLS/dMp3rb5ggUheY55JCQ/vRYqFRQ=;
	b=PF/8Ev/Gi/CC6/cY8lTggCiXqbQs3UI5TsMqP+LoZ5bMGMwmHSOiArNJqzx0f/GijMJczP
	x4lrUJ6VaqGl4CdRNQsciP7N9wISicAfdzzXoBtVBiEuGm3pGYbpAqO08YDfDrxOPWYkVr
	T9TSvP8x59ownUqFWm3FxD/S3MCcDtQ=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-321-SVBYfSOMM1O8gH4B10pXrA-1; Wed,
 25 Nov 2026 18:27:19 +0000
X-MC-Unique: SVBYfSOMM1O8gH4B10pXrA-1
X-Mimecast-MFC-AGG-ID: SVBYfSOMM1O8gH4B10pXrA_1795631237
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 790AF18002A1;
	Wed, 25 Nov 2026 18:27:17 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id E25AE195608C;
	Wed, 25 Nov 2026 18:27:14 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Wed, 25 Nov 2026 19:27:17 +0100 (CET)
Date: Wed, 25 Nov 2026 19:27:13 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Avi Weiss <thnkslprpt@gmail.com>
Cc: mhiramat@kernel.org, peterz@infradead.org, andrii@kernel.org,
	mingo@redhat.com, acme@kernel.org, namhyung@kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] uprobes: avoid postponing return-probe SRCU lease
 expiration
Message-ID: <awcogTgVYXBEDD-2@redhat.com>
References: <20261124091252.567037-1-thnkslprpt@gmail.com>
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
In-Reply-To: <20261124091252.567037-1-thnkslprpt@gmail.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On 11/24, Avi Weiss wrote:
>
> --- a/kernel/events/uprobes.c
> +++ b/kernel/events/uprobes.c
> @@ -2052,6 +2052,13 @@ static void ri_timer(struct timer_list *timer)
>  	 */
>  	raw_write_seqcount_begin(&utask->ri_seqcount);
>  
> +	/*
> +	 * expire_timers() calls detach_timer() before invoking us.
> +	 * Order its pending-state store before loading return_instances.
> +	 * A publisher that saw the timer pending must be visible here.
> +	 */
> +	smp_mb();
> +
>  	for_each_ret_instance_rcu(ri, utask->return_instances)
>  		hprobe_expire(&ri->hprobe, false);
>  
> @@ -2304,7 +2311,16 @@ static void prepare_uretprobe(struct uprobe *uprobe, struct pt_regs *regs,
>  	ri->next = utask->return_instances;
>  	rcu_assign_pointer(utask->return_instances, ri);
>  
> -	mod_timer(&utask->ri_timer, jiffies + RI_TIMER_PERIOD);
> +	/*
> +	 * Order the return-instance store before timer_pending() loads
> +	 * the pending state. Either the callback sees this instance or
> +	 * we rearm the timer.
> +	 */
> +	smp_mb();
> +	if (!timer_pending(&utask->ri_timer)) {
> +		utask->ri_timer.expires = jiffies + RI_TIMER_PERIOD;
> +		add_timer(&utask->ri_timer);
> +	}

Reviewed-by: Oleg Nesterov <oleg@redhat.com>


But... If you ever send V3 for any reason, please also add the
"pairs with ..." comments back. At the start of the new (and imo good)
comments which explain why is this barrier needed.

Oleg.

