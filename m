Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.201
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795191673;
	b=IIXYHMQ7+ekQqn+On6EZuYOtTvN17LwtKs617o+koZQfFSOs01aGnh4c7ZUUI2Ufnee7
	 bm7e1jBfkVTzAphl180A37OH8Qp7faC0yiJvudVsuhzdanwabcBwSiQw1p54DDH9NOUMH
	 vc7ngm9BvEJi3Qi4ZwmdEb4NUMNeXDrmXiXgAphWcHLoU7aqWEtgFEqLMdgwL9F4ubLU2
	 W3+UkTk+JR1158420M3hH8kITOqwakdBH1qnBHP++zZQd3uM5q0ZeZT9mU5CwOKpcOtiS
	 QIK8koyYVo4w7pqleCAtVHcm33L7jMlr+/d2EnnmVhxG3qihuuGhMSh7B5/+wad2PiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795191673;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=DlHp18CPjbRy2dBjwYmV0o13g/8Est+vNGExs52wGVI=;
	b=gJEmuyZkf1h5ggz7wbOgD9onCkEmvqcqxvbyMmEb3dwuOOzQSweCSi2WD5B6WGDVa4hd
	 AC1UbvKhlK4NzmXXdDo8CCvebwnXAH3OJQHxzAo9/UDYDbl0tTSbgCIwoqE0U2GGdW3xg
	 xpg3eqU4frOzyVG3G4EBAjWG7uTPuNdCUyP09R35LP+pS0OjJSyjjdMO7YpkV1ij76RuM
	 Hab/JMxvJZsq/G65ShW4iUsZGxRq5xk8wSAj6Ebe5wo9TWzBV/ZN8jBZefd4k0IoMi8jV
	 kWwOEkhBzg4xSWVxylTiDW82+/7X4esMxWKVvMtHfya0SFFPTFgKglW029wA2fHJI+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QFIMvXBw;
	arc=none smtp.remote-ip=74.125.227.201
Received: from mail-pi2-f9.google.com (mail-pi2-f9.google.com [74.125.227.201])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7BB606A330
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:21:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC7BB606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QFIMvXBw
Received: by mail-pi2-f9.google.com with SMTP id 41be03b00d2f7-cdd9779aac8so181900a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795191672; x=1795796472; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DlHp18CPjbRy2dBjwYmV0o13g/8Est+vNGExs52wGVI=;
        b=QFIMvXBwT5UZma+RH3dkZsdOYQvdRV5lMg2aPbcMemqkf8Dupdo41EKmwIjAfGV4QA
         Rp/STC14Fr5kxpZn+8zkLj31m1bjMjxlpVWu5+0//Z8eCJbmEBx3iIRpFCCMESlrrf9Q
         74BR4tGYR7QwgQcBkHvI2flO0QSGZaaSskVdakj/+23kYau/j0GxnIcVBm3nNd5igetR
         HGiHwoG0tUTt/5hlWBXpo2Q8eAbrCY5t5yCGNINLQ0L+yQv+Ww8SSN4ZSQZtyT1IqnWr
         gdzRJT0GAx4L7UAT6H4ozbogf5xYExqjbow2iVzPZ+99dtMfu3s32l3yKwAv/yQqsHNG
         Cuqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795191672; x=1795796472;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DlHp18CPjbRy2dBjwYmV0o13g/8Est+vNGExs52wGVI=;
        b=iy4m7QaX+FurMzDa2VHgchc1f8TjMQzwjSq+4/dSUIYGJs3aLd4lju1sxxADxV5w7l
         v8TfJbq4oAj4HMLfaY1A+g8vOD9+u2RuW4fe9+dzaBaZqrBwsUwm7qmZzbYV2CpLOBb9
         1B3xcAN6Q3o9UuY0dC/eDMKKyKR3maOB3eWNDcCS/GzNvLJIUnx55MI49/VGdmAT5Ecm
         qEMqo+wK75/uvpFaG5fNVLO6/ytYXIodaHQrDAjDlNIpfYUt1vVcry4PAFo+lEwbKBP9
         TPpVPH57laDCOjOfpgmTnoVtDm/yOlWq4oP66+dgpPLmiqGHHGU1DTDzronNQDqBJlQc
         jniQ==
X-Forwarded-Encrypted: i=1; AL+hErH3jk02L6r30686/kn1YerkweI5twBisn18jQJFs+232gnJqXhpicC+WlplsABHKxH6+zWaDmXUbdCXD90=@vger.kernel.org
X-Gm-Message-State: APuU4Z8e9lxe897/Df+wzhFJZXllLDC/4sme313wD8UwuwrNjhTgPLk/
	d6QHvkDtRIf2hSArACElsJdKCP09GAg/tWrQuk/meM/hU29If8tTtNtlpU/TET2ci+8=
X-Gm-Gg: AZFdTZdOeBjd2oBHB6Wh+fWmMvhFcQqcfLm2cbmpeKLGNDgfw+y2IeARhiKMyxX6FHn
	xlBYvM/hX8GpJLyrtC6x8YOo7yqwLAyP+sRcD30D2eMsHMIZGexUfbNx4pa6uvtkMJW/QSRhBsg
	DphQF7zFbV6ksKXmuthfbGUdphuXpq+cofaOXGL1GG5u6+qxuwg5ulXVZsaji3+01zU40y9hhvY
	TFzPsuhOr4w3SoSZy4I8CjGz3eMKOCHg59L09h95u6/PN7Y0iatwOp9Kl4yYjSt3MnhSFvQQDvh
	ueJ73FIH0AtebXM5BLyJ7vYGPrt9AaGCh2tymurpMynniB3ZlhFJtn2C6xyHDq4G9jKuiIE8tD+
	t2eNIuS+36TWJ3bedBXdWImyzr+lBlgHCt+o1Bmj3yi6fdBJ9xodtvHJuZLnER2tTP3zU+3Becn
	meuZ4uqVUSHgXOje8X1WU57LG2TP3ZCIQRWmDtNCbDlMLYKyeYM09Gnz7xPh/LMDvcCSJ1mioPG
	qgDGDyQpggyZbv/53NnnXAcyJ8ti7bKjIPKG2Z5zCswfQWjqcqD2uSAwlSdwknWYm6tY1weEiRL
	tE46Vu2kygFQ1IRg65PfN+0=
X-Received: by 2002:a05:6a00:1c97:b0:8b5:7fc8:866f with SMTP id d2e1a72fcca58-8c87d32b004mr3231608b3a.44.1795191671804;
        Fri, 20 Nov 2026 08:21:11 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:60::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e45e32sm1696071b3a.24.2026.11.20.08.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 08:21:11 -0800 (PST)
Date: Fri, 20 Nov 2026 08:21:05 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Kiryl Shutsemau <kas@kernel.org>, 
	Song Liu <songliubraving@fb.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Rik van Riel <riel@surriel.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Pedro Falcato <pfalcato@suse.de>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, stable@vger.kernel.org
Subject: Re: [PATCH net 1/4] net: skbuff: limit folio refcount when copying
 skb frag references
Message-ID: <awBy7PoxdEMEGWyW@devvm16445.scu0.facebook.com>
References: <20261118-skb_refcount_overflow-v1-0-5551b4954c3f@kernel.org>
 <20261118-skb_refcount_overflow-v1-1-5551b4954c3f@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261118-skb_refcount_overflow-v1-1-5551b4954c3f@kernel.org>

On 11/18, David Hildenbrand (Arm) wrote:
> Various networking features copy frag references of an skb, for example
> when unsharing a cloned skb (AF_PACKET trimming a clone), when copying an
> skb (nft dup) or when building NFQUEUE messages. This is an effective
> way for multiplying folio references held by an skb, allowing for
> exceeding folio refcount limits.
> 
> This is not specific to large pagecache folios, but with them it is a
> lot easier to reach the refcount limit, as page table mappings can cheaply
> create many references.
> 
> Let's introduce skb_frag_try_ref() and skb_frags_try_ref(), which use
> try_get_page(), and use them in pskb_expand_head(), __pskb_copy_fclone(),
> skb_zerocopy() and pskb_carve_inside_*(). All of these can already fail,
> and their callers handle that.
> 
> Fixes: 800d8c63b2e9 ("shmem: add huge pages support")
> Fixes: 99cb0dbd47a1 ("mm,thp: add read-only THP support for (non-shmem) FS")
> Fixes: 793917d997df ("mm/readahead: Add large folio readahead")
> Cc: stable@vger.kernel.org
> Acked-by: Pedro Falcato <pfalcato@suse.de>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> ---
>  include/linux/skbuff_ref.h | 53 ++++++++++++++++++++++++++++++++++++++++++++++
>  net/core/skbuff.c          | 35 +++++++++++++++++++-----------
>  2 files changed, 76 insertions(+), 12 deletions(-)
> 
> diff --git a/include/linux/skbuff_ref.h b/include/linux/skbuff_ref.h
> index b6f6da556ee90..560ddc863bbec 100644
> --- a/include/linux/skbuff_ref.h
> +++ b/include/linux/skbuff_ref.h
> @@ -44,6 +44,33 @@ static __always_inline void skb_frag_ref(struct sk_buff *skb, int f)
>  		       skb->pp_recycle);
>  }
>  
> +/**
> + * skb_frag_try_ref - try to acquire a reference on a paged fragment of an skb
> + * @skb: the buffer
> + * @f: the fragment offset
> + *
> + * Like skb_frag_ref(), but acquires non-page_pool page references using
> + * try_get_page(), refusing additional references to a page whose refcount is
> + * at its limit.
> + *
> + * Return: True if a reference was acquired, otherwise false.
> + */
> +static __always_inline __must_check bool skb_frag_try_ref(struct sk_buff *skb,
> +							  int f)
> +{
> +	netmem_ref netmem = skb_frag_netmem(&skb_shinfo(skb)->frags[f]);
> +
> +#ifdef CONFIG_PAGE_POOL
> +	if (skb->pp_recycle && napi_pp_get_page(netmem))
> +		return true;
> +#endif
> +	if (netmem_is_net_iov(netmem)) {
> +		net_iov_inc_ref(netmem_to_net_iov(netmem));
> +		return true;
> +	}
> +	return try_get_page(netmem_to_page(netmem));
> +}

I don't see you removing original skb_frag_ref implementations after
the conversion, any specific reason? Do we still have any skb_frag_ref
callers left? Maybe at least you can make skb_frag_ref do 'return
(void)skb_frag_try_ref' to avoid duplicate code?

(optional) Also, an easier way to migrate might be to make the existing
skb_frag_ref return bool, convert everything, and then add __must_check.
