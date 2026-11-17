Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794959827;
	b=i7tAzsq4q+ArjjDR3fESxksbVNpG1EVofuEAoiM1xLeR9hY036UF+u/Uq/8WpQMBeUIW
	 ALXjy/zTliDGhfVRxlYmJaHvQnDpivujxYRFQWU/AFlL6+OcOT0lMkdlGbujK5i88AJK3
	 6CYeBVW9CBb2OyfEb3fuVLA8BxXcgSIMlAN1ELVzAY5YdkDi1SKv0JemFFf62qRTftaYy
	 4O2ZzO4kbKBzHbGJkVHxiQgA2MSKVp4OXze5GPuHPM0HXtA8H2Fvt3FNFwuEZOec6ysh5
	 fmOQwgQJ/qrLAPhUeuAFjXdf/pQAacfjFYJSWl7k8c3NXPdgh9KKacW6nP9/SxpQblg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794959827;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:X-Mailer:
	 References:In-Reply-To;
	bh=zBKSUNIiXiILVKYT5fm/zNF8yb/snSQKW4BL97jmOFQ=;
	b=cAfo0nG4fXdL+ScU8j8RXEVJNRVS0DdATiwTX+EnQOtVJPop88o4Sp2TNZx3qqY3G7Ox
	 XhbQwJRFRX/IS1orvc+JHTalP0Vn/GKoJnaQ7shFL4IOi0luVGFOgyxnqTZkDyJhM8gYU
	 n7RCizi3JbODjjTOkxleDdnftZB1LwR7fdxNA/H0feYJ0AE+5oCXULTOOjIwLS4ME9lNZ
	 ngmd/LCGcw8aAOnz2B+29EW1jxjCyRzYAlOGNDW/jF9zG1zdCPOqIek0QdQC6McCYSieE
	 IkivBKgJtcfRBxQo3xe5lwsf5zbiqhqT4ylhZ4KBvwp1IyOVCDhx9JAN8m4wpgIzhLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="XeX/kpqg";
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCEF1606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:57:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCEF1606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XeX/kpqg
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so3502065e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794959825; x=1795564625; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zBKSUNIiXiILVKYT5fm/zNF8yb/snSQKW4BL97jmOFQ=;
        b=XeX/kpqgO/1P35ogpjLlwilnlvUFxFQSHMnnNShW2FTydkN5BOOFbOVoiZ1Tt8lCdP
         nWleJ1xb2SgrnnY9yQ9J6liP7gVP9z1S3U51juI7aanyRwXBCVGUrHcNBONwbjovMIGA
         ize1km3yalXg/kHQB+YLgd0Je/uGWIV6uDtEnzb6G6RYtBpDw9SqmNxyytBqPn73y2BO
         O8Mc7OCOL9xSyFnV3BpIDzNIJYJeLqnhDNohQQ3Qqk55TRBfkEsdiw8VlNsKlb+LRcaZ
         fHdt6yhQVuwnXlUzL/YnSKjia75t3dr5aQ/WGzE8QhPLylqcImcPLkZpnWJIGYUcACu3
         bT7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794959825; x=1795564625;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zBKSUNIiXiILVKYT5fm/zNF8yb/snSQKW4BL97jmOFQ=;
        b=VrFhEgynrP0QAtcadWIytSfKXuqeB8grqsx+CJc5dlijK3SoLbVSGE4vXPF7WLdx2U
         cSONWPkDA2iiw/0KGVte/cJwEDXEOjrK0Lns5VKtWwkCMXsKLBwJS4i96FZhfc4Yf/9/
         iRvENM6y6CMg/+6bQeVF+BKOHxQUTEGEeBbqJM0TzuExIpqi9uACRK3fVMCRxEDLJWgj
         Gzpdii/EVf8pi2MZ16gJoQV7D4KuucJYJlLjsg5rGeFWGywI9BUR1lbBoqzw1FGhZFvE
         1gotP4QS6ZOCzAvTgjigCQYq7W4ys0co7ydNwHEtxYBM4sYXaWr0Dw5GvHp3Ehhdn3mt
         T3vQ==
X-Forwarded-Encrypted: i=1; AL+hErEMpLsdKQbip9ctqLbtOYEJexmNLJeA1BaR6+rIhmWgv5TAmcjQ0Kmd1J3+EcypyqaBmH4DhRKwf4XKEuA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ezz1YiknK8xxQ4TOMzMZebXRGQMIF/ILHNrF+56bfWFv//+Ig
	+kE6sV/w/+RLKI73y4UYVLbVzCLSLgmMQHMpHP/t+VUe0+WbA1s2AzAY
X-Gm-Gg: AYBFou20Hp1ZY6grm/33OKvMhPtQ7S+4XGDb8jUjIgXMkAfjfEUo3ksFSJqzXzneKWO
	xcJ6VcZBxEjS/j9kwh7Q36L2+PjmkJKq1WBMG/7krxjPVikI6rBlySB6VThXJ7NXbpJkE1/SZ2m
	h5fNSAShGI0+pnaXdPh2jN3cgCbiahI/yXvzvtu7NmBd3Qia7/SGnv7OKtS8HATh85HobBFA5Fm
	CmctAcUtuoD2irVp9rKs5zoJOguo4VXKfQW3abmYxJlsgYB4zIX7QAJx/TQ2RtkSw+yCA2ysGl4
	trmC4OFRLHkPbroUmIO2Algj6pvEikZvbWWFS7HPP+EUAkJqw8a3a8/CDKfcX3c0KT35MNeXXpA
	F/ViLZDgnpYlN/MYvWxFlVL+qK2T9V4HWq994RbgMtulkG8WwtRBn3nfcgunEisFIsCYvODumU7
	B4aMYBzafmfQUuWtQBtc5MkGWJn+NHJCNoIQ8Sxh7kUOvEW0QjzHp9xdl4OoSDo7BvcRKUphelT
	tVxJVnbo+hUpJZAGEhsWiRAdvzjQOszGKr0ikRA1Dmhtz83JoxvK5fnGypmtCDHgdnA4nvnmywT
	TRZW68EnnE9o54eHAnfluvrJ/Q==
X-Received: by 2002:a05:600c:3485:b0:4bb:6c5e:b006 with SMTP id 5b1f17b1804b1-4bb7d6cc1fbmr14508645e9.3.1794959824991;
        Tue, 17 Nov 2026 15:57:04 -0800 (PST)
Received: from localhost ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7ddd4614sm11604905e9.6.2026.11.17.15.57.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 15:57:03 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=b8e4a62509544b067db299bce93de40d8eff238bb48ab78a3f5b1b72ee7a;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 18 Nov 2026 00:56:24 +0100
Message-Id: <DMXW51AXC5LC.WAVN6D92YIE3@gmail.com>
Subject: Re: [PATCH] cifs: fix times assignments in cifs_posix_to_fattr()
From: "koraynilay" <koray.fra@gmail.com>
To: "Paulo Alcantara" <pc@manguebit.org>, "koraynilay"
 <koray.fra@gmail.com>, "Namjae Jeon" <linkinjeon@kernel.org>
Cc: "Tom Talpey" <tom@talpey.com>, "Ronnie Sahlberg"
 <ronniesahlberg@gmail.com>, "Shyam Prasad N" <sprasad@microsoft.com>,
 "Bharath SM" <bharathsm@microsoft.com>, "Aurelien Aptel" <aaptel@suse.com>,
 <linux-cifs@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Sashiko"
 <sashiko-bot@kernel.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261116154526.429315-1-koray.fra@gmail.com>
 <f61c83e614c1afdcdb20c958474ac055@manguebit.org>
In-Reply-To: <f61c83e614c1afdcdb20c958474ac055@manguebit.org>

--b8e4a62509544b067db299bce93de40d8eff238bb48ab78a3f5b1b72ee7a
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Nov 17, 2026 at 11:18 PM CET, Paulo Alcantara wrote:
> koraynilay <koray.fra@gmail.com> writes:
>
>> Currently cifs_posix_to_fattr() wrongly sets SMB's CreationTime to
>> fattr->cf_ctime.
>>
>> Fix this by setting fattr->cf_createtime to SMB's CreationTime and
>> fattr->cf_ctime to SMB's ChangeTime, matching the behaviour of
>> __dir_info_to_fattr().
>> ...
>
> Applied.

Thanks! (also for applying the other patches)

Best,
koraynilay

--b8e4a62509544b067db299bce93de40d8eff238bb48ab78a3f5b1b72ee7a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSgVimKafU5DQMcjcDmj22qf5IGXAUCavzpqAAKCRDmj22qf5IG
XPWVAP9xBbMDNG3wRaQ5otbBeAD3QJd1ciHOLK87Ks45GFkGPQD/Uc49HbHxdsrm
fBmxh1qMDGjqe7DXxQGBQKhWo/58BQw=
=lQhA
-----END PGP SIGNATURE-----

--b8e4a62509544b067db299bce93de40d8eff238bb48ab78a3f5b1b72ee7a--
