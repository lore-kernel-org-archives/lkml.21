Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795443060;
	b=2rO9+zQF96IDseVKa4ZFa1tx9GAnUzF0VmEbp1u1gw7eP9XfHr8TAKX+Wq/FvbUj7DLd
	 RC2s3a33Bn60UvMWEW5VMDbJBLY4GW4c1Oef5Zb9d4PEa5ITNagL9qa31ruqYYaF1bC5W
	 xzZT2OgC9ygnLigOB0wZOZbpkwXPjUnsKMEc9hAMFXvuIGyI0cPjg7+4fAKNEYDyvWrE5
	 cfzGbuNG8CBzNfiqQnyfMfjzRyxjoNTA5uJv4z4nDhG8Et8jwtlDZADbgrd5te2ToOKj3
	 TuhCDTJ0nZvzUuhD5hm06kIkeNLxM2iaw/xhkIWe10eZ87XIot2yLMmreZnhxwpiHJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443060;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=d1AIvaF+IpG23jdKP21kq1wT2/x6/exBEcH0NfLvcbg=;
	b=kkaRv+V1Or8sULa2rM8rBWGUi/wpu/HAAxY0sN0N3t/AZg/LbzK3vziKLSFWtp1HpUR6
	 heSctdmS89R+ox6gT60pxcfhdI4yH0lHJeE3IMsMSoLatqzfcmN6WrucOMJ8Ju0/Bngiy
	 6buzuxLfJFZdybbEibsR24wGK1Ame40zmYD/mB6n6UxOemmMxQ7WjrrooEKzlf71v5THO
	 V+k1ZZXVd7XSGXLx6QcjHmp5dnx9GBaBuW3r3SOU9C0eEoBAR5lI2AtpWY7n9caYNoaGV
	 A5Dejd/f/cB0Ig5iPbM2upR4oB5n3+pArSv3KtpDS0UM0cI7b2fS2meSssQlvNmD3Ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=djqORsXF;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=P9YETTMc;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB9E606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:11:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AB9E606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=djqORsXF;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=P9YETTMc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795443059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d1AIvaF+IpG23jdKP21kq1wT2/x6/exBEcH0NfLvcbg=;
	b=djqORsXFAAzPREp3W8FZmRsAjOxcTYFh91CbNLVETDnweVDHJNiVYcw2N9lgFQcBs5YCE+
	SIvDrj6nS8K8IwbI9amkiODsY48qtSSwGZNAOd8UAkAxr0zF43Sd8Z6SEe6QLlh1YADe4C
	SpukVjRUZkXf55IuVosTPcLLvi8DCd8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-57-jro__YGYOi6MkFcrjNtXMQ-1; Mon, 23 Nov 2026 14:10:57 +0000
X-MC-Unique: jro__YGYOi6MkFcrjNtXMQ-1
X-Mimecast-MFC-AGG-ID: jro__YGYOi6MkFcrjNtXMQ_1795443056
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4ad3d35e899so27284355e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795443056; x=1796047856; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d1AIvaF+IpG23jdKP21kq1wT2/x6/exBEcH0NfLvcbg=;
        b=P9YETTMcoc3G3Dbli1ODXZ++leIbFdiB5E2ilkjHhQlw8a8stEVjTPeqO4r86U/+16
         E6jnVtugfk9ADAa20mVyiDZgN4XVyUpSF5bIaO02lsOmL6BYHp/VAlHRmMOUPjn2Yd9I
         cI/yMyFS4n19K0rQmh9mw3Q1arlCRyovmkktUJEN76Kj5KUUi2LSLJbFfUfb3E5SJIBm
         13U2uhy4fvaObpGSPOaqlTJW6h5wqWXp4KfK9hVQgvfDhtRBegWlZmWcAA4apfy7oR7o
         QlPA4h495mkGPUef4r54W4huqnpRQz7UeRW/2qXOaDixBS2mxSPT7Zura4K4UpHWotru
         S8dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443056; x=1796047856;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d1AIvaF+IpG23jdKP21kq1wT2/x6/exBEcH0NfLvcbg=;
        b=IywGcLIIaMm5uGAGs4lOuYuAvaEp34mFgCq65/ju3ah9zm4rx0BqZ8iGjfnNsvBn3n
         9OkNW4AXU3h8aVO+JQZpT5KRR4R+AuQQIYxqNAZ5kB+0YpdZ76LvvvrKG402XkH1Djc1
         ZsSlzKGHFP+GSRuLQcBT7uBkIHOQgKuvXCsTreuGL/cvSG4sZHnQYVK/wgSQ2c2NzFLs
         9XDcBhkhpRZ+bSKp3Z6A88IgDSg2t9cDJkDQ7X1VgQ0Yv3Dq982xmQF40Uis+9jNtAtE
         W6KWxwAoOmZ1/ux0sXgomw1rYKRNWXSJrsfgt3CyvPTMkgSKcOemKtG2ubcjkROquw2b
         eLNw==
X-Forwarded-Encrypted: i=1; AL+hErE+ndAe8WSPdN8hzktQ7a2M1yGWdcmqU0Qy3Fe+Vk1DE2AovRQAeYH9zpkdv+/Wof2alluzmw+/IVNcB+E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Gcidzvl12Vj4goFWbgMXTI7QPYlqg9LQoAoIYkaNkdN5ETQoH
	KTlnneYcCoIdeyU/rm1BuDIM3Y7Uc/YhzyWCzLhZNJHcOnTfEsaPjY/XWViCuUN5480I+AiY0Lm
	yQ35EqnjxLJ1zbVC5MAOYTbL+Nygw/u/NcD1mHqRoanMemumQwoe3ppYExP7HBTsBpQ==
X-Gm-Gg: AZFdTZct6RugC2dQX7llFu5rHWaDEUcdn7R2b4F9tUGfzyYpriGN+wMPdO8Bhu8QC7l
	1Yj86pjJBpGI2jugY+CgnBDFT7h7NS44r5rUhyw99tQJVW2fxjjMI7HvDcwO7BUJrlWoCgsXuwi
	M5AVJBkv8Lge3j7GaEhmzG4tYaI7pRGM/1erEPs8iaSy9acCnRcvkBAD0KNZGDb5jpEZa2pPhSL
	k2Yv0AxKGOG0XmaIT1F1uQLXM6neM+ZHRXXrO2F8lklOwvW7Ooq6kc44C4KeuYjwFAyzPJxgsVk
	VKsvxzG3vJH9wbAxK2MxcB7kREO86v7h0y72Vac5v+rAvV2UUXpz/7Zy8DfDOiUTFzqW61LSwmT
	CPURFZeutQO+D0LFAN8RGF0+tJMN/kltvHoCjdyppevPT7ny+CdasJvA/kVeP30uPEYvMynDUPI
	KyjXmpbOjBSca27/wxBipzoclxF4Q6pD4gtUpb2iarStHu
X-Received: by 2002:a05:600c:828e:b0:4a7:7f3f:6f8e with SMTP id 5b1f17b1804b1-4bb8878702emr257260675e9.0.1795443037455;
        Mon, 23 Nov 2026 06:10:37 -0800 (PST)
X-Received: by 2002:a05:600c:828e:b0:4a7:7f3f:6f8e with SMTP id 5b1f17b1804b1-4bb8878702emr257260265e9.0.1795443037023;
        Mon, 23 Nov 2026 06:10:37 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c43563esm23666814f8f.57.2026.11.23.06.10.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 06:10:36 -0800 (PST)
Message-ID: <2f7e6a9d-1d8a-4d8f-985c-b25149c62072@redhat.com>
Date: Mon, 23 Nov 2026 15:10:35 +0100
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
Subject: Re: [PATCH net] ppp: serialize channel connect with unregister
To: netdev-bot+sashiko@kernel.org, 26031212468@stu.xidian.edu.cn
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, linux-ppp@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 syzbot+6b18da3ef22e33061add@syzkaller.appspotmail.com,
 qingfang.deng@linux.dev, 25031212117@stu.xidian.edu.cn, byu@xidian.edu.cn
References: <20261116122750.23294-1-26031212468@stu.xidian.edu.cn>
 <179505889320.3136.16828129332871650938@kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <179505889320.3136.16828129332871650938@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/19/26 04:28, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 1 (1) · Medium: 0 · Low: 1
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [High] ppp: race between PPPIOCDISCONN and ppp_unregister_channel()

While the above is arguably pre-existing, I think it should be addressed
in the same patch.

/P
