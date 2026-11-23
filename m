Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430333;
	b=Vi9lqeV1NKBEf3jlwMoz8cD0tb2RbRujNfN8k+5PuZl6kUx/vV08C9S/r3ibORLim9Ib
	 uapZY9xA+ApiNg97HoKtI7BLyVI/nnYnDvEvwMqvbaKLa0SAVFbt9uGa6RIeV0lR/Vk23
	 JqoC3X/8+fgF1Vban7dRf+wpXVLFk97jWo+F+5b+KO5daDvirst6zx410N9H/lAv97Rgv
	 uWxPPxM7qmH1ZoycC5zGWhIRVkPxUkgZysXzjMpboEaK3REhmqIaZzdPsjrfw8Qwf+7Ym
	 qRyolEV0HUZK/lyzAdXpc4uh8Kos67jev8bvfiT5ukHNuMzOyGtxsIyMg2yLmavZO1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430333;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=2vogCHTyzsPAWp62GPt/7NN1PGJX3oa0puEKi/CotX0=;
	b=kJ/7zZbM61ZChDesSeUr7+SilbAHEpOicRYslvGqV/hvXQKIGSQd7HwsxcDl5XqOWxzO
	 q9VlwZKRSJnEpxnVlsvC+QjFRFSsHaY9Q/eNJFOW9NP5GyJO7RlQxec7wXAlJmaI/TBxb
	 JAofcFvgGX0g6wRWrXVAFY8nFL1BuHCIk7KzIjAwZ3Sw1JVMumnap3ZDfIBk+iofOjYZX
	 5EPbbiwivo36+41S1kSL8vfcE3P1fUGY40Mm3gz/h8WgnRdUasEMg6gDRF21gAnxtGrxH
	 10jiFNdyJYx4wkuv9qqRB4Qju8X+suNaKq8Tj1ls3o3t9keu1A+PNhFuAgB6jgwuOgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BKGAqYE9;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=OOrOArhW;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97B1606A330
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:38:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B97B1606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BKGAqYE9;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=OOrOArhW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795430331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2vogCHTyzsPAWp62GPt/7NN1PGJX3oa0puEKi/CotX0=;
	b=BKGAqYE9isy8xC+EX+MKAN9vOZiYD6bXnGkHZ/MAlPANZj9WsEN3Tp/gHD13HSOues6RsH
	npOnDFMGCjuehekF0Mzf4V6k3xmBZCFpUlccppr+/tS6Y+sBrP/ntM2vt+FdQeuNIRZOxg
	X449grfGUy/Y6mUT3JvKuIn/6O6C4mI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-271-Z-G7ZRw1Ox6rCFbbz6P4Tw-1; Mon, 23 Nov 2026 10:38:48 +0000
X-MC-Unique: Z-G7ZRw1Ox6rCFbbz6P4Tw-1
X-Mimecast-MFC-AGG-ID: Z-G7ZRw1Ox6rCFbbz6P4Tw_1795430328
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4bb66fc3aa6so29737275e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795430327; x=1796035127; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2vogCHTyzsPAWp62GPt/7NN1PGJX3oa0puEKi/CotX0=;
        b=OOrOArhWVwNcPbfRVmT6Y6fSaMbQZv4neHWc2dYRVLFU8oHOgXIAVp+CiqOa4JNFJL
         bF4/2GUTXQi51oxgnbW2R8f9kqHAP4ExNlTcwcmE3AzTChIhuouy8xNOKHMlYr2nj/a3
         qq6eRQwjv3fgl17/UQpf6iZfe7/HPfQudkn2B60A59SIhWHKYKLWh3GB8SEcQ/I7E1vP
         C2QZIiFCrO/ZA5lWXF8KKo63H6NIE/yMxY7ep9QEZMj9RzosogxJS9Posh09rKauf6lR
         ke/oJXt3EqTbfngGFuJYcL7VQ6Vb5/Y+HeFOX6VFS6IFPVUA7/H4cRyNHbkjNq4KabWH
         I8Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430327; x=1796035127;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2vogCHTyzsPAWp62GPt/7NN1PGJX3oa0puEKi/CotX0=;
        b=b6m2nQpgPORMFlfmCijkxfc2++SC8IJXyKUtR2QekmNzO76cyHf3RVUjPE7Z7kUQph
         2fntwQMAWC44VuhSNlrtK6Yij7bsKl0hBbwqc+V7VqdWRJ8g5q3N8/S5uyu/+Yv7iPmt
         5cK2fss+b2+EnQkqnkrEL1/EoomE3+fXc1hCQXOndni1u1wcnzHpL5WcNk5AeTe5VsR5
         yOLXs1xTYQeCBOnHEWxmcF77nerLWkHsYGToHDUxl2GpQnyE8LxiR7wHi86kgXgTLyxL
         Pxm1R0oGe5wS8jBF2B7wqIMasmnB9i0SApnhTrjJw44wQzqKslVKhVYVIpPA4QGT3feb
         7Yjg==
X-Forwarded-Encrypted: i=1; AL+hErE7g8Q1ZyZ3S9cZLqkkYQ8W6FFv4z2UTwd2mJlf4U5K63IokP6h3Ev5JN1bioM6dmXQ+8Memaod5xeFWnE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Aw5llhoX/3zOTsTWID1QSOXhonBk/Xpm83WuQ5FmURqVQ4mo3
	SCRsX9t7W+YqtJsuF7bPW0V6ZrhlWdb7oSN7aVHvxUS6V0vI6Jr4VaR3MtpyE/T5Q+LZzRv+Pc9
	eKFmpd7LiqBlpMzVpqxgx+XkqTA1YnE7cK+kzlrZpiqAFLFc+i3SsCzANSDc4P4XGIw==
X-Gm-Gg: AZFdTZd/dshmlWh3CEzx4aSy8I83hUxH61+ay3kvldLGufV2i76yWMo7YH1yqIE0xND
	9fyThJ3F1d/2z12GuIz+AJe2FpGW+6nXanCiePz5xP+GUUwxhpljOAVzH0EoG8ZmFDWqQhnvmPP
	Sp/vEiXJwPPbzziRPN2kXnkAIj6SNHHfD2cCProukr4Wj+RUsoWgQ+haLMVO2Oj1hE5iBp8EyOt
	+wzn8WUU9oUgaebLiq47m7YDzy8/CK0ur1CzIrWi6zVvDE/IshRxUC0X+ThqQsol3hkoEQDb6/B
	jSrrJnk5adrX29XhOaox8S4Vp7UVV5t7uHiXb7696J/02LJqOMyI1Em3ZJ3cPoQPzBECaLnlSpf
	V7X5hP4alSuY6YzgBfpqXs9B4ii5/ZBEW3W7zCE4rC+sRjgaRzsjDLf/F3AV6iDvYiIUvIcO9OK
	0l7y959B24wC6bMfJKikJFkFfIBa1pRjCQEillrRiCRZ66
X-Received: by 2002:a05:6000:4009:b0:4ab:7c3:101 with SMTP id ffacd0b85a97d-4abb514617emr22984733f8f.22.1795430327622;
        Mon, 23 Nov 2026 02:38:47 -0800 (PST)
X-Received: by 2002:a05:6000:4009:b0:4ab:7c3:101 with SMTP id ffacd0b85a97d-4abb514617emr22984699f8f.22.1795430327225;
        Mon, 23 Nov 2026 02:38:47 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d55sm21654938f8f.5.2026.11.23.02.38.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 02:38:46 -0800 (PST)
Message-ID: <5691bcd9-1358-4f1d-b300-18a25a63eb31@redhat.com>
Date: Mon, 23 Nov 2026 11:38:45 +0100
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
Subject: Re: [PATCH net] net: hinic: Don't fail probe when firmware lacks
 rx-vlan-filter
To: Jinjie Ruan <ruanjinjie@huawei.com>, cai.huoqing@linux.dev,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261116021858.273519-1-ruanjinjie@huawei.com>
 <0e15bc66-3737-4e6e-92dd-3b54e95e224c@huawei.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <0e15bc66-3737-4e6e-92dd-3b54e95e224c@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/23/26 07:32, Jinjie Ruan wrote:
> Ping.
Please avoid this kind of communication, it just add load
on the ML, with no benefits for anyone.

Your patch:

https://patchwork.kernel.org/project/netdevbpf/patch/20261116021858.273519-1-ruanjinjie@huawei.com/

has unanswered 'high severity' feedback from sashiko and is
in 'Changes Requested' status. You should have replied to sashiko
long ago. A new revision is required.

/P


