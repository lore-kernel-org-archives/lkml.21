Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795777506;
	b=jt9ddeFuVa5JWlJXAU3lnTzJa7e58KwqYoz6poksTTtHprfoAtYvZjFuCjUvm0PznXTq
	 it74QKCANVsETdpUMY8glzzh8N2zfX6yME2/pdDBkrY3lRSsEskUm0w1vEhR9tNs3+Da2
	 uH8aLwiU7Y/igEhHe8WL1nPuM7zA1RLrvCY5Dh3GusF3wrExsDfGHLcLA1bWeStfUFDhn
	 UsH6QaERlTYBjPsyU+fW7qaSvyo5pNU6EjZV7v4IGA8FstNkgos/ZtPi0/4TbXYIKYv4p
	 A63r6auRhor6Ar+1SaENeiiW6kl6Om/gHFH1kAoVoq3FBf+by6SClnNaSAG/WjLd6vQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795777506;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=qcpX6YwnHTFKfGu87lTd7oqauZWlHU08Aks6/ht/Glk=;
	b=FCQVfrPmaMTcyJ+lmjEsyV63EPlym5fISm1m5gfuRWQZ7ZGN1EKSwDymnfG5gEkCqrdv
	 3mYQLFCSZCB22xJg91uJ0Fvo845/NlNy3ij9yxjD0vYcKsMBMdF2spKi3BN5PdMuEDLt7
	 K171B5kjJNe8wLX1AFfA6JzVu06N9otaVw+MbwAXObBumOfMHgLlw3nz1C3sf3ypjd2eh
	 whRYTphZQxBZ+GZtemo9arQqXdjD+S6nGqcCFkHr8WQu3QUzbY/uT+/pH2lPtLDueEoAo
	 QWbvzHBvXUyKtzNyY1S+mGfutA8HkzP3Hn8+j7lz6ZEMATahgGD8A94Bhz9ZEMnkG3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Bs1q28KR;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="m1/rciBR";
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694D7606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:05:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 694D7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Bs1q28KR;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=m1/rciBR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795777504;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qcpX6YwnHTFKfGu87lTd7oqauZWlHU08Aks6/ht/Glk=;
	b=Bs1q28KRG+Q+EutZdVt1HQ5lRo5QWfQAf6QBol5yH1DOebcRFcZbeXeUZymFwSIUbK4S2Y
	ORgat4tyec+fTmHLO1BN6WkSDqp5wTBm8oJWMo61G5jtFxxGiUH3cRJ3IaxBhyJQnFxvGK
	s5XLa6qZHfhiy+e4253lK7WJGq5cWpk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-k3qSBKvSNhylWshlUL_Y9A-1; Fri, 27 Nov 2026 11:05:02 +0000
X-MC-Unique: k3qSBKvSNhylWshlUL_Y9A-1
X-Mimecast-MFC-AGG-ID: k3qSBKvSNhylWshlUL_Y9A_1795777501
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-49337a224a8so4820925f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 03:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795777501; x=1796382301; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qcpX6YwnHTFKfGu87lTd7oqauZWlHU08Aks6/ht/Glk=;
        b=m1/rciBRUKbiNZLc56oAE0Djpvd9OQ7EBzCR3KWb7A7zRKLr05+HordNZL+9k1uZpb
         M2/PLpHqTgLow3ARGAy/Aa+QoyRhE+IXHX0fE/tQ46S8vhDbdmICmTwxAyf3NLI9mDZ3
         QlHUkKEVMvk/4J/twgIkvcZoVBtaVwfU9xRNm/djfEZxzCP7RUtQdXI31wlCWe3LwUtn
         +1/78g0UWq5oTKFgDIbKx6Sdqo2ngC/XlOtbQfWVeazjPAry42ZyzKt3o20MPd2+WbrG
         Sk+v1StbHx1PG1wKsQwkOK1mfx35uCj0CXEvnSHcsaOYmYlnWvgL8lN5ITkVhYEcmPLs
         fa1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795777501; x=1796382301;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qcpX6YwnHTFKfGu87lTd7oqauZWlHU08Aks6/ht/Glk=;
        b=uqaCFcQubEU6OIrpKZoasyTqwWdvdqEXUqU7so8M8g01mv40LGiwbC6IRY8NoA5r3g
         9w64QVDU9VXWRnzd+a81nLmQ0b8pAmaU8uOjb5o6RWnUv0FD8vMO6Z2mEMQe0d7/x1++
         VUbI42T7wR5t1uOPBxKEo4BJL9w8JoIVu61qlXRATTA7KUVRNkuY9aakx8fSue1x48D2
         zTSaY4ofhVYlz9JLd2RMDRmhUFzouWGJhH+DaI0irG7tLPZHtDOD6Ui0yUrgBD2difJf
         6xQs8j4zACxjLCaoyonVT4QxGmQIAvrKItIKVjDA3xKejRNh+v7p278nUjY/NnJCBXD6
         emnw==
X-Forwarded-Encrypted: i=1; AL+hErFbftKKF1RjoPxMyzYJDSOc1kz6cCZv0PiIFAVmzYrgc+7wzi38GGStS+HH47WBiyhJgqz9Nvhnqo3AwEU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8B4sy/bL0604wAtwv+rFkNguy86uQj9c+wXdLPEy6mf8y04GnT
	JrN4qpnGoY1eUbQHxj3suoj7yFjT6a3H1MRqyb+ssJJxNE3GFO7uAuYcQS6kEI0T/QQoiWkJE/e
	hZGMqQIRGdcxQHibYzL/itxuV2w46NAe1iSQzKLviwBLP6/LLT3fQHs+y5vfKuWxT1w==
X-Gm-Gg: AZFdTZcOxdTMexDT922ljNY9gGsZ7nbsiTYMQWqwrCzO7Lxxp4APo29ohflSjBzuVub
	BJ+lPGt+B45lIYz0oG4LIn9Dvk68vd0N0GUAiGEbNWcAvkcfMx2+T0NrLd2G/nvLWqtwBTGrAR5
	tv+/DPQe3n0UZd55JqIsOKHaBdGnuZlvTVi9xjZCX4VGF2fIHi49CCrxzkNtUE7GfQ1evO0oibi
	1rxWY3ty1KkGHv4ktJw5AcELuBhaJOPcUnLyg+mWJ9V9ToXeepRP0icKSGzcnqCvO/Rbi9syTYM
	TyY20GwMBhVSEy/wWAGCu/2GPHAp9YALnnr3kThXKHCbS6UiAhM9bKD5o2zLCSHU+pzzoa4jvii
	k7yJMq6cBPLk73Q+ub111wQD0hosLBHesKFAD2bSRxdLw+kPa7tj4NpmpFWFsF4pL5QSlDE4QGd
	WweWnqCJ8XDskZBAaaOTn/HWvvttWTfsC2z9Rnwy+B+lRr
X-Received: by 2002:a05:6000:4812:b0:4aa:8da8:4bbc with SMTP id ffacd0b85a97d-4abb5702827mr43599198f8f.36.1795777500972;
        Fri, 27 Nov 2026 03:05:00 -0800 (PST)
X-Received: by 2002:a05:6000:4812:b0:4aa:8da8:4bbc with SMTP id ffacd0b85a97d-4abb5702827mr43599159f8f.36.1795777500541;
        Fri, 27 Nov 2026 03:05:00 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989b3sm46514173f8f.51.2026.11.27.03.04.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 03:05:00 -0800 (PST)
Message-ID: <fa61e083-d6c0-40d2-b25a-f83cad368397@redhat.com>
Date: Fri, 27 Nov 2026 12:04:58 +0100
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
Subject: Re: [PATCH v8 net-next 8/9] net: dsa: netc: add PTP two-step
 timestamping support
To: wei.fang@oss.nxp.com, xiaoning.wang@nxp.com, andrew@lunn.ch,
 olteanv@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, horms@kernel.org,
 richardcochran@gmail.com, linusw@kernel.org, linux@armlinux.org.uk
Cc: wei.fang@nxp.com, imx@lists.linux.dev, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
References: <20261119030534.1892935-1-wei.fang@oss.nxp.com>
 <20261119030534.1892935-9-wei.fang@oss.nxp.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261119030534.1892935-9-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/26 04:05, wei.fang@oss.nxp.com wrote:
> +static void netc_port_tstamp_timeout_work(struct work_struct *work)
> +{
> +	struct netc_port *np = container_of(work, struct netc_port,
> +					    tstamp_timeout_work.work);
> +	struct sk_buff_head free_list;
> +	struct sk_buff *skb, *skb_tmp;
> +
> +	__skb_queue_head_init(&free_list);
> +
> +	spin_lock_bh(&np->tstamp_lock);
> +	skb_queue_walk_safe(&np->tstamp_queue, skb, skb_tmp) {
> +		if (time_is_after_jiffies64(NETC_SKB_CB(skb)->ptp_tx_time +
> +					    NETC_TSTAMP_TIMEOUT))
> +			continue;

Not a blocker, but I think that starting from the tail would be better:
the loop can be stop as soon as non expired skb is seen.

In the hopefully common scenario of no timeouts, the worker will peek
a single skb, instead of traversing a possibly long list.

Can be a follow-up.

/P

