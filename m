Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795434987;
	b=Oe9gtWdbYxLXqu3E5rXttx3nJHkd/pWgiZYGQpmfi9jP/hYA/Sf+amCE2oVaE3FT1Lmb
	 qy0DUhf5GT6P7cOTwxI4dHbWxzsIMnWCWVisKQQRaY/wPdfDQqLnobCcXZUsnro40Ma8P
	 WzGpA4l840cSYZAuSpS6NX1rSEvXHcgoQDexNw/Z/O1UD1oAiMVtcehJ78aayhGlOHvIj
	 x/AUvcRHv8az/6xL2xiKQ1/RtxmTqm3eEP2VpO/RDegCMVuLqALgHszgjwvMNztsXZpIm
	 YZc0zDJyk/ptrJtS8BleVHePrDldVCesUb+wcT/P1G2K4Y5MUhYnkrVLbZ7tsim2XeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795434987;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Scanned-By;
	bh=JWKnHCuSk7LneegfayxlFTdcSpVyKl2lOhT1vd5/dwY=;
	b=syCXjt1TTL2PEcje0v8ge2Wtwmvl9oKlc1/JSlRqhB6yYY6d0AUvuHk0img7cH+ODwmA
	 eN0PEeUF5BTizSi2+JJNF6BlzRFk/v8igmf7yjyFGOwOtOUphi1b01N9w+k4pmyOy5ybB
	 N32zaUiP2RBPVYTJjf4ZAuk+IXckl73pBJIPYFlxLOtsFE50971UDt3lJCzJ4BORXGqga
	 nvY0/3jbmTaUzbRwUgMWQiFHroeAbcu/g5XbJAiftUIRkL+M17rgL2HqI/Tx5awBerMEx
	 PHEiudlyJbAZC6p1aqaKDFK05wPGbkYUEEA0MVljf/XGO5rbkHkTnA7wNxvA2Xa/ANQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KvpC2MHH;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C73A606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:56:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C73A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KvpC2MHH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795434985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JWKnHCuSk7LneegfayxlFTdcSpVyKl2lOhT1vd5/dwY=;
	b=KvpC2MHHkypZy6gXZCIY7Ta/Oe3hPmqtRqoHLLUOnx0AhghbUtlXsJGlHFoOGHafP2HN+6
	QK7E8bBu67nzM2apA64QjiLVaKIwi83/oeGH1u2SnrdyQr9QBva8CNbsGFAIABAWmT69xo
	1SCxWqcaTtz+UN5q3qefjrDnbJc6x+8=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-694-uMh-3LQANHe0guXSvQAUxQ-1; Mon,
 23 Nov 2026 11:56:21 +0000
X-MC-Unique: uMh-3LQANHe0guXSvQAUxQ-1
X-Mimecast-MFC-AGG-ID: uMh-3LQANHe0guXSvQAUxQ_1795434979
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BCBFF195609D;
	Mon, 23 Nov 2026 11:56:19 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 031EB18004FC;
	Mon, 23 Nov 2026 11:56:17 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Mon, 23 Nov 2026 12:56:19 +0100 (CET)
Date: Mon, 23 Nov 2026 12:56:16 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Henry Martin <bsdhenrymartin@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Christian Brauner <brauner@kernel.org>,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] signal: initialize k_sigaction in sys_signal()
Message-ID: <awQp4FzrABb9s9Be@redhat.com>
References: <20261123091329.3658965-1-bsdhenrymartin@gmail.com>
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
In-Reply-To: <20261123091329.3658965-1-bsdhenrymartin@gmail.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On 11/23, Henry Martin wrote:
>
> Zero-initialize the whole struct so the fix also covers architectures
> that keep the restorer in ka_restorer.

...

>  SYSCALL_DEFINE2(signal, int, sig, __sighandler_t, handler)
>  {
> -	struct k_sigaction new_sa, old_sa;
> +	struct k_sigaction new_sa = { }, old_sa;
>  	int ret;

Acked-by: Oleg Nesterov <oleg@redhat.com>

