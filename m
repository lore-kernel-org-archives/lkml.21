Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795078997;
	b=jLnR5bFsqAyFyNW3Z91ou9Ggs4wuLHTD90ZxiDJSdSIVySmMH1QSWcCDE34CC89sGnF2
	 EC233ekAP8gIBSWB6lGMQo8JqD5vID9Qv5opzh/TlMf3832s000mMlBvfsF7f4G1eGZ1h
	 n2qHjU7SFdRNkXxFs+B71XUX16z8IgLE9pFSMDGjCOYtYqEUZvuClGWPnHkcxXWISF8QY
	 WGcAXNn4g61pdWJZT9zPBXjNVf/RhDJhu0G86SdBzYzYA36M0Sez5hG+0Z1Hvx7lDFZMA
	 nf09uCTWKSXl86yY5ic0usFlBvGLuEZMSslHdVXR7sgshaykXw64gdGi2Ph+jRegI2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795078997;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Ev1ALMDJ9rqPsDXSnREH7pDpCBz175oayjjOjbBvQOI=;
	b=HhNxzNdlVULfelC7KvDCzMhSfY4vVvNnlexI70lbl7ox6Ev5J1BgfYlA1uWUNdmp3QQj
	 n358H0b/hClEkzdpg9L5L+IwRsj6J5iBg2eELys9ONVMdQ0Er0oS9JTfeLjwav7TIxaoL
	 B4+4u+50FJLUkjqZZ1SBpxfoPNm+hrWHdr+JmFmOXJaxdL51K3+KDY2GvFhQ4iEFU24fX
	 dvJ0e8DG6YZBUALz6nNJjvBJ7QYgnHyMGcrad366wmRswLffgDCIVwGbFCqwLYBhLSplH
	 h/cXgWp/lCTGdAGKVApLp0lOknidwpJx2N6UhC3TF0S2yjK5tZ5j9OFazf21C+qKO2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XzJyUlZd;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=NDy7OuQA;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D09860A2600
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:03:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D09860A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XzJyUlZd;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=NDy7OuQA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795078995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ev1ALMDJ9rqPsDXSnREH7pDpCBz175oayjjOjbBvQOI=;
	b=XzJyUlZdvOEvO2tepLebN83cQqiQIRozPgN13M9xjpZuJij95PA+RjISxIAMujcc88nDt8
	I9TQor4SFo8rI3L8adDZtBtO+tiVbHo846/ZWh3ikXD8LewNvHdJPd9dL2QBlazCbIHAgg
	HYq3bYbdciaTRZki8sAJ07oBuxUGmaw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-120-KCIq70iZN0-l57WEsurr5Q-1; Thu, 19 Nov 2026 04:03:14 -0500
X-MC-Unique: KCIq70iZN0-l57WEsurr5Q-1
X-Mimecast-MFC-AGG-ID: KCIq70iZN0-l57WEsurr5Q_1795078993
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a70b42bab0so6207105e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 01:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795078993; x=1795683793; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ev1ALMDJ9rqPsDXSnREH7pDpCBz175oayjjOjbBvQOI=;
        b=NDy7OuQAYN725puRZGYMqK1SPlFc6PbWY2Mk8+q0b5T27jWFi01d0o8UYL9sETK1uM
         ebNwCyzECEWNUhrJzteVE2FPpw1j+l5wHE5jXO4CQoK59II9NbxR47jNBUoBcSoGGQDE
         GA9R4IQ4DRbjUJvVVcjlxXVG+LUvQhYrcPi9tLHe1iUTObvyysDaD24mNLBAnYv73fzQ
         quZZxXQ8g2oEE/pJgEzVgNyA4iuUgofNiS2fZx3P6IjzpM9a2ZyGmlq2CfQytwjRsRn2
         7Mze0crl74fZvW/X1qiBatVWkaq8M2AfrZPvxrNi5FuCWbHw+wtDNk2u1MvK6H1XdFH8
         TGig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795078993; x=1795683793;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ev1ALMDJ9rqPsDXSnREH7pDpCBz175oayjjOjbBvQOI=;
        b=fMVMU4au+Fy2H+JQLb/APrelmZUuj+hv5i4YTtIR+Nz7OxLxxjwuDgCKmCofP8IaYM
         lwkaBFk4EGkHP/vEKJIDXc+zNu19VCl3sTyLRA5Hk5umUm+6lUDrtSj5+DgBju9u+Gqd
         ppdddLDqUAjNsgsXRDD8xVlTtjLLl6HwI3Q515J8fyw01FExqedmmdjv7f9aSnf+IQNK
         jqFFdkck7cd8yGrGEZdTNnRBnxtAXwqIYM9EvG6R0qKrrIX3Qo8CCNaSNcylzqp49XSH
         xlXMptrWQ2SWYSLm3X+G7pAnaFU0BiymeJTMh6JHRzFV8vcPgP/3zW27E4cqdJEzhbA3
         5NnA==
X-Forwarded-Encrypted: i=1; AL+hErGfDkWguJlj9RIHkN527FMLbH6Zv1nV8W80NRSwQy7yfZn1UeVgHUQvu11WaoeZQp7c9lL3nSqC2wNt3fQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/DFaKqVCj417Jhs9l/+MlzROLVHsOTmfi1PoUBTo2YfuB+mYvj
	n5nqJq2Ky+0CLnjiO0DDyRK1baM2A05v+eHcQxYgIkfefI2O1g6sfLS40r9OeUpX5qG4IbhIXjR
	aXnmAv+L1iVyid5ldKVFtTEZUoex6cDuogbgaN6odPEwBwC61XGoCVVlKGlTHtM9gug==
X-Gm-Gg: AYBFou3tcR1+OAl2OLVP8iQykuOnznW53j/YVPdTq7EOnYoa5nsZsiF3FOcIGMuKrpP
	lW2tbdH4F3r9e6/OH9EqXogC4GbzavTJuEdd679eFf+Ee35HSUlKXDqN92Q/MfNbXhWE2d19lT0
	3YLkwVMcQ2pmMRMlfF5Xqze2X6G6lRMqxdaJuMhy9YW96GbSsp+D62qxRgXuBldnw8Hgq1gagPP
	BvBUr107hTrYPG0ra9Smjz87Ch6BtySybCRnJ1e4NaPtLmv6+BGy7MGrtlrvNJMgR1y78QfxpHb
	XP0k12viAWnKQtIf83Vt5z/RHoRf+BXBn7tfKrR0r21CT+q80OYOkukobd/X3tI1dVQ9YGWhNe1
	hKsYPhPXxgrffl04KfdOJJm/GLNbPX6F4PPgsfPDdhOKfvW4DW7Pxj/nQ/ZVfpZ0dOt9Vo7S2qB
	Gs1hlVId0aqCTmpheInBmJug3VRNQSwZFreJ+2LfSaBsbP
X-Received: by 2002:a05:600c:b90:b0:4bb:6a78:7c42 with SMTP id 5b1f17b1804b1-4bb860f622cmr10713985e9.1.1795078992821;
        Thu, 19 Nov 2026 01:03:12 -0800 (PST)
X-Received: by 2002:a05:600c:b90:b0:4bb:6a78:7c42 with SMTP id 5b1f17b1804b1-4bb860f622cmr10713525e9.1.1795078992313;
        Thu, 19 Nov 2026 01:03:12 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8526cbd0sm29541955e9.0.2026.11.19.01.03.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 01:03:11 -0800 (PST)
Message-ID: <a3049b70-fae9-488c-9de7-0c1613e6c480@redhat.com>
Date: Thu, 19 Nov 2026 10:03:10 +0100
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
Subject: Re: [PATCH net] vsock: only deliver taps to namespaces that can reach
 the device
To: Bobby Eshleman <bobbyeshleman@meta.com>, netdev-bot+sinfo@kernel.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 kvm@vger.kernel.org, virtualization@lists.linux.dev, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261116-vsock-tap-net-v1-1-7e24f45adad3@meta.com>
 <179487315810.3291.12142099363352099423@kernel.org>
 <avur4Uwbv27bGG67@devvm29614.prn0.facebook.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <avur4Uwbv27bGG67@devvm29614.prn0.facebook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/17/26 02:20, Bobby Eshleman wrote:
> On Mon, Nov 16, 2026 at 11:52:38PM +0000, netdev-bot+sinfo@kernel.org wrote:
>> Hi!
>>
>> This is an automated message. This series looks like a fix, but its
>> commit messages seem to be missing some information:
>>
>>   - How the issue was discovered, e.g. hit in production, hit during
>>     development, syzbot report, manual code inspection, LLM or static
>>     analysis tool scan.
>>
>>   - Whether the issue was actually triggered, or is only theoretical
>>     (e.g. found by LLM and not proven at runtime). If it was triggered
>>     please include the symptoms, like the stack trace or kernel messages.
>>
>> Please do not repost the series just to address the above. Instead,
>> reply to this email with the missing information, so that reviewers
>> can take it into account.
>>
>> *IMPORTANT*: If you do repost (for other reasons) - please include
>> the relevant info in the cover letter or commit messages.
>> -- 
>> The evaluation is done by an LLM so it may be wrong, if you think
>> that is the case please reply and explain.
> 
> This is a known issue and has come up in review of the guest netns
> series (so via code inspection).
My reading of the above is this feels like more an improvement than a
regression fix. As such I'll move this to net-next. Please scream out
loudly very soon if you disagree.

/P

