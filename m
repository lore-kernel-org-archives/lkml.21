Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795100070;
	b=o9M9S1cM9HcSguLh4Qm+BmtNzX+FyRKbxBdhh/UsGE8SyE5DoICyuhkxHmh1EwtfnoX6
	 rPveBlWSqrMHwvgAGCObA8eNp2zoxyUb5i9yjMQmwkd4V1WNgZB6DQrlv7MpFOOPUiiDe
	 nyuyb52NoOCfmVppSvGrUNJlOg5i+rxEiM91jIIojTvKZWT+OA8kzyrWTfFKZmrYAkXmx
	 KoCt11ytDIjicEAlTPO1QliTOoPJk2kCP8orN07+UUDUzoXJzQ2mamAt/lw5pTnADqOiJ
	 C9/CXFTTy9pf0371i47E/O+E1bhXdHO0Gwc2j2mV8s+P0c/j2HLl+Ysv90oPKnIOYEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795100070;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 To:Cc:Subject:From:X-Mailer:References:In-Reply-To;
	bh=mF/CN1MwkKAbj0n+aog+XXJlGwsq4jMzPf88n15fnBI=;
	b=awFQCcdusa2aPXdHRxwLAoE40vOhEz9Efr7lk3EW26Xo6RL/R1fBat64MEqAem24SQOT
	 7fhvf8idN77lWL4++gNvGjAhU/yqwMjz8UhV21R6iZqQYP3IZDuXDnNOZSWhtsD4kTSNh
	 Qw7Vkb80YlEsxxqN9O+1mMsKz8ofWgg+xNivQgD4AiCoEgb/jWD6g6QVyBBAVDxZNSRUp
	 LK2RUTB3GZWdv+jn8zcnFJQBMiYlHT0Pct8Glqs7vGotZP8bQsIBuiwNekXgJQjpw8opM
	 SLk1cm9bXhsQFr7f0CHeWST/n4PON9ZG90hms2RXdKPFSNx0DCKLAjb6yuUiP69O5cA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=I6LPAIeX;
	arc=none smtp.remote-ip=209.85.222.182
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD1C606A337
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:54:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CD1C606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=I6LPAIeX
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-94965745d92so251816485a.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 06:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1795100069; x=1795704869; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mF/CN1MwkKAbj0n+aog+XXJlGwsq4jMzPf88n15fnBI=;
        b=I6LPAIeX+5AEjUj2jih1ACvF7QNbKEZSSWEQHvV1cx+j9LvgW93X3qemhuduWcn0D3
         wzjjkTCPSi8Rgf0iuqK8xc8hJddhWoVNo21OQxjCP7w+/nVX/0sSFgNp6T16VosZ8l8m
         HAxC3NLC6MhIkDBmbKV8klY8QvYuZ/Xb43ZoIKvvEvWWV6qHPqKqKpSCN1Va6vVqIQ/u
         honQkjaTAMAdsC3ea9n10KbyFizCpOLDvHQAp3NtIUNsuoQsfY2rOKBvBaTmm6gqubgm
         nGFTgPM6LG7FI1IqREsQ43EHzZnUjXfjfvYzru7SjxiKuf1M/4sgL6+m4kdJklSo01+f
         Zypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795100069; x=1795704869;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mF/CN1MwkKAbj0n+aog+XXJlGwsq4jMzPf88n15fnBI=;
        b=tAkg51HM1oGeqyaArtb42IgBJHTJr+2O0YAMkpIb7UIrKkc+ClgBczN0+rNN5ZwI8y
         cu/Tqedet9B3M+Jbn5jMSxhdgx6vti1HCwzENEf0pMMSyue1NXAyPwYg2Ws4HLSfj+OQ
         JLMtbWFNTRVZV7XpS8eZR/gYF2bBxf2laGQlwt0MbdHi15/34oLrb3qjA5XbwA3sI4so
         qHGRp58sx0e5ledhJ6kUYyfe4GG1QnHZcSsLtGLSIpOSzxMj3vKPN2ri6shf2cKRRgNe
         M+HFX7pCHWgnjTd3gFVJkY82aZ9BwZca/XkqWsvG907hGumMJG6SofRgXhyjROTZDKbO
         OJrg==
X-Forwarded-Encrypted: i=1; AL+hErF+ItL2zeOcF4uNpjNMXuLjqmjnFhXQv5NrJV5ljtth0KxKtEWrMoA8MlY2hNcOv2J3sDC7UW++LDWjKxo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ehw7xRYcJZrH949jgLKN/zUldQ6p+HpuGERU+PUn1Y+p1PIUQ
	UTP0d1FQqyJ+4ysAvsV9nX5cT2hKzsBpXrpUthX+CofneTV9KXYPUwsHav50LWhPmYo=
X-Gm-Gg: AYBFou2PYb2Qkzlnw0z8/eMdZJwwpq4rfm0Bz5Xgmtb/p2d1ovDcsLSmHV0jQpLx4pY
	qBcTpVSvtfA1Zv5+dtYIlJudgw+yzIb7Qnn5t+gGKYjiJiHTPMVDZfn1G/tz+1F4ccs+XhbMgrR
	2wqj7zursRBdiAXFCB4Gu8ePr2VyCXW2x56ZFi9guUpBUmAgC5fBvnzlc17s+vYlWZJYhW5kWCO
	e4kk2tsE+4P4prvOF7bevjz/9PG46twgiB1gbWIRj6vKaw9gVVA5qMdrnrLrl7lLAYmkAfltifW
	3nBkSxAGzbVglj+A+piZpCdWdqyTLI7UT4DAEXDlwV5f5ajAJ7xAiEKIRWvk9PMnJhLM7dzL0vY
	c3XmAMRkrCDvgXMCEsM1/h7MDtecfHQfKqh92aRfM/rSXpcXpSfcoq9PCNsbjOfnKSaV5ffz5IZ
	BLarSkvYOaJ6yAdLdsKUjXBDn+Br/oyiF/sVdhxivf8bzrerMrJzfCRoUBEE5Yn3dTySmgvtTrf
	PaE4BSODob5/5ae5aL5wtAQyKZmHvrF44WX55A6PXeev7o89jV0jv+Vil2/iSuYoVNuozguG+zz
	UYYB+qv2mKmb4KMsZU3GzjqYEIm4kQyKh+AjzDzffnxORcNN4NEYRMLxiNR0tEB5P231BgcFr9q
	cXK5Tu7XdcFdSHTn7TC1d8VRSqqSMznM=
X-Received: by 2002:a05:620a:6e84:20b0:949:a7d0:e6b4 with SMTP id af79cd13be357-949a7d0e7f1mr416234385a.51.1795100068869;
        Thu, 19 Nov 2026 06:54:28 -0800 (PST)
Received: from localhost (57.233.150.34.bc.googleusercontent.com. [34.150.233.57])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949b9a5370dsm10296885a.23.2026.11.19.06.54.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 06:54:28 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Nov 2026 09:54:27 -0500
Message-Id: <DMZ9V6MU9XNZ.3J23SCKTSDHB@soleen.com>
To: "Chris Down" <chris@chrisdown.name>, "Pasha Tatashin"
 <pasha.tatashin@soleen.com>, "Mike Rapoport" <rppt@kernel.org>, "Pratyush
 Yadav" <pratyush@kernel.org>
Cc: "Breno Leitao" <leitao@debian.org>, "Alexander Graf" <graf@amazon.com>,
 "Baoquan He" <baoquan.he@linux.dev>, "Jonathan Corbet" <corbet@lwn.net>,
 "Shuah Khan" <skhan@linuxfoundation.org>, <kexec@lists.infradead.org>,
 <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <kernel-team@meta.com>
Subject: Re: [PATCH 1/9] kho: Reclaim the metadata page left reserved after
 kexec
From: "Pasha Tatashin" <pasha.tatashin@soleen.com>
X-Mailer: aerc 0.22.0-39-g5d7784875be2
References: <cover.1794383544.git.chris@chrisdown.name>
 <63ca64c004b296a998a3e531f8c0c4964916b70c.1794383544.git.chris@chrisdown.name>
In-Reply-To: <63ca64c004b296a998a3e531f8c0c4964916b70c.1794383544.git.chris@chrisdown.name>

On Wed Nov 11, 2026 at 2:52 AM EST, Chris Down wrote:
> After a KHO kexec, the new kernel keeps the page holding the previous
> kernel's kexec metadata reserved for as long as it runs. It only needs
> the page once, since kho_in_kexec_metadata() copies the previous release
> and the kexec count out of it at boot, and nothing reads it again.
>
> Free it with kho_restore_free() once copying is complete.
>
> Fixes: 76aa46b9e404 ("kho: kexec-metadata: track previous kernel chain")
> Signed-off-by: Chris Down <chris@chrisdown.name>
> ---
>  Documentation/admin-guide/mm/kho.rst |  4 +++-
>  kernel/liveupdate/kexec_handover.c   | 10 +++++++---
>  2 files changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/admin-guide/mm/kho.rst b/Documentation/admin-g=
uide/mm/kho.rst
> index 902d171a780a..f9d2cc5999ee 100644
> --- a/Documentation/admin-guide/mm/kho.rst
> +++ b/Documentation/admin-guide/mm/kho.rst
> @@ -120,4 +120,6 @@ stabilized.
> =20
>  ``/sys/kernel/debug/kho/in/sub_fdts/``
>      Similar to ``kho/out/sub_fdts/``, but contains sub blobs
> -    of KHO producers passed from the old kernel.
> +    of KHO producers passed from the old kernel. A blob disappears
> +    once the kernel has read and freed it, as ``kexec-metadata`` does
> +    during boot.
> diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec=
_handover.c
> index eeec298aa9d6..3046b89e5db4 100644
> --- a/kernel/liveupdate/kexec_handover.c
> +++ b/kernel/liveupdate/kexec_handover.c
> @@ -1808,6 +1808,9 @@ static void __init kho_in_kexec_metadata(void)
> =20
>  	pr_info("exec from: %s (count %u)\n",
>  		kho_in.previous_release, kho_in.kexec_count);
> +
> +	kho_debugfs_blob_remove(&kho_in.dbg, metadata);
> +	kho_restore_free(metadata);
>  }
> =20
>  /*
> @@ -1885,14 +1888,15 @@ static __init int kho_init(void)
>  	if (err)
>  		goto err_free_fdt;
> =20
> +	if (fdt)
> +		kho_in_debugfs_init(&kho_in.dbg, fdt);
> +
>  	err =3D kho_kexec_metadata_init(fdt);
>  	if (err)
>  		goto err_free_fdt;
> =20
> -	if (fdt) {
> -		kho_in_debugfs_init(&kho_in.dbg, fdt);
> +	if (fdt)
>  		return 0;
> -	}

This re-ordering can be removed, now that we applied:
https://lore.kernel.org/all/179508700586.361583.12491114908870226409.b4-ty@=
b4/

> =20
>  	for (int i =3D 0; i < kho_bootmem_cnt; i++) {
>  		unsigned long base_pfn =3D PHYS_PFN(kho_bootmem[i].addr);





--=20
Pasha

