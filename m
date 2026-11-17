Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794954440;
	b=fsVy3+0g1N//iRbODmzUlQdMTar3Dktayl3Lpus7jcbbmDa/GXM+m40URrxu5Hkw1fP9
	 RwWQgjFvqlb6HjyO637SbnUGVgQs/BngybpQr3MDt6s7ttw2nzyLD1PDIo4FYM4JZuBrG
	 c5veFsroFuz7Cmj+NyhkMxkqyl8Oa5M7jxIfcaW9Xcu1ho8aH44L1pUkbtaM5vpfFU/Mb
	 E5YC5yFklWu52TDBQ9p4Ay4PNFdUlFhepQnohiraMTKY78Rbf3F2+7vNPwRrz0ng3yFJ+
	 8SJNdxmZ73twentW74twA45XwigDZKg+C5BnLKB2iDqNKhtPDIe6c2dKuOxIqDJO15A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794954440;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Qc4tF92xQdHPstDc9OOaR7th/jMxJe62KjbX9qJMUYY=;
	b=jKW9P8VlAHKw81zEhJMA4b1Pwq/i2vux/KMLUHuJjBm6uhVhJv46brpvsDZcFdCNa4BO
	 rhXkkKjcj0AZzBfMlrAbCUQ02L6dYCIw2Ct15WJNzVVZbzEb/nTlUhWx6JU8KZRsxkGYp
	 SR39LdS/8YZ2hki0LdhtWX5oqZUXxvFoemThUcQkoXhW55oPgIN0o8yOu3nod9Grd2m/4
	 kXENobOyOeAydoA8M640Y1antMdA0daLuTUigqxmCsTDt2jUxLfMXzh6ulsNHT3C6pWlN
	 mpV+qWYR1TK+5O/mN/KejhflvzYkwU7vtui6jpb1eN82xyBrGBCePCbhHDbxY7d+QIA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IB9KSB2I;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA41606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:27:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DA41606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IB9KSB2I
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-380b40319bdso682468eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:27:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794954439; cv=none;
        d=google.com; s=arc-20260327;
        b=EzGmTA/3Fi5UkkdG3qJofYnFbTTsQSVmNuEHd+X0o9n0Dgq0VmnRiYMiZtzUdNTP7A
         lJccotU7eG8jK+ZemsIc5bA+8ehb70t7p5ueoUQAqMW/1+rlBXJ7GYmDnP3hVEmI9yKK
         6JpAmil8Vy5NS90nyh9veKlnfA5Om0NtyWcjIwKI9RhpQOdTwQmOJc4ZVbqHRdQLTizq
         vwXqAlhFpcy5TRwfMnuVTtzmf4zjqkZ1KXSc9O4C0SNnRqfes35HaiXneM32VswCcDvd
         CMl0YJUuO6tgcaj3k3MmZqa+e2grSN4dVbHB8d1Pwo2Mqpnb4J1+8K6rYoQjBrIIIGqr
         qlfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Qc4tF92xQdHPstDc9OOaR7th/jMxJe62KjbX9qJMUYY=;
        fh=CxrGVsK8dtoqdVXdyCbLSuGxHh3hYFynGISQTHLDhMg=;
        b=Ysdur3UK6gPZhIMyXiO88zD1FiJvoW25FVii/NtmOzZdxv7L/l2PEWTM3VlWnkvy+q
         1qwfbBIqzYLDUmHyBKh9zo8fY6zdz5YNvBCVxc3gi6cB4pQV987ZHVoIQTFF42Ihu+GU
         NShkTUeD0NkRNuUF1ht2/t02qNoywXIqmHvaH3g47wsR/Y0dEnGanqSemnCoHobhXBZA
         FTqZomLM+wgeefcuGV+DW0E7Y9HwiDOhXAhDsu6/YiFbdnYV3hBhPV5H9TlaxEbH+NbC
         4dPI/gIvNtCZFt+9PALHtFp5bas8/x4wfSrV/idKXJafFNFgutUg3pyTKOJ+QutVjPCu
         vwHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794954439; x=1795559239; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qc4tF92xQdHPstDc9OOaR7th/jMxJe62KjbX9qJMUYY=;
        b=IB9KSB2IO7iBgCq+jpeGWdjPjnYtClNviws6DaTkktO+PylGhjg0GKWFZiRmTiYy8k
         MyTQahP6c3RdjvveNi5QxsAzzUV37zetQh/aHiKX6hMOXlz71Jnr/1tBkfzavydq9+Fj
         dSWU/IZSX6OejLPtgrnhjpR4RKxo8Qzbucd0RZrms6HayGn7wzdzbz5jUeJzI1v/Kiq0
         w3PkJrIbbIHptZ8tqCmNDuLqktqioEjbVBlGMSr9gbPdb+KMJiRCC5XmRHtJTg/Zl8Pm
         Fq8rBhEkuK1mAGxWxuZT7Hd+7i8WF8esFnW6jsWBDjMz6AlDQDuW8aneGxrCDiBy1evn
         XOGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794954439; x=1795559239;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qc4tF92xQdHPstDc9OOaR7th/jMxJe62KjbX9qJMUYY=;
        b=CE+jhLDsvozmS1yOEquu7GqQ+AUlt6CeVb3u4DJrSmUdeyWiKiBUHO5h9UhXvjynOX
         C/vlbxBgeQiYbLOOEQUf0Luy1ivFnbF6SbYG75frD7L+iGKCFt4FnrnX3mDLF02pLGyn
         FSEXswYDJcxSypy2vrcl6O9PCC3KbaawNqljQUzdMIS9ZH3wNHLQEM6L+X+CHyWTKBdV
         VVOighooTDwbak3zKWtHuoClC5DJf2KaTTRpQ78HNUwokW6F8MK23/MIWVzN9BOZ8WcC
         EGPAXTPEpSYBoOtYsAbvwycVMcDiRQxZk7NvpnMurHwe0aGaNwz8dxnY2Ug2uSBqJYkx
         XpUQ==
X-Forwarded-Encrypted: i=1; AL+hErGcIHQzd25wD1IZnGcz9TY7w5YmmPji8hcVKsze3S1zDvKGECKw2Aqk1ewEFfBp1vTSMlxFWkkqfVKmqXQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Ze0TeNQkI3tQ0g3MhdVaME51XqegVz2kwKsCJxN/TeoQjB0UH
	RfuKr5ij4Fl9YiSpa+mwc2AmP0mXMMj6wtOCn3q+xsgX12czMPcvtSCRxDRTo3OHlLVT77rZMcI
	YLvboUnd4zeEzKcCHRGIpPAJRqhaaG/k=
X-Gm-Gg: AZFdTZeKSX/gDJGNhx+i/awXOD++SzZieB++7iX+InpsZqb6Hhx7sqnKkJ5kPCB+Hx9
	YkCQdkjeqk0VwM/0zQYrsq1zD53QyDLpIYAUnYXsFJPnpmkjaXLc8Wi/7JVIR2zZrBg9qyJyvqM
	dIEUd1XMtPWhC7aemzw+ltbStM624jn89W+GddpCQ0FSAuwSDzYLnsKZ5IFLMDjjsZjPL4Mpywt
	1ACe55youtv0PmNz45IU15Gucx1r0n+YYGJuMFK4Fdyk9H/hoz+AJ5mtotXH3v4B0ShvJwLilP8
	ueTpvxXPxVFREQw+MMImyEcNjLBkJ0KKFf25rXSFWkCwCV+ZaUeR95JXYyhDH/shbUUfXvYWiq+
	V+otWtkj/ujZdKKdhakTaSGZyuktQOjrpOZoOE0JW97zLGiCiAz5vnUVYz14+qbexj1Vt/0s5hj
	ENzEeugSrJ1qmhX68NgsccV0KDov69oTygYVb3lDk=
X-Received: by 2002:a05:7300:7314:b0:375:c5e1:931d with SMTP id
 5a478bee46e88-38280c2e5fbmr1001348eec.25.1794954439224; Tue, 17 Nov 2026
 14:27:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAJ6F8CFSfgdZqaKMndGZtbaww32Xr_KVL3gA_2Jemgv9i9vskg@mail.gmail.com>
 <CAJ6F8CFgkgksyk6YM3NdMkQNhSFWV4depC4c-mHvpDHpnjhM-Q@mail.gmail.com>
 <6ab4a114-57b2-40c7-99d4-55a4ac4c9a9c@leemhuis.info> <CAJ6F8CHzm4=ryY+j3ao6doR=-67Lq=3-w-kbhk1wdvtYDhyNeA@mail.gmail.com>
 <CAGEkeHdxaC2BBg5wWOCL0pj0r4Ks6mD_a3KpE7h+en9Aupb4zA@mail.gmail.com>
In-Reply-To: <CAGEkeHdxaC2BBg5wWOCL0pj0r4Ks6mD_a3KpE7h+en9Aupb4zA@mail.gmail.com>
From: =?UTF-8?Q?Cl=C3=A9ment_Smagghe?= <cle.smagghe@gmail.com>
Date: Tue, 17 Nov 2026 23:27:07 +0100
X-Gm-Features: Aa3M54pO67MCZLcmJlYCwS3g7jZlLsxu4gjlyt9JHnihscax6mlfWNEjuiM6Vfo
Message-ID: <CAJ6F8CF5FF6-+Z6tOA7Gz=m_Cvxz-n7G=bqVY5H+fBCV3kbo_Q@mail.gmail.com>
Subject: Re: [REGRESSION] ntfs3: existing files/dirs with ':' in their name
 became inaccessible in 7.3 (ads on by default)
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, almaz.alexandrovich@paragon-software.com, 
	ntfs3@lists.linux.dev, regressions@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tuesday, Nov 17, 2026 at 8:29 PM, Hungyu Lin <dennylin0707@gmail.com> wr=
ote :
>
> On Sat, Nov 14, 2026 at 7:43 AM Cl=C3=A9ment Smagghe <cle.smagghe@gmail.c=
om> wrote:
>
> I sent a fix that makes 'ads' opt-in again:
> https://lore.kernel.org/all/20261115103845.56074-1-dennylin0707@gmail.com=
/
>
> Could you reply with your Tested-by if it works for you?

Hi Hungyu,

Thanks a lot for the quick fix. Your patch doesn't apply as-is to
v7.3.4 (the context line 'opts->ugm =3D 1;' only exists in 7.4), so I
applied the same one-line removal on top of v7.3.4, rebuilt the ntfs3
module with the Arch config and tested on the affected volume:

- mounted without any 'ads' option: 'ads' no longer shows up in the
  mount options, both existing directories with ':' in their name can
  be stat'ed again, and a new directory with ':' in its name can be
  created, stat'ed, renamed and removed;
- mounted with an explicit 'ads' option: ADS mode is enabled and
  shown in the mount options as before.

Tested-by: Cl=C3=A9ment Smagghe <cle.smagghe@gmail.com>

A minor, non-blocking suggestion: Documentation/filesystems/ntfs3.rst
says every option can be negated with a "no" prefix, but 'noads' is
rejected (only 'ads' / 'ads=3D<bool>' are registered). Accepting
'noads', or at least documenting 'ads=3D0', would avoid confusion. Not
a blocker for this fix, though.

Thanks again,
Cl=C3=A9ment
