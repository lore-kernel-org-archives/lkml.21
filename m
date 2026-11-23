Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795438671;
	b=UbP+YcRVUSmo6D7WArt4a63cbofJ6Gb87hBd22HhLsQQs5enpQgGZLfST3GtgJgw7sbT
	 p57NenG3ZVoZgZznPQZ/iortowQ05z0NlbABmt3BIiuvisIljVwxPbNghPkM7j7StwgfL
	 +p3BbJAEMTKPYq0veEwJTptDj7bCOgfEUwoF1DoyiNzYoUtfhTRWGf+7G9H0/wywCLY2b
	 rSucpTQaqLWzUNo6jLODrHFgDMobZm1tZ4fz5rAKyvDzMTY2340GwHYx+DAF5Sf9NN7S+
	 DNi53B4aCz1qOhkBLuEeAowctnXARZXRxu+uTvPQi4l8t00UodeKwGByBE6HiUImAvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795438671;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=sndCEp07Frht52v60gUrZGuFNtLHoYQT26fBAkqgHK8=;
	b=abbni8/MdBUiKit3DxGyTB2IOf8wxzahVoJ5lOXvAZE7T4wDf4rTcFv49T55zm7f2re7
	 /2RiB76TsBgPBwNDodmwtmhLPyfGL8vDcHwV2XXwSbqXVdTT+cxhZqm/16z4j5Yy1SAGC
	 jvCwAtVNghNB9tBiIduXWr0jhNwFTZlzn2mgWa0fmTGkUgWbl84FiiQeUiiLns67GjSaU
	 7ZetWTR3gCv4cCRWWmOR64ZuW3ZZOy+Z9SO6lkSOlOyDiCC5+KWTew3aWZ21eZc1diCnL
	 x72wSSS/edJHtEJNHK/qX0wvafoBDbxICDr0QfFbuxxz36DrnGMVeDOHwB631oifgqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cq5k5OZ6;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21EBD606A32E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:57:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21EBD606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cq5k5OZ6
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso30148175e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795438669; x=1796043469; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sndCEp07Frht52v60gUrZGuFNtLHoYQT26fBAkqgHK8=;
        b=Cq5k5OZ6ebr9kRq0Z/vDSvn8DQeQ0JrmvRSJpVhuzYr1k2sztwwNQkSx+QpW0vEuOK
         TIYXR7dkbD8q2rEmMzG1fesnw5BqNakqvrEe0Gr9/kN0hv2TK++5n33TCyghqOoT3+BJ
         MaJXEJHhU//ZKGts3ByOG7xBeTGIFUPfAq9mBs4emurD7F1JOeAM6lo7UdC8NY8iYOz1
         r4hvKp6X5Kc3BdGBqc1JBxlvde3uJK3aeEMKZxZ9QpLOH7dsggvGgqsFbvMwdQ5/ew8p
         kAwyi/sbffg+cCwj1kx03jmQpw/yuOKvtLBzLBOz8RrhvNK4bK36AO76kwy+J1qbNgo/
         nPKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795438669; x=1796043469;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sndCEp07Frht52v60gUrZGuFNtLHoYQT26fBAkqgHK8=;
        b=anfoLh8Yw6MS6bNTGC8jGxByXdP44yHGubc6KDgCLm9f7AQl6h+bVjp/0n3oJ/+I0p
         SMjJp0w9tcPaWyYe+2WUxEZyBqT5hH54yTDYYUvnFfyfgREGsrHu6bvntYyr/VsOQzlS
         WWviSwnBTtloi2tM+rwHOviGjQ0VNL9AwEMtS5Ec1MLLUeghRTX9OPQWT+0/WFjzrnT5
         KI1BxE8X9oRsTLeJJpiQEHA5wVwiHVDsVVDgsrvXWB7xBq8pJMOD9kDE6KQcc2yvDZkh
         Q59S+Tw5Y++cR8F51tTs+lUqmhOYUcap6A8gCDGvhnbfxGZqAI0+TxndKlfsAT8eaerb
         0vEQ==
X-Forwarded-Encrypted: i=1; AL+hErEUpU/yQ7S4dRh1vjh+NRMCq1DVyKjL4LQxXaURb8CwALLfUR6e0OuBR0stx4ewl9EvYaj9lcNRac/X0xs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dEFjAxQ1IZ0PEEA235PC2FOkE0nOhJ6PTRvWtpbO2dmXHMYVZ
	MgRPT9qgXEtJGMaDBkfNc4HqG9TEf9X8Gn5BukGb3qjRwRpe+ly55Lda
X-Gm-Gg: AZFdTZcy3zOsjRUv92K5W2/+3fpZQ13m7MFqlH83pbL/x9P01aIMW66BjhW/QBnRdBu
	0lHlpNDixuh0ska9jfZZ2ihuA6n9UlNTBZXCCUy3caQMcZx4JC0dRtGMOVNuSEPFNC4dqLssjz0
	/a0z7xM/VrEaRidjoULXVo1dLHE+XKs7LHMuPqbIP/xnj57TXoEDCpscrFnVduDVRLjhdStivuE
	d9s6d5g2zG7uNk0qa07+MrSuwV7Sc2e7nED8M1VdoKWXb/PWxLz8hw8qWEuumdaNJLYdFnUc+KP
	YZCYeZjN9cHwZYJsFWo1BU30T3j0JfzSNvUs4cvI+RqQ7Qwhy2Aotuq08bNkLQ1VlkQjjTYDGpQ
	jIsXAZANydeRpoDum3SXFj4XabppaMdikS3cnK4F935XobcEO4RdS88cLr65t9MKde6glwq9V1v
	kUnl5acMTZuHbo1Zlum67FCqfpfUU4pvvUtUi+F2urMKwnsgmTh54ikHjgfPMTuSkl2aJwGLnnQ
	ERyHi91dlWKADEnOrLFF1L3weK4v+nxQXk+NBpuCk08oeLXXi+STZL44io0HGUhq592d5SJnLcs
	vnAFGIPomxUVZmJFmYRB4/ZJspCE5php7NO/PhQ=
X-Received: by 2002:a05:600c:4f4b:b0:49f:fd2d:23c7 with SMTP id 5b1f17b1804b1-4bb888226c0mr278120335e9.27.1795438669332;
        Mon, 23 Nov 2026 04:57:49 -0800 (PST)
Received: from [192.168.18.21] ([46.197.185.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067846esm197171515e9.4.2026.11.23.04.57.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 04:57:48 -0800 (PST)
Message-ID: <6d2bb264-c1c6-42be-869b-4548fe697f59@gmail.com>
Date: Mon, 23 Nov 2026 15:57:47 +0300
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
Subject: Re: [PATCH] kobject: fix use-after-free in tagged uevent broadcast
To: Greg KH <gregkh@linuxfoundation.org>
Cc: rafael@kernel.org, dakr@kernel.org, akpm@linux-foundation.org,
 edumazet@google.com, brauner@kernel.org, driver-core@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20261122061751.178540-1-omermetekaya0@gmail.com>
 <2026112237-delegate-neon-7b4c@gregkh>
Content-Language: en-US
From: =?UTF-8?Q?=C3=96mer_Mete_Kaya?= <omermetekaya0@gmail.com>
In-Reply-To: <2026112237-delegate-neon-7b4c@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/22/26 12:41, Greg KH wrote:

>> Discovered by Sashiko, not triggered, not runtime tested.
> 
> Please test and get a reproducer before attempting such a change.
> 
> thanks,
> 
> greg k-h

Sorry, this is a syzbot KASAN bug that is already triggered, I confused
it with another commit I did. here is the link :
https://syzkaller.appspot.com/bug?extid=7db35adbc02c5b86d4e0 I will
resend it with properly.
