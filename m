Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795607022;
	b=3eflir2c9CvLaklP/u6pFkgz8NjpV80ODgnIYIKv93IpFTB8e+RJYrUCnH4qVT8zltyp
	 2fPJP2/zQ9dwx2u9jO6L51yhCBDCVcNPIcdYxwIGX0kXFGUZZJ/zo5MIhx+XBWCBk+eUy
	 +bVP5kwhESUNHjbFCuJ/6v9joadyHUFtREYTjq79iSUJB9Nk3QavwnGtgLpGSWoePTT7n
	 L3y5xQ7YLNokPCKLrLIu1Gdc4eNfi2Sgy9BmngKkW9bDlbpw5Sc2RIsF7K8+KOYsjNmfP
	 qlgmCBxKA/krv7QIbuZAmTy2VpnVbsWpeWxgEmEvVKmYZWCqoacToHvdZaNueJpRFJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607022;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Scanned-By;
	bh=Ro/q02DiURiwSOcN9QA2cgFPXuLdyWbUrkDRq5unrbc=;
	b=CxhFZQrokle0MxmXFi4g6LufGnS1pOXfyQLoKjHZI02Ehqmyv0MkTtLpEXVLtrUk0MEa
	 xog7Egl8IgK1ru33Gre569UCxLHITv46R5HxMJnOYgpIZXnnL7NTw9zwHoizOJ6WEHn6y
	 8ewnVbpVDx1Y17dd2R+9ATAwnuVLBliRU31Ll44ILCemIHnQMOy/jsC3ealoQogxjicUZ
	 0f1kAyUWJbM90Zy78hWms9LYyb0cjtaEACbSQhEXZNqzZvV4o/tWAXltQCB+1lb4cGpj4
	 WThaUC3Dg1HbMdk6uIfUYTaW0WRTdi/20aA8ngmkAAAi/AL3E7oiPsHq6JbjqY/LahA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=R6dgT30X;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FE7606A329
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:43:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8FE7606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=R6dgT30X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795607020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ro/q02DiURiwSOcN9QA2cgFPXuLdyWbUrkDRq5unrbc=;
	b=R6dgT30XGwhMJ/KBQ3B2sYl48R6mxFAgZ1PGU7K7RtczaAlUEDGAIQwxzJNVt6bC6mPV9I
	552KTy5ilRixQMN6p1IRE5b1m6jBu/2URl34OGylDDOZ/eRberpXGZY9CeNALEZpyP5u0V
	RFXGwyeq9uldXciN8Upki7vzw+B50OE=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-312-piUuYfOLNh6PqB1vS4-AYA-1; Wed,
 25 Nov 2026 11:43:35 +0000
X-MC-Unique: piUuYfOLNh6PqB1vS4-AYA-1
X-Mimecast-MFC-AGG-ID: piUuYfOLNh6PqB1vS4-AYA_1795607014
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D92371977502;
	Wed, 25 Nov 2026 11:43:16 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 2E2C33001DA7;
	Wed, 25 Nov 2026 11:43:12 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Wed, 25 Nov 2026 12:43:16 +0100 (CET)
Date: Wed, 25 Nov 2026 12:43:11 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: mt4022@columbia.edu, Jens Axboe <axboe@kernel.dk>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Christian Brauner <brauner@kernel.org>,
	Michal Nazarewicz <mina86@mina86.com>,
	Wen Yang <wen.yang@linux.dev>, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, tz2294@columbia.edu,
	stable@vger.kernel.org
Subject: Re: [PATCH 2/7] sched/wait: add WQ_FLAG_POLL_EXCLUSIVE for user
 space waiters
Message-ID: <awbJz9stwx_JzZFX@redhat.com>
References: <20261122-b4-sched-wait-intr-head-v2-0-4a764b64e8ce@columbia.edu>
 <20261122-b4-sched-wait-intr-head-v2-1-4a764b64e8ce@columbia.edu>
 <CAHk-=wj_eqNh+gNhCQh3exrL5Pmo5hbZBcL0W-4Ah_Nw0Kegzw@mail.gmail.com>
 <awWSwmvaTwBxfU-r@redhat.com>
 <CAHk-=wj3GCXZohdFWWPAOkC_LHno4X0oQW+0sQFJzRMvjpODUg@mail.gmail.com>
 <CAHk-=wgYc9vFEmyV0Ch_e49j6GOhUCMQMnMV4f1FLLvumZOmRw@mail.gmail.com>
 <CAHk-=wjbK0xyhwvWP1uNiYR6i-X9MpCn8bnm_akxq0MsrYOL+w@mail.gmail.com>
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
In-Reply-To: <CAHk-=wjbK0xyhwvWP1uNiYR6i-X9MpCn8bnm_akxq0MsrYOL+w@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

On 11/24, Linus Torvalds wrote:
>
> @@ -105,10 +111,16 @@ static int __wake_up_common(struct
> wait_queue_head *wq_head, unsigned int mode,
>  		unsigned flags = curr->flags;
>  		int ret;
> 
> +		if ((flags & WQ_FLAG_POLL_EXCLUSIVE) && poll_woken)
> +			continue;
>  		ret = curr->func(curr, mode, wake_flags, key);
>  		if (ret < 0)
>  			break;
> -		if (ret && (flags & WQ_FLAG_EXCLUSIVE) && !--nr_exclusive)
> +		if (!ret)
> +			continue;
> +		if (flags & WQ_FLAG_POLL_EXCLUSIVE)
> +			poll_woken = nr_exclusive > 0;
> +		else if ((flags & WQ_FLAG_EXCLUSIVE) && !--nr_exclusive)
>  			break;

I obviously like this change, but note that wake_up_all*() helpers
use nr_exclusive == 0, so

		poll_woken = nr_exclusive > 0;

doesn't look correct. I think this patch should also change them to
use nr_exclusive = -1.

Oleg.

