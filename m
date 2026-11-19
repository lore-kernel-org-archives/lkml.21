Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795082521;
	b=Hkfzh+IV+yPBFOl3R8cSKCFzMvRXwKAp/6QkG2FaI7rvwQOMBoSLR8PXghU1petCPyf1
	 3yfr6jBUCwFmBguVp/TL2s3m9JG3bW6EWfja6vKxQIphhQ1ywWBvvSZCJr3Ps81eiQfxg
	 s0LHca7J+u5BgJIRFWFgCX5lw74+apMrxZrBCxBMnPaERtIa20Hz2Yu5O8c5L5x2C5QuW
	 j5xHFHs0ubjarOOdGfUAt0HdDO2ChgbfEnywPUZ4k3R2N8Q8j7CxDqQYvTK2mO2aQpctl
	 CxldUP7PAflWMc2JXSsTtWZ7Dt4O/KEhsNJCevHBsFSM3Z1C1/fOFgGv36y1wW9qulw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795082521;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=BouZjsYOkGr2M8SflT7EXKbiktWSsg1pSaGKgnCUdX8=;
	b=B696FWpr52XMeTV7zxz/YZfYFEk5ki0XPgRcB37rwsUsUvSlTjVSjJiuPjy7l7U4DMMI
	 kzzhvlmArtEhEKFB1refmsV8DqoxroNil1NkjgXQjIQ6CO/Jj70ZC0lD7/AFFUJsYM8Dp
	 9DzvPfk2393Gte1RLVCOV4GflY+dboyzCO7nkrc0ClwReeCPGP/VSzkbzvGSFeTrOtHey
	 IE9wU2v6c971yCej3vAYMQuTfyME9QKZbkX9dGChj5WIQ1WcJcT41+CH/Sm8aEcGyMdMF
	 mYS4kfIOiBLWnf3QRec40QRQRds5Ut2VwKMcSEmdY8ZTjCVybODA+dXIili+ZtCCaJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XKDX9f6r;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=dOFFqZ1w;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DB8606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:02:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5DB8606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XKDX9f6r;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=dOFFqZ1w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795082520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BouZjsYOkGr2M8SflT7EXKbiktWSsg1pSaGKgnCUdX8=;
	b=XKDX9f6ru2f/sVXDgFEuSpU5O8pf8UDXhDIxHqD3IJdJ6ICb0ecXHLCZpFu9XHMF1vRq4D
	nySjC/K0jSWKhy4nBVlEgpesHG4cUGL4Lm/RLxZNs1SG9eVgzKxm5tWWkSgyaz55XrUibJ
	iyuUtdpCvLOBGmXTHIO4pN7LfFO/wJg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-Q-gpYE3hOa6CdZM6hEz3MQ-1; Thu, 19 Nov 2026 05:01:58 -0500
X-MC-Unique: Q-gpYE3hOa6CdZM6hEz3MQ-1
X-Mimecast-MFC-AGG-ID: Q-gpYE3hOa6CdZM6hEz3MQ_1795082517
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a2065a2ef9so17925035e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 02:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795082517; x=1795687317; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BouZjsYOkGr2M8SflT7EXKbiktWSsg1pSaGKgnCUdX8=;
        b=dOFFqZ1w13i9zITU1kTIDe0O8h+wWvgJ+Xvhcr20xVLgH104yol+zZhXyl2MYd1Q/K
         ljmRTlwISQLlsXYJeB+mcBYnMSaWYm1XThhyL0AxF5UT66S4e9aQVCeoV53Z0MfYZoS6
         MAtl30Rvw37C90Ub3u5A9mUkxDIwWibXAR1CcZqqsRZqdJkfMlpKN8VQoZAppwWSYtUT
         ffRyDK3vYf/XODspcxhZRnXpnvuuX9rW5ALCGO0GeYlmHdZyW/IUSMpif+fW6fLaQFEP
         n/Ko4XejIznYDGS3VPBtXJR9pB1YUCeVBkrxm2RqH8z6dmcdrFu7Hm1NE0p9vckUHvLJ
         rQ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795082517; x=1795687317;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BouZjsYOkGr2M8SflT7EXKbiktWSsg1pSaGKgnCUdX8=;
        b=dsaS0EbB1ebrKjYhK9ACRLL6FGvlTNxY230F5LpY0gU2pWkkfty9r1gPzdgyK0XbF3
         8Uf7yU0sDcqHc00CaXzEL7ViGCGt0lhXJWPZXtjw7iTg+swBBTqAyXzPVV5evWAZ1w8L
         s4as91zsNF0s0R+9xQ62LSEdbYZRbmLxHhvRUeRfRpjiKqeP0PztfNg30AxVIcfMHvnj
         0sFAUJxwRLfQrZAsqKQ8iGv2wHfRXgaGDDf+el0ytB9T3xUO5mnL0btQGPXGZs06eCHi
         IGsbNkyIfd038AwYQ1jsJ0KYKrvV6ls4b5NXUbXCwFhErsuWRm+LkN/uQCEFO49NtX+q
         0xCA==
X-Forwarded-Encrypted: i=1; AL+hErEMGoZglLq5dsQmnmYx75OHUPQZVF/Gbd1vWyr9OzDJd1RcmMflobbq+3/880LEdUS8bfQG398cbiziM/M=@vger.kernel.org
X-Gm-Message-State: APuU4Z8x3RC4uiuZUhhEtoWlFOT25KcXxnTdscISJNpch51QaDxp5UCx
	bdv7bzAln8S39hWrT+7p/ZHPNkA35Spjtec4V/Yjv9W+D6NPRMQ1VCGHC1wuMP3XMVWXsv7loRP
	mPyZwcqCu0BOasL6+vy1UI8guMFK9JsWe1tZbpiAJQqaQRz7h3YxdNJ3ugFRJBiOrag==
X-Gm-Gg: AYBFou2UOLGLSu5cktRL+uLXfnL3c8el1QeN38Kn+aS3kdv3hGN2tXWgROgNfUA9kPl
	9Wkv4rdk7GRSIyAGAxvMOXLxElGlxIqh6wSrsHQDap+DKGHzuNRUmO+/XhuStr3PEYRiMAPxP9w
	SuZrrS/g2d5N60iodvCadZqnOucTMUa4j92RYaGjP3chYfIaX7F/q6srnH8Zf3VMmRguyiPCYPu
	4wtu1nyIck2z3WngfM4TDCUWzU1ipIRsr3wCi5yq7wZ0iBmesVq+PUQ54YWXfkQzbuO8D58hNPM
	wr+LMmRds7QLlJi5/0f8XMXVavsr6diDN6Ln5Nf1A+3q4dMEo8do343G+d0aeHduRJbsEbtA+70
	tbweTM7JtiN34maHvtbl1aOXvoOCmc+hafusIVGLT3QrfHvncatnOofe/6NXZmpyVt4EGGhWKZL
	hbiceRFyYPXzVLs54jUyEPhyNqF/UmkvKVzwbHKsleyJs3
X-Received: by 2002:a05:600c:3b91:b0:49f:e772:6ddf with SMTP id 5b1f17b1804b1-4bb7da4647dmr123452275e9.32.1795082516716;
        Thu, 19 Nov 2026 02:01:56 -0800 (PST)
X-Received: by 2002:a05:600c:3b91:b0:49f:e772:6ddf with SMTP id 5b1f17b1804b1-4bb7da4647dmr123451735e9.32.1795082516256;
        Thu, 19 Nov 2026 02:01:56 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853c9170sm25507345e9.14.2026.11.19.02.01.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 02:01:55 -0800 (PST)
Message-ID: <0e0ce63f-58d5-47f8-ac4a-eba0420e6383@redhat.com>
Date: Thu, 19 Nov 2026 11:01:53 +0100
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
Subject: Re: [PATCH net 1/1] net: usb: rtl8150: break cycle between tasklet
 and URB
To: Oliver Neukum <oneukum@suse.com>, petkan@nucleusys.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261112104548.693456-1-oneukum@suse.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261112104548.693456-1-oneukum@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/12/26 11:45, Oliver Neukum wrote:
> The tasklet can resubmit the URB, which in turn can
> resubmit the tasklet. The cycle needs to be broken.
> The simplest way to do so is to prevent the resubmission
> of the URBs by poisoning them.
> 
> Fixes: eff674a514bd3 ("USB: rtl8150_disconnect() needs tasklet_kill()")
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
Sashiko feedback looks relevant. Also please include the
info about issue provenience and the impact into the next
revision changelog.

Thanks,

Paolo

