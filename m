Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795443947;
	b=kPPY5S2dYerEjktk19YZnWYn/+Yj5OALGGHnxjhpbmOq/QsnNqdDX/P23YTY1aQ3k5gx
	 WVgHFzjvlpeFFUU1r2i/9HJNbIwt61ZaaxYYS9Gzb4z358VPhNFJ2tVjSALouK5Ck+YtP
	 33DcWGOm2e0s/oI8zHUQKH0hNSGfmQWCy6PaeDJNWB81fi5MTii4jPD3jeliB0Z8WNoHI
	 +K8ZDUyXcM5l7cGtWTcyEzHmGcwc+MtF8P7CdS7OMwsvftcGr9gq8lFhM36WCnpAZ9QFW
	 fpSDJwV1NO6vtfdYJXXJCHX7li1OR/cUbIaI16BnCjnaiWH3OMZGOGnc6SRNDm2NZiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443947;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=//vDoMeDoG6qrEO4A9KSwEo9nf4mW8pFNbX/3y32fq4=;
	b=2FL7afJVYEq1zJE8Z+aV02wGJdYlcCjpJIboRp2J+O5UC+aMyUydUiGSaSUDh/LbW6TK
	 XlIyxS6OCNOWxb5S4mbmJmcK87EwMZzFduJllvRyzte01n2dJ2ekKTw0jJz6YCSgPsCUk
	 0Qll5nGpc5CQNV3/rIYi0z+hJBTL+6EZhcv/ostAGFLgJf65hiXwZTwm93HQBsQJKreJh
	 Xfu/b5Co20XaCPN36/3ZtV9QI32AV+mmUhvU0lR500DHip/ysu/RlOL/W+4sZ4OTipX+l
	 ad7UiBUGCFl2NG1b1IeTQqbAEr5m2QwUOg7Wo+4JNc7NcwPM+0kYtEIBom8oURnAqCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LgXvSsKl;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=EyCeo9KV;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9312A606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:25:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9312A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LgXvSsKl;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=EyCeo9KV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795443945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=//vDoMeDoG6qrEO4A9KSwEo9nf4mW8pFNbX/3y32fq4=;
	b=LgXvSsKlPakd7uYc27D7BnIE4UDFrHy1apvyc59uqVg2ei8HQ/bHLMtaf1GJOK48oltgO+
	inL/abcbVyXSJc4u1bwTDqVDpeTbqVxfzFH9PqLxzkKdbGFc/atEsMBSL/D/AwMWwrEIT9
	oatRVxCE8DNkt2uZ3f9bbbCXYCSXhq8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-Afx_ZUezMfuK555Dh4mKfQ-1; Mon, 23 Nov 2026 14:25:43 +0000
X-MC-Unique: Afx_ZUezMfuK555Dh4mKfQ-1
X-Mimecast-MFC-AGG-ID: Afx_ZUezMfuK555Dh4mKfQ_1795443942
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4901562b819so2446894f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795443942; x=1796048742; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=//vDoMeDoG6qrEO4A9KSwEo9nf4mW8pFNbX/3y32fq4=;
        b=EyCeo9KVSS1jJ8bnW9XNbLBiaXRazjmE+WmLAfyf0V+72j/WeGV9VkgW/NFdEoYDAv
         ORskZH889xizBAzTBpBE0oeXHTi7WK/HVKKAzqVLkMNS4SFAIjpkH5lQp2WUhOwcj6w2
         U+68g6SlVLmQQSVG1B/GNX3jmbrdCil4BWXCROKK7fpzfYPy7uMgdJe9GjrTbhzeeK/P
         p4RcEqUPgFtGzS/7Ria+0136rvsd06Bid2RFCswDyUcBQNRS4GWqMJ+lVxcipKuZwFzs
         jAUWWrXeqQysb19AeRl5dq1+VbBViLB6bZiEpAEq1sKBR+LFvPoI0QvRVzvOc23WlG0g
         8sDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443942; x=1796048742;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=//vDoMeDoG6qrEO4A9KSwEo9nf4mW8pFNbX/3y32fq4=;
        b=R4+czqy2FnUGBPhT9gWkJd3wZjB4xjaHPoxcAaJvOyD43KHyVFMf8aYil2Ybjmt89v
         4mSC64uuCqhk1hKARiRwblyDRHQAqqCSSmNthnuurlaaJrY8i2utmdG2JX4WpTwhILLx
         lXXxn5ygiJlfaJvY7jk3DnaGzgExtE4d0sPiZog5tq9/svfxXullZLp7jRPGOSj9oKvl
         St02iLzwET53IJTdN7cAcG78MaTluqNmJPoaNucV/OHzFKhKB4iFfFcV5Xz6N8OWKIKH
         56qIC8aa64k9efI2jzc4Ppsk+VQMriVAvV/8qI5okYpm4tgShozhszP4aHTl31rb8ucf
         Smcw==
X-Forwarded-Encrypted: i=1; AL+hErHiY2FZsr5t7cTn8ESHc0B5v0hW2nJE7Mti//Qw6eh/pnPbQKr6B9JEgKDJ4PALWoBhhGhm2qMEQ0O2CT0=@vger.kernel.org
X-Gm-Message-State: APuU4Z96d/B+uExEEe/1THsCNcvUmLC5crMQ4jcYJR5lZFXqn0Le84lp
	PW+6F7kSFLW4mNyOHP904ADrFV5qcx6GJQzam8/zQxsF7kBsi08JjoNr8kzjWikCD8vaXsgGcRU
	GxarPaf4a64H299RicRCIoU3xtZDf58qRr/PIZlQXwmA5mIxsPmGLzcTGJudJD3/0PZAC3oQSOg
	==
X-Gm-Gg: AZFdTZe31gefl8YmxOhvbgZxa6L1d3Mqj0kuB7tz7kfzdKUB+lB2wHC0jfioVCDSaRp
	ZgxwC2t/a7Jd/rrvvdj7q7yvvI8cOF74TzM2u3jrT81CmydwEskR+vgpWAVnVkVVCkcY5sqNRWw
	1I3zBAiwTtA2B7x1+1DLE0KKZRvJ9rE3iqiT7b3fEr7+R9o4xq5Y6Bb3L3Eyvt4fGizCUfD7VVN
	nNrp2TWofZJSuRLlmjHixbnZPk9jA3aBtI2RIjw8+Pud1i1WiJABPcp0/yomleIX4pxvyccGvly
	u605va37fZeuLyowiGV6TI2sky90I2fErd8hEnfzh4IZgAGkPNPAgld615t7eZBjNWEwd7H8rdT
	04h3aCJxVhQm6612xs+mNrsWayla16b0GFGVnKJqTzzmBxzEKoviWACo5bwkplA0k00F7kSqdD2
	nf/w6wWkEx2KJYfrsMknlw3Rg3sn243IsJxqGbfoRiYK5C
X-Received: by 2002:a05:6000:1a86:b0:4ad:d65:aaf9 with SMTP id ffacd0b85a97d-4ad0d65afa1mr22673182f8f.56.1795443941783;
        Mon, 23 Nov 2026 06:25:41 -0800 (PST)
X-Received: by 2002:a05:6000:1a86:b0:4ad:d65:aaf9 with SMTP id ffacd0b85a97d-4ad0d65afa1mr22673141f8f.56.1795443941433;
        Mon, 23 Nov 2026 06:25:41 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989b3sm22660754f8f.51.2026.11.23.06.25.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 06:25:41 -0800 (PST)
Message-ID: <e6811e96-20df-49fd-a5b9-d343047dbd7b@redhat.com>
Date: Mon, 23 Nov 2026 15:25:40 +0100
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
Subject: Re: [PATCH net] mctp: i3c: Fix potential thread leak on registration
 failure
To: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>,
 Jeremy Kerr <jk@codeconstruct.com.au>,
 Matt Johnston <matt@codeconstruct.com.au>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261117-571e631490-mctp-i3c-0@mail.sdu.edu.cn>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261117-571e631490-mctp-i3c-0@mail.sdu.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/17/26 15:48, Guangshuo Li wrote:
> mctp_register_netdev() can fail before netdev registration begins,
> leaving the TX thread and bus list entry allocated. The error path
> assumes ndo_uninit has already cleaned them up.
> 
> Always clean up on registration failure. Make bus cleanup idempotent
> because later registration failures can already have called ndo_uninit.
> 
> This issue was found by our static analysis tool under development.
> 
> Fixes: c8755b29b58e ("mctp i3c: MCTP I3C driver")
> Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
Issues in error paths in device init/shutdown existing since the
beginning don't qualify for 'net' target. Applying to net-next.

/P

