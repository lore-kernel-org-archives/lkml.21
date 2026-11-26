Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795719823;
	b=19snhyyH5ioVPE+0f6pev50GAisgE27lOadA/mq3Ay+ZITPO2Mjnx7URA+I7Zlz4hpq4
	 nBKW2muBaytTOfZ2pAIV5wkMjtiREfIH4jIvQMDeX2bb/kbkyYGGtOQ8Qt6eO7E53wVs3
	 DjBBnjIsNNC4JnPIZkA9iWP59figzGhntQKIKvZD4bAbarddiKQAa4RfBbuQX8/SUBnAW
	 EI6SHlcBne8Etc1sHqk/vtVE76BqQQEYpdy5xjJng5q37KNdt8t+ithAeeeEgv27zak+7
	 L6FlfTMoUyWQcMofG24gcGrE0rMEsAyh3z46q7pu7EcG0pgU6XNIq9WRyO+LdLk4vMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795719823;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Scanned-By;
	bh=1NLmpkwpRGemCjNAmExXJ2Jf4+Gcuw2/4O4W0/7nAKA=;
	b=vptHms6OxDsWlOTME/wIZqJ6LxktSEekZR9sOXRRBfNdGfdzz+SmoWRERVj7rn7pRK6n
	 16lLMJ+9WRT1vh4LW29oSkCKP8OfL270Q8zODyS+/s+TgOik7raL0rcOzVwUCB3lt9Lj+
	 uaWasWWjFG/Ur0iDsKqW0c1u7ynLXpsty/D4L5NAcqE4XkSrxHBMVpjx/hyhL84JHJAF+
	 t+/TxPzYknSz7Px1c4zshM/0RwGVrATzbGHtxWuGY2gOzdNXQ+DAeewE48hoDiwdICkWH
	 TofB4JozG/8EzWoFHUTCfHGJbtj5PEEwsZlGYND6nN80WzEI7BDnOuImFGkgXNWI2yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=InC7TlWC;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064A9606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 19:03:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 064A9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=InC7TlWC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795719822;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1NLmpkwpRGemCjNAmExXJ2Jf4+Gcuw2/4O4W0/7nAKA=;
	b=InC7TlWCz2SRk1oa/tYzEahw7iLtw+i9//caJrJ8ePNAeE/etLBYcSPds2is9yQFhOMqoV
	4Wf8s5WOTt8oTOZfvQ+FaFjTiwsS9gsKGDPvFDv2WNmyj9TYH96X1fMEyd75e+0UknoliV
	1d6CENbvdyJb2jzI+E4XSPdowaxtZng=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-114-bEqfSAbqPkqa_ZW734XZPw-1; Thu,
 26 Nov 2026 19:03:35 +0000
X-MC-Unique: bEqfSAbqPkqa_ZW734XZPw-1
X-Mimecast-MFC-AGG-ID: bEqfSAbqPkqa_ZW734XZPw_1795719814
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A7D7B1800557;
	Thu, 26 Nov 2026 19:03:33 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 6A7D618011E3;
	Thu, 26 Nov 2026 19:03:30 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Thu, 26 Nov 2026 20:03:33 +0100 (CET)
Date: Thu, 26 Nov 2026 20:03:29 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: akpm@linux-foundation.org, brauner@kernel.org, adobriyan@gmail.com,
	jannh@google.com, jack@suse.cz, sforshee@kernel.org,
	me@black-desk.cn, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] proc: also check the opener's capability for
 oom_score_adj and oom_adj
Message-ID: <awiCgZ3cOW7BaIET@redhat.com>
References: <20261126045222.20770-1-dennylin0707@gmail.com>
 <awgPDmEbGpJsT_iS@redhat.com>
 <CAGEkeHcK2rSWyQOp5a6Ub2SJ4wi8qK_Wz5uKH0WN+pLksL9jLw@mail.gmail.com>
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
In-Reply-To: <CAGEkeHcK2rSWyQOp5a6Ub2SJ4wi8qK_Wz5uKH0WN+pLksL9jLw@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On 11/26, Hungyu Lin wrote:
>
> On Thu, Nov 26, 2026 at 11:50:54AM +0100, Oleg Nesterov wrote:
> > do we really need to keep the old capable(CAP_SYS_RESOURCE) check?
> >
> > If a privileged opener of /proc/<pid>/oom_score_adj passes fd to
> > to unprivileged writer, we probably don't care?
>
> A write that needs CAP_SYS_RESOURCE still needs it from the writer,
> even if the opener was privileged. For example, a task can open its
> own oom_score_adj with CAP_SYS_RESOURCE and still have the fd after
> dropping that capability and calling execve(). If we only check the
> opener, it could then lower its value down to OOM_SCORE_ADJ_MIN, and
> any children it creates afterward would inherit that.

And my question was: do we really care about this case?

> I kept capable() so that a fix for stable doesn't relax anything.

OK,

> Or do
> you think the opener check alone is enough?

Well, let me quote the part of my email you have removed:

	Just in case, I am not saying that the old check should be removed,
	I am trying to understand.

So no, I am not sure the opener check alone is enough.

Oleg.

