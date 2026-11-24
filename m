Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795512664;
	b=u4xBrwxG0sYWoOE5D5LuE6nQDTL4PfWYRvFoYOl9DvqsEc2hGUU7pjYVPNKuxQU2iu1M
	 uMGUMj68akvn9b4JovnIBs6B/Fkjs3aqGa7rjVP8McqjHyCTQ30d0eX3QUmCDm+YAz9lM
	 9UXVU92+AiZgKja0aWXS0HOv20jRut+myD1VcKnl46xTPSoRRLaPRZ03cv5EykRWyEAdU
	 MgLGoWzNoyBurMcMVw8QEEPE5oOcDY4AfxpQL0bIRUP2LwZKYk4F/nTG11OO6YARhKm4p
	 HQfOcOYM/tZjQXGr/CwIsV2Y001okuKqymqB9SKwyDgJYkeHC/JF0vwpe/6VaQ72hbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795512664;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=p8/AOUE2k2Bi5Zz6s9PwthDlESwQmQ8r07ZNdj5Rp/Y=;
	b=3f15KQXacxPvQTHBflEC2vxQy17aRKinY8XfN19Olj0d7m2B5kEu6+g77mrFF6POw+RY
	 YS6guoF0wNZG0I8fOXs/LPcAg+qoPau6cDup6S1jKjncwS+7niOv4EL5T1gB/TP41oohI
	 vso3vj2N3FFQexQ7nley4cz8+G3xM0Hxi+4kkjh0K4nnnYz/orIJICr8LHz1MaanA9tyF
	 qqBE8FY4Vyib29LZ2a1Timr3Qm4yvmN/Ru9pKxIE+r0J00s0Q1k2VdW6GFy5aEdQ0ABZP
	 JTWMWKOb2i4BphnuskXoCzIR8saV7JjhMq3LY3sdbcs5DnzUNxfKIkhZpD8uARjaMTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=R6cJImOJ;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=g5nEKchU;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF50606A322
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:31:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFF50606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=R6cJImOJ;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=g5nEKchU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795512662;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p8/AOUE2k2Bi5Zz6s9PwthDlESwQmQ8r07ZNdj5Rp/Y=;
	b=R6cJImOJB+IoR3b/ucpRDv0/uEqRTg/RPP52/pcTTYJ/Za5FYsiM57SBXsDwrW2qYI1grj
	006Hh/yU2vxqGvU/jDibFQ/PraLAfR+NSmYIeo54oNKo0aLDfFFd8ueSSfB/dMBXcOe5Cd
	lyt0ZryLGQvHcxItOnSfojXQf50y7Hs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-687-xheq7fItPcG0BFRiwxmKUw-1; Tue, 24 Nov 2026 09:31:00 +0000
X-MC-Unique: xheq7fItPcG0BFRiwxmKUw-1
X-Mimecast-MFC-AGG-ID: xheq7fItPcG0BFRiwxmKUw_1795512659
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48e4d1e29f3so3627182f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795512659; x=1796117459; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p8/AOUE2k2Bi5Zz6s9PwthDlESwQmQ8r07ZNdj5Rp/Y=;
        b=g5nEKchUY/sgW+6GB07azuSey4SHZ/7OiYBQtrAtPPazqHviffbCL9I4dUVBMmShfZ
         ysnYJ2BJE9jkGLeDEJ4gVOfq0WbXbWIm+XKSzJvDy0Xzj0QZPdcTMRE7D3+08SakR0/p
         XVQmzgTRp1Sw+ZTpYjFKZDVo/xAwTbun179/ovaw6e/Ef9cMRJ9h6eRfjUQSox31vZ2U
         dj3RLGQg2eTVmWYw679NMiKbFinOs0l8FoFPW2QecDjLv2mOzl5ZY1rwid45YMMZrIkj
         uO+Ckms9Ne1VOhNGOom8ahI3K+lAVL4OlsGWyMryKHUU6VA5SlUkx/pA3pLDlRoNe63W
         OHlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795512659; x=1796117459;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p8/AOUE2k2Bi5Zz6s9PwthDlESwQmQ8r07ZNdj5Rp/Y=;
        b=bnElMst5ZOhz9grYlI3O681JqT52ywHo0/h2xAqOqwo7ndMFOIjFqcwdNuqUPH7VnZ
         GF8bGB7A8cuRvn8A1wPssmuIOLj5zv6ZIGFmX7h4vkGmzadyO5RAdZ1eZj4PXqF6z8A5
         Tv316vCngiKdu3JWufYM6vt9I3lJ5CMybQqn+Omexz+sx7lvCIWkLsGqGtl/DPXoiR9H
         A5Jl+uuYOumaTha7ov+EtA5BCR7fZY0hrjW9TxCuN2A+foKbsIkYPYNpWPyFfT+9vMF7
         k1kZAjPilmEpru5O2fYPOWyl3bozt5HaL5UngSdDvnzazVeDO5WAjZ0v1W6+K33+KyjT
         SHjQ==
X-Forwarded-Encrypted: i=1; AL+hErG6CMxsztCKOt2XHH1UheqebTF5noHZlefAyVJuNfnQhsxh3KDbWkKwoZf5b7BLc200YzkcPRcThupEWn8=@vger.kernel.org
X-Gm-Message-State: APuU4Z82IGvuelg+3/1U3KCdV3YA1HbVG/fvf/vNHGDQaHAHUnjrpMoJ
	4OfDemHFi2aKuamZV6kcccHkAmf63o2VxXYvOOFsOiy2tQOW25+knHkxm+4y1xFNhsun+a/VROV
	Os9YmwzaS7V9RNW0bGgC8BInmK620AT7bgt+PVURuOdccmOO4mHp40lyHBSVBQZpFAw==
X-Gm-Gg: AZFdTZdIxKqhjNU1GZ4nYjLLunGXW+xbo+dFFFWM6EmRgG2b+AVPi8P9pnFRwNufBEF
	sTAogyBEsM9wLbFA1Ig8wcBNjbf+B1KoHmMyEv8/Q0dtXgzAmQNJwj1RZkINnschY8V7nAChtb9
	HuqjrL7G8QCZzlhX29FTKxRgGKZ8+49OEWx2lDiHHQ9/P34hcPMtiR3Rpu/Fx5LssiB57p5YXZ7
	/JOJTX0t2nVlp9F60sGdngHb8LN8to4gCz0QlRdWIM24wYCUcMxkI+RmpnTyLiFcMpXJRTYo2hW
	TX2+0kgXhhQJO9b5uhjrMoWDG5lrXXKWnCtZgQesP/V80RtpNKI9/BVV06SG/y6IAXZhzOPKr1X
	zt7RO5EDlOJJvI+xOnFdOD+7yT5tiJq1FbKUXn87SJm+087KWN1oc5CeHCOVaCE2hB1zMmZBKA7
	jHQ8fg00RbufOdILUbtiSqZSBcFAps/Pz8dFLpsjm6+fQW
X-Received: by 2002:a05:6000:2c05:b0:4a9:df02:6040 with SMTP id ffacd0b85a97d-4abaac57bf5mr26381696f8f.3.1795512659250;
        Tue, 24 Nov 2026 01:30:59 -0800 (PST)
X-Received: by 2002:a05:6000:2c05:b0:4a9:df02:6040 with SMTP id ffacd0b85a97d-4abaac57bf5mr26381657f8f.3.1795512658831;
        Tue, 24 Nov 2026 01:30:58 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf61e8sm28289277f8f.11.2026.11.24.01.30.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 01:30:58 -0800 (PST)
Message-ID: <95d49bf8-21b3-4ea4-961c-d5a229995829@redhat.com>
Date: Tue, 24 Nov 2026 10:30:57 +0100
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
Subject: Re: [PATCH net-next v2 0/5] net/mlx4: TX helpers and deferred
 doorbell fix
To: tariqt@nvidia.com
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, horms@kernel.org, linux-kernel@vger.kernel.org,
 daniel.machon@microchip.com, Jakub Kicinski <kuba@kernel.org>,
 Joe Damato <joe@dama.to>
References: <20261117155353.2250540-1-joe@dama.to>
 <179493106742.3291.11434436383058043225@kernel.org>
 <avyELebAXqr4y1Yi@devvm20253.cco0.facebook.com>
 <20261119143852.3bca9000@kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261119143852.3bca9000@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/26 23:38, Jakub Kicinski wrote:
> On Tue, 17 Nov 2026 08:43:25 -0800 Joe Damato wrote:
>> The only fix in this series is the deferred doorbell flush (patch 5), but I
>> need the other code (patches 1-4) for SW USO support I plan to submit next
>> if this series is applied.
> 
> Not sure if this is what you meant but this may read as if you were
> sending a fix for net-next for convenience of sending more patches.
> To be clear - that's not a valid excuse. That said, here, we're talking
> about a 10 year old error path bug which nobody apparently have been
> bothered by. We don't have space in net for such things at this point
> of the cycle, anyway :S
> 
> Tariq, could you ack?

This is small and clean. @Tariq, any special reason to skip this?

I think we are better off with this merged; if nobody complain I'm
going to merge it soon.

Thanks,

Paolo

