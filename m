Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605946;
	b=wnH8XwaiTzG2XzigHDAb8/bor5fB8G4VCKoeHLkIL/RWbZgyyNWE7tvr7QeDSic9m3sT
	 U8iigx2nAwWEdt6GZOSukGYWztUpvLfphziRVg9St7Toa+JsFxNn3zPY+UX9fvc3vpbY3
	 VYWRIS54ph/I5F2Q3kjob6subnY8lU/tMaiZvHXfA1OVn2g6pHMdFY4KbFK8l2gm7QxcO
	 u3OmqUTdGq2Xy2k1i7FIPeAsMx5bRPZVOZRCXjMPndZwMPQCwqOAU410twS8oCFupem7A
	 mnErJ3aOnmbt2B6Qa/6v6JIQkbQmGkQXHqYGTWoIaIwJgro+ta+dHzu4sMqMjZBi22w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605946;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=+rO3vOAJomjUcFEeYUN+30ZNzkmZMhsVCFDnpuFvzyw=;
	b=vOX1Q8SBEXOvMgo2fdh/N8akJJpe1AO0A0thBq20U/RvBbDJDEKDoVBe34Cjvpz1lRTr
	 E7kzWTP3xCOj84bjKEefrhiRxdJ3kBFSBujQl+fp5KxFV8bg8YZzBce4ApBMgA546BVwR
	 QZogQTHpYvSL4A45PMXuWiLL37cuOGn8le0rPjhoc2/CxdQHXh4+7kj/XEVsHheIwnH28
	 I9m4Il+3tPMlJC7bMP2/9TLR2MHAWe3ezaDp9dvEzohrGxbjRC3So58BmiFJEg1JptCNM
	 /i3fD7cnKuWZrjOl0ubCsDURy2BS0vIkJnSgHMTZnaFw1j5dZ3tN07md1uPB2axZhBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MtBBo8eP;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=E4+SJoWw;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE02606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:25:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AE02606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MtBBo8eP;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=E4+SJoWw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795605944;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+rO3vOAJomjUcFEeYUN+30ZNzkmZMhsVCFDnpuFvzyw=;
	b=MtBBo8eP9BTXmtJsApUkZYAINKBzRCR9lyKb0sefbpNyAN8Lmcsh4UN33qPsJ5/LygaJrw
	cjLaITNG9EalxQrgcCUQQIWQcS7YxIl63PwE229uIYPTszvS7Myk61ebUKVnlQaqCVkKg0
	8kKu+w4auaqvCBSMQFDC9O/J1hgJYbg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-351-l0sJUlUWND-WYRrJIhwpNQ-1; Wed, 25 Nov 2026 11:25:43 +0000
X-MC-Unique: l0sJUlUWND-WYRrJIhwpNQ-1
X-Mimecast-MFC-AGG-ID: l0sJUlUWND-WYRrJIhwpNQ_1795605942
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4bb69d84053so40518175e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795605942; x=1796210742; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+rO3vOAJomjUcFEeYUN+30ZNzkmZMhsVCFDnpuFvzyw=;
        b=E4+SJoWwJoh6vbZ5OXT2i285j++lIr9qKa+10+9JtvuG9+Yl2Xv3FYNL3n9MNbAE29
         UARhIn/pQKjSPyHKQTjb2X8FYbO3d0epxtF51tfhw7IgfsabZzC1QllWo9bDUJocj5eB
         MpfePXjuq6EMjPz4lLaoDbA5PyDcQhyIDeTFQg7ik40QqZu7J8bmQyslISq49A6uHrp9
         v6D/6OGFJCDDnHuZgpK57ua0fo6Bp+XssdcNz/uTKqRLVARGw5V7PHb4cnPgEz3Q25km
         K1FK44qUxtwGModu4nnRjDkI29MAahmBUnklnlge+l3hKitezAd0OVSNONzD6Kpf1DZm
         7f8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605942; x=1796210742;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+rO3vOAJomjUcFEeYUN+30ZNzkmZMhsVCFDnpuFvzyw=;
        b=RfH9jmzATZUmnx2YlChBlbOGEN7QFtWdJjxtFea2BgzHGloV5pB2w1FUv5GILiVQnF
         Fnjsg+VWznWaWzk3Ge+z/qONv2LjuSuWLw2MCF8gyVVq/87mcp6lzVw5N3Y0QxtVh903
         qA9d8qv0bd7BiNW267OU/SxVO7UcPxqWnugVe2SKkkgP/Sy8GObdnK3sm5qFp9pP+U7V
         Yf0C04vTmAWJHczpzrF78zVfV/4x59KIzIw1aTgkom9yGaFx7pBW6cnmbosYTFZuAQbt
         GQpjW1gp7TOwnOyho9mKRQ1mnd6czhbEr7Xx3zQiZhXFDIXQSDX5x7SMorh58zL7mfPR
         H29g==
X-Forwarded-Encrypted: i=1; AL+hErEJpJ6U+0iOKW092g3bhRG0zWrkWciCcqOH99mctKhydmE0btl9I1+GDDyVXb8p9IpcYY7uiZ+fhARsfgU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+ZpKI0jnZJEQVbJk/jyIK9XEoYg15dG9IztE0O7Dx/f1lNqTY
	S9IYqX3wtBzhZcuCx69Ce91sJslQE9sAU9rnGT+NXKpl+BQk8AveQnwWEWOifwQSOVtfr96BJd8
	g/iaXoifoclF3hLX22yGZh6roGJTzBsNgtfjx7ro3rJ6IrZudbj8FvQ2+zp0mgvcDPw==
X-Gm-Gg: AZFdTZfLTvr1xZTrroIknUzx/2kdmr4RSPSOjxU7fPK9Y62t0QQw7h5Hq+HlOU/zfw2
	3agHtSQNieJg1LkwxWEOdIwGTTtntzsHcfuNZnN0r1b6FvXeKKJKRqR5sihPwutHSvmswuY2BP3
	OzARz5ytT4jvSQ/GTI8e8uEaZdfN9k6Kk16gU2UTPBFG7oSDslOwdKJjd3tX2HMa5cgh+gYqea4
	5NerlH0JhUSYe/WyoFqTXaZJidnCKXrFauacffP/BApbr/dXQL41ah9m5Iq0oErAgz+eP/mEn86
	h2cOsC/kwwjlx1hWJK1oyEeos0JuasIMVBEa++/NVD+r5+be/XRYyyaylqqVVE9BlORQleu+3eO
	KUGLcCAZnJ/35KejT64Vf7gW3DC6MN2u2lV8QUtaK2BhwX400qLGLlbKQTxy8wyOSK+RFif3W3A
	IREvnMiJbHCnq28bYw6rBHUrZLPivAYblN3TNCZ1NAY5e3
X-Received: by 2002:a05:600c:3ba3:b0:4bb:6118:4c9a with SMTP id 5b1f17b1804b1-4bb88819940mr408781905e9.30.1795605941967;
        Wed, 25 Nov 2026 03:25:41 -0800 (PST)
X-Received: by 2002:a05:600c:3ba3:b0:4bb:6118:4c9a with SMTP id 5b1f17b1804b1-4bb88819940mr408781405e9.30.1795605941527;
        Wed, 25 Nov 2026 03:25:41 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906d6a13sm274230175e9.3.2026.11.25.03.25.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 03:25:41 -0800 (PST)
Message-ID: <4ca5dd8c-ef36-4b5a-9f9e-223c2a29e39d@redhat.com>
Date: Wed, 25 Nov 2026 12:25:39 +0100
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
Subject: Re: [PATCH net] bnxt_en: Fix auxiliary device leak on early probe
 failures
To: Simon Horman <horms@kernel.org>, netdev-bot+sashiko@kernel.org
Cc: lcy8047@gmail.com, michael.chan@broadcom.com, pavan.chebbi@broadcom.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, vikas.gupta@broadcom.com, andrew.gospodarek@broadcom.com,
 jacob.e.keller@intel.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261118050716.3873167-1-lcy8047@gmail.com>
 <179515123717.3136.1891710789877841672@kernel.org>
 <20261123165340.GH31322@horms.kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261123165340.GH31322@horms.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/23/26 17:53, Simon Horman wrote:
> On Fri, Nov 20, 2026 at 05:07:17AM +0000, netdev-bot+sashiko@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 3 potential
>> issue(s) to consider.
>>
>> Critical: 0 · High: 0 · Medium: 2 · Low: 1
>>
>> If you believe none of the issues are legitimate, please reply to each
>> issue of Medium severity or higher and explain why the AI is wrong.
>> If any of them are legitimate and you plan to respin, please let patchwork
>> know by including "pw-bot: cr" as a separate line at the end of your reply
>> (one such reply per series is enough).
>>
>> - [Medium] In bnxt_init_one()
>>    (drivers/net/ethernet/broadcom/bnxt/bnxt.c), a bnxt_pf_wq allocation…
>> - [Medium] bnxt_en: skipped bnxt_clear_int_mode() on bnxt_pf_wq error in
>>    bnxt_init_one()
> 
> The two issues above appear to be the same issue.  It does seem to be a
> real leak, similar to the one addressed by the patch under review. Yet
> strictly speaking different.
> 
> I'm indifferent as to weather it's fixed in a revised version of this patch
> or as a follow-up.
I think it's better to address the above remarks in a new version of this
patch, since it's going to touch the same code.

/P

