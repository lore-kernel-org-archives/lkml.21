Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795621458;
	b=BsoJYD9lwBoMzA/YpZ38nXJbpkfDHmkNjqqRMzKabBqis/4zCmtVSnxE18U4QxoTofpU
	 pptso2W5FZReRYVaAQlkrHJ/aOR9grY80pHdKxvy6/FojrZkyJrUdzCS/AtSe4llZwDIr
	 zOW7iDPVMn0X5tqQ902vXlcYjYd7oD10nlg7i7AbPi4c8kupIfJWaImzYVhYIt6T5RRiT
	 eaqzaGWuHog6eDzVHlUnQJGYldHOH5mfeMdxKl+N9/6FOIYXUVQRAn1AgCu0wnkiCceUb
	 IH/gAQvulXWXr44ZqejlnT436qvujFL6VmFLXzruzhnDR+/gqgddrAGwsf9yqxeA5KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795621458;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=iC7ojDwFiN7+I6mTjomu3O4mbkOEaFgiVWGSsXUSLq0=;
	b=uilof9sxohQaCeLW+nb3IvBvVIXSiqXoosAD1Fb2Z2JIXVkkaj+cn8nNdCOjtBf2e0zV
	 qMP0ModC5mw6IhKz/BIRm2nyPks3KYqBN6i4sBXETjYz8nFInWAkK8y6ZHf2H6L4Xu1FA
	 eUa9AoImKuj8EDB+D+Sz/vnfT0+1B9qpmY+g3tN0gcs+tH0q7yupq45Icc+gOk8X8syWC
	 gX3W/cVGZcbYltjPqNcEa9FPXSM3J5K9oMrKjEN22aal621CD+Yoi6rzTs7T+9BmUvycB
	 1bC6aIDZquq7zYdxVcZ1GKwB+eow7Wbqabx8ISybLN4KylsP9eYi28XnJg5yDt1EeZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ISpPVjVM;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="KX5Ys/n4";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4F2606A329
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:44:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E4F2606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ISpPVjVM;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=KX5Ys/n4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795621457;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iC7ojDwFiN7+I6mTjomu3O4mbkOEaFgiVWGSsXUSLq0=;
	b=ISpPVjVM0IfDMRAzsKQFVsk0Jf03agTxOgaC7YbhfmnYp4vYDjvPGtVJJN4t28kA8aw2N/
	HKjrUadNbDeLjzJU+/MBEiGW3punruWB0617tCIWvHRBfZhU/8z6OudmkE/6jjX7MkKC/a
	+MXH0IuS5yVbaOcUS5AQZ7oYbDusyKE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-434-ei8LNe7rPxiB1FipijoE6A-1; Wed, 25 Nov 2026 15:44:15 +0000
X-MC-Unique: ei8LNe7rPxiB1FipijoE6A-1
X-Mimecast-MFC-AGG-ID: ei8LNe7rPxiB1FipijoE6A_1795621450
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4a9be7586ccso3257747f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795621450; x=1796226250; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iC7ojDwFiN7+I6mTjomu3O4mbkOEaFgiVWGSsXUSLq0=;
        b=KX5Ys/n49pTEdZfZdjbMiqQnSPDEpnUKjhFx1Aksr37iezPafiZW00icmLZtWoRIld
         RFi7eK0gP8JXkcTtfq0UmnkPRxXM+YYffLWTyLbgQscto659f/FE/ZfKaFZY0EALuzo8
         lDXXtHOClS0W1N5mUQ+eU5PL19px5ymyUzmSrDs9wsUYSMrvUnMxOQ1NJsYv2J+xie6N
         AHrT9wNGClUOl74NEpE7IMR58LkasitOdQz31oSgxhIfRbiOU5n9hKJ8zktAk5h0qiUh
         BEUL+JTRcW0xDX1kQ8ozi74HEzvBJdEBZLTLfcDo0+mqm0nCjRPQtuG9DZ5Pz5GbAoGI
         1mpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795621450; x=1796226250;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iC7ojDwFiN7+I6mTjomu3O4mbkOEaFgiVWGSsXUSLq0=;
        b=hjpNmQeVn5+bRhjlaDYAMVWl+4jkkP2ch4RzZERhq3m3GK1DSkJ8Cun3U1IntJUqja
         DXGsv2gciao5TYgHhMTL5voXRLkYdTFZbojJ11KPtmA8EZBTAIEcgdthliziZY60SDdK
         FMf0as0GtpkhVQfoNCnJiu1gzwlGBvL5JNmUKoXXBUnfKUuzCg9vTNlNivQqKKYMUemP
         zuSmuZAdFxdZ3VSBB/Y/U09sXbQLMsiqmSW2RKkm1dgA6P9hWm3BPOg0mge8W+VTYKKJ
         zDRk+6xHkhPGXbYmmYL1hF74WahjbUIGh3RpxYt5B6X1l7HYp6q8y+IErjCm1/PLC2qL
         hpCQ==
X-Forwarded-Encrypted: i=1; AL+hErGsmgc9aM5d1zsjmGG5hzpkDrB+qpUg1/W+nwPR70LD3PzLvBm1py5y4+dn8SN45qAc3LQFEO54laFT67k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/atE8q3e0F2c0BqroS/v77tItHeUsen9Mvm9ZMapKwWuXEQmrI
	c7v54/9mcCrVfBgZcX3uvjISj+JEjslS9LCswNA+zilGArJLVTwmYwi70tAgj5mFzmy0rhAg7oi
	6/kl4ixuvxqwwZ1Y29qzvBL7zEURIbcauMezb4DhfNlzGlSvDOLYx0gpo0ggE68arBg==
X-Gm-Gg: AZFdTZeDMxWn/04HLJtPz19ILwgSyVD7CsKkGmifQ505oewJlwKVlLlQS6C8/6TrTaQ
	j39yzUYXMAPs9hCNKLE+gfek3UqpGCtja6QTJBTV4H62eAq8PJ7svJW3HJWZgoBxGm7KhkQSIoX
	u8/AyLxp12dDWKXquOR/Nfdomc0L3//Ewg+plvfz1bcaP1xGi9Wt6loHhLdEozTLaYUCUBl8mt5
	DEMnSgtkyqwvaG//zFwhNMEkugdRtg0JeiXbDKLC7jvfCvx40+jg6V643t3NFNI7Nh+yqEqFhZl
	7okrNGkZv/b/wdBbx3yX9JgsWUQTtNhx6rMH1zRaitqwOX8biRuOHPOh0JUGUo+jb2n4PxC2E94
	pW82wJtvAdVC2gls73EVEF9SwSIAcV/V+UnraMjzUZNNKCNMSaPifV512rvytORTKyFtq032Hmz
	sHTSa/DlsF48Nqo/pBbWeFGJzwJdf3coUiJJp1uo0BjDWq
X-Received: by 2002:a05:6000:40ce:b0:488:8347:a110 with SMTP id ffacd0b85a97d-4abafd02fa0mr38342900f8f.7.1795621450467;
        Wed, 25 Nov 2026 07:44:10 -0800 (PST)
X-Received: by 2002:a05:6000:40ce:b0:488:8347:a110 with SMTP id ffacd0b85a97d-4abafd02fa0mr38342866f8f.7.1795621450098;
        Wed, 25 Nov 2026 07:44:10 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c61f558sm35600520f8f.58.2026.11.25.07.44.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 07:44:09 -0800 (PST)
Message-ID: <711567da-17c3-4ced-b7c6-e6e6b9376155@redhat.com>
Date: Wed, 25 Nov 2026 16:44:08 +0100
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
Subject: Re: [PATCH net] tipc: validate peer address attributes in
 tipc_nl_peer_rm()
To: Ian Rogers <irogers@google.com>, Jon Maloy <jmaloy@redhat.com>,
 Tung Quang Nguyen <tung.quang.nguyen@est.tech>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>
Cc: Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>
References: <20261119170556.1518068-1-irogers@google.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261119170556.1518068-1-irogers@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/26 18:05, Ian Rogers wrote:
> tipc_nl_peer_rm() documents TIPC_NLA_NET_ADDR and TIPC_NLA_NET_NODEID as
> mutually exclusive ways to identify the peer to remove, but implements
> them as two independent if-blocks with no fallback check. If a
> TIPC_NL_PEER_REMOVE netlink request provides an empty nested TIPC_NLA_NET
> attribute (or only unrelated TIPC_NLA_NET_* attributes), 'addr' remains
> uninitialized on the stack and is passed into in_own_node() and
> tipc_node_find(). Conversely, if both attributes are supplied, the second
> silently overwrites the first.
> 
> Return -EINVAL when both attributes are present or when neither is
> present.
> 
> Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
> -Wconditional-uninitialized enabled; fix and changelog drafted with an AI
> coding assistant. Build-tested under LLVM=1 W=1 and
> -Wconditional-uninitialized; not runtime-tested over TIPC netlink.

Testing your own patch is actually required. There are a few exceptions
(i.e. h/w dependency with unavailable H/W), but this is not one of them.

Please resubmit in a few days, after actually testing the patch.

Thanks,

Paolo

