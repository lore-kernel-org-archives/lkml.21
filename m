Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794938322;
	b=mMMu42eGSWadQJtK4n/A3CxzR8STaWMKyApCJxqJb2OF+r5lAYB+A/Ie3ICM13wts6w9
	 HuepLNDR02qglH9jKElM1B8A0l93g1PIOhUSLzgJF8uSPczouKkjXic2557OyfdYsOlxl
	 KmzbBiUdm9FdKnKNgSUEShOLutU3arSazHIZXTi7sBTE4ttIhqLkJUfvvvx7Wuj5ieb3i
	 6+r3wZDzXA3n4xjGeai76O/ML2XiyDUy5mlO7Svsg0/lZHkkL6SseAjQfArEgNW9TmF/Q
	 xnBbJOdkVqko3Cmkb5+VP6YplabQtUHv0WL0WGd3IBmrEVa0G4VTKEBEXcUtWOmcQSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794938322;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Scanned-By;
	bh=fDNSNdtJiNjajmSbnTodRJEXL2NvDP17/w+5CLNocfY=;
	b=ovCISJB6kqk6XydBDk8IrK3FbPFmKXZ9IV07NC8gwYPPaTXIu/eRwl2sp7RMbHs90AFN
	 o70HHiD0hKnEEyvwWEmZ3bT/I7KgexKdfp1aW2ZtzZhrIe/p93ypWPHCt0OU3kGonJ3/l
	 JTZGrlwckGwalBzqJagM45/rVfi1OFz1UoSbEpCFEX+tkitEDGcZKcVhn/IaPvS6Kjdte
	 3BHhUF8veSwTP90Vr02HJraYMxSSAI7G5yLO3R5SQIkq8jJl0Iv2a4p9X8NiSQ86ua4cB
	 6KQYB44L/zSlsHmb7tg4jcUNpE5S2w3y68bvYiTvlN1EG9FNrUiemDU8qvJZHQUWGdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RQUAWyu+;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8482B606A33F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:58:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8482B606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RQUAWyu+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794938320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fDNSNdtJiNjajmSbnTodRJEXL2NvDP17/w+5CLNocfY=;
	b=RQUAWyu+mlNTWbq6u08wfFosdmF1UAXwNZ31ZDwaIp78fYyNaAkCIMeX4BAVggCaxtPhuu
	s+dDN/75KhqYeju6jMVys0GnbhuJRffAuTyDHKXpmiNJpyvDy3b0qhP0tusB8vB2CJImYx
	B1I9bLLxaz9nUaguGt9CPGtjaSXb/00=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-207-NzwzltnfOmmdHu5W3N7H9A-1; Tue,
 17 Nov 2026 12:58:34 -0500
X-MC-Unique: NzwzltnfOmmdHu5W3N7H9A-1
X-Mimecast-MFC-AGG-ID: NzwzltnfOmmdHu5W3N7H9A_1794938312
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EAD5E195608F;
	Tue, 17 Nov 2026 17:58:31 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 2D765588;
	Tue, 17 Nov 2026 17:58:27 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Tue, 17 Nov 2026 18:58:31 +0100 (CET)
Date: Tue, 17 Nov 2026 18:58:26 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mani Tofigh via B4 Relay <devnull+mt4022.columbia.edu@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Christian Brauner <brauner@kernel.org>,
	Mateusz Guzik <mjguzik@gmail.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	tz2294@columbia.edu, stable@vger.kernel.org,
	Mani Tofigh <mt4022@columbia.edu>
Subject: Re: [PATCH] pipe: keep per-write wakeups for EPOLLEXCLUSIVE consumers
Message-ID: <avyVwg-5ef-pXZkG@redhat.com>
References: <20261111-pipe-epollexclusive-wakeup-v1-1-0af6283e9fda@columbia.edu>
 <avxWKI795DthE8Sb@redhat.com>
 <CAHk-=wjOq+G=6gte4vX_YxOD_VfE1uZh7=+KHs8N0wU75xyHEg@mail.gmail.com>
 <avyODoFhZ_M7YDU5@redhat.com>
 <CAHk-=wgcBSBtHE+3ceKGjq1jyF64OyoEqf5JPpixowAa80GqNQ@mail.gmail.com>
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
In-Reply-To: <CAHk-=wgcBSBtHE+3ceKGjq1jyF64OyoEqf5JPpixowAa80GqNQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

On 11/17, Linus Torvalds wrote:
>
> On Tue, 17 Nov 2026 at 09:25, Oleg Nesterov <oleg@redhat.com> wrote:
> >
> > So. Do you agree that we can "ignore" this report from Mani for now?
>
> I think we can ignore it, but I also have a cunning plan.

Good. this was my main (the only) question.

> So what we could do is to just make the pipe code open-code its own
> wait event logic, and add its waiters at the head.

perhaps... and we already have WQ_FLAG_PRIORITY, but we can't re-use it
without more changes...

Oleg.

