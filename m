Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107078;
	b=Hho/wQJMATfnFWIA5TO9Ybxkcw7Asl9UjP7/is00XBUhpK7exnWQx4OAB6U2XP1k2Ksf
	 xPF8jcyMSOnQRzztcgZ35BS/o337HFmtkKLHophFujyVSdJEKUNi1XOdbG1cyrFphS9ab
	 0my5Gdec8XIH3fsw/I3e0DQX+6gec7jfUMp3rq9j2a9jBQqp0qEiR94opTiCFChGEQ+VP
	 6UYJI0uqD6qyj82XjpvcY64+TKrP9r0enGzpiNYPIKrktESOVbJ4D+smw9vlgsUSRkJCr
	 pCM/a9tbSQ74xHg9awYm1dl9oxxEKLuTg8hpIPL6oC/hPDkZrgOcypvQjJODdadTfWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107078;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=lRdO4Y9UH2iKezbocQeecDxSl284A9tGk8f3DKBUEvw=;
	b=BzegwLO+rvTjy4usF5lg6Gz5AylBkNX4M8crZSUhPgpkBhErOau6cEZ0pvjxba744z85
	 y3J/96fMNTcZX2CnsMzNScQRbAR+VIVo7qzdd9ZDhmEaYQfeaNdE35NWDy5ibKeShQQlC
	 3BlNbe4LQUhWXCLMgE7+UmNPcby2TqYh8Rka8I6w+mE3TX7/iIrRrNzedApuUEe8Llnoc
	 7rwDLYFnQisa2sb6GxAsz0zYUdYRAZv+fAis7zRlBz15YGB8scjMW0Kik+P4v6sygOapO
	 CyKxsPNGDSILHgbefSNC+Jb/FMDMaE4Qz4HjRMeDw0gkAS1vYO29ryJvkVGusmT7/0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W5wO6cSp;
	arc=none smtp.remote-ip=74.125.227.138
Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B5A606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:51:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8B5A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W5wO6cSp
Received: by mail-pj2-f10.google.com with SMTP id 98e67ed59e1d1-3b3bbd46625so3498a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795107077; x=1795711877; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lRdO4Y9UH2iKezbocQeecDxSl284A9tGk8f3DKBUEvw=;
        b=W5wO6cSphMtufLh55O1QNHFTjjb1uZu5SGtB5W7M62SmtljwEGk7x3+bhzJ+DREFK6
         umUp6pwX5j+HBfVAZA44kvYcenfW2ZXBeKRbIgFV02b5iZ0jdHoB5mQNj9FdjY3Q1vtw
         bhiqhmaJ3qXePUgF5vYOCQwnUqrgTLMFRkJ2LXEBXHMT5utExV3QpMGWC5UUblaatWXr
         jPJsVBx48ePyUXCmmGeWvOnStA4jjHK9GMCxpyFdG4QMocQqrY/5IPAsj0+zxTL7GgEe
         hkthLF2Kph1SFQXMlKWX2vB2SzT9y2FtH/HwmLi8Y1kUI3sVT4mkiJAcUcDqcgFItZ3k
         tvXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107077; x=1795711877;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lRdO4Y9UH2iKezbocQeecDxSl284A9tGk8f3DKBUEvw=;
        b=OLPbfoajOcLPYqliPOu+JqUdM7nWfW00lsy1/KS7uSxAqlEeT/2G1A7FAbGyR2Tgtf
         hnOAG1b2J3pnSQWOHyjkiO84dqjguEuaDljQ/N/ZXv4ZIb1lpYJMfUNsfkmoes6uwi2l
         5Oh6wQHxpnjFHY9gMDCI3Dspu2cNaBc1ANGz587X33qK3csq1b0okL5tTD7Q4V+mOtSv
         aPe62EI8+8u2y9DJ/VGMmyoVAzHJV+4iu9h6FCXfZV5A/g5nUjC5EMY8xoBc7bRwiA5E
         cfNsD5QsUKV2it5XdiXYqk9Y3mpJlqmXs4Fc7LWgnZvRBsohEGLjwfcW+1NVH4T5zFUA
         NliA==
X-Forwarded-Encrypted: i=1; AL+hErEQ3SUpHp8/mbik8Z4FngBfLgWNypUY6garGw+Cp+fmnK4NGWYs9DpUVCQU+x3BhvghYsjYJSct2ElBA7g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TtL5OF7KFyS0e4DU94UE4vYEB1D+TAlc7blKcsEz6eJr/5fJZ
	hef1q4XQhjBp8XajbcJMEzArQKJ9TBSCr+czOgqq5s4kRJeeLrcb7Xht
X-Gm-Gg: AZFdTZePgSLuEYBBeTNCOlyhc324Glz6clPcP/qRomPpIsnNz8V6RzS9ewtI4TN3yhY
	ETdaEuV6sK0tNupiAzEZ8KBm3QuEjPJTSxcPYFhFIfOuS7bp7gvWpKqnNW42Skj5RPy7LuK4Tbf
	zpQoyV7ebXaifbS6HvAnM/2qRDb5ML/YCa06X5GWd09QYcQGFy2HAq9qQ39E0O+cIqZnZjQoBd5
	bC0kEpkh8ZcXuZbdrJPasBPlFfUo81VW/ZdMThlncM4iK3pqXftApHsoKrYOqMGT3uOdu0p2Pvo
	JMaar6P2V6omCCpAZ4PhiTFMUR+OyfAgLBuxoQDMaFam1Y1NZBq/0OcvvN7y817tnBdPZj90oBs
	321dxD66UoKo3OVwpIwmYD/WPNsj/wmhbPjJkw0FRgdkqNLctxHrbZhQOVh7oi4mNLr31H9ls9f
	lXis7/OBUXeYR0HZtv82cW0ahYmeqjhTNdEUKWVCXCYa/bxXkRYEJNIt6Sxfi4u0spvxtgrXucy
	g9AgOjvBjbHjjCLP8cicCQlhWuZ+/4huC2EDL4et3A0G2ZOlshiB4Or7+ifq3jLSM+vTpFMRPkG
	eaJULY2IOiEkkLeLTIar680=
X-Received: by 2002:a17:90b:5407:b0:3b3:b0f4:1bf6 with SMTP id 98e67ed59e1d1-3b3d074d82bmr6300014a91.22.1795107076893;
        Thu, 19 Nov 2026 08:51:16 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:6a::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad92c13sm129647a91.14.2026.11.19.08.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:51:16 -0800 (PST)
Date: Thu, 19 Nov 2026 08:51:11 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Tianyi Gao <tianyi@cloudflare.com>
Cc: netdev@vger.kernel.org, magnus.karlsson@intel.com, 
	maciej.fijalkowski@intel.com, sdf@fomichev.me, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com, 
	yoong.siang.song@intel.com, kerneljasonxing@gmail.com, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@cloudflare.com, tianyi.gao@linux.dev, 
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH net] xsk: reject TX checksum requests that overflow
 skb->csum_start
Message-ID: <av8o-Egamsxv-uWn@devvm16445.scu0.facebook.com>
References: <20261116162834.30087-1-tianyi@cloudflare.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261116162834.30087-1-tianyi@cloudflare.com>

On 11/16, Tianyi Gao wrote:
> xsk_skb_metadata() sets the u16 skb->csum_start to hr + csum_start. With
> 64K pages, csum_start can be close to U16_MAX, so the sum can overflow.
> The checksum offset then becomes negative. With XDP_UMEM_TX_SW_CSUM,
> skb_checksum_help() triggers a warning. Without it, the device gets a
> CHECKSUM_PARTIAL skb with a negative offset.
> 
> Reject this with -EINVAL. Use the limit of skb_partial_csum_set(), which
> also rejects U16_MAX, the "not set" value of transport_header. That
> helper cannot be used here, as the skb built for an IFF_TX_SKB_NO_LINEAR
> device has no linear data.
> 
> Fixes: 48eb03dd2630 ("xsk: Add TX timestamp and TX checksum offload support")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/all/sashiko-outbox-203545@kernel.org/
> Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
