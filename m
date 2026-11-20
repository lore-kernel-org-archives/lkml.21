Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795194153;
	b=uXaWimNiV8tisP8GjbtJx9N1XskssPQs8yqtr/FHUbBWvsfS4omSzBoxD5bBbkS+Y4RO
	 jVRRNSJ+PI0KOK3cG0/E59jG73g1XJBpHL6p9BacRlZoishsgEddCfDqXGEFkq40X3pwF
	 uXJhjbkri5+WAF2dCvczRKkAQc5Wk2Pn5h8fljzIouL9xjdQTqqqNuNFPV99sFiBgIRqQ
	 oAWDHNCUefJdrIISXJw73ihJdiMa1sWgcpj5fyEPK7bWfpoR8/O4PSBgQCTBBpbOVr66E
	 tYaot5/UGVeOxE4Gyo8a0CooyJaehqlUFyfh7KIfsEFQ6hJdqwqdKbpD9b3v4wiE32A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795194153;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Autocrypt:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=6zTKNqmPWf0Vj/jpuR4Gw2ubEjlUG16M4BFYNokv6fw=;
	b=49kuO0yZYqarA8AggEvvmUUoGWA4zOwKh+CYT7T7qim5TEHIOAQQUNdo89eAMnMvJdAa
	 LGSLuO8m21QbVjh/DWxmKC8F5MQsEsX5QbrL9dm+FZWFRDs7N+VxQeDQGCSuU/EmLR/4q
	 EjYdplmkpGf3VxMAamXs3fnF3KFIXEg1d6Qr+BINqapufT5jza7LwAuUcbaCgwNQ3dlyz
	 Mr1faRqKyVu/Saqu/KfVnLt8gVlPbOZfFpRrdvj+SGvi33So+05T2Hm/ZvqWDBGE10CDq
	 AjEbokBcKTVvioyzILtj5bR8t4JL7ZO0+HDVn0+ku9zbvQCbYYU4XSz9/uMVP+6XiEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DlbGZYpb;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Mw0Mi4be;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF0C60A2616
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:02:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EF0C60A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DlbGZYpb;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Mw0Mi4be
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795194152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=6zTKNqmPWf0Vj/jpuR4Gw2ubEjlUG16M4BFYNokv6fw=;
	b=DlbGZYpb7podqzKB3M1KMkW2Nzuymky4eohfSuhazehrIFU5wcLMaHRrZ6RWdtyg0EkNzX
	A2fq0SnFWbreKtvVW8+aI5dLBgAdXLS80QbBBdQXhvHcz+ApF9XS38nF9baZFVHrU9Bovc
	dcTsISppcQLc+FvAPfpSJxaMYnX/GgU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-42-YbX9uGXhOQmduffJV8OV4g-1; Fri, 20 Nov 2026 17:02:27 +0000
X-MC-Unique: YbX9uGXhOQmduffJV8OV4g-1
X-Mimecast-MFC-AGG-ID: YbX9uGXhOQmduffJV8OV4g_1795194145
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c429d9d05f0so114000666b.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795194145; x=1795798945; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6zTKNqmPWf0Vj/jpuR4Gw2ubEjlUG16M4BFYNokv6fw=;
        b=Mw0Mi4bePAMKpX4Q3RC91qT6zGlebyMkxXIjyWiSh2PjzB4dt4/kfsYHLFI9qEMg9j
         r0Zq3irCTVI8DDK92ylIEAiGgVD5NX2HBkH3YIpJEhwmElY2vMoGbYG1bLx7z1I0VpKs
         U01vlSqMVt0C3EqdIIu/8UKjSioZ7gZ1T9dHkvpbjhG6AvLkOOcc5AFyAQQPhvollQs6
         8OMuLujFd76aZS4xzMPDLyjoOkVA9FbiXDFOBmZEumFITYSHw823YoYm2Vrs6SwY91Zj
         iDP8VERKjiAMRBKDDNqd30cWNwmu20wfwFwAsKj3UMD14kxERLeuIGGPr1lIwY2AFpRS
         QpQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795194145; x=1795798945;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6zTKNqmPWf0Vj/jpuR4Gw2ubEjlUG16M4BFYNokv6fw=;
        b=wmaXOxrlFDSF/w6CXB3T5qhZezVXqaS/CNfKbxPj1lLiOafOX2wV+mcpye8LvYNRK5
         GVK9mAzZngu5tCUP0U394hy4rEbRlgzRT4CdRHpNanWM6C1bXiWs88rTwqCfVonJgKSb
         6jWI8vO2L5k10gUnktCBS8QP1VeroxNpB1VDi32Odln9ycqk6UblFuo/qLoBB3XQn8cc
         0naBJ20x9I6ffF8d12jGymXJO4NmMTLG1DMGTiFep9CwHFcb7/SNhSrQ4XrVTr2FtN5k
         QUIUV9/uoBblnJ1AbLSh9FsWFhJ8b7YR/NmKExd1Uo2Q8LqKjKUEhV3AwOBl5g88cgfO
         rmVg==
X-Forwarded-Encrypted: i=1; AL+hErHn4ibWtIF04j6cY5y50qbigXMtMDq1P151Kt+zLP2QqY3XzsWYa0rUSYpEfBHnjcnpspbroeazN4Wf3Xo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Xf2LdnFgVTKLyZ5vpGOB1tUznhYnYHcadeOcU3aeq35zSNZF5
	jY/mAvTQeDbtD8nf/WVfokkoMsU6QvjNKdapjGitHXdKXk4LEkD2fMPD7dizZ0LYa50qvJFP12a
	2zRWax3yy7bnyaT/Sl0gRFfnOM0WVHTtcKppAZDwGj3/+yacQMxPQGlykPQz9m3hE9ae6p7XxCt
	hI2gg=
X-Gm-Gg: AZFdTZe7Tpuvxe8cND0ZUZTEdc0jW+bxZeYhzuaVv2KJJgkSJY50uK3wfwJmA/yFQHB
	vPk2JODW6PSwIgli8LzLkbOGr8yC5HMeSOK49RSqP7ddNWPBYUmrLw45t4fBWmHCwKKToyc1HoX
	gHu2fBbqSU2+AZhk2a0OoiBmCPjoyInu/XVh0DMeMu6VpyBw1sQb3UK9T7dkhxVa7seN9Jva6pP
	YgxyP6lPp5jLoHdxZmjOn/RLP3CncNWcrGqNYAuBdgTEEVLrg+Z65t0iPokH7ZjCJvozNAeNU/Z
	HqN3I7hWmcNuxyE/DVITqszLbwaGro13G6QMX2RFFux1UsYgFn2V1vOJ8EHnhl6ONo5J7RbSlLf
	DhcR7hOyX6CPWvGvOgHySkAm4EIB6SQmWb3BijsJp+Y9/WqFnTf5t73yYbvigwdEWD1kEQbdvjg
	hA
X-Received: by 2002:a17:906:f59d:b0:c31:5bb8:4b3b with SMTP id a640c23a62f3a-c513a47d551mr393854666b.2.1795194145233;
        Fri, 20 Nov 2026 09:02:25 -0800 (PST)
X-Received: by 2002:a17:906:f59d:b0:c31:5bb8:4b3b with SMTP id a640c23a62f3a-c513a47d551mr393848666b.2.1795194144836;
        Fri, 20 Nov 2026 09:02:24 -0800 (PST)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.168.96.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afeb9bfsm112182566b.74.2026.11.20.09.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 09:02:24 -0800 (PST)
Message-ID: <5cb05c823110358e588c651778c981cb278335e9.camel@redhat.com>
Subject: Re: [PATCH v8 05/14] rv: Add a KUnit test for the storage free path
From: Gabriele Monaco <gmonaco@redhat.com>
To: wen.yang@linux.dev
Cc: Nam Cao <namcao@linutronix.de>, linux-trace-kernel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 20 Nov 2026 18:02:23 +0100
In-Reply-To: <a00e4d311cbb9da36a621177f8b2c420bd532c7f.1793900349.git.wen.yang@linux.dev>
References: <cover.1793900349.git.wen.yang@linux.dev>
	 <a00e4d311cbb9da36a621177f8b2c420bd532c7f.1793900349.git.wen.yang@linux.dev>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0BrZXJuZWwub3JnPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmjKX2MCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfIQuAD+JulczTN6l7oJjyroySU55Fbjdvo52xiYYlMjPG7dCTsBAMFI7dSL5zg98I+8
 cXY1J7kyNsY6/dcipqBM4RMaxXsOtCRHYWJyaWVsZSBNb25hY28gPGdtb25hY29AcmVkaGF0LmNvb
 T6InAQTFgoARAIbAwUJBaOagAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBMrKEfgLgd0WcK
 eo9u9KbElYeE3yBQJoymCyAhkBAAoJEO9KbElYeE3yjX4BAJ/ETNnlHn8OjZPT77xGmal9kbT1bC1
 7DfrYVISWV2Y1AP9HdAMhWNAvtCtN2S1beYjNybuK6IzWYcFfeOV+OBWRDQ==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Fri, 2026-11-06 at 01:49 +0800, wen.yang@linux.dev wrote:
> +static void rv_test_rvtest_arm_after_destroy(struct kunit *test)
> +{
> +=09const int id =3D 4242;
> +=09struct da_monitor *stale;
> +
> +=09atomic_set(&rvtest_expired, 0);
> +=09da_monitor_init();
> +=09rv_this.enabled =3D 1;
> +
> +=09da_handle_start_run_event(id, NULL, start_rvtest);
> +
> +=09scoped_guard(rcu)=09=09=09/* resolve before the unlink
> */
> +=09=09stale =3D da_get_monitor(id, NULL);
> +=09KUNIT_ASSERT_NOT_NULL(test, stale);
> +
> +=09da_destroy_storage(id);=09=09=09/* cancel, unlink,
> call_rcu */
> +=09ha_start_timer_ns(to_ha_monitor(stale), clk_rvtest,
> +=09=09=09=C2=A0 RVTEST_BUDGET_NS, ha_get_ns());

Like sashiko suggested, you aren't really supposed to use stale outside the=
 same
RCU window, the scoped guard should probably come up to here.

> +
> +=09rcu_barrier();
> +
> +=09/* A timer the free path missed expires here. */
> +=09msleep(600);

This feels like a magic number, are you trying to say something like wait f=
or
twice the budget?
Something more explicit would probably be better.

Thanks,
Gabriele

> +=09KUNIT_EXPECT_EQ(test, atomic_read(&rvtest_expired), 0);
> +=09da_monitor_destroy();
> +=09rv_this.enabled =3D 0;
> +}
> +
> =C2=A0static struct kunit_case rv_ha_kunit_cases[] =3D {
> =C2=A0=09KUNIT_CASE(rv_test_rvtest_underflow),
> +=09KUNIT_CASE(rv_test_rvtest_arm_after_destroy),
> =C2=A0=09{}
> =C2=A0};
> =C2=A0
