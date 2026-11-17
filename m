Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794952044;
	b=2NSAzHnOpx346V7tMFZcpaDRDQC4wIS8GcW4+k4K/LkFAcGCyAkmeDUYDArdKN6pX/Hc
	 tGS4tAJ+F2/GZQzbCKDTk8CxS9FqEDE5QamZNGn6/S5KdI4VzjPsCXdXrPOa7jZsVpCvc
	 wW7Ru2CI1A3g/6g25u+bcw0m5SnsL5uxlJcwy7BCXXItiaFSLrvvLcrJAtr1pCJcSDLxS
	 SyT6xq0+inYnk0hmYYFnkIUWr6pfAGgJPUIKhLRyzmMlSygxn1aK9S8shdKDbQ7dXzMe6
	 e5RMFfArk7R0uy6SxD/sxLQPcwVqw6qETHUbulofPumig0bc9rA4EV/WpxF3zo483Nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794952044;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=gIwiNUiHWgzvyXGdgc8knRbhVSBtepqYaXTWRnw+kyM=;
	b=NqPNxUTO3Jm9FMWjC61ViUhlYW4b2fsK1h6woiP60WXQvi159yhXWVGIFZaA4F+fMrw1
	 d1bUL+iGcsinyPDpHWK3bluxetkZfb4xT0zcZ+aOGm5wt5IxNIOLO5iN0KEF2gRfMIRAZ
	 q4wFgSOjuUBUumu1wrgHAub7/Nh8pMAkCpDh2GVy6O0HfotCgRSFrno8XbVOk5ylmGHVT
	 Jk7nTABqja9irLUxZwj/qktRsSxgUsCnsJZnJs2rm7fx3H1NSKdJXbkFMFdQWqvX+nMPh
	 Ps0za7byTrWLZ2z1HBVWQMgzz1b75lGjlH4sOl/c+0tdg1XV0QSfj0j26YyvWBwHYiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=BXRpKHux;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A047606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 21:47:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A047606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=BXRpKHux
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so3442965e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794952043; x=1795556843; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gIwiNUiHWgzvyXGdgc8knRbhVSBtepqYaXTWRnw+kyM=;
        b=BXRpKHuxYC7+jXyNGqp8Xt8BxCPlFt8shuAvBEmiD153YOQwoNWkr7fJUfkZDTG54E
         qpRb0LbE1dIIEyKgOAen32RVWEiYeJHoG/9HNRtwrOP4RgexsWf30Fe80hck6Zz2WM8l
         JgrMoEpAU0hoPrBcShtrisI0TtNp5mfJV16vRtKo3B3pWtIkSvu2boryrUstMDX/KHVb
         ToTmvddYBj/rAJnEb2EhsEbXfdlw0OpI8jJwEKZEu+RavC1lFQRmqbrL+alRGpnhI05I
         JNXo9RcQrJ5Zod45/NVIUpJhxH1WHy4R1UjhxKCDghMbiPDj7UxRO3Bmd4PkiLOd97DH
         8MRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794952043; x=1795556843;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gIwiNUiHWgzvyXGdgc8knRbhVSBtepqYaXTWRnw+kyM=;
        b=g90vL/I2QZbzXkjyR1z814HZonfAEAGuweJ9z3saHR1V64HM+UOx2pLGzi8G2kZYH3
         tcHJbHemdRs+r5mS9rKtEYLt0HPwfrwS83MWBFFUtUTluGG2m/zl277My7I4VjdxeFdd
         AB9UdBybI8rcdwiC0ZQgwBOheevMfqNGSyoYZsnkA0LnnT6luFLwo6ZfRD1l+zG+mb33
         Tfs3hOBVuzx20otcYU56+8uZ6l3r1JJ9qozguKhITkewo+f3yF9jl0WcL0Qps87kqgyt
         DiMxf480O0wBUiBTU8PIgSKbUXKGX7B1qkUZstu0GIsPnt5haGMLAeCxXSAbinZR7T33
         vQ3w==
X-Gm-Message-State: APuU4Z+vWiS2234m4Sqiv9dw3pKVsCM12EgZ9YnA2vvy7ST2hSNPWWCT
	95hXWyfE91uIRJyGWPm1grG74kU0EsDOAVh957yBXpHpuCE0HelBdDqacClM8ccPcb4=
X-Gm-Gg: AYBFou2V5fJiQQnBIo+x8eBZmg637tCtxcEE1dFBFTm/UNjH6km5pNSnswH+QXpqu2X
	Dlvl5QLhQzu3SAUCWlqMhP5pquThhTecy37ah0Xe9W2ZcGMExHfTUUg8Jwg+73To5v9vXf6veZP
	6nUcOhnMY3virfpCzMJ0zAJFwfbvrIc6ZLdYHsrYL1BDtUS8eHSi/LD81o7ZNr4l/7H6N2BP42k
	c12hJCEhWxpZWfhkE2GV7BAyUjTiIWmlGO+Q9Nj3IAygOuTqCV0ahiYwPnm9EmqhkBzUrvzIbBg
	NametKWLA0dNv89BmWpv1EGx41FED6Vbp/OugpHWXJ4nC3fKBWTv6Ppama66dej83tFifsaQXNJ
	irj6QKfEQBCbQyjWXungLY/u8wPWuM3o3sC+D0+4xofjEn5avgALOO6lOi54eTlq3jYBgbMxRPn
	2o+Qo2Ey8NyQPVDCG1TbylhBGjVM20vgr+Jpv2tvw8VF9WxLUAoM73ik63XzkpYraXsaL53Au2x
	3sJJos7GRHANQ0Tv+KzRL7Ka5TWreeQaBUbTPcH7549i3SZUZxaw7eClBOnAIh2cBi2vvgigZB3
	NMBw73v9SqrD6Qbo+vlFe7zJMSSV4GxkPqihB4RIbGOeqkp/XC4vYTC0KIb4NJKhK8bPXGle7H0
	3vA==
X-Received: by 2002:a05:600c:34d2:b0:4a1:6992:f861 with SMTP id 5b1f17b1804b1-4bb7d6d1f21mr10057405e9.1.1794952042780;
        Tue, 17 Nov 2026 13:47:22 -0800 (PST)
Received: from ?IPV6:2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183? ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d256f64sm14409575e9.1.2026.11.17.13.47.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 13:47:22 -0800 (PST)
Message-ID: <f68008ab-e743-4859-9b33-a88fc1e4b855@baylibre.com>
Date: Tue, 17 Nov 2026 21:47:21 +0000
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
Subject: Re: [PATCH 2/4] accel/rocket: Fix the panic in
 rocket_iommu_domain_put when the domain is NULL
To: Chaoyi Chen <kernel@airkyi.com>, Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Oded Gabbay <ogabbay@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>
References: <20260814022453.437-1-kernel@airkyi.com>
 <20260814022453.437-3-kernel@airkyi.com>
Content-Language: en-US
From: Daniel Drake <ddrake@baylibre.com>
In-Reply-To: <20260814022453.437-3-kernel@airkyi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/08/2026 03:24, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> In rocket_ioctl_submit_job(), since the domain is assigned last, an
> error before that triggers rocket_job_put() -> rocket_job_cleanup()
> -> rocket_iommu_domain_put() with the domain still NULL,
> causing a panic in that function.
> 
> Therefore, the input parameters should be validated.
> 
> Fixes: 658ebeac3351 ("accel/rocket: Add IOCTL for BO creation")
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
This issue was already fixed in commit 
70e6a33d68a9b03335c5426332666e52d07f45d6.
This patch is not needed.

