Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795672324;
	b=kdl8kG7oIZXMmyoTZHjRGnxMwA36fapUFdhgEDqD/DdsvNKvaBXPLFdsb7SL6tjzDqUz
	 8tOgUqkwSbOfVZG3kgWqmjx/viK90zW9nJOTPK/yxronCuoFmLTqtdtehuYK9z0DtYzPX
	 Io7YVlytNUjY530pV/AyV5wTe7Li6gBTPZIH3+2WJx65j1G/F4X6ZcYZCzc+iUordwE6x
	 XtdDf3BYW14khJf/+I0CV7lkvPoWUXabNBVs22Hf76l4OHJgyp4pULZwGCJkNAVdzBYFW
	 HitWItPW2xoicq4GdI9FUOI2wXWeMF6auhnv/zDn0Hg1eNPZ4jkwBVaRkp3ZV4a5aqw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795672324;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=2k6JRJKRP7LLLbAdrdUeXnNjQUGXGLvFy8MnHqGutzQ=;
	b=BySkjbKSWV4J8BBMZX2rvxW4eLGE9BDnGSiUchcIkyWIWDzrEHv34LAthefti8Mipzfc
	 ndlnYFjOhx815wGa4MLen12TqPqriJo/AdwLVpnWE+vVgJPSXscl4u0bJc/PSfRlX8RvT
	 ZRr042yLMVLVfYXNZj81djmtIvqi2UGCSYxAYVdQUTzutp8TpKthYtyJ+BddeBmJm8W4h
	 1/JGaw576wZwAGAluErxAuZ33hU80i0Xk9alsAisPYInoDS5xhyhWYwNCEEaEs3yvHD0r
	 L7Lb6maILKpDJgZPnJhTZHwKW027r2FmaQDLjx59Ch8DDuTFJXpFhtnahlUwI5tycLQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=F3MGezqK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.47
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FF3606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:52:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71FF3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=F3MGezqK
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-92130d3ee15so62104406d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:52:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795672323; cv=none;
        d=google.com; s=arc-20260327;
        b=I+WOaTYkWj+A2XYTEMnPLuoRgm3ZPs5iJWCMTnxkZAxAXFzMkyJoUxoYPcmrrJAyl6
         qQTJyAR/WPfrK2+k3V7F2OTV1O47+0a/4mo1P/veT1eRvU2nugzfhI2ATkywKli+T1dG
         1cd/6tcNfrM2DXrmXTNcpm/bSBANSzSBH/qIk0UFoECZIOgF80mgzx9JTiMvIEtnde34
         bMtkuqT2sFXduuhXESs7d6LNo3pZAdPkzVJtyNoZNJ6RDcBRPxup9661rJJWbc1iSJ7L
         ggHIjmLCU+kGf/yeS1q2xS4zZR8bd6B2ooMDKU50UcpVkN5oo1yGHjCw/PfAbTWL/Xdt
         dXpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:dkim-signature;
        bh=2k6JRJKRP7LLLbAdrdUeXnNjQUGXGLvFy8MnHqGutzQ=;
        fh=IIFQyV2LquFilDt+b1IboHUUiP0QEPFrBn48wH5Szeg=;
        b=oNWKq50/oaYI5/HUHSjO4tENIMPYA7EnbicImxKC949GOLMYbsqFUhKIOM+gRUZZb0
         6xR3tWDjg4ReXkESlksXoR+OgObytk4gvvPaPP+cjjI2OrgV0+F2lrBF7JS14nxhAFwx
         SSlounOdniB7tykBvNgWh3iswL8fmfSMVLB1+CyuTp/kXRONoE+atNzLniPRe5viLtKD
         CTGocfaKhOtlrT8qUrlycn7asPJM1tW9DBj57lX8vd64rMKDyJpTrJB1EvfFkINmSMAF
         4+oY2CCixMdfFStytyFk9oV9E0V/EXXdjsQm5VWiq3JuIrwU2Dr9dGfobCIyGkWzUIXs
         aLdg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795672323; x=1796277123; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:mime-version:references:in-reply-to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2k6JRJKRP7LLLbAdrdUeXnNjQUGXGLvFy8MnHqGutzQ=;
        b=F3MGezqKQgAa0JyHUcJcp+Zg6ECnBiEvfsDThi8VsnhmCXRKlWSoL52eSfBDIFPD2x
         uBbQU3jIrSUyVrO39S/PrsN2kIgfRdYx7M7CPQVpKhWs9Qo+tfOQoO0djyv9S5fGo/cG
         1stlyUDGtPHC8EeCiOXBaLjWTaoV9VydgrdgU9Wk4b+iiHz1Qka7xoNJKUOBsrfIXsST
         m4QV08PcuhYqC+cWrzNqW7y0Pt6RJga7Ihe94hLQ2aZhHXa/ETNRe70kJ28YwT7HQ0OF
         0aK/j4URULabgM805RCSyWG7Y7IAj7NdsXDAv0sHOeHVtmj7X6u+Ir0IZ2tntty7NS9X
         sjhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795672323; x=1796277123;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:mime-version:references:in-reply-to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2k6JRJKRP7LLLbAdrdUeXnNjQUGXGLvFy8MnHqGutzQ=;
        b=ce/44eEj/DJphufZpSlPBtmB5k8IwK9X1cojRgMnnPjhTk1Soap3YvUb9XwfByx/HR
         I8q8ZfriWswQL9YJPYAnX6SH1Fj/j+n6eAweoree003vJV+GrL68lSK/yynteO01VRta
         Y5B4X3IYaOqqXmTshmXGAW+3IYYd0YB8cv5dAMMBl9Z2dIhNqGWEneSMYT723E1ncMJ2
         HjsiJT9TN7F/7M9ksWK7nspQVRpPgAz4eS3Jbdv7KJ/v9Ir6NBa0uDbYqK6RU1amnW3y
         sw4IIYawP4VDvU1vcjC6fWhmI78oisB/7W0V3N8w0Id/Yc6JBYcEHVfIQXVNSwgq1+o1
         RylQ==
X-Forwarded-Encrypted: i=1; AL+hErFuMsHyxbwm7FcKcG7xlmmXEjr3wQPd3kfKOCzsblCBMNjmiLdrfyP+/fG2CCU2mBRSePQE6kImjAhK/2Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z9FPUgaf7tswLMi7chVoa7Y0rC2flC6F6PhWoW3ZZuq4fWnYVVy
	HUIzHbR8SA/Mo+VA2Ow323PPOQteFIIXtlN7ojL/bwzKo5Gji23uxAohQ8KpRsUD9LbeF8iXEeS
	A9EPFYeX0o9FG2MJJ9RIrRXvSHqPkS3oBVZTcwDCk
X-Gm-Gg: AZFdTZcloFCoZJUzwII5pB/MU9OwYXU64iPbgPrQm4uAbH8K8M9skmw/DVbgOUa0SO2
	oGfNXd6XXlYf6lvDw4vWZLt2JbwN6QAx9A0DtBQkKyCFsf2ZpjsmHCgNQCqgIBVa3UpySBlfwLR
	Qh8Bxu9WKQHKN8jhTNb6ycCIEvyJejuYUqdT7JuPCoybh7r7Qj0NA0M+9HmnDSjtwElV4mJOmXB
	MA/+IBmWbIqRokdG5QfxZRbj2llE1anUevjrif6HXiqEDch/vPS0vnkS2Cb+qmPbxa5h9woch62
	iLeK8LjVOcfLedGQ2vu/VEQfJgOM1v7pNR0BncpHVWntZrVaKKNGCngkBuDbMIqN95H27AENSz6
	OeNKBjKQPn3U4+3VJNyRe7NQE0n75LitO2d3nkF0ruO0hW8uQxzGKJhvOFJemCzVsog==
X-Received: by 2002:a05:6214:458b:b0:921:15d6:2acf with SMTP id
 6a1803df08f44-92134aae3a6mr363727356d6.12.1795672322542; Wed, 25 Nov 2026
 21:52:02 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 25 Nov 2026 21:52:01 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <3b7d2d65-be96-4b63-9de6-7303d2de641b@kernel.org>
References: <4c7f9772.192e1.1a17d5c2ed5.Coremail.xuhx@hust.edu.cn>
 <2026102727-data-sequel-ce41@gregkh> <566ddeb4.2ad04.1a202302fe1.Coremail.xuhx@hust.edu.cn>
 <3b7d2d65-be96-4b63-9de6-7303d2de641b@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Wed, 25 Nov 2026 21:52:01 -0800
X-Gm-Features: Aa3M54repb8SXZGoGoOnOV4yw28LCY3gHdW88ztUp64xOBuWhqUl6TXDC7tITrI
Message-ID: <CAEvNRgFsS3ntQBANqaqdm5XS8c4n6KDh3aODiduf6pCczmBSGg@mail.gmail.com>
Subject: Re: mm/hugetlb: a min_size-only hugetlbfs subpool is kfree()d before
 its last pinned page is released, so free_huge_folio() takes a spinlock on
 freed memory (UAF)
To: "David Hildenbrand (Arm)" <david@kernel.org>, =?UTF-8?B?5b6Q5pmX57+U?= <xuhx@hust.edu.cn>, 
	muchun.song@linux.dev, osalvador@suse.de, akpm@linux-foundation.org
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

"David Hildenbrand (Arm)" <david@kernel.org> writes:

> Hi Ackerley,
>
> does your series [1] actually fix this? What's the status of that?
>
> [1]
> https://lore.kernel.org/linux-mm/20260916-hugetlb-subpool-always-track-us=
ed-v3-0-38aae9b5ccdd@google.com/
>

Hi!

Yes, "mm/hugetlb: Track used_hpages when getting/putting pages from
subpool" fixes this bug.

I've been tied up with other work since [1] was posted.

I have a set of reproducers locally for the various combinations of
min_size, max_size, and both defined, while taking various paths
(reservations vs actual allocations).

The plan was to always track used_hpages, which simplifies the
accounting and it does fix all the reproducers I have.

I thought in addition to simplifying and fixing all those paths, it
would always fix races, but AI showed me a repro with races that broke
the model.

Because of the repro, I planned to re-evaluate to see if there's a
better model/clean fix but haven't got around to that.

I'll try to get to it in the next few weeks?

Ackerley

> On 11/22/26 08:37, =E5=BE=90=E6=99=97=E7=BF=94 wrote:
>>
>> [...snip...]
>>
>
>
> --
> Cheers,
>
> David
