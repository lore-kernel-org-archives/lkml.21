Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795110070;
	b=wcdV/kei9dws32yq8dZ7AUO5EcKdDw2svyrQZud46z4zwdx9JIVwno8WTIgKpI18ieMb
	 WV8ac3rRDS+qmNS9AqUsZiXbUP4fMx/uySJuhYNYCWwYk5f87g94dSMwi7BDoiFz2V1Ep
	 fhHKC7MUWYVMFD7YKRDvt7SxjLvyYN7eCmsY7HoOKaiss3/6mQUwCdO0ukGgR/Ub+dMCw
	 2GnwvgxiIBnuDr0HcESz5NNzGXOlT20jXNDZ6VG0qxcTbFwrfS/RP0OH5yIWk+UxjEiK/
	 vyXizrbIHgWWS7ldPQp7z+wi2bJoy9LlVHK54kXzfB+q/kiLFFq6UgNrGXjxOI0016Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110070;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=faMIeaoK/LPm6yriR8BPrSmHN2yGJNTk8EM5yBhbYJE=;
	b=KxIzy2eDPFS/IvIEI/sCpN1ppDacQAIGkELLMvRacHwfTOeW0to2d9EhvJ0brw194R7w
	 GaGgVK7MlrzcGke8FrhpZWliQRMBSL19aTCWf8+hurmvekTpzKfq6C4p/1CGTBcfokhAU
	 VFBlWJ0h8ujCADcuEzj/MnRCaJBf7m/qGFwSSaESSWHFFuyC7LVFJssFNjGl2IlaRyMVu
	 jbCcC47sq0Z1TkqyuSn2tJ4XMCi2JtqgHwbo+coHyT8tYNvsGEXaORvyVrtqofkzIsoXJ
	 oHM6kf3mog5zuz9hbKFhlxItMrKFR0aXYNY2I1YJMGh+4n7PUAP185Co/7pSf6ikLqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=suAO1eCq;
	arc=none smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E114606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:41:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E114606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=suAO1eCq
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-92116a3ef3cso14508726d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795110068; x=1795714868; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=faMIeaoK/LPm6yriR8BPrSmHN2yGJNTk8EM5yBhbYJE=;
        b=suAO1eCqJga1A/tYYdkSwi4XBJmnRXDSxDZeXVJKY8Ea3/+PHg4Z6/hGQdMUsk8x/S
         q53/cQEr2GgRkbFuw5/y06+XyeJvcwVvlC6Zlz6c1MoAs9cicHzrVc4ryTUHIM84BREM
         EZXjvpOq9SHyM3554td220q7xAt2/NAHehhyD5Ab6iHJSII4YSMk4PZ65BTgR6EXsJ7E
         eghmzgZuwF7TOMH53gKJa+YoakGyAQdl5kp+Av6ha4QFFclZ9csHtCa7QzctoZF6xHkY
         vc0fR2vIaVtJreQC7DerH3IqXDUU+QT9h/JSB8vqN33zYGy8ALbvVAsRP+EJZFX8XmEI
         mVgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795110068; x=1795714868;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=faMIeaoK/LPm6yriR8BPrSmHN2yGJNTk8EM5yBhbYJE=;
        b=L+ESS+xJD11/u26Zf/U840Mscq0F5agfHrKpIY+uW/OIWRtYX/xluzg6G+6n7Kx3Rq
         k66Cav83KHSYQASZHDgiNBLDAUrCm6yv18PTZQG5wEouTkkWlf8MmMSLJmv4D0rdheEj
         7rxvn5MWXVD98FL3dGopfhDrJo9YcV6Onu3IBAbGeaBb+xm/13C+Fxx2uBrbaDEWRP4l
         EwOtH5NtGPAeryAEEHEYoif4aqKSij4YmfuN/AE8L64CqJav7Kt37hbyiPrgLlAbFHeX
         U444bRjUpVjy26fA63G6HymKe4vLOO5zi7SKlCwmh41x7MqFfGTo5RHydGGNxNmH2XbS
         xAIA==
X-Forwarded-Encrypted: i=1; AL+hErHQitPZA1SbDUmSzuPbTkfItzGTFtLom9rZVnJuhoc4ra+iKwprI3g6+w6JOZKpPWC3Wxn756ZKThp5Iow=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ln7jeGnJuwJ0QvUBm1bLootm+QPikLAVeqDfUKafEtLhOpD0F
	KQtjiJWRFoTmZJm19bGbxO8kHDZ85dMAWEyBe0AYQJ0NjiR04pjkRX/n
X-Gm-Gg: AZFdTZfV5cLbke3y+gZw4t4Q8WQY/NF35QEEtURb0fc9+QAGHIrHdm9tYab3OY8+GBj
	bHc7ooWxMRSpDLxb36QcF7X2E0duvcydknNI9j6/F+O7cOwD+zJOBH4OWFg8IXv+rq3jn8EN+gE
	eJQdFBf6h8gbTevrputKqDT+PzQhakEGg/M/XeTDP53aAY2oEYDcErm57ZK74mLDd5ijPa9jInD
	MIMfi9YvQt0XPeUMrib7lK9QGMskb88UIrE6vq0bDuiApnmL77zFDRKGp5qJqhE3ToUIubR9Nat
	ZUNJOUZDaFhYqM1HEYfBd0Iac2y1lMp3/jPcmNia/CHyoBqJ+ptX1xVstOJ842deMDzPhNn6kE0
	LD/9lFmJ9FIXWpXSgqyTO5Xh8V72vLxGlBdklYmN6dTeUL1nhgfGfgF+S55FX6ymD1DAPYFShCH
	Vi7CPXv5RaNhSz/hBQ04S2asPmVHDemE1Rb9rn4irFDCYdfYMoBJxo09MPY0qjfkKRTcKjYVL5+
	6yGAW7pqDWxkP8+oF6dP4xm0Se/WZrDZFEea0LFkICVDn5MSiIbq+zEvdKMYCBUCy5gCres3ZMt
	6QoXtL6ywVVOcoxsvEfL1jEseMklXqdBI4826LRIx7JtJbmIeG+3/X86
X-Received: by 2002:a05:6214:c2b:b0:921:1e3c:efeb with SMTP id 6a1803df08f44-9212e0d16a1mr28186266d6.18.1795110068390;
        Thu, 19 Nov 2026 09:41:08 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134a0f5d7sm4654166d6.37.2026.11.19.09.41.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 09:41:07 -0800 (PST)
Message-ID: <ca5c0e46-3cb9-4604-8882-ae60c3d8fca1@gmail.com>
Date: Thu, 19 Nov 2026 09:41:06 -0800
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
Subject: Re: [PATCH v2] MIPS: SiByte: Fix missing function prototypes
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: linux-mips@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 open list <linux-kernel@vger.kernel.org>
References: <20261113191933.477395-1-f.fainelli@gmail.com>
 <alpine.DEB.2.21.2611180154490.54328@angie.orcam.me.uk>
 <b6546264-4c51-45e4-9728-a433527fb355@gmail.com>
 <alpine.DEB.2.21.2611190811510.54328@angie.orcam.me.uk>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <alpine.DEB.2.21.2611190811510.54328@angie.orcam.me.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/26 00:31, Maciej W. Rozycki wrote:
> On Wed, 18 Nov 2026, Florian Fainelli wrote:
> 
>>>>    static inline int __maybe_unused bcm1250_m3_war(void)
>>>>    {
>>>> -	if (IS_ENABLED(CONFIG_SB1_PASS_2_WORKAROUNDS))
>>>> -		return sb1250_m3_workaround_needed();
>>>> +#ifdef CONFIG_SB1_PASS_2_WORKAROUNDS
>>>> +	return sb1250_m3_workaround_needed();
>>>> +#else
>>>>    	return 0;
>>>> +#endif
>>>>    }
>>>
>>>    It seems a style regression, why is this change needed?
>>
>> The declaration is wrapped under #ifdef CONFIG_SB1_PASS_2_WORKAROUNDS, which
>> would hide the prototype when the option was disabled. The if (IS_ENABLED()
>> would not compile in that case since we would have lacked a visible
>> declaration. We could keep this and just make the prototype unconditionally
>> visible instead.
> 
>   I've pondered it a bit more and I'm not entirely happy with the use of a
> platform header in generic code in the first place.  Would <asm/bugs.h> be
> a better place for the prototype?

Yes, I like that, fixup coming up for Thomas to apply. Thanks!
-- 
Florian
