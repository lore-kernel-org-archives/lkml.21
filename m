Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794977954;
	b=vOuAusTnnIXkGa2H2D2mnFgUtBSPKVuG2KBkCeoqdBKPEZddAeD6k6N1Vqi4R26fE0GZ
	 e7Ctk0vzgwgpIQ1GpGLrmGp2wF67LxwgAYlTMKQe9mSkG+4s66Rnc6zL7AMcyZ+TZvxQU
	 AP18x6gXh5rB1ui9F6LrhhjpAlt43m+lElR69AATmRgXmhF2A20UvKk8TpKU0W1y/MH4j
	 1j7gwWTQk62g/APDTgyxU+mowiQvf1sx46DIQRmuHlbe0SL+0yhdP0lZSmw6znIt0h7B+
	 UTxFCv6B0SCGlE9XPLb0nND22MvqwV4kig4ITNwz8jMa9iKeovh4wTvj0HuR+DdPv4A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794977954;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=L15FRrjBvmM4ofKQ3Ff812vzjU+8L3wtPEj17f9j0B4=;
	b=u5IB1XRxWxSH5xd9We5jf9bglzOVmlLQaFc6r/H+jjvt22+2gPuQGFFGXfrOlhMCR/QE
	 7pEyDxKAGl1jVq4ffK5+Vq+Jh2436JsJvVz0c4ZllrDOnBPJVaApWfMxgFyuPT6RsoI5y
	 xM3EolBtP2h40HpyllFppO1Cz7LkXkB3afbtyAJbDlrY8V3UT/5f/3YdLiJ7m1rtG55yx
	 yn75UFkw7lRuim53lfDChyvLzF74GdyaMZVlq67HbrSHU0BE1D3QUkPAm3A8j9gjZ4X35
	 GUQWjfVLKRxVgcUytK4QFuwizRujART5kjruRyl+d9/ab3056w7JkM2glUY2u83v1Iw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=modal.com;
	spf=pass smtp.mailfrom=modal.com;
	dkim=pass header.d=modal.com header.i=@modal.com header.a=rsa-sha256 header.s=google header.b=iGs1k3cJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF793606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:59:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF793606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=modal.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=modal.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=modal.com header.i=@modal.com header.a=rsa-sha256 header.s=google header.b=iGs1k3cJ
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b315dd057bso3338347b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:59:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794977952; cv=none;
        d=google.com; s=arc-20260327;
        b=ldje4ai0C1+GW/PvXA0ZlPKOLoHkcw/bWj+YCy1+mh0MBuxnwoJV1XjDihqOeWBbRh
         waGxTccAAzfrAJ4un9dEa0QXDJaMTyfqrJyAn29h0ig7BH39m4LPEEkab9DIlP470C92
         3PozA0ZoJbvO7tRttpinOH4krzfqpbY+iFSKupvQkEUH8SLFQ/c2pMar8VhzMU0HLAxS
         7s+IH1O9SoQy633Xcf1pWGuD/O+YsrORL2pEetI0kUF7fiU4UuMMOctmA+18TCBg1kc5
         6GfckCv17slISvGHjnbfg/Q/Bjs8jV3StHUn7CiAzffWOvV2f9ghK+PUIIRA3vz+uPr1
         rHRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=L15FRrjBvmM4ofKQ3Ff812vzjU+8L3wtPEj17f9j0B4=;
        fh=IGi1FcMwzMlwIdYEAAF3cZcxOD06UKAdsqsB7emsWoQ=;
        b=RmCF0Rh8iwcKMn619s54kmZ+SzQ5WIPkcKQMpJB48mptTSkd9JWk2C6pP9RRwwArVM
         YF02c5QHD+6DuRKPsmQD9bYqaKBQSZloyJ8sCWJddxdmyunTVQOMzMghoEfAWjQRoFi8
         cI7GxgYc6vHCTnIDmCqzf2MQk/yzZWPbJ6AO0pc7M1Ce0t0exjAbwl5gn7pwQov5uJMu
         WoS6IJg+J3ZtxUq6psVd0VH0zcJY7r3ZkZKMSzCbz7Hn4dYTVmK1pIR8ru1MNirUhmG8
         Ws797PNFyJcmNp3524Ur0JWl2NIBdON4efSJz1iKn5t56t6b0qFGqW6b9dP0zV/fE/4A
         E4fA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=modal.com; s=google; t=1794977952; x=1795582752; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L15FRrjBvmM4ofKQ3Ff812vzjU+8L3wtPEj17f9j0B4=;
        b=iGs1k3cJDUQAM2hG5W2eJMpB2ZBXcrTDaAl2HYRYDxLwefgw2VvuddiTBApvNnPDeD
         pVeU0hm3ZKmaODZXfYV5B7nkiFcm/+tifz0L3IodOm5eR0zGsl/QQNfuGNcMnI626rIu
         kH5utsAJRqLDD7QdW5aMTxnUDoUTwZzPq9yiL4kuMwn36DM404H3wQ3ciTK4C/Yk8UdI
         yohN9H0yEoU4pr12/POpS4GvnumHh7H0K9Q53evdLdxqY89XYm9kSFURsnipcnuggCzU
         piWY0BB8QDpkEMwdsJUmJiDfOIzRurY0TGl0mEak7xCAGgh8JbAJ9uD3+BRbNqAs6q+c
         gwyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794977952; x=1795582752;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=L15FRrjBvmM4ofKQ3Ff812vzjU+8L3wtPEj17f9j0B4=;
        b=XImH2n2qF8VAKTR7O1ZbiPlhoXcKdd2L9CC9ojPYwtuWlBnST372sAQjy7iTBe6RKV
         DlcRgLyHZJvy8eYULUMDqod+1FlhSgtEO5tlIw0gZnqE04FULnRyenHjJ7t74q36hQYu
         zT9YVmZOof2hAoMQ2RjnbT4ju6jSnJBDDWT/+S75/UUP5//X6Zs7JFIG8WJQOA3qyQFF
         bXr/olfkRrfEQPTiUJYjWzyNDMRA4xkq6IgkXRWpAXF9UlUmqTTDpVDyf7ParVY7cJfk
         HCzNTgSSsFkKfEk6Gi2dzsoE2+Gcwfb7Q9wNXIk+STW6d7dV14EvZTmcmHDw2f0JD4iD
         XWsw==
X-Forwarded-Encrypted: i=1; AL+hErFEWD2VosPtiAqA16SKHm95Edgzi/UHhAQ5UvtbGP7H4zjNrV6ZVBPH6vxQ4OK/AJ2bTsrEj7VF1r6ESAA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/EwoLmyEhBgOsG04pwCoJh/WCTA5gfJZKcfcwAUp2Ofjyrs19
	jBm0S6+rX0GVsRKTKVHUQvAiQ3ljL8gmYTlbzXg/EaJSgdRtOr2dfGEQdagKgtMTYANDGlrDjI/
	hEN/59CP31B2CnjWiAKebTZAfIRiXKOxLM9fmss6XKA==
X-Gm-Gg: AZFdTZenxm/pefUG9pqnMINOUsK1jggjYmlWpLKfcNvpEDGym2fn4G1Gz5MZI4fHwS4
	n2k1HvSc5gVAKjWPnyTxe8srJGN038HSoKuB8DlsV8J+c36hxw9IZUbktN9m/OHjNlKTXOqJrnz
	wtbWmx+sr/PSrseP7qaJPlsVJ3NDWZlPuQvTJuVCLCVD5aIUt/LjPuJ3PYqchi1+rBp7WeEDkCu
	KEyrToolhoFqmXafT30ivNV5lBF6TCH1q+c6ZH3bJ253PDtKiT0PO4KsH388fRz9BeIOdqEYM5j
	kFdO3f/YhUBqHluvdL4gG/n1inFSL0sOLvVC/Y4VXR8Y2iLHimg9kItKVWs7z91aYlXUeJ21SIy
	mLw801YbrcG2gpMzlj+6pUg/zzJOvA++w05eY4kLMju0nXRFKW7dY0CF/GgX1yw5UngJh8G0=
X-Received: by 2002:a05:690c:6c91:b0:8a1:781f:4aa0 with SMTP id
 00721157ae682-8b4fedb40ccmr7127757b3.56.1794977952130; Tue, 17 Nov 2026
 20:59:12 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-samridh-shmem-send-v1-1-1b897ff562d9@modal.com> <8d90ee6b-ed72-4ace-b667-42e35c5baa5a@linux.alibaba.com>
In-Reply-To: <8d90ee6b-ed72-4ace-b667-42e35c5baa5a@linux.alibaba.com>
From: Fnu Samridh <samridh@modal.com>
Date: Tue, 17 Nov 2026 23:59:01 -0500
X-Gm-Features: AclHuK_HM_FofLuPSN0Y7ZflCaBv9_Ptu4MF3HkZBfGCwfv9f5hrG09K70kQ8wY
Message-ID: <CAKyepcRQntK6TPGXxaz3rpV3qJ_oQdjL4utnocwzS1xt-t7tGg@mail.gmail.com>
Subject: Re: [PATCH] mm/shmem: avoid zeroing new folios twice with init_on_alloc=1
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Hugh Dickins <hughd@google.com>, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 17, 2026 at 10:29 PM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
> I don't like the GFP flag hack. Why not use user_alloc_needs_zeroing()
> to decide whether we need to zero folios, like anonymous memory does?

I started with user_alloc_needs_zeroing(), but switched after a comment
on the list, thinking the helper wouldn't be accepted here. My mistake.
I'll go back to it in v2, which also takes care of my flush_dcache_folio()
question. Thanks!
