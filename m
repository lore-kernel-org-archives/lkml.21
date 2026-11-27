Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769174;
	b=ypZEp7fguNV5ExK+imcQGowJc+2hLOn1y8GNAcTXyN1f4U/3o7Nwoeil4X7CmZiUtPZI
	 HUa/sKzr68WebPDcwBvYd1MYgeQPe7nvMBhe5o7xRLRtWSaGf+JAetCcgw1x9Oeo7EeNt
	 YGNDJNgdGv7MnuMbNjiLmwykLhLIt4J9u15fpjAnIANb24zOlDDdiNLfluTZ/iVLW6dtx
	 4mT849qF/DvA+0LSSCjNF14ldGZYfXS/wtML7jK6MOEJDvY3KldB66WNuIxpbExGrcwxq
	 Gp60LqRS5ZJbAijmwLyhMQpB0Jh8zNv3fJNJe7NqpCkTnLb80VM29LytHo7NJesZ1NQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769174;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=igwRrFBoK1h9s1KUBKxODRaHXAteHTxYtqlng0AOnlc=;
	b=Noqk568NQF0GG67B4D9YHI1dIBlvOz+KShJwKON70DpJTIJycLi8WPA74pF9dJf589NQ
	 pNQMlew0/U2vCOf/0HL25D9Mc69yUNJ2Upk5IiD2P3IC/53LstlVbiZj9CbRZ6cADltIz
	 ZwFZu61n/RQw7wia9KLUupLztgH1lDVmpu4tSXOnUaWgG2Rlg110KDIprs04rysjJQOOg
	 EpW38fRsf0mRTvZ9Tt6VraMLe8ZK8GJMDUMG3Vgl7MXdHZxVNcCM6T7ueGF/zPCb7zpL1
	 BjlckKZwe+6JiVTwC8zg2hTbHD8QbZEdJWJVuFU4jw45P2Vj6MZxTX0oTiBrSlL26FA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YcsEIiRu;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ZMq3R919;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54582606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:46:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54582606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YcsEIiRu;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ZMq3R919
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795769173;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=igwRrFBoK1h9s1KUBKxODRaHXAteHTxYtqlng0AOnlc=;
	b=YcsEIiRuFQlFB78rlafpRFIylLiOe4NAMfkBEyvSKhiBgeaoZvoHMaaYXb1vHbzH9tRz5Q
	ZN9J7CJlw7LtF8GjRNiX82jSJ5dwYBdG2txebamUmsIUqO/lnD49pYE7oPQ8UHX2ZRFb9/
	JYh83DACII39OS/wNXLjk15h9n5cBaQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-449-ipDOgUsMO7SukvZLOtIdew-1; Fri, 27 Nov 2026 08:46:11 +0000
X-MC-Unique: ipDOgUsMO7SukvZLOtIdew-1
X-Mimecast-MFC-AGG-ID: ipDOgUsMO7SukvZLOtIdew_1795769170
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a204f135ffso40504665e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 00:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795769170; x=1796373970; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=igwRrFBoK1h9s1KUBKxODRaHXAteHTxYtqlng0AOnlc=;
        b=ZMq3R9194W23mwAkAWcjjtGBbMeArTf6jMI94CZXEfnGJFUc3ErF5Fgj/nwC6xhEZa
         UC29qJoLrhF23XGryVLgyOkwFgQJwEisGEupJQXu3qy8rVM69Q/h757uneDC1S9HG0YQ
         H6onFF4gxOZOuPjGXOt6m/1uRETycZKR+X+whhlVY+d4kqc3Vk3GnCGmsv2Pv5U09GnS
         k1nlKrb1YZaEuMsLw+hiYyg5GnMmC2fjTexldHQmoUKnGIxw9aUsjkbURZRlEi6RI1qE
         TUQJmaX1dlAe+8kXkXHP4dvxZDBQToRptNkbxORnxho4qEBnHU8KduCKDUtNHJpQ43Xg
         xTUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769170; x=1796373970;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=igwRrFBoK1h9s1KUBKxODRaHXAteHTxYtqlng0AOnlc=;
        b=jiKZzrknPxu3EpZMb6c25M7qGSY0g3HMT21S+OhZvr+Z1V+QhL7967uTCzClmUfbSI
         4yvJ0EhGiWUiu45A3LFjldb684K9Uqo4L0MJraLC+EiwDoHFFRl4r+4STKULepbUvqnF
         uFcAqskxwSbTkciv2k+LMJLPyvuK2fvBVGMAJvwwWHm6ELJhuYnkX9fyqsJhD3Jgchy0
         +1E0+NvQFiQo/YMl0aTYHHYtqcHBuloyhW8P3hvoMd7ZgQn6Z1RfCtVwIRCCbRq10W9J
         +wQO8iv44OPZLze165nMP8xOEm6565/ROKEVfpu3VaOalSR1r6EQtvB83v2sFUTRBjo1
         bp9A==
X-Forwarded-Encrypted: i=1; AL+hErEC9Odeh+PuI2zdN3Mf8kpXLyct/WdC7JwGxydeodp6X/Y/Jk6A0ntUwY18cAyNa21Jo0SDfFQ4jU2DrMc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MIu3opE5hjaVn7oMRd85+VvPU3uKacyNrEbXaFJKYCKfFDaVT
	47K7a/A19xe0/1DlbepS5aQkKkiWtV9iY9+4DF3ra70dX6i+1SvfS7zGTNY59keDJIVV9ZurwXv
	rPmZR+Qkp2rfFAsthFwKwNMfIYVqd7IsyyL/eMO/VbSc4HZNn7P8OzxIOT6nlB1hS1g==
X-Gm-Gg: AZFdTZchWZmKikEmlXRMbJt8J9L8+e/uSkaXjHLa69k2DOCoZmr1U4STTQfY8Pxx9rC
	GIswDhWPp+ZmVYJotzaKaNvUH1z4mnhTiTcYrsVmaKCRR/wG4+Aq47MEZTttFZZ+GuD5kRQJtzN
	4s5U4EkoVIMFq8iWYIiKqvutziHrJwTtrhALzM9Oxl0u+YbzyJIV8+0VmONO5ycO8aLBY3mO7k1
	xZ1CNt44qSsJoqss7lG1E2I2BLFCmq1U7S3UIjvrMAmwU1CzYAoELetz6E+LjY9tkJzunWCYWPB
	EJtm0X7bsy7CvL6vhblfeX19YNtLj0blN3TJBwcoGSinHi7/lOC6JCF8AopKHrg0A6CWyuiL+5J
	x4WVpnZJahhklcjYRii52AuRwRgmyubH7K6+68rWom5ugYavuVQHum8F36Mtek5Q9ublBQRYL2w
	ITaCu3DFNS4lKRSv6c3RoFZl5Sc6E33whnkhSfYuc9yaXg
X-Received: by 2002:a05:600c:4f4b:b0:49f:fd2d:23c7 with SMTP id 5b1f17b1804b1-4bb888226c0mr588676745e9.27.1795769169930;
        Fri, 27 Nov 2026 00:46:09 -0800 (PST)
X-Received: by 2002:a05:600c:4f4b:b0:49f:fd2d:23c7 with SMTP id 5b1f17b1804b1-4bb888226c0mr588676055e9.27.1795769169471;
        Fri, 27 Nov 2026 00:46:09 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm401669135e9.2.2026.11.27.00.46.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 00:46:09 -0800 (PST)
Message-ID: <a806ef26-fba7-4e36-a168-7b0b98bc0098@redhat.com>
Date: Fri, 27 Nov 2026 09:46:07 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] ppp: serialize channel operations with unregister
To: Haoli Zhang <26031212468@stu.xidian.edu.cn>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org
Cc: linux-ppp@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 syzbot+6b18da3ef22e33061add@syzkaller.appspotmail.com,
 25031212117@stu.xidian.edu.cn, byu@xidian.edu.cn
References: <20261119084333.371234-1-26031212468@stu.xidian.edu.cn>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261119084333.371234-1-26031212468@stu.xidian.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/26 09:43, Haoli Zhang wrote:
> The channel unregister path disconnects a channel before clearing
> pch->chan. A concurrent PPPIOCCONNECT can observe pch->ppp as NULL while
> pch->chan is still valid and attach the channel again. Unregister can
> then clear pch->chan and release the channel while its clist remains
> linked to a PPP unit.
> 
> Serialize PPPIOCCONNECT with unregister using chan_sem. Hold the mutex
> from before disconnecting the channel until it has been removed from the
> channel list and marked dead. An in-flight connect completes before
> unregister disconnects the channel; later connects see the cleared
> channel and fail.
> 
> PPPIOCDISCONN must use the same mutex. An in-progress PPPIOCDISCONN can
> clear pch->ppp before it has removed pch->clist and completed
> synchronize_net(). Without the mutex, unregister can see pch->ppp as NULL
> and proceed before that disconnect has finished unlinking the channel and
> waiting for network readers. Taking chan_sem in both paths makes
> unregister wait for the disconnect to finish before clearing pch->chan.
> 
> Bridge establishment must also be serialized with unregistering either
> endpoint. Hold both channels' chan_sem mutexes in a stable order while
> establishing the bridge, and reject channels that have been marked dead.
> Unregister holds its channel mutex through unbridging and marking the
> channel dead, so bridge establishment cannot pass the teardown step and
> leave a new bridge reference behind.
> 
> The transmit fast path is unchanged. chan_sem drains channel ioctl
> callbacks. ppp_disconnect_channel() removes the channel from the PPP unit
> and waits for network readers before unregister clears pch->chan.
> 
> Fixes: 6a196e83a1a7 ("ppp: disconnect channel before nullifying pch->chan")
> Reported-by: syzbot+6b18da3ef22e33061add@syzkaller.appspotmail.com
> Closes: https://syzbot.org/bug?extid=6b18da3ef22e33061add
> Co-developed-by: Jinning Zhang <25031212117@stu.xidian.edu.cn>
> Signed-off-by: Jinning Zhang <25031212117@stu.xidian.edu.cn>
> Co-developed-by: Bin Yu <byu@xidian.edu.cn>
> Signed-off-by: Bin Yu <byu@xidian.edu.cn>
> Signed-off-by: Haoli Zhang <26031212468@stu.xidian.edu.cn>
> ---
> Changes in v2:
> - Serialize PPPIOCDISCONN with channel unregister.
> - Serialize bridge establishment with unregistering either endpoint.
> - Clarify the chan_sem comment and bridge lock ordering.
> 
>   drivers/net/ppp/ppp_generic.c | 55 ++++++++++++++++------
>   1 file changed, 40 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
> index 1a610a1..7b0bcac 100644
> --- a/drivers/net/ppp/ppp_generic.c
> +++ b/drivers/net/ppp/ppp_generic.c
> @@ -174,7 +174,7 @@ struct channel {
>   	struct ppp_file	file;		/* stuff for read/write/poll */
>   	struct list_head list;		/* link in all/new_channels list */
>   	struct ppp_channel *chan;	/* public channel data structure */
> -	struct mutex chan_sem;		/* protects `chan' during chan ioctl */
> +	struct mutex chan_sem;		/* protects chan in ioctls; serializes with unregister */
>   	spinlock_t	downl;		/* protects `chan', file.xq dequeue */
>   	struct ppp __rcu *ppp;		/* ppp unit we're connected to */
>   	struct net	*chan_net;	/* the net channel belongs to */
> @@ -639,11 +639,30 @@ static struct bpf_prog *compat_ppp_get_filter(struct sock_fprog32 __user *p)
>    */
>   static int ppp_bridge_channels(struct channel *pch, struct channel *pchb)
>   {
> +	struct channel *first, *second, *bridge;
> +	bool pch_first;
> +	int ret = -EALREADY;
> +
> +	if (pch == pchb)
> +		return -EALREADY;
> +
> +	/* Use a stable order to avoid deadlock with reverse bridge requests. */
> +	pch_first = (unsigned long)pch < (unsigned long)pchb;
> +	first = pch_first ? pch : pchb;
> +	second = pch_first ? pchb : pch;
> +	mutex_lock(&first->chan_sem);
> +	mutex_lock_nested(&second->chan_sem, SINGLE_DEPTH_NESTING);

Sashiko noted that the above is defensive programming:

https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119084333.371234-1-26031212468@stu.xidian.edu.cn

and we don't wan't it (especially not for locking!)

/P

