Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629912;
	b=h4frMwoIeQr4SLEloqe0hhl2XsCN2oXAzg+FgV3gwSub39W7iMhlNiG17ZDyMZW0ZYdF
	 1q4a/HhE0Q+YgjmO+Bmh0sDPdBkcv2htOqtGGiZfaKqz+uR4ng3pgjaFeP50LXSDv13fd
	 Lv0PMj+9Ai1s1xA6anhpLkBB25pOyLb61Mg6dEz6+9PEFVatt++PtivI+bmY9DM2tdi4o
	 Jl6Ne88UY1LqVha+x3E34wlAS6ZRoW1tESoWmlHFJ6AbyhuY6AtKVKnfsFSRIKs9YULnx
	 f8lHHtssVV+dUuvZh+VtwVHHmtW+BMTDeffmpS2+viulDthYqYm5nEfcrvUtOOivXAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629912;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Scanned-By;
	bh=1rpx+3hZ3i6ycHmkkGcDthqhxWJ6L8BnBo1hR3Q2eKE=;
	b=omiSVP2ruGdQLSftCxk1KvL12fJsqahDoRFxszWdQADTRlebwgrvLktN0K2WcMAcXpm0
	 OkCqvY9fKrVqfZB5xep4r4i4m47y3da7HVcw6l7axX2hxBKHHTNPn2o2zGJ1qZSbCwGO4
	 jcwmlLcNhac4tmtymBJy/2TIoW+E4JNFoC/yap6Df4NPt34Y7k0iCEGZ3jmnYWS6uyeNd
	 MgUJpxFaewTdEgjSkImH1gxWu6MrcDRryGR1Vl24LiAARS/UlJhj91GdKweG20gXzGG3l
	 cU21dJNpgWPFJo14dUNXXHI8IoLFgsAt5sEhGX5W88Q73flaHLY9a59PA/tVLY41/bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=G+QAAEPH;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD86606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:05:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCD86606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=G+QAAEPH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795629910;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1rpx+3hZ3i6ycHmkkGcDthqhxWJ6L8BnBo1hR3Q2eKE=;
	b=G+QAAEPH4u3fq7RjEZGV7oQyHmcROKkWH7gYpr49kEvAcMRDT3uCyB20v1/9jSsWnzIedz
	vpr9pBSEQdFn+FQ17LSLuJHpeYth0kgK4yAooi7v9+QRFWouoRNp5eu7EMqxE0LzvgbsBw
	qO9rlTW8mDZO/1YztAxcyuLsfdUOKx0=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-614-RNGMqG3IPIexq9Xse4ufjA-1; Wed,
 25 Nov 2026 18:05:06 +0000
X-MC-Unique: RNGMqG3IPIexq9Xse4ufjA-1
X-Mimecast-MFC-AGG-ID: RNGMqG3IPIexq9Xse4ufjA_1795629902
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C595E1955EA2;
	Wed, 25 Nov 2026 18:05:01 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id C993E18004FC;
	Wed, 25 Nov 2026 18:04:58 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Wed, 25 Nov 2026 19:05:01 +0100 (CET)
Date: Wed, 25 Nov 2026 19:04:57 +0100
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
Message-ID: <awcjSc-84AgPPdj8@redhat.com>
References: <20261122-b4-sched-wait-intr-head-v2-0-4a764b64e8ce@columbia.edu>
 <20261122-b4-sched-wait-intr-head-v2-1-4a764b64e8ce@columbia.edu>
 <CAHk-=wj_eqNh+gNhCQh3exrL5Pmo5hbZBcL0W-4Ah_Nw0Kegzw@mail.gmail.com>
 <awWSwmvaTwBxfU-r@redhat.com>
 <CAHk-=wj3GCXZohdFWWPAOkC_LHno4X0oQW+0sQFJzRMvjpODUg@mail.gmail.com>
 <CAHk-=wgYc9vFEmyV0Ch_e49j6GOhUCMQMnMV4f1FLLvumZOmRw@mail.gmail.com>
 <CAHk-=wjbK0xyhwvWP1uNiYR6i-X9MpCn8bnm_akxq0MsrYOL+w@mail.gmail.com>
 <awbJz9stwx_JzZFX@redhat.com>
 <CAHk-=winCVsBKy0mGZK3mazNoTO73MrnmFHXNBw0UNK30Di7Fg@mail.gmail.com>
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
In-Reply-To: <CAHk-=winCVsBKy0mGZK3mazNoTO73MrnmFHXNBw0UNK30Di7Fg@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On 11/25, Linus Torvalds wrote:
>
> On Wed, 25 Nov 2026 at 03:43, Oleg Nesterov <oleg@redhat.com> wrote:
> >
> > On 11/24, Linus Torvalds wrote:
> > >
> > > +             if (flags & WQ_FLAG_POLL_EXCLUSIVE)
> > > +                     poll_woken = nr_exclusive > 0;
> > > +             else if ((flags & WQ_FLAG_EXCLUSIVE) && !--nr_exclusive)
> > >                       break;
> >
> > I obviously like this change, but note that wake_up_all*() helpers
> > use nr_exclusive == 0, so
> >
> >                 poll_woken = nr_exclusive > 0;
> >
> > doesn't look correct.
>
> No, I think it is correct.

It is, sorry for the noise.

> The logic in the new code is that WQ_FLAG_POLL_EXCLUSIVE should only
> wakes up one of the entries that have it, *except* if it's a wake-all.

Yes, yes, this is clear,

> For wake_all, the poll_woken is never triggered.

Yes. I can't explain it, but somehow I thought that that nr_exclusive is
"unsigned". Damn, the only excuse is that I could not really read the code
today ;)

Thanks,

Reviewed-by: Oleg Nesterov <oleg@redhat.com>

