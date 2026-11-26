Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795710715;
	b=JctyqRofaH7SL1bBEhmMk84MfeUh1eG65QNQGU2orFWYNpx7UuPOyORWcxmQcnMiJfhf
	 qLjIBPGt2FSNYVyXvCihyJps+sUHSNMQTuOOGfDxSdWTY7PMWVlmraPj0cujyO0zuosL+
	 gNzLLkz0S/jzXv15ZvKK3RLQojals3NLUDSV8m3dg0u9uVEgcsSiiFV9FhP8YDYN8gBfo
	 gK9f5s61hHBlWlYQWhMUoRIup4v5TR6mD8T9XBmJlJ6ainw3ec9Nab/pPyUf6IjYc+Wbz
	 t+A7Qvu2D4ind2wxELqqz3+3fsZJk0SWYgCpqhXV6qrHrHVK8qbGKDa53jOnZyyWFRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710715;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=t9zuf6AtiZX3yOJGNCRqBvoPw6Ll8AmPwZKNUXFPImg=;
	b=hJmpqT2USQIp5C8livBNzwPvRKv0tUtYB8KkOPEOAZ63wJeX/dcSAfsVfkLP5ZYCpXOe
	 Mnn6D1qYhtYzF8tuIqumd3fOqDFDCP8aQ3h1Vo/6khwdHPgH4mg8+OhjLqoAt1m8vP4eV
	 g/soTbf4QFDHi5GB/h8/MY9+qiZ8q6gsA7e+eEnsKMDfObB68H8WC+jg3WmzAHGbmlGF9
	 lVhycOO3Tj1c9yVuAZwrH2wvU+qu5jpb/XqJlx+lj535FjulwtiG+f0JzcmDa1WQZCP/I
	 NrO41CLzZLIv8MV49/bwczqkdYAAqvuGasAEGxssdNbH0GlBQCg1xmmdcaByFM9FsFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=POqSR4uA;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="slA4/mwR";
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B140606A68F
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:31:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B140606A68F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=POqSR4uA;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=slA4/mwR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795710714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t9zuf6AtiZX3yOJGNCRqBvoPw6Ll8AmPwZKNUXFPImg=;
	b=POqSR4uAcDxXpmxSNPRQ1hz3U4QYC8bybUIMt/Yz0Mqxh66CQuV4CnfM5IFuExdrtvNIjh
	Rj9eZtAl1uQEXkNbi9yVs003xHBRiruE0DMrwHdxmBRJ1ej5VeArwcbmED79PrXIJa0sxG
	23gSOfl/YPJIpZU/IRTYuSIA39Nhkvw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-131-kk7N2qCuMKKbdfyAfVSXng-1; Thu, 26 Nov 2026 16:31:50 +0000
X-MC-Unique: kk7N2qCuMKKbdfyAfVSXng-1
X-Mimecast-MFC-AGG-ID: kk7N2qCuMKKbdfyAfVSXng_1795710709
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4bb8ae35aeaso60225585e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795710709; x=1796315509; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t9zuf6AtiZX3yOJGNCRqBvoPw6Ll8AmPwZKNUXFPImg=;
        b=slA4/mwRHgGh6eC4qPsg3ma9GBSUsqK+U3eisX/eHTTzuMe9UVW34SAZb2WQ4xwtDW
         +eTlg4zzIEYgRhWv10nWv5x5T3JlI6QddpVrTkOJObIGF+K8LKMBDO7cnu3dPDJtPhQL
         CZDUM2f0Iqxbpm2t6bylh2m331ykHT4Tqcmalk8GGBX/6ci0bI2FsiobISE1FCnytjJ3
         ke1KQ10Q0OcxmAeL15nzspqgR4H+nY7OJmLIzmxbISwCUYA7foftptOIg9PyYcgafjz+
         ozgEUJybOvgv250riBScj739LMHu9Tdm0zKV/z4jwY2nVJg/f1dzlcFk+PO2ga8zC1W8
         wouA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795710709; x=1796315509;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t9zuf6AtiZX3yOJGNCRqBvoPw6Ll8AmPwZKNUXFPImg=;
        b=YhTcqDCzqh77bWz45tY/+cMt0pZxH1INCcdPvcUdAdjpcTGEZgerohppj691hmZQrH
         oPIkQuAPvwNnq2X3o04Y6MCvokALaJ89pMGQIgLb/qUFDaKyvkCRmBD/IB+L6DyAvMSC
         k9f35y+CMvJgiQDCVO7+QbgU6BvbvTqoehKbZ2KaK2I0zN46Wn7T1axVdznyoFp+pWTD
         6q2qvfk5J1BqpAsExRl/xkfG/z2kM22oxM363IRu+Vg9H7mbu/dlXAp8iYPTKABRbdmB
         slAhsT9GGBZyxLZBTNLVZbFgzXfZRWmLwCR0x4RJvsok2v46nyxQ7aXwAjPG0ZUs4Yww
         EV3A==
X-Forwarded-Encrypted: i=1; AL+hErE14jmlAhrpn+fESyGZ/GjhM56Ga0U+TtyaqbFyvrL3ZonWOvzlvZX9uFn3mKhKGO/CSjK8Eun5GeKC2pw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+REuB6zXvkehC4smUo1RII48cr5SFealULp7t87puOM9ZXp+wT
	3z3Q/6/Q5tIAPHOiCHd1Vq+XLdwZf4HANb8OmP4pW0+Q5p3e3kJdRtYi4/L6hwZBhKY7RWpmll+
	rvBkCUs6hxrYokP/qwHF/ozHRi3uvQnDv7uGHmVkSAadDqD4brMDcl4fot9ANRj0Bjw==
X-Gm-Gg: AZFdTZfOu2tWvb8X0ZrSReSqa+HetnXc9oJc6aNZaAGOQVQoGxwkarOs6eySYYkFzr2
	kcFU9BfIl3/BirRfYjlY1O9HGEI0GQP6Xf11oelcdr+jVuRh+xoh5j6SvWvD++8FDR/QtBy9hAD
	Ash6435AnUiozQl0PVMgaC94FbMRxXyggDoCUzFNw0T0UveJbPxO4UqW3IqRccTMuWSU6vKcwEM
	U6ALhBvBoYPIvEx7+8wtUqGdwQ2reKgy+6QcgG6RZum4YRuYVo3t1jiPYG3Mgd+9mWn8hBtzZ0C
	K7MKSqP8tvs5kioLpRautFoTqzT1zVndrDEPkJM4dOqtLHRffF8pctJP4GvyC1OQEgJt9BAdTit
	kORcZUG4F0uIjf4b4Mx+JUIL48o1vTcJ4SCZU7ghNRjp6fzsJhO2gxyFhK/1va5HI5iI5laYE09
	yoGG7rGzZQ60c4wG1ZvWExHVkO1nZlXXs4OQ1Igktklwcb
X-Received: by 2002:a05:600c:6749:b0:4a2:1867:10e8 with SMTP id 5b1f17b1804b1-4bb8881a294mr421918795e9.25.1795710709181;
        Thu, 26 Nov 2026 08:31:49 -0800 (PST)
X-Received: by 2002:a05:600c:6749:b0:4a2:1867:10e8 with SMTP id 5b1f17b1804b1-4bb8881a294mr421918405e9.25.1795710708737;
        Thu, 26 Nov 2026 08:31:48 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b8b7888sm41448852f8f.42.2026.11.26.08.31.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 08:31:48 -0800 (PST)
Message-ID: <72ec342e-18a9-4b40-ac3b-a20e4e9608a6@redhat.com>
Date: Thu, 26 Nov 2026 17:31:46 +0100
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
Subject: Re: [PATCH net 4/4] net: skbuff: limit folio refcount when splicing
 from sockets
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Kiryl Shutsemau <kas@kernel.org>,
 Song Liu <songliubraving@fb.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Rik van Riel <riel@surriel.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>,
 Pedro Falcato <pfalcato@suse.de>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 stable@vger.kernel.org
References: <20261118-skb_refcount_overflow-v1-0-5551b4954c3f@kernel.org>
 <20261118-skb_refcount_overflow-v1-4-5551b4954c3f@kernel.org>
 <14059088-7992-4d89-ac6c-1e6d1f61b3c8@redhat.com>
 <832f42a7-1d44-4138-a7f5-7cead4a28e57@kernel.org>
 <bcbb57bd-6447-4faa-a56c-9bdf1c7bc90a@redhat.com>
 <b36f40f0-3f9c-4ba6-8c1c-a76f99623944@kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <b36f40f0-3f9c-4ba6-8c1c-a76f99623944@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/26/26 17:12, David Hildenbrand (Arm) wrote:
> On 11/26/26 17:10, Paolo Abeni wrote:
>> I actually prefer what you suggest here more than the current patch.
>> I suspect Willem may have some other option avail, but he will
>> not back for a few days.
> 
> Okay, just let me now whenever you want a resend with the proposed changes. I
> tested them a bit and they seem to get the job done as well.
Please, go ahead.

Thanks,

Paolo

