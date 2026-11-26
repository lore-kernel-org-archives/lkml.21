Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685154;
	b=y5Ka53dj6OZIjRPA99wZwNdTB4EMhLUbowrje0DxqfsXzxRbg926igsw6ttiWIhLJxcP
	 Hx2P2c4Q+K79g7leOQZVyxqjFcbFInb0SEzHaPMmsvR8iUmOuK5k79LIZmUuj9MKdhUPh
	 HqMZmnzIjtS5JRcVhUCina028ELz31bMlCppY5KAxYR/D1HC1TFYFN0IN8Jtg6rnR7qQ9
	 B9PrqsSV1ZnaJO5TxTdHGNurrJsjzQNxYnfND7eGo/IM59173PjcMkqYHMeCKD/CV9ubd
	 4QgzlvJr6RAToth5MLACdNliM1x5iv8foicI/kSEkzL5Co5hPF7O1+vG8HM3wt21rig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685154;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=LfvcaCnRXo7+ZO7tgrpqUCFteTLmrLXFEjj9APedgl0=;
	b=Z8arjg0FZHKTN05+MupPHQRbfKwJMrQ3N68YBM9hQvCbidkk1S48JBKV9/n4jXDO2HeP
	 d+FhavdJJxFG+rxJ3wUdxA3f0w0QqLRsSzGEGd+c4yDj2WMSrz02BNh0k0QeJbcFORXKX
	 YPxbPonfJsDSyD8015xVAcMoT3ILp/W1MW8vt4pWWeuyAz9ajJvMplR8gNhFh5XyqHetH
	 8tq3AxVB8L1NQcquImBZB0gscTIZZSH256oKWGKQoqfE98Dr5EiV/UgkHAmJ2elr0s1JR
	 FHYaRRlro6ddwHpfHCk9OiNuMKhmnd8Bw6l4zYc9uHb5NJQGOCX2aq+/CuAeNf1cDug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EQjJIA0q;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=B0DQWVhR;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6170606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:25:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6170606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EQjJIA0q;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=B0DQWVhR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795685152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LfvcaCnRXo7+ZO7tgrpqUCFteTLmrLXFEjj9APedgl0=;
	b=EQjJIA0qgg9kzPnXlRXrbhuQ2TDh99Hzq1ZfNV/e5hcoPfT79xqhn2Hi8r0ZUaBTBN4qda
	M3WQDMaeKzpzfKRF0X/bRQwygAxJf7YC2T6GaH+2MtyBQ8MB9tlqv977dSBEWBQDoEPQ7V
	QPMXtihoapCxQbRhFJvsQg/bEP1j8yU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-435-WuNq4k7xPJaog10cs6l8Mw-1; Thu, 26 Nov 2026 09:25:50 +0000
X-MC-Unique: WuNq4k7xPJaog10cs6l8Mw-1
X-Mimecast-MFC-AGG-ID: WuNq4k7xPJaog10cs6l8Mw_1795685149
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-4915ba023d4so4252500f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795685149; x=1796289949; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LfvcaCnRXo7+ZO7tgrpqUCFteTLmrLXFEjj9APedgl0=;
        b=B0DQWVhRZ/jvEiWnXpaC1SnUOb5W0IaAtvMuz/ToupBUsoqIzK0Sn8dX2v4/SzO7bZ
         MY6FQMjBdz23ruklE2uSrRmCKvwYfLUWePuca39GIB/V3xloCicRtgaLyRrrTbtVcq5d
         C/PnVLhuZ52+cy6/5ETNDkjAMxZAivqQBa4DS1QXO13Zyg/yEpkqDNXGxRS9BHqEoVS7
         1xivqX48Blo3kqAyfTiYt0MwY4pUt4U8+ezxgxEEFGuqlxdo9BtN50FGJOpGIBhjAZRv
         4p6KVcTvYXBfnTvHcmCp2qSyeGXpzzn1673U+lQ1Noh6W67CNA3KpT5CN+NVmYmOv9nu
         +YaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795685149; x=1796289949;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LfvcaCnRXo7+ZO7tgrpqUCFteTLmrLXFEjj9APedgl0=;
        b=FWbWwF5XKyDGZuTrBFiuC3KzhN7p87GOV8gXnXgvzZ+oVAsdTwUX+wXreC/6kgu5fu
         qIVByNhEpPLFrifWpT8ciJ+oMC+vYKdO3qxUJnzpmrKv3aKsueAk83WaV8oMsmNjPNNr
         ghzh6rSXlY3MqLB9ZG2WiBLF1TO3hQbvu2/ZVhukTxD2bQYixV+5HyA/azjfv9icoXx7
         /V62s9zaiCgLwj6x5Fl7izZSpew7pDUoSxCqcaKcns4ngyV0IUaCFO5WW9FQc6A3aJn8
         stEadKJtzzqchmMMOqp2lHKrN1ffxF3Yenf/pqdmPnJo2oM2/x8GPZh4JVG/ANu9xI2/
         IsFA==
X-Forwarded-Encrypted: i=1; AL+hErFgy/kp+rOXKf3mMI+ux75WkO5tvOmg/TxDBLukCWnlKODTiTVEQNFPAG0Te7jxiaWfbWme4GWbaGvZl/Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6mxLPl+91CuKyfEcVWTI/1qmMK1aM3aX0GHSA+ahSrqx2d+JB
	A9S+czVWHPFVu6k+6h1v3ECYnGxVlLHpHaqHCwkDg3DSqC0ehTP7kbr1W0rVtR7aYwGzLF/jITO
	ky2+DywjPZu0O9WPUXnK1M2iwzhTINqECvrcrrhNcTEkRPr3t6BNcwisk4iLom6SyOQ==
X-Gm-Gg: AZFdTZeU65ANFXRaYru0WUOFMBUArqiGWYQ1c4OtHHBwpnv9pmsqGLkp2S4iABn/nIt
	/AW/5EENO6O/Japc6VYKNDRBd2bdz+GIvyasJ73ZC6o14fyEfR6G9DzZiJof2YXl35YMFp2YdkN
	7cpiVYXGmTuLbopPy8DLFlTLz9YQDPu4ODFxF67c+nCM5+yUfo+sTrNsz01DqU5eR0yIKWa40Gf
	V6W5f+7nAz5kbl9PIUpo2AzkcMVnRbYWyP87ATe2rASqgPaNJ8WA9mpMoJEGH0tVL5j3EN3Irn+
	KfoYKENIqYnS32NebyVWymrYCk5q1QBGkVYSa7JfuKlnQu2ZTgB2QpAOI3OFE0EqM29onCQXy5N
	UKkcvPkl8KzY5ioC/6OWLz+GWnH6BuVBcOtGQJHbAaOX2uFM6Y1iS3w==
X-Received: by 2002:a05:600c:64c7:b0:4bb:872a:f500 with SMTP id 5b1f17b1804b1-4bb887c2697mr421920715e9.3.1795685149212;
        Thu, 26 Nov 2026 01:25:49 -0800 (PST)
X-Received: by 2002:a05:600c:64c7:b0:4bb:872a:f500 with SMTP id 5b1f17b1804b1-4bb887c2697mr421920085e9.3.1795685148578;
        Thu, 26 Nov 2026 01:25:48 -0800 (PST)
Received: from sgarzare-redhat ([80.116.143.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a68048esm41351930f8f.29.2026.11.26.01.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:25:47 -0800 (PST)
Date: Thu, 26 Nov 2026 10:25:41 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Bobby Eshleman <bobbyeshleman@meta.com>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	George Zhang <georgezhang@vmware.com>, Andy King <acking@vmware.com>, Dmitry Torokhov <dtor@vmware.com>, 
	virtualization@lists.linux.dev, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kyle Zeng <kylebot@openai.com>, Michal Luczaj <mhal@rbox.co>
Subject: Re: [PATCH net v2] vsock: only undo SS_CONNECTING when connect()
 fails
Message-ID: <awf5zJTrZcgvdpOi@sgarzare-redhat>
References: <20261117-vsock-connect-close-v2-1-db5388323770@meta.com>
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
In-Reply-To: <20261117-vsock-connect-close-v2-1-db5388323770@meta.com>

On Tue, Nov 17, 2026 at 05:34:09PM -0800, Bobby Eshleman wrote:
> vsock_connect() sleeps with the socket unlocked. Meanwhile the transport
> can complete the handshake, setting sock->state to SS_CONNECTED, and then
> reset the connection, e.g. in vhost_vsock_reset_orphans(),
> virtio_vsock_reset_sock() or vmci_transport_handle_detach(). When
> connect() gets the lock back, it finds sk_err set and moves the socket
> back to SS_UNCONNECTED. Userspace can then connect() the socket again,
> and a connect() to a CID on another transport makes
> vsock_assign_transport() release the transport the socket was connected
> on.
> 
> Only move the socket back to SS_UNCONNECTED if it is still
> SS_CONNECTING. A socket that got connected stays SS_CONNECTED, and
> another connect() fails with -EISCONN.
> 
> Likewise, only move sk_state to TCP_CLOSE if it is still TCP_SYN_SENT.
> Otherwise a second thread blocked in connect() on the same socket can
> time out after the first one failed and called listen(), and overwrite
> TCP_LISTEN.
> 
> Fixes: d021c344051a ("VSOCK: Introduce VM Sockets")
> Reported-by: Kyle Zeng <kylebot@openai.com>
> Link: 
> https://lore.kernel.org/netdev/20260909-vsock-connect-reset-closing-v1-1-50298b9ccfbf@rbox.co/
> Suggested-by: Michal Luczaj <mhal@rbox.co>
> Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
> ---
> Changes in v2:
> - Only reset sk_state if it is still TCP_SYN_SENT, so a concurrent
>   connect() caller that times out late doesn't overwrite TCP_LISTEN
>   (Sashiko).
> - Drop Michal's Reviewed-by since the code changed.
> - Link to v1: https://lore.kernel.org/r/20261116-vsock-connect-close-v1-1-43fb125973dd@meta.com
> ---
>  net/vmw_vsock/af_vsock.c | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)
> 
> diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
> index 1d7d53542724..ce958b48295b 100644
> --- a/net/vmw_vsock/af_vsock.c
> +++ b/net/vmw_vsock/af_vsock.c
> @@ -1704,6 +1704,19 @@ static void vsock_connect_timeout(struct work_struct *work)
>  	sock_put(sk);
>  }
>  
> +/* Avoid breaking the socket when another thread has changed its state while
> + * we were asleep.
> + */

Should we make this comment a bit more clear to explain why we are doing 
this?

Something like this (IIUC, please check and correct it)

/* Undo only the state this connect() attempt set. While we slept, the
 * transport may have connected and then reset the socket (it is still in
 * vsock_connected_table, so it must not go back to SS_UNCONNECTED), or
 * another thread may have turned it into a listener.
 */

The rest LGTM!

Thanks,
Stefano

> +static void vsock_connect_close(struct socket *sock)
> +{
> +	struct sock *sk = sock->sk;
> +
> +	if (sk->sk_state == TCP_SYN_SENT)
> +		sk->sk_state = TCP_CLOSE;
> +	if (sock->state == SS_CONNECTING)
> +		sock->state = SS_UNCONNECTED;
> +}
> +
>  static int vsock_connect(struct socket *sock, struct sockaddr_unsized *addr,
>  			 int addr_len, int flags)
>  {
> @@ -1862,8 +1875,7 @@ static int vsock_connect(struct socket *sock, struct sockaddr_unsized *addr,
>  			 * sk_state == TCP_SYN_SENT, which hereby we break.
>  			 * In such case VIRTIO_VSOCK_OP_RST will follow.
>  			 */
> -			sk->sk_state = TCP_CLOSE;
> -			sock->state = SS_UNCONNECTED;
> +			vsock_connect_close(sock);
>  
>  			/* Try to cancel VIRTIO_VSOCK_OP_REQUEST skb sent out by
>  			 * transport->connect().
> @@ -1877,10 +1889,8 @@ static int vsock_connect(struct socket *sock, struct sockaddr_unsized *addr,
>  	}
>  
>  	err = sock_error(sk);
> -	if (err) {
> -		sk->sk_state = TCP_CLOSE;
> -		sock->state = SS_UNCONNECTED;
> -	}
> +	if (err)
> +		vsock_connect_close(sock);
>  
>  out_wait:
>  	finish_wait(sk_sleep(sk), &wait);
> 
> ---
> base-commit: 533ec433efdc11196f438da90d683053a57257ff
> change-id: 20261116-vsock-connect-close-1beb7cb51e7a
> 
> Best regards,
> -- 
> Bobby Eshleman <bobbyeshleman@meta.com>
> 

