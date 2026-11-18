Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794963129;
	b=n2txKIeQUyyE/rw6XRkUysbLNmydCSPnrBBIiXusJcgqdZbNBNdub5F8IbjI57LDbOuk
	 OdpV9D6pRAm3GrUw/y2JK1nBL7J2D9Yr/Cne6oX9Ce9R45VknfA6CgQm98v8cnTuvdMRV
	 TnOPv/NYyZElHLWcEUdMjOhP4JBYAVo1uEDTNNMoZrswnrfHSNTvbp6SF3ft8i8DyVyVJ
	 zfmhv38zqV8qBJaEUu7ZDbQe3woo0OdLq9whFHON4BhVZ+GUlcDBsBkHBlmX0tG1quJ8R
	 V4hOdLpIa6XxqR3Nhv8GTpTq8AeLk08puj0EiaP5Q62lh40PsqlV4HArCS54LBAz9vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794963129;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Scanned-By;
	bh=kln/hNnmMrnzVCApzGzQusWUmbr2uj6lH/eTkc+hpFU=;
	b=P8Wo8CFLXgDBrTmdYb1GoKJwFurepVURmgFrmV/bokeHwHSo9FS8waX0KlZ8zQ+5xo3M
	 gNbOl/ShjtVofRgHZPMLiXZRjbAfXAxnzwcz26JN3j8wgRmzp/GHtnsq7SJjl5z/5B5g5
	 ql1QOEQXnc6tIXuq+bsvEwYeO4u4kgrN0+nAG0h9OEyCQSOaqpS8toiqajCw3zXlc4P3/
	 GVDOgEWbZDF4f0t5D/J/331aPmHiPAJDaoqBlzqxzIJFEOXr2lcYL7y2pJ2WQ57VqtCRD
	 qblOmRJVDKw84X+RLbWSow/l68Rb98DtF3CMS2h4LJ6pePU5pxuINnbINAsdpWLKJzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bnGmTo56;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07214606A886
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:52:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07214606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bnGmTo56
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794963126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kln/hNnmMrnzVCApzGzQusWUmbr2uj6lH/eTkc+hpFU=;
	b=bnGmTo56Pwbqy+5+QfG7Z9RaulpCctnx3zpCfSuPGFauE1MNTZTQUo/YnlZUJ8OsjaIh7n
	KK73tYS5XQEqsfu8GPqI2T17i/eW5n6iIpcTyTQXtO0k426KsaUSeB5A3tkmw+vEdZnHKt
	iw+QXPa3MtEwpJysr/9ajvHJQ45kRl4=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-225-iRjuXzO3Mt2m2J6ZMIplFg-1; Tue,
 17 Nov 2026 19:52:04 -0500
X-MC-Unique: iRjuXzO3Mt2m2J6ZMIplFg-1
X-Mimecast-MFC-AGG-ID: iRjuXzO3Mt2m2J6ZMIplFg_1794963122
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3839B195606C;
	Wed, 18 Nov 2026 00:52:02 +0000 (UTC)
Received: from bmarzins-01.fast.eng.rdu2.dc.redhat.com (bmarzins-01.fast.eng.rdu2.dc.redhat.com [10.6.23.12])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C57911800543;
	Wed, 18 Nov 2026 00:52:01 +0000 (UTC)
Received: from bmarzins-01.fast.eng.rdu2.dc.redhat.com (localhost [127.0.0.1])
	by bmarzins-01.fast.eng.rdu2.dc.redhat.com (8.18.1/8.17.1) with ESMTPS id 6AI0q0Ze3962128
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 19:52:00 -0500
Received: (from bmarzins@localhost)
	by bmarzins-01.fast.eng.rdu2.dc.redhat.com (8.18.1/8.18.1/Submit) id 6AI0pxLp3962106;
	Tue, 17 Nov 2026 19:51:59 -0500
Date: Tue, 17 Nov 2026 19:51:59 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Qiliang Yuan <qiliang.yuan@linux.dev>
Cc: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
        Mikulas Patocka <mpatocka@redhat.com>, dm-devel@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dm thin: drop the grace period from thin_ctr()
Message-ID: <avz2r1E3cS08yPIS@redhat.com>
References: <20261116-bug-dm-thin-rcu-gp-v1-0-14ed3567da3e@linux.dev>
 <20261116-bug-dm-thin-rcu-gp-v1-1-14ed3567da3e@linux.dev>
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
In-Reply-To: <20261116-bug-dm-thin-rcu-gp-v1-1-14ed3567da3e@linux.dev>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On Mon, Nov 16, 2026 at 12:12:03AM -0500, Qiliang Yuan wrote:
> thin_ctr() adds the new thin to pool->active_thins with
> list_add_tail_rcu() and then calls synchronize_rcu(), so that a
> wake_worker() call can't miss the bios of a thin that isn't visible yet.
> 
> The grace period doesn't make the entry any more visible. A worker that
> walks the list after list_add_tail_rcu() finds the thin, and the thin
> gets no bios before its table is resumed. A walk already in progress may
> miss it, but the wake_worker() for the first bio queues the worker
> again. Still, activating a thin device waits for a full grace period,
> which takes about half of the activation.
> 
> Remove the synchronize_rcu() call.
> 
> Activating 100 thin devices of an idle pool with dmsetup create takes
> per device (mean of five rounds, min-max of the rounds in parentheses):
> 
>   before (ms)        after (ms)       change
>   15.4 (14.9-15.9)   7.6 (7.3-7.8)      -51%
> 
> Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>

