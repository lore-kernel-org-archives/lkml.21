Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795203856;
	b=MfStkmQ7igUbxilMlF7+QIGL9cyUJKKlIRCD6rVpX7wGn6z8STCDMPnnL/3uevi6SuTK
	 dBursUnZZYjwNsacCsJW9c6PfWTnb14Ipxq381kTU4dwVjJJIvjLxpZkyrDzZaBHYuRef
	 44aUpZkh92nH9GBAMp8mXjQ64V9eg2qRnXR/x4uGI3tkD2EMxHUCzVimwWHNfPTYqurWX
	 Vv61uUEsAxkFsrWvAqINk065rsVZQjOTp+vYa/kbovMaIQbqYtIpqYgltQpSRp+Bah7Ch
	 qK6ItDkJoxfLg7kqWzZHpf5lNM4EhZTKXMq0bSky5KYNcVYZwkAsN2HHsCD3x9mGxXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795203856;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Scanned-By;
	bh=wqj7eho1qsScUX7Rstv/jSo5ybS3FSLuhvGplwRCAqU=;
	b=wywgQWm2qBYd4ndqwAec+4U2p6Cdsrpm5by7haQu6qyXp/prCTVbkEONDKmnWaVa55pf
	 pw78h7Lw3p71KU73pr55Ykaz81AwR/uFhByw+b1whCdudDjAJ3GCFkRgMOqKA99+fJhqw
	 h0KfGH18I39KIHO7DjQuRbRB7AxuvmzNZTW/5VH+bGknSYMN3umIdtiKpLis3EYIejElc
	 NU7s4Xd8ruvtNVVia83R0B1/K1Og6IPD90yUwB9a6s0Kl9rv+YPcZV02S/UuJJ0AJGPPw
	 FlxBBPlh+LnKDDJ03XV9Vc6Swfqgp4DMpLXHqnESdU9cOdqPJ4wyef1dOxDDawUW0kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hhW3BGV9;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FAE606A6C3
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:44:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8FAE606A6C3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hhW3BGV9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795203850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wqj7eho1qsScUX7Rstv/jSo5ybS3FSLuhvGplwRCAqU=;
	b=hhW3BGV9JXlszr/OWi603j4Ja2rjwFSE2MvvUauraZomTldQqc+fGOq7AcWHY4MEsRdDky
	rhzCSq3dWpqrFlJQbQV3Dq/F7SjEPeDIX7trACqGynKlhX+G8jtZ6DKbXwDrlj6147/8c2
	opmHHoxTKkgYYWjtEJZp5Coql7y42e0=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-593-N45WE1kOOaaqJwZtFKTBdA-1; Fri,
 20 Nov 2026 19:44:03 +0000
X-MC-Unique: N45WE1kOOaaqJwZtFKTBdA-1
X-Mimecast-MFC-AGG-ID: N45WE1kOOaaqJwZtFKTBdA_1795203842
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C88E71801337;
	Fri, 20 Nov 2026 19:44:01 +0000 (UTC)
Received: from bmarzins-01.fast.eng.rdu2.dc.redhat.com (bmarzins-01.fast.eng.rdu2.dc.redhat.com [10.6.23.12])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7A8661956041;
	Fri, 20 Nov 2026 19:44:01 +0000 (UTC)
Received: from bmarzins-01.fast.eng.rdu2.dc.redhat.com (localhost [127.0.0.1])
	by bmarzins-01.fast.eng.rdu2.dc.redhat.com (8.18.1/8.17.1) with ESMTPS id 6AKJi0pB1530875
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 20 Nov 2026 14:44:00 -0500
Received: (from bmarzins@localhost)
	by bmarzins-01.fast.eng.rdu2.dc.redhat.com (8.18.1/8.18.1/Submit) id 6AKJhxUp1530867;
	Fri, 20 Nov 2026 14:43:59 -0500
Date: Fri, 20 Nov 2026 14:43:59 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Hannes Reinecke <hare@suse.de>,
        Keith Busch <kbusch@kernel.org>,
        "Martin K . Petersen" <mkp@kernel.org>, linux-block@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] block: stack max_user_discard_sectors
Message-ID: <awCi_9_Xykc_Mmk-@redhat.com>
References: <20261109193927.595104-1-bmarzins@redhat.com>
 <20261120154040.GB28611@lst.de>
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
In-Reply-To: <20261120154040.GB28611@lst.de>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On Fri, Nov 20, 2026 at 04:40:40PM +0100, Christoph Hellwig wrote:
> On Mon, Nov 09, 2026 at 02:39:27PM -0500, Benjamin Marzinski wrote:
> >  		t->max_discard_sectors = min_not_zero(t->max_discard_sectors,
> >  						      b->max_discard_sectors);
> > +		t->max_user_discard_sectors = min_not_zero(t->max_user_discard_sectors,
> > +							   b->max_user_discard_sectors);
> 
> I don't think we should take the underlying max_user_discard_sectors
> into account here, just max_discard_sectors.

Is that to handle devices that call blk_queue_disable_discard()? I
didn't think about that. Makes sense.

> But otherwise yes, this
> should be stacked.
> 
> Please avoid the overly long lines, though.

Sure.

-Ben

