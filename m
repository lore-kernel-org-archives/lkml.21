Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795085383;
	b=ahSRtgFU1fThJ5xmRITBc+T/gShcVi5bZWb7+x32L9+W9kdtEiMmSut8LDFsQd26acKg
	 OpqDS3w+YqL/Ptke22dXy8TmdG4rUyaA4i8tnAnAl1v69eSOx2fwBPH8Ge6yeAI06yiSC
	 MrgxHuylYgcj48O4lEBPcm049viTJ4LjnW4vdQocasDS0OgO2auDlUgCq/7YkIfhOBMfC
	 s5S7UkjVKhZSNYuAMm0e3k3EwVrYEp3aZGjgrbLMShoO2qlIShvPzpQFyhWKDnE5AhkYD
	 5D/2PrsckPjcJfxE5xOK5Z/XQJ52JUuYW1M+9Jt2CDGuqOcHlpGIgTji67K19OAW0Ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795085383;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=gWmNjMP+sg8RHRMSC21HnjHiZEQ4hcvMIRHCqkIXFzg=;
	b=dIp0duY4qI8StJF1FE2BAB2Ar3bwPk5EKEMYFTr+zSG4XGAzWwvjJI4KmnbQyd0nak1c
	 IfVGTy5xJtqchKnLX+bIXxUrCiACkimDaeQFHrrjiuVTnVNK8r+Ak9JQAYUMsPQYCGP6R
	 8nTa88Sl8xDCrj3ljv1lULvc+Q9iywtjGBIElloIjzmOA+Or9KDYIraVVScDAsuqLlMnl
	 +wVgdsjJvR4JZQ7pnHjWbsd980SvbhrZtacADiG1PiRjfODADsSQ9gKijRRO9NT7piRWq
	 hx7UNQzW80upY68IXW4luYVtgWcTzqKk+1Fat4zBqTDk6n+p15TNyqo+hIpsfSnViAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fUOd06kj;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=qmnk73NJ;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9C2606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:49:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C9C2606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fUOd06kj;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=qmnk73NJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795085382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gWmNjMP+sg8RHRMSC21HnjHiZEQ4hcvMIRHCqkIXFzg=;
	b=fUOd06kjg7qrtuicS0LVJg2Ow8Bmf9m3unCxs7SNWL8GwRjLQ/OCWltPqymYAEAH2EKss1
	M8F3RLlUKOKpEGAuHzK+4o6Iq5Q0eWnE0dKdxmP+AwJKeaNFlwtaEUvwM7YwfGdHTLJeCO
	m7dnqRl/R2tWWvoB2u/JwcwZeaigS9k=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-211-hNqcDdMrNWeuaDYnetx3aA-1; Thu, 19 Nov 2026 05:49:40 -0500
X-MC-Unique: hNqcDdMrNWeuaDYnetx3aA-1
X-Mimecast-MFC-AGG-ID: hNqcDdMrNWeuaDYnetx3aA_1795085380
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4aae099f5baso31372f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 02:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795085379; x=1795690179; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gWmNjMP+sg8RHRMSC21HnjHiZEQ4hcvMIRHCqkIXFzg=;
        b=qmnk73NJf6DOljXpqtNoLk86T2PzOEnIK058W3W1xzhvZquEYIAHpITks+XchqOo7U
         mCmSg/1L6j/n86L1FFk6mHaUvD4VfNPyBgm5k4Ug+hkngyvs8Yhd+VpfND56l2i1Cbsz
         JAqFXr7bGfNjBch+jkUqTbQB+fIkvRTp15/4PJT/ThBAThYQz5vAZJfTEKy5XtQdv2w+
         FcsnsS5lkVJ2A/WvpXg4hZgtbdvpQvOEGumR7t351Ba9biN0pXe4SgHNw+p+ol1KpSVi
         3TdVGBQGOjJG/MySIIdFR3dtXLFVI1dHur+p6Rj23PRUDDx+DT6zVmMPqEEbyjxdos+j
         9B7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795085379; x=1795690179;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gWmNjMP+sg8RHRMSC21HnjHiZEQ4hcvMIRHCqkIXFzg=;
        b=f7DE6zS80gHO3Hgiou1ysbTeGvYj+rmeixhT55udY+N3rYkC2lj2nkBnwwna9xBC9y
         p9byjczxlUPAgkt/GjUUJNDXXCDZ1GUV8sGyBICzuatLBq5j0/INCFN5KfIjYD+YLl1A
         WIm0A5Rw2/ICfBZJvhMKMWwKbQMNYN/2RFtxQ+vwPAw3xw+IbB0wPhw9LlDhHqxhuB9K
         SthgWtyUPqndHAJOypP9WYpgW1+/9LTmAdtir9SwbqaA48SjL1AIWMoeJAM48SolVP5E
         eeiC9KRbkZhfy3KVypqlLASwei/TRIY0CgIIerSywWd909G35/KEuuQ9QXQpQVhPY0Iw
         7u0A==
X-Forwarded-Encrypted: i=1; AL+hErF3QjMSs4RNRjp2fX6EuNvO1/YqQTV0HAcX2djIXV3RgmiNPRkLjXOLFAaN7/U1LMU7P12zA/IAjGHAgmI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WchhDAn973gXmIBuuvXijw3pbyUKVSL1C7QumLgWa1LNk+QQC
	xxRGLeD7s9nOajdY5mKzc0nY0GUYQ8miT5F9XZ1ft2dpvE9toFmUFtvwBzZtzRytkmKHKjue90r
	0mcgJwHI0wRzy8Xbv0ZcxlVn+k2uGFwZPnB0aS+EgC5MS3fJBpHqAHJ9x/PfD12l39A==
X-Gm-Gg: AZFdTZeva7H9dKDeH7kYoDJZlmY65EBZ037gDF0uwu8yBGqrcpIUoP5U+Eh7mPqlF8o
	nOWgNav0ZKtHBuFpRL3X7BpXB9phrHQ9Z714MljxLr44kkThrcox/UsHWp1ks0RnZmPg46eL3JS
	OJthOc62roEbrQsXu8Ql4c8261uy8AMgcvQV7thjvooi/QEs/XKvAfYerI7n2R8z42Y9Dfpa2Ne
	mJ7dBspk5tcXZUStup8ZLiNTHTA7VMDLpD9X5pwwStZIn3Li6ZW1E09NEKJ2llBKxSqkdNZ4SRu
	5N6UTXK86rTuIhMx+NX/v/K11tlFRlUU/ZL92Z7VA/rvGDxtpCPyKE2qe/uVhaHk4bUTBExDm0C
	BzoqVj0ejYcPTKDnZYLlZqZEveTmzA8oqkLcRgoJQxaQvF3J3O6qdFkLOrVJJq+e+Qyc+DIjPl4
	SkD6EsEF3r1pd3o/QjSUltaPJ4Xxtp4bRxBcZy/45ltiMF
X-Received: by 2002:a05:6000:258a:b0:491:fd47:5df3 with SMTP id ffacd0b85a97d-4a6332bc8fcmr12141411f8f.7.1795085379523;
        Thu, 19 Nov 2026 02:49:39 -0800 (PST)
X-Received: by 2002:a05:6000:258a:b0:491:fd47:5df3 with SMTP id ffacd0b85a97d-4a6332bc8fcmr12141377f8f.7.1795085379181;
        Thu, 19 Nov 2026 02:49:39 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65560b2a1sm9587223f8f.32.2026.11.19.02.49.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 02:49:38 -0800 (PST)
Message-ID: <00d863db-2ca2-4d05-964b-ce742cd0740f@redhat.com>
Date: Thu, 19 Nov 2026 11:49:37 +0100
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
Subject: Re: [PATCH net 1/2] veth: wake a stopped peer txq beyond
 real_num_tx_queues
To: Simon Schippers <simon.schippers@tu-dortmund.de>,
 Tianyi Gao <tianyi@cloudflare.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Toshiaki Makita <toshiaki.makita1@gmail.com>,
 =?UTF-8?Q?Jonas_K=C3=B6ppeler?= <j.koeppeler@tu-berlin.de>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Stanislav Fomichev <sdf@fomichev.me>, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-team@cloudflare.com, tianyi.gao@linux.dev
References: <20261113104648.225983-1-simon.schippers@tu-dortmund.de>
 <20261113104648.225983-2-simon.schippers@tu-dortmund.de>
 <20261117181607.30219-1-tianyi@cloudflare.com>
 <ab31c0a9-8e3a-4c24-9570-7baf91c22288@tu-dortmund.de>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <ab31c0a9-8e3a-4c24-9570-7baf91c22288@tu-dortmund.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/17/26 19:53, Simon Schippers wrote:
> On 11/17/26 19:16, Tianyi Gao wrote:
>> On Fri, Nov 13, 2026 at 11:46:47AM +0100, Simon Schippers wrote:
>>> Fixes: dc82a33297fc ("veth: apply qdisc backpressure on full ptr_ring to reduce TX drops")
>>
>> I agree with Sashiko on the Fixes tag.
>>
>> I have reproduced the stall with your script (stuck after 2 cycles) and
>> confirmed this patch fixes it (all 30 cycles pass).
>> It is tested with veth from net at 5e9b2ad9b838, as a module on an arm64
>> VM with 8 vCPUs.
>>
>> Reviewed-by: Tianyi Gao <tianyi@cloudflare.com>
>> Tested-by: Tianyi Gao <tianyi@cloudflare.com>
>>
>> Cheers,
>> Tianyi
> 
> Hi, thanks for your testing!
> 
> Yes, I should have referenced the other commit, will post a v2
> if requested :)
Not needed: I'll update the tag while applying the patches.

/P

