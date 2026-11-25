Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618366;
	b=uXJxWM7KSc9a6tpT2Q08kVkJ7I+uxNhZ2vlLFeEVfxRaqUV/V+TY7AyalTW10okVCerQ
	 VtT8ZZIvBhN1z0Ui9ETTSllm3W4l/yewn8kMhXJmWtgI/PVZ4HBq6LK+tNjVdHNuMjD32
	 Rbop2dQ+d5cc2wnR8gZ6HlBq4WWOjIyfCEutkb+Ao2VKaPlKd+vwzOqRnx6NKGt5FzTLR
	 O4SsJ77siTX5vXZukkZa/6uea3UEeYjMlbAx1sixMrkVp3WcwF0+W1BlhQ7j+6+DYjDgc
	 ZMiHy2bdVFPmt3Vaq07eWlttJTen+dZNvaanT9DYqKn7WO7bvdGgqpik6ZIqWGGVCKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618366;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=MnpY2Zhyj/N+MyWnAzdhqA5s3y6VrNWCefytP0ap+Z4=;
	b=Hko6Wv2rJL73nV9iEN+ftcUWJPlFdjcwEHHBwIvB63jb7OF5sV+JuROSsff9J365yf1g
	 rHs8cUok+5kYLOKHUHlQpz1rIQuy+rEG+2kFtnprxCsaNA0NbVM+MOoquv+pfZ+fY1UWm
	 H8/J4cyiYG5BdTksVgV+TJLG2a64OhBFLM+9zZ8IELuA8HmXtmTEWl6aFeEtw0epW9fiN
	 d778Ugd4CfWxllKGjwg1UlnBI22OeY9p3fJIEiygN7Dv/10g89FjkR7TDplfzRpSGNbQk
	 4smOAthe2+TJ/AzXls/MZTrxbGiSbPxsXB9Tpvd2wRTNEyvOq68LLqAcACzHQ9Z31DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="EDaWdxc/";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Og9N7t4p;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B95606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:52:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6B95606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EDaWdxc/;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Og9N7t4p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795618364;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MnpY2Zhyj/N+MyWnAzdhqA5s3y6VrNWCefytP0ap+Z4=;
	b=EDaWdxc/zmClNBpJHbY2UVBQYtIleFJxR6kCqAaO1o5X1ml/3BWhWx+wQZFWaD/TXXkhr6
	dg5u/l6AaInuWrP89vyWtQNYiDbc4tG/A6rM0XXk6r7/PJSmALXIY8rtS8uCIIGO+pv4MF
	5qQppT6rXV2AQ+j9GORh+vI+CEx/VuY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-fPTeDwGqMuii8Lv6NqsgNw-1; Wed, 25 Nov 2026 14:52:43 +0000
X-MC-Unique: fPTeDwGqMuii8Lv6NqsgNw-1
X-Mimecast-MFC-AGG-ID: fPTeDwGqMuii8Lv6NqsgNw_1795618362
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49953abe51fso41988745e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 06:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795618362; x=1796223162; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MnpY2Zhyj/N+MyWnAzdhqA5s3y6VrNWCefytP0ap+Z4=;
        b=Og9N7t4pa7nsuRPESyV8DOMPhoeBzUPu4LoZTsTgKclqq8KPIRas3OZa47mK7ZOCmv
         4uLYUCDtS695OaReRUhD5JFRyTInZr4ul3RqoNvKukMQde/QMgoyiRIogvLTplG0M6Bt
         gOE6cnD65rYUBrlNx3/hfarbT7w9PurdHI54xQOcD16Y68EClBbJ8cwxDQfUCS+wexg9
         p4p5k5LMe3v3Jrukeux0aRNe8KYfSZPRiBlZZz1anVsckp04kuifjnYj9PCAnRryzm8X
         3nAYVV9lKpebksDXefFa4yjTRDQsLpvRzqXvP45hcLxIAYnS/JGR7GYUT+YO2pGb0Nmc
         JmMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795618362; x=1796223162;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MnpY2Zhyj/N+MyWnAzdhqA5s3y6VrNWCefytP0ap+Z4=;
        b=k08rOe7eGLpr5+YATv8lL6wtyK/VUliY8sGu9d9A28MVozBKJP2kt/wrAbMQbaqS6Y
         QIHxqEwh3o58dgT9nxPWNdfl7U4b5bgnIGCl0em+/2fjfF5FzILR3gZZ6CabFKIG6w7n
         xkvojkklyH99He0P286OvICsYj53JfPztua/Q3uYZN05NU6O51pwjZkBpcBvJ9/kb4pr
         wvRdhiPIwK11kNUXQ4wtP3gsXM0utPQSm0+SRnQJUN0h4i5oYtyioF3oosBn/ydI2yJF
         TTtFqH+qVrHtSNdGPmbIjegEJUiN+JzRHUqiqZYEnGELa0e06jWV8xEydQ2y2hzH/RJF
         dNHA==
X-Forwarded-Encrypted: i=1; AL+hErE1J9rvesp6ha6+/wWcxXnbYaElQFxUPYqUyhoniMSBkU224s62gOPhIWrzzojP/paKpuDa/UbPV7aCZC4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pDFt/EZKlxIy4LKuoo1dYCdf7WpRIiQOnsKF2I4Ig0j2oH9xM
	czpl6Rc43f5Hii9JJjwFj/vTvAwg+ewOV2Y0e4y5D5Hlucd5gqI6USPmgYTnBsp30V4HIEi/PFg
	Zbhgc/X+es0pejZ5rqa3jh4K04hYx039Qse4l4WdXQ+DoeijUTthoKyZiEVMuF/ibww==
X-Gm-Gg: AZFdTZe/JGJ8JrUuVR38lybKBUcb0gsbyVEWxYP7uCJjqfegNXBz+Kw0YqDyeTsRb1A
	LSyr8YT1IXGAtgGAuvnzGTlLvkY4kRcfVXsZbCRS9t44+/7CN6e2fBFZ1Kmeo67POn3kddUrLf3
	yGLiITw+60KdpLOHLnv9J0049GQGsnVPv/wEewj4++ZoyrEFE9vMbCcF6fktvRAus9xr9q6dicA
	0IoZlYf3dNDnzAQqz3ztGR6Rkh37xR4OYINiy0WrfgbZuqqfTbujjNNb2tFKAKlvz8+4Df4vX1X
	0NczWTBygc7a6QzrxLOGWU7rWEE3CPD+rkcialVWL88ErQipw4RljA/aGWOmQFBoF7iOqUNPx2+
	0D+pe5qymvyiOteGytqmgqWS3c3P7jfZG1U6w4oPrbZWAdOJg42RIWJHyPUpmhCmqZovmCoWHZ8
	01vSL1Xmyv69rLIc2VwtELS69AkMamxQZ3dyoYIoH/NZen
X-Received: by 2002:a05:600c:b90:b0:4a7:76fa:87e9 with SMTP id 5b1f17b1804b1-4bb8892cb02mr359808585e9.21.1795618361979;
        Wed, 25 Nov 2026 06:52:41 -0800 (PST)
X-Received: by 2002:a05:600c:b90:b0:4a7:76fa:87e9 with SMTP id 5b1f17b1804b1-4bb8892cb02mr359808145e9.21.1795618361518;
        Wed, 25 Nov 2026 06:52:41 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c61e53asm36682773f8f.59.2026.11.25.06.52.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 06:52:41 -0800 (PST)
Message-ID: <af9b6e7d-6972-4881-9403-c8af22b449fe@redhat.com>
Date: Wed, 25 Nov 2026 15:52:39 +0100
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
Subject: Re: [PATCH net v3] ptp: vmclock: keep the device state until the last
 file is closed
To: Chad Aldreda <ca@modelmiser.com>,
 Richard Cochran <richardcochran@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>,
 Shuangpeng Bai <shuangpeng.kernel@gmail.com>, netdev@vger.kernel.org,
 stable@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261119061517.1142436-2-ca@modelmiser.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261119061517.1142436-2-ca@modelmiser.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/26 07:15, Chad Aldreda wrote:
> vmclock_probe() allocates struct vmclock_state with devm_kzalloc_obj()
> and maps the shared page with devm_memremap(), so both are released
> when the driver is unbound, but an open /dev/vmclockN keeps using them
> through its file state. After an unbind, read() runs on the freed
> struct and reads through the released mapping, and a poll() in
> progress sleeps on a wait queue in the freed struct. KASAN reports a
> slab-use-after-free in vmclock_miscdev_read(). In testing, the same
> read() faulted on the unmapped page once the device had been bound
> again.
> 
> Allocate the state with kzalloc_obj() and map the page with memremap(),
> and release both on the last reference: open() takes a reference and
> release() drops it, and a devm action drops the device's own reference
> after vmclock_remove() has called misc_deregister(). misc_open() calls
> open() with misc_mtx held, and misc_deregister() takes misc_mtx, so
> open() always runs while the device's reference is held.
> 
> vmclock_remove() now marks the device as removed and wakes every waiter
> on the wait queue. A read() or mmap() on a file that is still open fails
> with -ENODEV once it sees the mark. On a device that supports
> notifications, poll() returns EPOLLHUP | EPOLLERR, including a poll()
> that was already waiting; it tests the mark after poll_wait(), so it
> cannot miss the wake-up. The wake-up uses wake_up_interruptible_all(),
> because no later notification will reach a waiter that the remove-time
> wake-up skips, such as a second epoll instance that registered the file
> with EPOLLEXCLUSIVE. Without notifications poll() already returns
> POLLHUP.
> 
> Separately from the report below, the bug was also found by a
> Coccinelle script that reports device nodes in devm-allocated memory,
> posted at
> https://lore.kernel.org/r/20261106193517.3267013-2-ca@modelmiser.com,
> and reproduced in QEMU 10.2.4 with -device vmclock. There is no access
> to EC2 hardware with this device, so the fix has only been tested in
> QEMU. QEMU's device has no notifications, so the poll() path was tested
> with a local change that lets poll() wait without them.
> 
> Fixes: 205032724226 ("ptp: Add support for the AMZNC10C 'vmclock' device")
> Reported-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
> Closes: https://lore.kernel.org/all/178144969601.60470.14493569608271069160@gmail.com/
> Cc: stable@vger.kernel.org # 7.0+
> Signed-off-by: Chad Aldreda <ca@modelmiser.com>
Applied, thanks!

Paolo

