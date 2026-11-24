Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795544431;
	b=oLq9F+ekK53Mcb49+w2rdI98yuW3mY+zcgfV13d7ZlDuMZt0lZx1vCXtXRUK27U9nBNa
	 6nWkxXMIi9a7zSwO2Ug4L1rI/iffjaE0SJirZOte+2uVjXFK/mYbwLxJ3R4MI7NvqWCIa
	 l/eIhH8Ag0WVMjJ/sBTkK93xA0iyGrMS0ij41bAq0jyUkNBsQD4xtt4Z0tgjjHuP22fSY
	 XNDKV2GiFZ69IcBOMqF/iV5IK8Plust++FlVpVJnV+OiZ+KzG4SK1wjdqX0Oet5w9MVD9
	 3R2qEt6oFfuOLkDd17X40KLqs/W00Hz4HuhP+zEFt28772LCbs9JAus5/6jtMYV/6Ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795544431;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=t6rdI7mURCpoui2vomlPR/PWdU7STA6LJoFefEg+LTQ=;
	b=R/7AeA71ELlg7HZNCfWcFTaeGb36n+A0Vy4lowGqyJbzKqXjkG/t0DAxwHvrcegTboXB
	 qH2WzFAHAba9zhELHLoxB8A3tZPc43CQ4W9I3YwnnBvveTw7rimT8lvNm9+aV+WKANbZZ
	 N726VK0URgNvXyZmNF50pRt5sY1dSeLqHiPNZHcoLCbblS80cUA60SLo29HWN65uLAA8f
	 ZdEOyCqFm2P8G90DUO/MBO19clZrioVRjtyS9X2RCug8ZAE5uTyGzXuNQLGMnPJuwHbLS
	 MZOhLZt9ytMhneY9oCoRxw+XrJw3ewAA51n25Z49anZ1c3iZ9jXlpC0VEc1liXn90vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=CZoClDc9;
	arc=none smtp.remote-ip=209.85.160.49
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018F0606A696
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 18:20:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 018F0606A696
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=CZoClDc9
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-48e9476e26aso1744351fac.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar.com; s=google; t=1795544419; x=1796149219; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t6rdI7mURCpoui2vomlPR/PWdU7STA6LJoFefEg+LTQ=;
        b=CZoClDc954audVYdIAGk8ir98EMyWzZHR4PzCp8Z+e2wEsJQmV1rb/kHIm8sEB4Jvp
         c/ZpPcECG7Kg0949y0SWgOinmwavNBIrF8zVixscHcAkNpX6YUdmZ/2d/OK191FY8e6o
         Z4PguIbi2hOCQc3GsJL9zb80eiKCeMDN855klDJsOp+lXiNWxqQi8IRQUBze156ylde0
         Q1HQEbokl49+3iwiPhPsqudSrpuw/1BKEuijh662QrDC82vqGNE61FqqYwtrTGhXJjTq
         qojQSWWOI0D9ja+Azu798AWtQou687WNmexdfBUuDLsDiqzkoJ4Uiau95H9RNFadWat5
         y/Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795544419; x=1796149219;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t6rdI7mURCpoui2vomlPR/PWdU7STA6LJoFefEg+LTQ=;
        b=CPAwd2TMDhPA83sGI9QxppDN0EBvVG9bo4AyrazWb0W2qTqffLk35vlk/ZEPpwpHhI
         IDY3vKVkgXXiJ8i4ecEkhUAhy/JklVXtn7tp5sRGQ8YhEUvsMXif9kAF7Gu8cs/cXK03
         ZtS7Uph43I6I5hx2LtIFlL2P7UGmJVawfDY71OShV93lYlPegCHQlbcje0vToTgSW+rg
         IwvQi8YCGbnw2LtNgoEziUmQv3hgL7Nolz31xFUbf+e8INRcOfBjO674ZYrTKc02AWz8
         bk2ns0QWXPb4x3s5I/bLVgh+4FOP3e/Wo5xpLU8VXOfjGSq7YRtxa8eMxIfA1+HseXgC
         tZOQ==
X-Forwarded-Encrypted: i=1; AL+hErFeVRYT6BaopgHrxq0yDXpNuTwiirKiVdjvF7fIgPR6C5ZbAutUNIkG9GiltVovVfeoNAuW04q5hFL8KWU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Wutgukwfz1No8trpV3wnrfzdbPQxWhPSyOQnuKdz+IyRWxCBl
	aB5VYgv8aB9c4i7h+PJUFjoDcUlR9quWtK+5BKZ2XeDt8mq7RBStvYJ/oalETwnq7Qk=
X-Gm-Gg: AZFdTZfsuyTWnNMsXG/YPhP4B8qo9GOxwePc2BCZdTOBfGerhMCcLLXKTgCv5Y4D3q2
	OqtPSSEMGTtV6thm/CtWXokJVtXMREewozs0vASPXyhGuEzgQKdtiwIHJzta+krNxSinqdgpMF4
	g6eTMXmCVn1oWIiyr1BE08wKBCn+Pltrdl1UEPYrY2AwovDvRiusIN4Q5gYRVpFL0aRZAvyzi3H
	syYcs63ibJFJq01oPCRmuvVrTkUnn3g8W06YhSXK6RFeugHfG91fm/ywvsnBcwh98bhOJdXJmw8
	ZFegTeYGBwvqpqPawYCLg8v/w97RDKmWV6o5Te7LgNCieuPYlvq0xCAUsxrV4aV/eIlXBkOWwXK
	JSDkDp1Y+6g+yWN5PyhwxZDLR4B0eBTnXZ3EtmJQsI4NV4GhL96hOwnWJRipbWJJ6odNaOQxNx1
	8ifCPYp8k8oBNpnHV/vQum9LjCMWQmX5j+crIliS32r70kVTtpsl3O7Zt0ly88CfAH6nvXgBchx
	3Ox7UOWT+lJxRRImtiwgtYaSIqCN6rKRnd+vRLg+/mEG3tg6Z9ZsoNO5lx5G7KtnRZrzeRU7y38
	JEcwZukLgLrZ/xXVDCyJOvGe+WMMxOlj
X-Received: by 2002:a05:6870:5b9a:b0:4b4:8c0f:40b6 with SMTP id 586e51a60fabf-4bc821920bcmr13877948fac.20.1795544418852;
        Tue, 24 Nov 2026 10:20:18 -0800 (PST)
Received: from [172.22.22.28] ([76.156.233.211])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc60891cf6sm15654378fac.13.2026.11.24.10.20.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 10:20:18 -0800 (PST)
Message-ID: <3f7e5d79-c356-4082-9be2-bca3b8833f88@riscstar.com>
Date: Tue, 24 Nov 2026 12:20:17 -0600
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
Subject: Re: [PATCH] staging: greybus: bootrom: use firmware size for debug
 output
To: pavankumaryalagada@gmail.com, johan@kernel.org
Cc: gregkh@linuxfoundation.org, elder@kernel.org, vireshk@kernel.org,
 esennesh@leaflabs.com, skhan@linuxfoundation.org,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20261124181046.44750-1-pavankumaryalagada@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20261124181046.44750-1-pavankumaryalagada@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/24/26 12:10 PM, pavankumaryalagada@gmail.com wrote:
> From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> 
> The firmware size is converted to little-endian byte order before
> being stored in size_response->size. However, the debug message
> prints size_response->size directly without converting it back
> to CPU byte order.
> 
> Use bootrom->fw->size instead, which already contains the firmware
> size in CPU byte order.
> 
> Fixes: fc41c2da44c5 ("greybus: firmware/bootrom: debug output from bootrom protocol")
> Suggested-by: Alex Elder <elder@riscstar.com>
> Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>

Thanks for the patch, this looks good.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/staging/greybus/bootrom.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/greybus/bootrom.c b/drivers/staging/greybus/bootrom.c
> index fb1fbd3f7b99..4e225084851b 100644
> --- a/drivers/staging/greybus/bootrom.c
> +++ b/drivers/staging/greybus/bootrom.c
> @@ -222,8 +222,8 @@ static int gb_bootrom_firmware_size_request(struct gb_operation *op)
>   	size_response = op->response->payload;
>   	size_response->size = cpu_to_le32(bootrom->fw->size);
>   
> -	dev_dbg(dev, "%s: firmware size %u bytes\n",
> -		__func__, size_response->size);
> +	dev_dbg(dev, "%s: firmware size %zu bytes\n",
> +		__func__, bootrom->fw->size);
>   
>   unlock:
>   	mutex_unlock(&bootrom->mutex);

