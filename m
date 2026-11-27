Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795777192;
	b=wWEjDIm5cZvZJcWbyvjF5Fled3DtlJ7VA61WAisk9SdzAoM+sTS2N7s/3t8Lfx3kc6LU
	 I3OxtJbBBNSRr/yENjIxoYtZlmIe0IVsL+MgEIR9dmzuO96dvUyWN17JdqcWyEZ9wFMSu
	 tU8PHTVGi5NKhgoCQ1BxFKl1VTf+r7ajd3YV9UiLV+Od0MfBv0TgGhsl2ksYsLm1j89rb
	 Bj9e7FAzNu5haoijOGGH0+nsO0QVyGI6qr0HDFFhxl0iTkgNEdAZCRSCVmafyTyIBHf8G
	 LPO/VUKntdp2XSTsc6HAd/iBt5jf29xGBHFw/axWo1ogVgcEMXiaq8w4aEmRnHsvcuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795777192;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Scanned-By;
	bh=eDmbQxvOAV6AoLiIpCNO1W0wBoR3l1azQOV++NzOhOg=;
	b=eCx73ADJUhsiKDgjgc0RwLYgyF/VPZAQnYEfSIWhPxwHnBEiW4BvlpYpGpJipf5bwbJ/
	 G6YofOlPAChOtJ7nlAYfbjTlYMi1Kxiyyc5McE97Wa0VIFqjwXlA8cd0GfiTUY65we2Sb
	 8wG4rMvfaCMdU31hME6gEIr/vAoVw9OKl+z//RO4omsN2j+OysnGf1Q6GVI/Qakx7+sbX
	 fGKN6m6AUQ0f7inDKU+0RSUt8BqfsGD9o+TIEkP3RHbdqJt5BOslHJ6OmMHAH7hhIzCeb
	 DMQAd3x9hCsDTF6LzDBu0u6ZSvI0oeT7GhfBuVRJzgsmuDu+0cM9XVVMVjl3Enfl8SA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ACccuzUZ;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A2E606A329
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:59:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65A2E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ACccuzUZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795777190;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eDmbQxvOAV6AoLiIpCNO1W0wBoR3l1azQOV++NzOhOg=;
	b=ACccuzUZV6cmFHEwlox24Zdsrp+Fyn6kf3aIcNiZUEjc7y3vGEDNNHa6wKPISwypXPWIuE
	t84k4oyEMgqA/0O1qg2nwVeWLWEyfS3IGligmIY6W7NB6hHMWyydPA3XObK8ov/bdN346I
	sTfs0DPe8MEc8GBMqhP5N0kLtYJwZAo=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-448-oodBcF41MqmwaMAc8hNtZQ-1; Fri,
 27 Nov 2026 10:59:42 +0000
X-MC-Unique: oodBcF41MqmwaMAc8hNtZQ-1
X-Mimecast-MFC-AGG-ID: oodBcF41MqmwaMAc8hNtZQ_1795777180
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 956741800548;
	Fri, 27 Nov 2026 10:59:40 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id E9DBB30000D3;
	Fri, 27 Nov 2026 10:59:37 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Fri, 27 Nov 2026 11:59:40 +0100 (CET)
Date: Fri, 27 Nov 2026 11:59:36 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: akpm@linux-foundation.org, brauner@kernel.org, adobriyan@gmail.com,
	jannh@google.com, jack@suse.cz, sforshee@kernel.org,
	me@black-desk.cn, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] proc: also check the opener's capability for
 oom_score_adj and oom_adj
Message-ID: <awlimNsIKMMa6vN-@redhat.com>
References: <20261126045222.20770-1-dennylin0707@gmail.com>
 <awgPDmEbGpJsT_iS@redhat.com>
 <awhFQzXfWnDh1mKe@redhat.com>
 <CAGEkeHeWU1=HjMX=GETdRnWkr-xqTBZp7p8RDdtTiUVw3+qBfQ@mail.gmail.com>
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
In-Reply-To: <CAGEkeHeWU1=HjMX=GETdRnWkr-xqTBZp7p8RDdtTiUVw3+qBfQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

On 11/26, Hungyu Lin wrote:
>
> On Thu, Nov 26, 2026 at 03:42:11PM +0100, Oleg Nesterov wrote:
> > I just noticed that __set_oom_adj() has more CAP_SYS_RESOURCE checks below.
> >
> > Shouldn't we unify them or even factor out?
>
> The checks below only decide whether a successful write also sets
> oom_score_adj_min. The checks above already prevent a write through
> an fd opened without CAP_SYS_RESOURCE from lowering it, so I left
> them as they are.
>
> I can factor out the common check in the two rejection paths in a
> separate patch on top of this one if you like.

No, up to you, I don't really understand this code anyway,

Oleg.

