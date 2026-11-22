Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795368164;
	b=fGnwN3+1NkHTCZ9krnaTniWlf1BASCXTKH6SlPcgaMUPINI0kq4Ck9CXOZOqFO2yDCRD
	 ncPECOdb+OLLv1BBqDfarmY8zMKnPJvn9ER4ByiALBNQa5Box86VP24ejAB6/S/7DRqPY
	 QEh581ZcHBMzZjlHlXDSQNxYB7RQVSE3LCg9Dj5FGDyAT/SShckpoe3fkEobzc5OMrDyP
	 7EaH7TKLz0jpyv19w4qmYK3BSxP1em++nYwUEY7O1g/XfuZ8vbzLiueFoFZ2NQsu+uM9C
	 UNMufjDvQ34BA5Mcc7eFfLbrz29dJO/+Nxz5SnCkKCQ0Q3OSK1Kj+UYigHtKw3TUXaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795368164;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=576Qvl2ypTDD9yrAIj4YAh6P34TjGSq1gM/j9EPcq4Y=;
	b=Fn2HaOz0COvcC1BIXPf2G+DvVRpEZ1K203kgYIB80Aw5jD+7xsre2W1BOG9VRvdxu0+A
	 OH4u+vmlkGO0I+xZ3WqHMiQnnGjCNvCy8cfmoDai/HktmHagdNheh81S3NqTQyVgsDfmB
	 dy09cbbiNY9urV2J0czYzht5A6G6ieFp87IkHmrvymhEfl3JqxQLc8OLgt17Hs2syl78u
	 ztKuL1RI9sAPlu8JgIng4LH/oObzuosz5cxva89Ze4//MzPsYdBbBThZ5ncwXzTYgPwCt
	 EbwgUy0swmiSvW129hYdR/EYxCOb1xdQ0qVVuiZQ6YQktx9fVolaHqIldk+SluqC02g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="rdMN/uuh";
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38F7606A330
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 17:22:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D38F7606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rdMN/uuh
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3866a784546so3084256eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 09:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795368163; x=1795972963; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=576Qvl2ypTDD9yrAIj4YAh6P34TjGSq1gM/j9EPcq4Y=;
        b=rdMN/uuh37VKObF52K9+lcme53bqcVhzqmpmYe9zYf4xuf7IMBHBGOWYyCDpwozQem
         HWXEws9rArjqW8P+BJrs8nA5WqwClIUasxOguhVLwHBAfr+1EfGiWqdYOGJcP3CtmHI0
         gFM2LT3VrFa+7Y1gdLeG9WA6HQpTTkVWY35gj/quFUOILDjm/CiPqDGJ91U16Z19CGBl
         KUK3EdQL3TDOO5ADOUiFXPerabn7IEcmxNlrpheQJPGdqhsKbS5g6fctTEQ8Xc8PYA1C
         8gAFgyUBNZoud48/lrvtNYJu2wAHKjInCOYGYtovVezXg95EEZqg2FGRsu8+8BtEPE3j
         PHuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795368163; x=1795972963;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=576Qvl2ypTDD9yrAIj4YAh6P34TjGSq1gM/j9EPcq4Y=;
        b=TwIbZJqQBDC9uPZqnfqoVdlFSDo+PTAsF3GVACTotucIAaxrJX1UHUSZosRuAMiYFO
         cbtFnLUO4qMxCqeNBpKZQ9LcIh6n063JzfyJNao/ktoYHGK4vhNC88Wtoz7e1+0pTPll
         D9I5BwL8RUMGqBLiD4Mcw16yMIgFknR059UG4mL9s5ZXURg+FpQx3sYOCExo1GnDVgwA
         ax6yqpF9rXNfgbO42HijEULKzdsi/ir5A34MToCqfpTKE6UqC9iWW4SqIEfVp5utU9lq
         HLl4AaWj9GvJLyPoY9rDlo20MYORXeiilD0ht8mSIjKUr93xHeIuqqyfPfOW1JLKiZ/H
         PxJg==
X-Forwarded-Encrypted: i=1; AL+hErGAEN1iIr7L4iZCQBOpO5Zj0shGjepCYGuNF+jK2zl4uxRISk8f4cw+pnl2xI6MSEth4qt8p73jeYLpD4E=@vger.kernel.org
X-Gm-Message-State: APuU4Z82bVjGbQOh6RHPdUcC0m1vTRW0HCN9/iE+mBaXIgVkNw719Cwz
	8CQ7gkfGB8qhidmkQdGJOkO9v+DmroA6kr5aETT26iBrQm7WZf6dDGql
X-Gm-Gg: AZFdTZeSgPgznO9FtxEeCj/wXTdzrEFzZffDCMTe1C9dY/jWofXBh4oeF+xXym0rYi9
	UxexLjY1PezkheUNxlPMRgF7tji+XJotZgDpXJGWgj/0jMAYQnxh09uxuf9m3sS7/lBIaJQiiA0
	B1I8vZ6Ep5oPB+5nrWfkT+fdy4zrCMp8AFg5sa3BucacfRIbg5XX4z0xbw4c4rm7rlDiDsuMia9
	hpZWmIds4UCAJBSsmzAvqti3eF9owFvar2q8HYyro0CkI9lCv+u1b0LZQ3t8RkJPDYsaxVmB1zt
	BpoWkMzO58eN4XZjvCw6uyRFlJkT870oyxh0y3vOnkgC0QzlHOjqRbL89rK0sjPcPPTiJbkFMdq
	5ZACbLpn/Udg6ok19YjrUagUhRqa2xA+U8SeEk8pdbX9IkKnwMZ31/79qu94LsvkYnMQaCqyndy
	FY/bBOG5mBoTsBkN94ukthuzvu7V2LCkReUZp/37oJ5ZR6+WXb18+uHzW9c7B0vJvS16Mky8VdU
	kSCJuNFZXUPpQk2QwNxldRGwv8+nLgJaern9tOFrlj3snwRaN7i5MOFlQXBdcJYBa4ll3BIzFtV
	SWLe4a4gRdZ3gV+0AZzW6zoNtC+bNdEqPjSbvZsLr4776Bs9Degoh684m5xPevYeA0xvBcnRhpd
	urBMZlImovc8IxHm68pvVPUEHyc4XrrtMkRbC9TArrJ2nievUZmO+TvEjiL05YQeJ4n6/I3XvyT
	EgFwTs5tV2jjvFAOLzcFB646HOOMuiFdIaANSDnCpj72q9T4Y=
X-Received: by 2002:a05:693c:6010:b0:385:849b:7899 with SMTP id 5a478bee46e88-385849b7adamr10817054eec.4.1795368162901;
        Sun, 22 Nov 2026 09:22:42 -0800 (PST)
Received: from ?IPV6:2402:a00:163:3509:b842:8324:ef7c:136d? ([2402:a00:163:3509:b842:8324:ef7c:136d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566fdce48sm30943866eec.14.2026.11.22.09.22.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 09:22:42 -0800 (PST)
Message-ID: <9997e6c6-2e5e-4314-88b2-a8547ab035f2@gmail.com>
Date: Sun, 22 Nov 2026 22:52:36 +0530
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
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: qcom,sc7280-lpass-lpi: add
 ext_mclk1_c
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261115174237.48908-1-surajsonawane0215@gmail.com>
 <20261115174237.48908-2-surajsonawane0215@gmail.com>
 <20261116-nondescript-buffalo-of-whirlwind-6a5008@quoll>
Content-Language: en-US
From: Suraj Sonawane <surajsonawane0215@gmail.com>
In-Reply-To: <20261116-nondescript-buffalo-of-whirlwind-6a5008@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/11/26 18:10, Krzysztof Kozlowski wrote:
> On Sun, Nov 15, 2026 at 11:12:36PM +0530, Suraj Sonawane wrote:
>> LPASS LPI gpio5 can mux EXT_MCLK1_C. The SC7280 driver names that
>> function ext_mclk1_c, matching SC8280XP, but the binding enum does
> 
> I do not see it in the driver, so are you sure you used correct reason
> for the patch? Mentioning driver means you document existing ABI being
> used.
You are correct, thank you. In mainline, gpio5 in
drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c is currently:

   LPI_PINGROUP(5, 12, swr_rx_data, _, _, _),

so ext_mclk1_c is not implemented for SC7280 yet. I described it
wrongly as existing ABI.

 >> not allow it.
 >
 > Entire sentence is clear here - there is ABI and binding does not allow
 > it. Please point me to that implementation.

There is no such implementation in SC7280. The same mux position is
exposed as ext_mclk1_c on SC8280XP, in
drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c:

   LPI_PINGROUP(5, 12, swr_rx_data, ext_mclk1_c, qua_mi2s_data, _),

On Vicharak's Axon Mini SBC (QCS6490, sc7280-compatible LPI) we need 
LPASS gpio5 as
EXT_MCLK1_C for the audio codec MCLK. Patch 2/2 adds ext_mclk1_c to the
SC7280 LPI pinctrl driver, and patch 1/2 updates the binding so
function = "ext_mclk1_c" is valid.

I will send a v3 with a corrected commit message that says we are adding
the missing function and binding, not documenting pre-existing ABI.
Thanks,
Suraj
