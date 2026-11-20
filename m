Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795198401;
	b=Lm0ToOXGYz+a3DZzPJLE0GDn6AjmqtQ6XDb432KLSimN7RjLplf9qAMjnXsqL3jN7O9w
	 2CJhtF0Bav/f88CPdd4ouGOsAS3y9Q0PNaWR5iCgEeSJVsoriYWjaLHRdmQtlMlP90DOT
	 3OcZ3UsmqKnfybMACvwfENhQfee4Nywq8V7oyIPpAskYE0mqL9VK4Re/rp0/P6XvAPF9O
	 hMLcerS/BisNUoE7dkBhyeNBOtTjJskzeqBN55AtueGa2izKjYZl0Ox64LMlpJx1KZmco
	 q0L/IDfcXJNjgcx+WP1qilQ64BCup6oWiZhz84tUyyPasb89Jqj79hoNTlltP/E//bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795198401;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=oidvo6PpYzFoB+4JyNdN3ZrBRB9jo1ImxetzExbVmTU=;
	b=mo1RTuHvXyRkOyVHFDRt94wP9Az2/QuZZdY5nMvKh6pYVXgo67fxsV19XtheAfWrz356
	 67xBKPJjp7FYimTleMWqjd++zxCEbZ9gFJPvenXBtdzqzLwBPAYFyAIpyjY1DvEK7v27H
	 TKdu2k/Z6hZUa0DBsBzemarEIInNJA298Cmfb1I4s1Osf2nH0EhcvdXqwW1PtLgQXEjzW
	 CHIDquFaOPPkVNbymj6lkz8H1PHoVmLONHSeXp0yw6NCx54ARlI8rsjTgbbT4wXlm9Vfm
	 nIAOYeomAmXZhh9mF3j+U3G84ktRsTNHNPOJZmB++/pAUOKauNxDQxMduwufgG8yGSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0ZaGSuDy;
	arc=none smtp.remote-ip=209.85.219.44
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9DD606C6FF
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 18:13:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF9DD606C6FF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0ZaGSuDy
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-9211efaca89so16112026d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795198398; x=1795803198; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oidvo6PpYzFoB+4JyNdN3ZrBRB9jo1ImxetzExbVmTU=;
        b=0ZaGSuDyeUEPpYIJz9D3/mrE7uSERI4S01BhMBly9pDPEbZE0OcJmrtz8Y5VvLH3Gj
         xKFXteozeWuhMYAX16li6vOwnt07M79tqFYKrm3pKC5uLbiDyB8bdD27ipJ0Ade1OhgC
         XFEynm4OvVDuv47NF1vP20F1hEkJRkHZmVuks6RIIklS9sjDJUfPh8mAK5dtVHO3JXPO
         wAXiulFFrw9lQJGH7Q7XyKRg2nsEhTulLYkGhK34gqEU2JfIrQBSyequ1JFrYuNGA9Oy
         x/Gpq5ygctt1B7fHBG2C61izOmkaKJuFWnHtt6naS+INZShm2Labe5EskMowrDFtbRTY
         zR/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795198399; x=1795803199;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oidvo6PpYzFoB+4JyNdN3ZrBRB9jo1ImxetzExbVmTU=;
        b=G+HxnWvu4Sgeyhd88Ew3ZDTHFg94yIxij4Wo9c93TE2V18qrvEx9Jeg2CZpEp0dFQb
         MSTiXFWdfM78x094qqq1PxU0maKymAsb+4igTwKl/BUgewGB6moJ+xDKKEvVC+6AmCmH
         1qCT/Mh8lcDiEjBUStgRlUVaerYH0VrvcAf/LxIvdy2UtMEy/dTe+voBMEwq2CMRSFxS
         g55peDa/f5ammMpyyYfummpCC2eMaz5dilgTMFyf1/zgOYAIaXWYdnjFt9U2KLbd5qWu
         br7WGDsmYSypGsrZwYD8aGTFq2dDZecK7Irq3Sh2tEw1XuzWmQVMr+PLx6u5MAqM8JYG
         laDg==
X-Forwarded-Encrypted: i=1; AL+hErHoPrBLQXds3gxNt6PexoVjMAQQsx2or9LiYNfy/dFCcnlf/AMigniQKIFXUS8wZ/72UjoEs78riFqThuo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+O+5+L5dRgx6Wi/ikhfgnrVjNPycU+wmaERik4GhB0RxY3tEFH
	aBEJth2zY6dqyBKXRY1umrRYhrWrxmOno3mBqnLzvehjwJr0cUXW6vRE9XSFFQ==
X-Gm-Gg: AZFdTZdKCmLw27rGoNsUOXNykZnLFePIg4MaB7vOPPgo5TYUg3Ys1eCt/Fx7+mXEmyj
	7IQ+XER4xDLHlS9j3qGO8NdzuCICORrhq18lzqEOzkL3KKT7OO5n9lPTF3F9Rh/2vkPwqhjZOdV
	HSHhy+YxzWHNxL2SuCjIZFZqaNAdHLE0u/HSHn7A55kvezojc9U7/O//33Y5W92oTuqo/OoNgov
	oK7fhCUUEEEd8ihRoKiyrmPQZT0dRZPVqL/pGyggr/wp02mlrazWd7kz19lwf+p0xjMNW2iXviO
	5kfExQNaaPz9X3UIG1EJRLu0FFni6w3T7uLQ0zKmkUdmI/u7E+Fm0kxmB3sDqmQCmCG1pPLP0Xu
	vVNrXASiXY1QG9Ma8yzoBzz4Jdr7PXQC5lgLD0WiFALyQYpaCGRhf9SXNRU5iJ0v+/PF+gidXVo
	XJaynIlVMqOwyJy4tRakjXZCkdqm9X0/jAWhkd4Qm+0jRN8mwZSMGc/w2Sq6dN9swrAPsSKZk+q
	i3uPy4Q1O/vJi3/7qcDCw+9L3rFL82xYvu9Fix0WWdqBNLr+SN3ZNqMp/nFfEAlyvOlPZqbdYN6
	m2kpABabHf2+88TOCMzESER8OT/ks9cLsyv6epjm78PKxUIMjCLGZHbk
X-Received: by 2002:a05:6214:c6e:b0:91e:d612:a120 with SMTP id 6a1803df08f44-921347740ccmr66147836d6.0.1795198398604;
        Fri, 20 Nov 2026 10:13:18 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349b50besm31921776d6.9.2026.11.20.10.13.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 10:13:18 -0800 (PST)
Message-ID: <f82422b6-20ca-4c47-b420-156ae6912dd3@gmail.com>
Date: Fri, 20 Nov 2026 10:13:16 -0800
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
Subject: Re: [PATCH] MIPS: Ingenic: Allow assembler reordering in the XBurst
 secondary entry
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 open list <linux-kernel@vger.kernel.org>
References: <20261120050827.804767-1-f.fainelli@gmail.com>
 <alpine.DEB.2.21.2611201404490.54328@angie.orcam.me.uk>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <alpine.DEB.2.21.2611201404490.54328@angie.orcam.me.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/20/26 06:06, Maciej W. Rozycki wrote:
> On Thu, 19 Nov 2026, Florian Fainelli wrote:
> 
>> Remove .set noreorder and the two explicit delay-slot nops from the
>> XBurst secondary CPU reset entry. GNU as emits identical reset-entry
>> instructions with reordering enabled in both the CI20 and generic
>> MIPS64r2 Ingenic SMP builds.
>>
>> On CI20, two baseline and three updated cold boots brought both CPUs
>> online. Each boot passed the CPU affinity check and 100 cross-core
>> idle-wakeup round trips in each direction. Codex assisted with the
>> assembly comparison and hardware test campaign.
>>
>> Suggested-by: Maciej W. Rozycki <macro@orcam.me.uk>
>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
>> ---
>> Thomas, feel free to fixup into "MIPS: Ingenic: Add XBurst SMP support"
>> if that is simpler. Thanks!
> 
>   Have you compared objects produced to be the same with and without the
> change applied?  If they are, then:

Yes I did and they were the same.

> 
> Reviewed-by: Maciej W. Rozycki <macro@orcam.me.uk>
> 
>   Thanks for this follow-up cleanup.

Of course, thanks for all of your excellent feedback as usual!
-- 
Florian
