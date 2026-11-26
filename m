Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795702718;
	b=3xNo2tSaMERZELc1oGEFmtb9C6ZwzCbMLealoM1o2oyIcM2CU4muGb0i8hlxpVnEnH9Q
	 T4sARITLX97Hw82bO0Ptey8VGi7lY1cLg9G+uXTJ9uUfhU614EYJIULVrX9yA7RKJSL8U
	 BECmcPt0AACVEmpR7HwwFRWLNx4fEAfpowrY/tm0sUl4fQJFNSACPoqgUmlarz1GDGPKX
	 hb439x3csudySPOpTHI0UKILAxBsPaNgFqlcZZ9rpHRZ9g5TgvWmi6GATH45fVOA9hE8I
	 uZCzwckpbepzgUR7bI31I+sakZOr2z4SJKCcSWz1IWFwGWhp6RZGnnD4MdevB0JeZAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702718;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Oc0e78R7GnTku6S9kDpVJbJPkJaWrIi7MbRLcQ86nNY=;
	b=XqnDLKUvgUA3ziafvnUtyRE6Li6H9iowVWlEC7sbtLRMrhOgwLyD82rWygMdQO06FXzq
	 yHaPcohjs9tiDLmbg29+46E4MuabxLGvy41ikir7yQsk+cw/G1WmCeGAUcHUIGqOAQ+2C
	 bep4g0PJCwKjuSkA+DwR7XgaMa6GJB2xYlykZRVA5cbKt7YhpYvmOVIqaR+geSES8V+A9
	 c/PsmcWQ6tfagkE5mAmYsmmLZ/BiEOxgpqIc3HiXgFd4PLrC2+9EVmf7fnidbR0xoCtA4
	 HqmH+Zn8VPwk7m/hjypO1b77Pm73nYD60iMpWUSgYRlY5Q4iMpVb1cuzvxrHxU6NJMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IQvQ+jx5;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Ys9EsDdr;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9F0606A327
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:18:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE9F0606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IQvQ+jx5;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Ys9EsDdr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795702717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Oc0e78R7GnTku6S9kDpVJbJPkJaWrIi7MbRLcQ86nNY=;
	b=IQvQ+jx506yOy/x4yvg8d6uOB9A6r/WEYX4lq96Ol2I6Rv/SlmUr6Y6RxajOMnSma/aAfd
	A9bsKYZHhHPRKwe1XRTSGD6XOfgn6zcqFI8wEOdhbakXxWiWRVjfreWXDApHhL6SGSdQP/
	xPyk3/mNX1NLhwjyKf3BrOTNQvAYLPU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-p7l7JIMfPQeeYntiAyUt_Q-1; Thu, 26 Nov 2026 14:18:35 +0000
X-MC-Unique: p7l7JIMfPQeeYntiAyUt_Q-1
X-Mimecast-MFC-AGG-ID: p7l7JIMfPQeeYntiAyUt_Q_1795702714
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49953abe51fso50231825e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795702714; x=1796307514; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oc0e78R7GnTku6S9kDpVJbJPkJaWrIi7MbRLcQ86nNY=;
        b=Ys9EsDdrD5piq4RdxKQVYvH3piYXoPWplyhnfpJP/rp7INiy9Y1Zejgy0SoGtg3E8U
         kGoPD4DrOd+KwEH1gEk1TjwU/AhH2OHPQGHemjMJxtRkV+rrn+k3+ldQLct8a2GssNwA
         NkbMJB4d7bt5+3k+FMgHuH7WF8bQmaSmJh/K3/ci9RvxSKWi5ixxyiDsdyK8pCy8e1Dt
         Xq0BRq+dHdYAoGuyqXng2A3bJ6bwlDCEjhfrVSJ5I7fnIltk/JRhHV4l1ZiRoVCruGx6
         q/28ZZxp/6pdwFDm7bTNqv/9NuQpf0DeMPXPt6qqA3Ckzam+a3BnZzkj8/1mcnpyNcNe
         Z6Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795702714; x=1796307514;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oc0e78R7GnTku6S9kDpVJbJPkJaWrIi7MbRLcQ86nNY=;
        b=s4u2fR+h2R+dt9GjBrTG/6BGzETLEUVaBZq0C1LznrZ9FreKJLEoiTGZTptfl30wUZ
         rtE4Axh8l9DYerQrB2MRURIqg8X1yojsx5f9ErfvtkOnuG88179Zw3ULTdeWhOIFSI+9
         33sQuCSvat5Y+G7V/qs+QTB+UokeP/jW52hIEiciQM1FpUeCm9WE1cyLVh4e/2/X5ZZG
         h/vOcBXz0g34Uow+qTh9kztJQj8HjlNjCAqcO2NHFIyYBoWynDhy8TvaDRxFFVG/77LV
         yu7EBNwcv2DzSMnZluaMQrvme9C/KzPwCFs6evGV7zs7vnCJ7adovPaIeW1vxTC2DNH1
         ATTg==
X-Forwarded-Encrypted: i=1; AL+hErFhNy0Guk97sCNKYoeXqcpijy9pfcvw6lf+Znn9hFk7Novbw636B76+llv0ZjzGHx+VR5FtNxKNTLaxybs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Uu8jT4kRFmNh75CRzPviKbMryL1MexXQGrSet610cHUALEO38
	3WD/ZkxtvVKLS7PKgVRe+wh19G7I5IO0T06Sw+ljyQMP3klgh54p4hwfXO2nlHFuUI/9iflzqcn
	pbdPvbQbN0V7Gc/9sCNmgifZK6GItpCBH1T9U0j/GwPj0nxI5PACsMsQMzmbCtihL8A==
X-Gm-Gg: AZFdTZfP2TnRk+Dw98TzbSfrWdPJFmkA9cHQKoXZfvLnHkfLuU0ZSNwojWN1rKTeoBV
	gC8rXQONgtIq3o9eXgczLH49gcXXG98G1C+btB4bYb4XcTOE3YIc34zaZ2ni5DpLIGS1qukngOw
	SqSc/TF2P3Ab4iht4QYEBb1tj7QznGbPanTcBTHo2lah5QPUNOvBPMAiEyHa9fagRmmKQMDhTGM
	2edDmLQdPSQp6wNlOpRMr9ZUXJNKmsQrSwoTynPVfHSKVBushiidsFP4dVtOjFuxsDv1YQNQjmv
	Q/4FR1pEFFxwnx0xBIbaT8WScGNy47V2izuHIiCqfLK3X7KmojLd1d/wxD7xNKdkuO3ncteCds1
	HbBmv/myrLugtyn7YhVnGGMhkWBYnjXy2rchcHCaPkQQS9A1GU4gPamkz+okxF3BWXRFROctwYf
	jFpmCt+2xdWdLmHHMzPhaRX93tTAQeRDd6+gyAjf/BxmYn
X-Received: by 2002:a05:600c:190d:b0:4ba:2bfc:c8b5 with SMTP id 5b1f17b1804b1-4bb888267aemr430554145e9.10.1795702714057;
        Thu, 26 Nov 2026 06:18:34 -0800 (PST)
X-Received: by 2002:a05:600c:190d:b0:4ba:2bfc:c8b5 with SMTP id 5b1f17b1804b1-4bb888267aemr430553595e9.10.1795702713623;
        Thu, 26 Nov 2026 06:18:33 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm1120826425e9.4.2026.11.26.06.18.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:18:33 -0800 (PST)
Message-ID: <14059088-7992-4d89-ac6c-1e6d1f61b3c8@redhat.com>
Date: Thu, 26 Nov 2026 15:18:31 +0100
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
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261118-skb_refcount_overflow-v1-4-5551b4954c3f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/26 09:32, David Hildenbrand (Arm) wrote:
> @@ -3299,14 +3311,14 @@ int skb_splice_bits(struct sk_buff *skb, struct sock *sk, unsigned int offset,
>   		.ops = &default_pipe_buf_ops,
>   		.spd_release = sock_spd_release,
>   	};
> -	int ret = 0;
> +	int ret;
>   
> -	__skb_splice_bits(skb, pipe, &offset, &tlen, &spd, sk);
> +	ret = __skb_splice_bits(skb, pipe, &offset, &tlen, &spd, sk);
>   
>   	if (spd.nr_pages)
> -		ret = splice_to_pipe(pipe, &spd);
> -
> -	return ret;
> +		return splice_to_pipe(pipe, &spd);
> +	/* Returning 0 would make callers report EOF. */
> +	return ret < 0 ? ret : 0;

AFAICS the above introduces a change of behavior:
caller with tlen==0 get 1 as return value, while they
used to get EOF. I think the return code from
`__skb_splice_bits` should be ignored, when not negative.

I think the churn here could be reduced re-using the `len`
ptr argument to store the error code; something alike the
(completely untested) following:

---
diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 85d5caa08887..9fd5116f33f3 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -3177,6 +3177,10 @@ static bool spd_fill_page(struct splice_pipe_desc *spd, struct page *page,
                 spd->partial[spd->nr_pages - 1].len += *len;
                 return false;
         }
+       if (!try_get_page(page)) {
+               *len = -EFAULT;
+               return true;
+       }
         get_page(page);
         spd->pages[spd->nr_pages] = page;
         spd->partial[spd->nr_pages].len = *len;
@@ -3299,6 +3303,8 @@ int skb_splice_bits(struct sk_buff *skb, struct sock *sk, unsigned int offset,
         int ret = 0;

         __skb_splice_bits(skb, pipe, &offset, &tlen, &spd, sk);
+       if (tlen < 0)
+               return tlen;

         if (spd.nr_pages)
                 ret = splice_to_pipe(pipe, &spd);
---

which is arguably ugly but IMHO no more than the tristate
return value in the current version.

Possibly some comment around __skb_splice_bits and/or
spd_fill_page() would make this option more palatable.

/P

