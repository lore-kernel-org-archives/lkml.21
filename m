Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795079433;
	b=us1eKmUMImy2/5+I0qTnJpS+Qu8lbwq4XIeYT34nxFL5YkbQBE+hKhf1kTuYBQBt/Sc8
	 H74ITbKuVD2ckXGuGuCBuMqy1+kXZocYIT6jEfbfTs0feEju2SUnrK4tknhKJzBk57tse
	 awSddOp2Tt18+t1GNhfN7jsRiyC4WKeZuM0p/y9OsLMbyTbq4beCsV/frDM2uOuiWyTD0
	 hHRKyFwsvWJyya0SUaE2Fyk8AbGH2c/DpGLeYMO6RhHNotz3HmoQv5IE+dRCy0thiZeE8
	 TQM13rqcK6GkXoH2lPXS2eZcf8bOLpY4g64c/bKA4ddvAGsJp1iVCMgwjUBeVKCAmMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795079433;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=tuBOCCiH6AYUcrUIRQklRkNbz1Dojigm78BR7t4qnhM=;
	b=ld9MnO2m1GyQt7IUn6I59X0NwPsUsSjfnHs5AoaAS6E4KD/kGXU1vU5vDzY2Qvr+wGba
	 jKx4Leg6gGFL5y+mv459EQB2g7+fKet86D44zngmPiD8K5zkNKlZz/Bp0bW49EL83WquG
	 HLmzFazscu25As+i9qNBL5Iv91NY1YjY6TZxFkHvd/sexGj0Eid0eGHOAWIdXDGPMFE8P
	 qr8hiDNObn1KC8TCFvpM1CJWg+gti1HpIo0V6oE6Zjaq5dbf2qBuwT2PuGqwBmAVBfYgz
	 nlmth0b1S31fNhCr+vclICNVvBEzltsQx4gGWZaYaqkQDtub8iyORKNJ2zQGIo6v4OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ak8SSP06;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=S2tpJH4W;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55877606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:10:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55877606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ak8SSP06;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=S2tpJH4W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795079432;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tuBOCCiH6AYUcrUIRQklRkNbz1Dojigm78BR7t4qnhM=;
	b=Ak8SSP06UU4DSoW35enlMSyplGRxgyVyhWUEXLELfEbuqPDPQb3AV1PsgQxxN460IR37FT
	alxtXqzHluQ9vKauGbfarhPDNU6ZvQDpQW2yFYxl91O7063leqsA/boaxxMXFOph4EhKXr
	KPRfKoDdifyx/kuVM+d0jdgfyzRjsl8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-84-4pxV8BE0Ncqtsg7_zLsfPw-1; Thu, 19 Nov 2026 04:10:30 -0500
X-MC-Unique: 4pxV8BE0Ncqtsg7_zLsfPw-1
X-Mimecast-MFC-AGG-ID: 4pxV8BE0Ncqtsg7_zLsfPw_1795079429
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4aa0500c979so170669f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 01:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795079429; x=1795684229; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tuBOCCiH6AYUcrUIRQklRkNbz1Dojigm78BR7t4qnhM=;
        b=S2tpJH4Wj6jciNhL/J4DjTGLFb3gFzo/LgkP9ow8OTPov7qEGZJckh5wjM75Xa3QHp
         8wXSJRthuAGTzqs+NHkEp9uOE2/ayyCcyx1feo5KuZTHAv89ydrHab6WETnQ2gNZHeC/
         QPe9Z0XuEaZLj5Gd/ozaNEV1BvoJO2aDBu1Zj6wXCALmqGv1E3f6guEJIAzy0/cfXOay
         c/fzvbbUszZZROATz2kQZML2KwVQ8l+GlL1gNGaCUpfCnmvFQ/NlMUTj6Nm2rgQSEJM8
         /YPpo7sOoeR64D/4g64N9wUNvR0XtN3/Yb5gSaCsPKnoJtnLC1Iw8KMwk0v9NXp7alcs
         DaWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795079429; x=1795684229;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tuBOCCiH6AYUcrUIRQklRkNbz1Dojigm78BR7t4qnhM=;
        b=eGkqOV8tsMcjJWH+wm0ob4Gfb+JcfeITR0w7PnJVDgAvDw/beGr9O6xsQDeVin1KH5
         MTFzO6C+bDedKhmcLJ49k6D8rsyGkyzkRZ6TWmpD3NuF8CmV+5vh6Nve5cmOIDNnB+B7
         gTEon1YC75w9jwC560G72SKeW1kPkT0lBPD7FRSSisy6xSoz0IJGjpFX/sR8TnaAJXOt
         b16n04iGwngXxhzT2gnm7BnI4KD8uoCe42RXuw2fb7iC35wOS1huzdb8tQCtqJSOAt22
         X9/V1E6MU6aqRPRVcY00HVit+8/KCKEfiNSYqnD+qQc6Al+WwjAaY7DF4HlIWCCtCpDL
         a4xQ==
X-Forwarded-Encrypted: i=1; AL+hErF7ryXT1lVcv7swlT7/C4AKHwBrT09LY5RQ1Oew9dgLtFQmvbE46YKUztTYJfH/CSyI0uEW7WjJP1x2a+k=@vger.kernel.org
X-Gm-Message-State: APuU4Z881mscCvPJIJwPxBGuuCYwqDDoUSl+QBVYuJOm/NceTUboO7/g
	YxFPxXslToJtaBz41pWPJG9W+6p2Kc78p74fOZjw1/lGY9CDjFataR+j/ecnhLnmNyUZk0hQ6Si
	jradpPJR8t0t00Qi9/Vn1zVw3ICHaiB9YcEeqa024NzGyQbFVSiWO4OM6OiDZ2Pt/MQ==
X-Gm-Gg: AZFdTZfA5xGpqWdg+Zk0KKpURxpl32HBQcSVmKHtHxz3cQXSV8BykLIW04vthrm5uqa
	9CjuI4mdM2wPWxEjBLuXkQ1j5JM13v6+rzCbNzX6VB8m3MPh7zqDFNWDwDcd30Jbnu6iz1MXRB3
	6IRw7xV/NbXc5R1WGFakRs5l+rVlOeJ7fNzjECIAaMVj4w5Adkddegl+rbI8candM595KfhQPJW
	tFA4OGxq18cQutUmhLu2pC7hQ7hrhcYwlocbHdX4TeD6nRoOTXmXh0ZAwd8v9qWNiq9S5ChA9iN
	WhCWydcldo6t4v3sEtfUHyN4tWm7n6HsnKgvmyl+FdoTjU854UvSvbWGyXAeLbpw6ppaXh4VBwI
	Kq5ZpPsgew4SyoUZYTBahAq4UeEckWr/aiq3fvPR6X+xauKB8oORkDQ==
X-Received: by 2002:a05:6000:4812:b0:490:50c1:f359 with SMTP id ffacd0b85a97d-4a63bea9888mr10985191f8f.39.1795079429119;
        Thu, 19 Nov 2026 01:10:29 -0800 (PST)
X-Received: by 2002:a05:6000:4812:b0:490:50c1:f359 with SMTP id ffacd0b85a97d-4a63bea9888mr10985146f8f.39.1795079428655;
        Thu, 19 Nov 2026 01:10:28 -0800 (PST)
Received: from sgarzare-redhat ([80.116.143.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a655db6d45sm9145491f8f.33.2026.11.19.01.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 01:10:28 -0800 (PST)
Date: Thu, 19 Nov 2026 10:10:21 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Sergio Lopez <slp@redhat.com>
Cc: Bryan Tan <bryan-bt.tan@broadcom.com>, 
	Vishnu Dasa <vishnu.dasa@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Bobby Eshleman <bobbyeshleman@meta.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org, virtualization@lists.linux.dev, 
	netdev@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] vsock/vmci: reject datagram binds in local network
 namespaces
Message-ID: <av682hncPM1ksJtf@sgarzare-redhat>
References: <20261117-vsock-vmci-netns-isolation-v2-1-d6f35e86416a@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20261117-vsock-vmci-netns-isolation-v2-1-d6f35e86416a@redhat.com>

On Tue, Nov 17, 2026 at 08:01:52PM +0100, Sergio Lopez wrote:
>VMCI already rejects datagram sends from local network namespaces, but a
>datagram bind still creates a receive handle in VMCI's global port space.
>A VMCI sender outside the namespace can therefore deliver to the local
>socket. Its handle also prevents a global-namespace socket from binding
>the same port.
>
>Reject VMCI datagram binds in local namespaces. No namespace-local
>datagram transport exists, so EOPNOTSUPP reflects the available receive
>paths. Unbound datagram connect() and sendmsg() also return EOPNOTSUPP
>because both call vsock_auto_bind(). The receive callback rejects any
>local-mode socket as a defensive check.
>
>In a KASAN/lockdep QEMU guest, a reproducer observed cross-namespace
>delivery and the global port collision before the fix. After the fix,
>local bind returns EOPNOTSUPP, the global bind succeeds, and a global
>VMCI datagram still reaches the global socket.
>
>Fixes: eafb64f40ca4 ("vsock: add netns to vsock core")
>Cc: stable@vger.kernel.org
>Link: https://lore.kernel.org/all/sashiko-outbox-212907@kernel.org/
>Acked-by: Bobby Eshleman <bobbyeshleman@meta.com>
>Signed-off-by: Sergio Lopez <slp@redhat.com>
>---
>Changes in v2:
>- Combine the VMCI receive checks and clarify the auto-bind effects on
>  datagram connect() and sendmsg() (thanks to Stefano Garzarella).
>- Carry Bobby Eshleman's Acked-by.
>- Link to v1: https://lore.kernel.org/r/20261113-vsock-vmci-netns-isolation-v1-1-ced02054ea61@redhat.com
>---
> net/vmw_vsock/vmci_transport.c | 7 ++++++-
> 1 file changed, 6 insertions(+), 1 deletion(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

