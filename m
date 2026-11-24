Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541635;
	b=ySPoLcZP8EGNW3opLAeRtjFhL1smGlnWwqZ6e2bbFAFTMLtI1B5IGS8ZlJHPnr9m+HsS
	 nlzg07iCNhvDIo0Idh8aoiVHXz9u+qPtz00EwTmAEoOhNvTSamI9M7exZHaSXossgYMKi
	 WpAGG7TGeXP4zSVoLGoutt+uWIriH4W2bY6Vd2Wk4VDbxExzXhAK4998JcNnmTVgPRYhQ
	 KrbtQK+l+Wf1QWpSj7v6QPgbvepOJxm/uAW3o4rQW0js4cRs9GAoOS2gZlOLJP8bp/mi/
	 lswihyKMpUgRDAKMoGobvT8Yag2OUuwIql86Ak4Yq8x2s9AemEFn8UZb6PiM2CF1Jfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541635;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=wiuyexhBeJMAQYshISHeK6LJF1PaHeuPItNhVAf2u9E=;
	b=OlWaBZlvivjaps7a0vhdQmBJ5Kjf6yXVr/NBslkqqnx4Lz1Uoeu0/soizNcMHWOL7WIp
	 sefz97ygelmvF+QHIHhtGf5543JkNRAG+2o0t4tr7YsHhGi1SBun8SQRVtKPDltbBtmdB
	 MA9ezXN5NuQPm/1o+4s9rH1ULXGT/Zg9iL0h96AZKgZLht3wS8TwQtwAUwy4G0fARUt/k
	 q5RByyOIT9NTBzachWYLSNTQKbiorHbZzGKSBajnxXr3zb7h8BsvNWXXyZVxgykGn39aR
	 cY4KJT3Cu/pc4Ei6k95AduXmlHKNy5/3gkk6wZdPXutxGclLaca96esEhXFMXNzG0Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cfZ3w1fU;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80807606A323
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:33:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80807606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cfZ3w1fU
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so62567805e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795541633; x=1796146433; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wiuyexhBeJMAQYshISHeK6LJF1PaHeuPItNhVAf2u9E=;
        b=cfZ3w1fUW0vulvRXY6maReaWXvvzJmwc1lPh01QfqY0uV62PRD0Ql3MA+nYd1kW7sU
         4sJtFXAqxGtI2qA8A3QzaAvEr5J+3FvgDrFcHU8mFT8SpIu9DebXC9lOSUVHx6vd9G+F
         1Wcg3GdZ/hySgOeC2BkuQohQySZFWUy6Ocp2iabtffltmEww6EPtaaXrsHqj0WAhdJvN
         MBUX9OFHj1lAFIkwQqMoEKFzAIAQBaanavY18Z/EkgHm9KzwRFKE+E+t3/UHASSdyJCJ
         +wKeoHNVX8kmqGNdcjzjy49YtvgXgR736vdCA/avn0NhgcsLa3WDOQqRTnXu8DlCYu0O
         3R+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541633; x=1796146433;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wiuyexhBeJMAQYshISHeK6LJF1PaHeuPItNhVAf2u9E=;
        b=HJFmrl/47/WgtWqcI5QhW/E5K8FSCTOmxMyjyDbe7fG3AzvIs4z/z2wHvf0xEbhM+K
         2qNgRdkBavVjUfm2ORHIhfOadjDs2Cc0l3Pof2ouMmnZ2i5utw+Jy+3XDmYjJJccG/gh
         36N1Mm1Vp21i3xDPsVLcgRF9JpgihqUc/IB103YfqoudYAUk/BeHfUbzw3QGBRORtAWx
         Yqn50KyG3embDlHFJlJism4+5a2qzoK84qOs4ZCFJnoJXJYNZ27kgRziI50wy+oTgICP
         gpom1QefUoLTgLgKOtICbmpGauLP4a576prN0kWKA3YcYjzlAeiUlAL4376Y+h1JTGnF
         6M6w==
X-Forwarded-Encrypted: i=1; AL+hErEOLDuW0Czr8dz/Jvg9en830owgMiXlC+amet++Y+/7/XbDaq3QFmOXOahSyTeG2W/zs0KT8uml/MgusqY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9L+AxDuw3XBZ4bkI17PiMlgPbRVmCynjFUyZoN/LehRZEBNgSM
	8MhFLnGoPaQvVHDOXKUlX1m//uyv+lsUJS7fsCRSmFfG+w+qTL6vNtVOuUxht4BnqjYmenuAWLO
	2Xd6l7hY=
X-Gm-Gg: AZFdTZcs/VCQ3L7iW+XW0EzDoEali9uXJI95N4sHeg5JqaoXXZwS00V2jg5FMXfP0RE
	rL19wu0Gd+LT33nIUoxtxWuvMdHyaCo+IijaG0T1qeCXVfSWqJROBwhCZIblJkVEkGpIF6XA3kY
	s/OfYNUFe3oSF5X4H6xRe+DiyvERDCCoWkji8+EbcxrToytD1R+V7fdbnJxYkewRF2drSo+BmOH
	9d123BOM+m1c2hk+4xJnkyKxmSbw6Umg+y3nGODHPYD/9YyM3sqPKXScMAGYpkEDWd3RVfCVYbr
	kydrimq7KNxUE3wrdKiCUlIoAZlDKNSQHaDEW6zhKqtki8wVp7wVtMVwgYazhNQFnWhqVDxHdFh
	rWpvvvfqaA3lnROTGJzW83CqhSf3bciTtnUhqtH5Rtx5e5KcrQgAn2F2xVvDo6lbci5qI3XtzDZ
	a5QAFcMcYK/ZNk/Ij7wJMMxUX7QepLpoXuou8o/mOuZ4c8aIAPquqxa4dN45Ytv0v4LBfwm5cli
	gHsobUUTrYVssZP7uW5FCP5Pv6pHu9kf9MS89k6HAFORgE2QBiYZdcgSUOlkGKqMtkTcggC3EE/
	fvjCx1EUcp6Qk1I8jxFmRg3gfX9n7rlWpWzi4Z80e4k=
X-Received: by 2002:a05:600c:468b:b0:4bb:5fd1:92aa with SMTP id 5b1f17b1804b1-4bb888160c2mr325342815e9.15.1795541632819;
        Tue, 24 Nov 2026 09:33:52 -0800 (PST)
Received: from [192.168.0.167] ([109.76.241.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8d4f9aa8sm410677815e9.4.2026.11.24.09.33.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 09:33:52 -0800 (PST)
Message-ID: <41204b50-d861-435c-9cbb-8155e5e1d771@linaro.org>
Date: Tue, 24 Nov 2026 17:33:51 +0000
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
Subject: Re: [PATCH 1/2] media: qcom: camss: Latch buffer addresses through a
 single helper
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261124-tfe-fix-irq-v1-0-fd9840d952ae@oss.qualcomm.com>
 <20261124-tfe-fix-irq-v1-1-fd9840d952ae@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261124-tfe-fix-irq-v1-1-fd9840d952ae@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/11/2026 16:47, Loic Poulain wrote:
> The buffer address written by vfe_wm_update() has to be made visible to
> the hardware, and the way to do that depends on the generation, the older
> ones only expose a register update, some relies on a FIFO, while the newer
> ones expose a dedicated address update that triggers the latch on its own.
> 
> Both sequences are open-coded at every call site today, with the address
> update being additive and always followed by a register update. This
> leaves no way for a generation to tell that an address update alone is
> enough, or that no latching is needed at all.
> 
> Add vfe_buf_addr_latch(), which calls the generation's addr_update() when
> it provides one and falls back to reg_update() otherwise.
> 
> The write master configuration programmed by vfe_wm_start() still needs
> committing, so vfe_enable_output_v2() now latches each initial buffer
> address inside the loop and issues a single register update afterwards.
> 
> Signed-off-by: Loic Poulain<loic.poulain@oss.qualcomm.com>
This is a bit too wordy for me.

Can you reduce this down to one paragraph. It seems like a 
straightforward functional decomposition to me.

---
bod
