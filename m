Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795783362;
	b=ZWHis1VPkgJZTAny9fMqyZcrGKvXNyJRInoCAn6ekZAzeWkviSGeRhcd9X46c3eB4IZ1
	 Qs6qyf1oYmmQ3KjYVdDMnC6hrb3eVZPCLXPVq/fLy+j/CHG0MMRiGsW7Z0WDyAWSwPFjU
	 vm/cxKz1fUmHSTAyfZUk4pV3p0+J9ILlp0yW7bffQPKxIPu8G9/5yB1CEHt2cbg0VfqaE
	 lcAKDuiuwhS6XsP96kBkfaHQp3ho3dRfdWg0C3FJE7CMuU727F4RE2ihXUNH8jH4X0Gjn
	 h7GqsYk5z8obdJcA7kTWtyi7ATeZLjDDry8cix7Gp/jWItLKjy8SXxU+o3Vq0pW74eQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795783362;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=69WYYzr2raKy4GZhRJJIx91GBcacgavIFPmAXCyscrM=;
	b=Faw+fmzJk5hV7v2+crYa3qcge8jGHfPwwn7WDmFGE+zMjumTExH0A7Sg/qIwzJZWqN9B
	 adZ3p40xxxQOp7aXuKuCRS7vAdHu2HmhRFnRGxKpkIHsKEehiMWP5SlSv/EVj8f+IOgAs
	 H15qqCUWM+/09VMOyeIsj3bF1gQsUaSWPoYBwzRFLP4OIDov0sUAw8gNtWHvOOjfEqh18
	 uKpeU8MrsQBhTaU3AEtftJzrMGsNAAKszfOcGFL6Tvs+X+1VRJW8/IcV2cNsN+R7eXwNm
	 6uu3lCPLoHYxv6fqA7d7nCBUBBZFuezOUxmEUKVQZpWglIMG3gj6p8nbyl8Mbmvs8jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="B/dZVh/W";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=mIrb7wzj;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F58606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:42:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43F58606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=B/dZVh/W;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=mIrb7wzj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795783361;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=69WYYzr2raKy4GZhRJJIx91GBcacgavIFPmAXCyscrM=;
	b=B/dZVh/W5IsUnkRIhZuDRVmhBZTPB2zjnZfJGbqZGjFsgXvnnu0dUZlZrN2vlBFva8mZ/n
	luLiw1nw2HUjvK05ebLxt9jnGY46wzK7e5MIFBaltPfhT/y0K7SAck8eyjtqnj1bqCTQuT
	A49Qz62zMbWjIBWn7vBWnIGDx6DM1kg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-WDK8YporPO6s0Iy9pdPeEA-1; Fri, 27 Nov 2026 12:42:37 +0000
X-MC-Unique: WDK8YporPO6s0Iy9pdPeEA-1
X-Mimecast-MFC-AGG-ID: WDK8YporPO6s0Iy9pdPeEA_1795783356
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4ba078abd78so54156655e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795783356; x=1796388156; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=69WYYzr2raKy4GZhRJJIx91GBcacgavIFPmAXCyscrM=;
        b=mIrb7wzjO+Qx/rOHTaJMbrY2yvfrKxBuFQ7FW3EgTTJKVHbMB9Xd4afVBBx89q17bX
         1e7iWantFienpWSC3hOgmrEF6b0GG5kuN33wJ7WF6aOlKHI1fuoLoKXgdnJZwhmY8iR4
         3tcQLAPRHWCbqLXxJNgSk1EOrQIk8sCgfkUxZLqBxhMGdgQLiww6afb/XT0pZYicdGzk
         rwVdK/W3bkOyXJzvhTnaBv9MHb0e+KJ5qR2+s+9vRsbmqxzYU11mxKG8Y5r/DmaJuA2z
         pfadq7FY1ZRi/UGQD/iiWQlmEkJ4R3wiJunWqde3F6NgNPINMQ7bqa7uLU0SS/zJbhPM
         Ebrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795783356; x=1796388156;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=69WYYzr2raKy4GZhRJJIx91GBcacgavIFPmAXCyscrM=;
        b=lDbb+QzenOpOxnxwu7HHnv6tkiKfKMhZUJzfxLR8lIheUNB6OQY/9mGQ4WRzUZD5Gl
         crtDXRea9b5RgdLa+djtJVI+xb2uEtWIBRJujRkxTUjh2a3EaUTBjwbtLWh/AH/s2+9Z
         RW//6C7YDdl0s8sOw+CahNkskfOevvXg3RiLhdc8cVFM3YNIKoGAHPhxfe9LfdH7Dmqb
         vrY2rEZmhdd1saVVxtD33yxBwxdDk/jyDKyoZkIWUVUHdi8ihoE6Ww/Z5W7A+QidcheZ
         Xjynif6px4qGZqtnqySURGc1uO0f586kvaBShhFVkM1iJw+42YqGJwYEf0LMeSA3kz6F
         rpXw==
X-Forwarded-Encrypted: i=1; AL+hErFnAB5tYqKgLHW/v+i7AF7zfMDWfKQaSf8EiurIjlFjBMkmPco9u14aWt1WtDsXxYaUyv//ECDkzB4dHCo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9HmQc7Mvs5svlZES26f5VnubjPhvcEW/jvnynmpMUzxqV8MGum
	epawdXdFk8AMdOyWfzNo82CbmuV9moQJ7rb0AcvBh6CQox1V1ZvDSZxSy7ryIYrzl8Y3TuZnak6
	1jBHiA6i6YPUSI2i1d9FGBdVKgPO4+KW//Xy+01paJpkzXovZ4Ds0umBveBXnJgwwYQ==
X-Gm-Gg: AZFdTZeUevkjB7CwUDIcjI9DSMmml9cKwH57rtOPtxit+cbFZXb0IHUrsAzn/Vet1Dk
	UN7O2nu/7uXxqOLIkOEzU+6ryHYBeAHIaRtszy44ySYQL83cYCW2ONKZRzTz2ZzEAKE0sQz08RT
	IkCaWN4Ojl3m2to6Lqw4Z2nUmMxNvK/lqdpVq8vol6LilwIkvMCRouYRnVIJ+BDoR8eXhGCJwKX
	HmnOaJrDJ36Jt2/vVbfnmu9bziP9Bvq76NgpslxCu8RoK4PZJdz1lcbjmwsynkF67JHbwBI2jF8
	zB3VHFfaRI7ilZ/Ylxg/TEqeIap/JQiVTcXKL6066zmUxSMkglukFay9PF7JRHbcDI0jMQnSPBS
	BZg8IIrqeSpbvnowz1iT2rAPJyMd5hkMbXMoR9O0jWgui6kbCLMh03laDCSFHJX2eXlamjtMJem
	Q0+BJIRpnBSVu8KykUQ4MX
X-Received: by 2002:a05:600c:3ba9:b0:4a2:1050:aff with SMTP id 5b1f17b1804b1-4bb8881c741mr568979995e9.6.1795783356045;
        Fri, 27 Nov 2026 04:42:36 -0800 (PST)
X-Received: by 2002:a05:600c:3ba9:b0:4a2:1050:aff with SMTP id 5b1f17b1804b1-4bb8881c741mr568979345e9.6.1795783355534;
        Fri, 27 Nov 2026 04:42:35 -0800 (PST)
Received: from ?IPV6:2a01:e0a:11aa:87f0:ea69:b2b0:2dae:5ef9? ([2a01:e0a:11aa:87f0:ea69:b2b0:2dae:5ef9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm1250929405e9.4.2026.11.27.04.42.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 04:42:35 -0800 (PST)
Message-ID: <1084ab13-d5c9-4154-b314-c7513b533c50@redhat.com>
Date: Fri, 27 Nov 2026 13:42:33 +0100
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
Subject: Re: [PATCH 3/3] drm/panic: Simplify QR error correction exponent
 reduction
To: peder.bergan@gmail.com, Javier Martinez Canillas <javierm@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261126-perf-drm-panic-qr-v1-0-51856937dc4d@gmail.com>
 <20261126-perf-drm-panic-qr-v1-3-51856937dc4d@gmail.com>
Content-Language: en-US, fr
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20261126-perf-drm-panic-qr-v1-3-51856937dc4d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/26/26 17:53, Peder Bergan via B4 Relay wrote:
> From: Peder Bergan <peder.bergan@gmail.com>
> 
> Reed-Solomon error correction reduces the sum of two GF(256) exponents
> modulo 255 for each generator coefficient. Both exponents are below
> 255, so the sum needs at most one subtraction.
> 
> Use a conditional subtraction for the reduction. In the x86-64
> userspace benchmark, this replaces a multiply-and-shift sequence with
> a comparison and conditional moves. On top of the first two patches,
> the change saved about 32 us per version-40 encode with raw input and
> 31 us with a URL.

Thanks for your contribution.
This code is executed only once when a panic occurs, so optimizations 
are clearly not a priority.
But this series looks good, and keep the code simple.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Signed-off-by: Peder Bergan <peder.bergan@gmail.com>
> ---
>   drivers/gpu/drm/drm_panic_helper_qr.rs | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic_helper_qr.rs b/drivers/gpu/drm/drm_panic_helper_qr.rs
> index 1d96ae855052a..4ba2e3de5a6b6 100644
> --- a/drivers/gpu/drm/drm_panic_helper_qr.rs
> +++ b/drivers/gpu/drm/drm_panic_helper_qr.rs
> @@ -569,7 +569,10 @@ fn error_code_for_blocks(&mut self, offset: usize, size: usize, ec_offset: usize
>               }
>               let log_lead_coeff = usize::from(LOG_TABLE[lead_coeff]);
>               for (u, &v) in tmp[i + 1..].iter_mut().zip(self.poly.iter()) {
> -                *u ^= EXP_TABLE[(usize::from(v) + log_lead_coeff) % 255];
> +                // Both exponents are below 255, so at most one subtraction is needed.
> +                let sum = usize::from(v) + log_lead_coeff;
> +                let index = if sum >= 255 { sum - 255 } else { sum };
> +                *u ^= EXP_TABLE[index];
>               }
>           }
>           self.data[ec_offset..ec_offset + self.ec_size]
> 

