Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795007732;
	b=hPDn9TDNPJritgIg+VKvJwk1OOnLkddqx3REb0f2+UibI6kx/2oidHG5bNjAaGQli3v/
	 /Sx+F1mjbLwbKjjqFv2VTKCgJMUSf3/1zkbWaYPMZeSIFQF1tneJE8wxGFzkqu3P8qlWL
	 mUKCcViMSc5vfdHcVbTlNrqxHo4tKiXgfA3rNsWQ7qFpeL+xvZiucbd0TnWCytE9cdHKJ
	 4nunN3V0GqtFAkrxTXt1FfZN7K+vrp8el2ulYo5qk0oEVJgAQS2cAc7c2YzQj+m3JIDJg
	 8OBECbzW5zPHPmAxRk2Oqg/3NIGgiMRLulgxOaKZBrxARZPum15mSGfVatc6s0haDBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795007732;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=/TyJXkm2vpWoT51loq346JyUhuDruv4LPJ1ahbEZXZ4=;
	b=YiPsXyfKwWOl1At0M5LdHSRPXY2LpIclbt6yP5SF9iB/R2dtcu8jCekxvpRtBHAzB/fH
	 NJH4zyIeRJIdIO2RKTB1oihDVlgXhMISDWJjF5TA6mLAkZp0G3xdFSNezHfGmNHUO/7PI
	 7+WuwlEvMyifhlfo/yAjI7q9rU7uX3s/aDtf9bU340q76lXx365CE4UeOQzogLFjH0r7d
	 CbAhKNuHnagGcZAF42YF7jAtsi6Bxut8FxL43DKZukt9I4kYfsl72F8iWHxRNOOSv4VFR
	 E8jofpl0VmT1Du1fjuR8IDritMIOtuWM4x8THs8cGFNH6d2ATWj9b6FC9jaGyzwXU8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=hjycwbIO;
	arc=none smtp.remote-ip=209.85.208.171
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CB7606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:15:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6CB7606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=hjycwbIO
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3ae25d9e2fdso10718391fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 05:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1795007730; x=1795612530; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/TyJXkm2vpWoT51loq346JyUhuDruv4LPJ1ahbEZXZ4=;
        b=hjycwbIOyvQrtyBMWNnhVJEWJBwdjlEA5Rvyz1eNWYwmnxttiufHtMTo1C4mMepjlW
         ieE3sgvVtGrErSqaWC2nOZxiaCHT0Ac9j89oPsu2nDct0nubQg13z64ZJnvNFVqibbhH
         Bssl7Bekzs4AoVLMeule1aRmXk2lDI8Fck7HI628EQlIFVkq5YF9FQa+PdaTM4yCOvg2
         8sSuNzh5wCxCMJS0g7BjKDKcxEDR7qdJsZUl+OpUo8HTzRzb7VPsUZb+gmrj0LqYMFCZ
         fvSd8Cike1jGWLPP6cDliszDr2Y64nw3FRNzOC1FWZVjHDtSTgm33VNqwRaLAWUsmTlD
         iH6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795007730; x=1795612530;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/TyJXkm2vpWoT51loq346JyUhuDruv4LPJ1ahbEZXZ4=;
        b=eCMoMOuQUN25dqsmBIuhkVehTd4BhoxWUgOItIl/lZFSpINtpu6GgcBTnyZsgNg/TV
         jzBm5yi1r5eVxE6HRj5YCOnR9XlfNpCw28ju27p3I2y4uazrfMHBWeJ7ftud79+M5Rg3
         jfFZxHTgIWs+usxCTDceF+lZybpCvWthpGhtXXpXDw0AecXCnDeINc20Mdu7vVGcPxlp
         /X6XxtyS7+DBtJGMX+wAHxDDOsdJWy8E0/xnFP4sJK3tJveB1ww3Zte237gwe6G9FC5B
         TZZXgGXKadNgkkHgmOeIATenpBDTyBrNLMvmth7KRt/w9vkiM/zh0RHXmYmAg+xXA+O6
         LGrA==
X-Forwarded-Encrypted: i=1; AL+hErGWMqiJU44a2AqDh/Ja3n9popM5m2IILAVUrhmzWxpzYpXP0ZjEpNvSceWiLVoG500Ml1mq5sJ18yN7u/g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CPQVctN+7mYJ4Z708wxK5vlsHdJh6OQB4Jn9J/v4KeWKwIK0W
	Ds72qW6XZ92lyc9gNX5TKU5cHJg3+Ccwi/+pRSf9FmLYoy/RFyJOkZnJgtwZsqiqX9Q=
X-Gm-Gg: AYBFou3AwaKCBIqvFdUG3tWWwu1DLbqnvvzhPE8E1/pPvww8yTkHH4zoq0hWv9+UCEF
	sC+bLwqepbNTuwEZD6d4suL4rzPcpXq9zyYa7VesvJUiyUpA38f7INtjRwHCbQebipRYL0lKWQX
	/ItRKVV1AKyZpE8GQKQm6FhUAehru2/WiVXKmduytLpGR0QwbC2X2ayad5++MA+15iTHR7ajK6w
	thoNEhiCd9H/a+pyQpb1sXMbzaOemsh52tagIm1So2pD90SpEEYEvNz1+nMLRrFjU5JC3i1CyDM
	wL+ll95zygMxaP67YH52pEpbs78SBlFx9u62kSiHRoLuEDn77FVaLIB5EXf/8HsIBtrCPHV7Vr8
	zvZoeCSSOP1WTfMgM0wNRDw/D0IkkGISuHlfMwGj7wkU9agqzLPh5F14GwWwgbtL4YMiAeZjU3T
	Z6jLEx0wQqQpGMXkqCt9jwY9LfTZ1omNGXUH9XIkn7r+WoYGzap9lcxt/rMCoyB+LDCGcfzRAyj
	HOA6bq11Sq7ffTIKwalfOhr1xvtYhK8593v8JtqUSG6LFunqsXBaKLyYU+dSkjZp7EikI03n2dZ
	cUaW7rBNl6qiHGaMmaU0Fy9D0xOTK1wsVMaVWjeNaCEEZ6Tyh3zh1gA42zWecg==
X-Received: by 2002:a05:651c:a148:b0:3ab:3607:df9e with SMTP id 38308e7fff4ca-3ae670d1664mr9301141fa.13.1795007729556;
        Wed, 18 Nov 2026 05:15:29 -0800 (PST)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae67a38db8sm5617761fa.4.2026.11.18.05.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 05:15:26 -0800 (PST)
Date: Wed, 18 Nov 2026 14:15:21 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Ying Xiao <eagleshaw@google.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	"T . J . Mercier" <tjmercier@google.com>, Jiri Pirko <jiri@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Philipp Stanner <phasta@kernel.org>, 
	Jacob Moroni <jmoroni@google.com>, Xuehao Hu <xuehaohu@google.com>, dri-devel@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dma-buf: heaps: system: zero pages after
 set_memory_decrypted()
Message-ID: <av2jgIDyawKNS1BA@FV6GYCPJ69>
References: <20261117155431.1654298-1-eagleshaw@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117155431.1654298-1-eagleshaw@google.com>

Tue, Nov 17, 2026 at 04:54:31PM +0100, eagleshaw@google.com wrote:
>system_heap_allocate() allocates pages via order_flags[] with __GFP_ZERO
>while the direct map still has the memory encryption bit set. For the
>system_cc_shared heap, set_memory_decrypted() subsequently clears the
>encryption bit without re-zeroing, leaving ciphertext in DRAM on
>confidential computing (CoCo) guests instead of plaintext zeros.
>
>Skip __GFP_ZERO during alloc_pages() for cc_shared allocations, and zero
>the pages once in system_heap_set_page_decrypted() after
>set_memory_decrypted() succeeds.
>
>Fixes: 78b30c50a7ac ("dma-buf: heaps: system: add system_cc_shared heap for explicitly shared memory")
>Reviewed-by: Jacob Moroni <jmoroni@google.com>
>Signed-off-by: Ying Xiao <eagleshaw@google.com>

Reviewed-by: Jiri Pirko <jiri@nvidia.com>
