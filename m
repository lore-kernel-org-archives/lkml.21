Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795696063;
	b=DsgEjbLJuJ7KurtHWeS98isNGI9TrRV6E0HGgoLoXifmCj3jUcOr4VESrfCVKBUjzfJQ
	 lAw+E7smMSfSZTlQ8vSsjT2zT+XIRIRP0+Metm/h0w95N5fDY5r0kcchOk46OOXUHC8xY
	 wNJa/3VGrDz34Bq0Mwew05+TPWiX6lqn/fONi2a9ikhQtpnI/dFpEKWsPRJEYEdQ8PIIV
	 JrMwMTIN+IVR2dwZ7IbrO7u6WonrYo335SSmnXA7dtY2lrsfwO92gWjg6ZIS/prjAry5W
	 OlQpQPHXH+YIQLIxwbZwPBGoEhdZq0LNtgtdF/XKyODPC9HVB53YSaPmcjeVXiM9chQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795696063;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=9cZzYu9JZHNy2GGOL3+wun6roAj3SViQk5bIR0UA5Sk=;
	b=IDYugkpagq+fGnrVDh+RSwZAJIRLD/QtjXc/Jfnd0nfHs2BOzxkzZHV6w/9bfyngB55R
	 NNb8P/Sm8bh6dYqfhFXzUGLfJrNQJXgaQrU1b7fnOPXWvczeaxC5rihzJrVbZ+qS+p3Mt
	 lrTRbPcW0b2PVnWApAOwhLgfQ5YwJ2aVGo/+JP1XtZf4hmQBcm29mBs1rgxpq7chsYuY9
	 tOV+uz2CVkGrVilGgq9vPBfVEdVpNFxgHCBJWo1WmmkZvZkZ+Zxd7BykwaYCP/4pISdxV
	 ATseuQ8Y1DZlEMii+qSWtHOtsRHoczh6lEenIEdvdEXqzNpKkC+Ge8bbHqHO+Wlf+kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BuzY04aN;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=esWdhudF;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C6E606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:27:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3C6E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BuzY04aN;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=esWdhudF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795696062;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9cZzYu9JZHNy2GGOL3+wun6roAj3SViQk5bIR0UA5Sk=;
	b=BuzY04aNqJ8DjlZh/sunyE5JAN8qSV7rHZIYvceOiE/BgLSiQ4RapGubKH/fa9UQdCQxtM
	IBaeD8CosmolQ7olOfIfPE2VjPjX6dhhHaLiMIiLMkWb4G7UL45gcR05ENGXjySJn+mBNQ
	wEmuXbinbBgHnRS4D5Io3iUGPCHyW8w=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-443-ui1NXR8RNaiGyFUkfoUedg-1; Thu, 26 Nov 2026 12:27:40 +0000
X-MC-Unique: ui1NXR8RNaiGyFUkfoUedg-1
X-Mimecast-MFC-AGG-ID: ui1NXR8RNaiGyFUkfoUedg_1795696059
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48e0389d6f9so219505f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 04:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795696059; x=1796300859; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9cZzYu9JZHNy2GGOL3+wun6roAj3SViQk5bIR0UA5Sk=;
        b=esWdhudFfQsKS+tpfNRde2CWmMRuH7fqbrNvk8aC89n+TvncvSj82pqNBmHCooAThs
         fmcq1QhNQBUaX9mciAZ6JE0oHW9tLzqmTiKC0bXz8zsmnD3at7B9w8gizJU7bV/XgYat
         mQEJGlprrFCKNJ9rWDBiARQpsL7WncTQ59cOUAuxTUgampDGDiecHLbJghdBVPImbCYT
         1XKhDmUsWwmgxcbXiZr6JkGYWJnObu3l2DPR9V4biT+WjR4vWVl5KX5MmEHlXMblucpL
         ZErjEtlJdYFk1OHpbSyONjX/ul4WKAx7jT1v0sINg/RO/7QK9/+GqxpcJH+VUVFGxwkP
         RNZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795696059; x=1796300859;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9cZzYu9JZHNy2GGOL3+wun6roAj3SViQk5bIR0UA5Sk=;
        b=aH4UtBBDjtz8g8C+4RvXHUhHVr+VZQTebs+wKlZ5yjd+iw1hkiqR2pIONniTT34Zz6
         LmXCkB57Hja8AzMV8+k09DphID26ppcs1tTvaihPqnYbPub1tGCozxx/Gc3eS9sEP3M9
         IchaywTTJG/zH9UhNaHoPtV1rYxR4VW04Avnpygz2vO+QmKkIILA+1KR6IExb9fT/qUM
         rrAFZ+5FgodywVFi2x6XQDUNLEGG3QWksTwuBRQDImEd1SvFankvXYeltcSy5FBt7mUo
         4uCMPjPiXMlIQMgjn+PUGjhODafuIC+l1XWbVnkO6prdD2URcEE0jVthU3eP9xNMH80p
         I4GQ==
X-Forwarded-Encrypted: i=1; AL+hErH30jbEZ/b/+Xrf1+lGIMfp22YRfxoB5/gMeY8bzjyfVKYFO2sIb6JjkNn+CtgnyNmzXYAFR3ZIxsK/gzk=@vger.kernel.org
X-Gm-Message-State: APuU4Z934MkFA15+JCMgkrXKw8vFnUq2+wxOmy2E+XJLowSTpsobjHtc
	UAYty1DI/7whQb8f/crN2l3LkoDgU2qAVJCIwz8NZue+vxipb476TOyYbA+ye7F+FgHPa3dEQDO
	4Q1zAyb3KZucUdaynSZPB1bLXLOaOCvTjC5vS+1H3/rOTPWZz+I+wvCVOQKo9Ha3PruCz3xxfoQ
	==
X-Gm-Gg: AZFdTZdj7+qERvnYHk7kecWPJ0T+/sUIunvCSlTaWjK+jaKWEcwaoV3/YqTHY4ZDncB
	W4i8SovedlEJ9/mNJPFBLMOaXU61NcZiF4Wo7nZ/zNy+uYzsHHNHtd2kbt5OPUkRov63QTxS0nP
	OGCZR26Jc7+EJ2KDtZNvANW4ESxI8OPnv7nOjno6z2X1N4SSyAV62iQIAlGCsRERJZulnjuneBV
	nzm+HML1CuzAcb0ZzuBc2aCzVudbLY1UysB+o6kmf3pXijfZJrKQpFMiLgOfhObNjY28ZqCXZac
	0m2XPYjBz7Mfd4JuiUP753gJaxkBBE72TmpGWgdHQ/u5ROZrvNxwbmPsbWBrVWFuo4nMFP/g4QA
	rOriqo4OAiahjs29RGd0XkSmxc72G74CtQHywJzTx498hwVRDVmqFVmYjEWsHvl3pF2tbzRTrYE
	dSz2y0mA9YdMraFoKO6we7K+rVEVmvmui1Og8b6BPdRZuv
X-Received: by 2002:a05:600c:4514:b0:4bb:6823:3d3c with SMTP id 5b1f17b1804b1-4bb888169d0mr450260725e9.20.1795696059241;
        Thu, 26 Nov 2026 04:27:39 -0800 (PST)
X-Received: by 2002:a05:600c:4514:b0:4bb:6823:3d3c with SMTP id 5b1f17b1804b1-4bb888169d0mr450260195e9.20.1795696058841;
        Thu, 26 Nov 2026 04:27:38 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b3415763f7sm18432143f8f.9.2026.11.26.04.27.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 04:27:38 -0800 (PST)
Message-ID: <76fb5610-8a2d-4540-ba58-dd888e37e372@redhat.com>
Date: Thu, 26 Nov 2026 13:27:37 +0100
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
Subject: Re: [PATCH net-next v4 6/6] net: mvneta: serve the TX queues in
 weighted round robin
To: netdev-bot+sashiko@kernel.org, pepe.schlehofer@gmail.com
Cc: netdev@vger.kernel.org, marcin.s.wojtas@gmail.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 maxime.chevallier@bootlin.com, w@1wt.eu, linux-kernel@vger.kernel.org
References: <20261118093012.90121-7-pepe.schlehofer@gmail.com>
 <179530217537.3135.2864178231067849132@kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <179530217537.3135.2864178231067849132@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/22/26 00:02, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 0
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] Nothing in the driver confirms that the fix works on Armada
>    370/XP.
This looks like the only possibly relevant comment (the one on patch 2/6 looks
out-of-scope, and AFAICS the one raise on 4/6 is addressed in the next patch).

I think this is better handled as a follow-up is needed.

@Josef: please note that you should have addressed sashiko comments yourself.

/P

