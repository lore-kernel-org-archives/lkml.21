Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795742359;
	b=e5fnQRMZZLtBEGwo1NFgA1YSi95vvzx9eWYwpdgKbkjdyenvxVKdZiHMaVhRlgAcNcS0
	 QKElb8M4Yt/DvFsMQPBtcJ7Vz2jnq3siCmyKWQ/gCkl19n6OHVLGLfC+OU6JU1dNBplS6
	 7ItwxvosoKB4bjbTOBedAuNaByc6h0+CqV4MJwWFSFkvktQJsnYOL7G6fazVsT6NZsi6D
	 2JZxy4MKTzy3jp5LT/VwaNI6QCJIV9ppSVN1uGZaWGgxLZIXaaoSpEvyTOMPmQk5y5vjQ
	 UCHbZfQejEAqoNZu1kVB3yb/idTApEETME1a1n/tCegd5YEeqY3suwQJE3Fvlk9URmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795742359;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Content-Type:Date:
	 Message-ID;
	bh=Q3yk6JuBVYGaDg8/tP3a+chRzUs23UDHyDZreRS7jcE=;
	b=kwtmaXg85wuDvyolwz9/yCtBKGQ8OAMgD9bcRwViXQPrqdiHBNb3py1u2TGojVhOg1tp
	 e5y3lB+sCutm/yxRV2ztXXBmDlVQv1pfmZl4Zksq80PFmS4vciGhvVa3x4AxJSMgdt8KI
	 q+swT4G+e3wscLrQeCYDmGsisISOxuQ2kd9S1z5dfIkdkGvFzrEbafOhfI6SyEloB1iSr
	 lem0tAPMXwNO9KRweBmzCiahmJ8jQEE9961deHf6zWOTMas1izwBNS196U5N1WStQBre7
	 S3kMNZcsGQIpWzy/PWLpP5ldpKzo7Xat/uLtwgH3ae49DEllHExfghB5XqYeGELpJEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xXuq0+wr;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5E6606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:19:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB5E6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xXuq0+wr
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-386ab9ab619so10177469eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 17:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795742358; x=1796347158; darn=vger.kernel.org;
        h=message-id:date:content-type:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q3yk6JuBVYGaDg8/tP3a+chRzUs23UDHyDZreRS7jcE=;
        b=xXuq0+wrnpAH7UpE9haZ/+L7MutpZIBEKagw0QMKq72w2hxnPNM7ey4qz2ykvgnKh3
         OSY2eJOIeJNEdomKUvdn6IvJUIUXnrkNlS1b/x8QfMNTTtUTCu5eV58LfwCL0eEOJkDn
         VPfUGiNs+WAeh8Po1PPe3c3Rc3XT7d0JucL2/13QODYT0LpPt2i9nwwQi/FwI+DIVavk
         1EcA+MDPvU4ktjbmbG52LkbDzWt+LaluPJZw5W9UjZx0+gazIevKPLoteO7e5ZlPWRkv
         7zGCrPzOpqaq4CFsqgZt6AXJQD4NzHmzLH74s8FTl2sBrY/JUD933NYfRl9gXzt0fM/e
         WPjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795742358; x=1796347158;
        h=message-id:date:content-type:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Q3yk6JuBVYGaDg8/tP3a+chRzUs23UDHyDZreRS7jcE=;
        b=rxc4dvS4Z2Mbulj0Ti+oU+ZZ/lLt9ZQcWdH/WWPjYg0KLJW/Ag4hqyoICg8u0HBFXg
         ZTAm1sK6DQyj5IXVqYSAdnbeMsw+l+v1HxLSVE61djuLKAGEgJ9ouWjmnz3LejPaZaHV
         mhTOZLd8e7DcMJyuYCHhy1v/2hp0h2UYzQlxmw98gtT1td2legnb0WN1euEVAkGY/chS
         PWCzgAgDf9Xy15+LHtcjOdSxdAFIMDPeoikoZpJ0c/rHoZ/nTSrwlD3sKpKqZnaMs9UM
         b85OMayYaW13i7S+qUgdCClaUlfuJ2zKZ5XcjAVRg8gQB/8MMjJtCCPoBNBkkMQ2hC9D
         3cJw==
X-Forwarded-Encrypted: i=1; AL+hErHpeXR+FNuqOMT9Y4uI063zQuYY2VuOO02uMvCUr/Qf/+7yBPxNOH0yQeBc4sjSNj8vmOaB3a5mE2cobhA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/E2HN7uV+joHiKawug0ImC8IidnUVO56XsVS1tIdfgxkOJJdfe
	TwbXhZMwiM0tvlwpEMypZKnZ+YGH94LlxWuFhOGWVJDlTnvOzrn6B9+g
X-Gm-Gg: AZFdTZdx/fzbxzzeH2in9rkg4IMF/w6QlALE++uyA/Hs2oFxWKIGmBhvTOTG8tvjilp
	Uszk8XshF8Ty8cl2/2QzHIAPKHEH10oVKQNm/xFnSBXAw0XV6bp079FZQKqFc6wt57YjfIgvntE
	jyzNW1dKzgq8NpcFN82Cs1mAZUA6HwjIVFbXPMq8P7EUabj0mM35xy3Uqfi/MUeXs7GcoaNxLkW
	jYhcAT/5h4jz6q4wOer/KN895GCpczZ6VlfxOFtN5MQhsVWWRnP+6EZMoRmcxrYUe13dmO+noEe
	BJjGqWL4wpoS7B3HoTmhlpTw+6dyJLsZS10A/LroFIgDgbuqyX4YbytbMKer3IQ5VT/baSxgD6d
	7F/mThGCgtsfEvTSE776Qy436Zkw9/cZplrUwOfnqk0mRT1+PcmuuEOmvBYdj0P+0ksxq+q7Fby
	829uNNS815nOVZIWele94/mdDc0KWsXayX/egI3efxA+HI/ps33GAhAsEyIJ4JjBYSijRRati6h
	+wM4ekzUhtOoaVk0Yga4rCVKsRsFYsi8harI9PGAch0gjqCJ40JCU8cH1TMSmX5IKg9f7eusCTI
	1jKlZIDsA6+nghS9QN8/cL9rx8Rzw1CivhsLsqPvuYgJI1E6X+Z2rnIstIoPCz0VzRKpQlPnmv8
	=
X-Received: by 2002:a05:7301:5093:b0:36a:31b2:8643 with SMTP id 5a478bee46e88-386992b3f3bmr19402083eec.38.1795742357644;
        Thu, 26 Nov 2026 17:19:17 -0800 (PST)
Received: from mac.lan (114-45-165-38.dynamic-ip.hinet.net. [114.45.165.38])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7fc3sm59524851eec.8.2026.11.26.17.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 17:19:17 -0800 (PST)
From: Ilia Snezhkov <iasnezhkov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
 andy@kernel.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: inkern: guard fwnode_xlate with info_exist_lock
In-Reply-To: <awf5uvVpYC72orT_@ashevche-desk.local>
References: <20261125234827.94791-1-iasnezhkov@gmail.com>
 <awf5uvVpYC72orT_@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Nov 2026 09:19:13 +0800
Message-ID: <179574235369.59467.3738891359915793741@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Hi Andy,

Thank you for the review.

I sent v2 at 06:06 UTC [1] addressing Arnav's feedback (-EPROBE_DEFER
instead of -ENODEV, dropping the num_channels check, and moving the AI
note below ---), which picked up his Reviewed-by.

Good point on placing `iio_dev_opaque = to_iio_dev_opaque(indio_dev);`
right after `channel->indio_dev = indio_dev;` before the scoped_guard()
block — I will include that in v3.

[1] https://lore.kernel.org/r/20261126060615.63790-1-iasnezhkov@gmail.com

Best regards,
Ilia
