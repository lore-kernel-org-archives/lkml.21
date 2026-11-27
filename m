Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795794558;
	b=UrspTV34i4ZxmlJMX3fB3e3qpqcpGh4VzDSaZgQSLVggQbo3LRJ1GAXZ8tCAdlGv2+qX
	 9HQfAeteYGTVdwGSTXUk5ngRqqUzhemAlbod6iJ38hzDZmweV+uudO+qhA6dkAvNr3v9d
	 +tTy2zPpRf2HjcUyhbwVezcPMhKAqOkCCvg2G4iU6IK2sW4aIvAsssvBe26Tj9T/Auyy3
	 RwPV1srySryVNTgJCvKKDLS8uEYjIlFXxUYBidC14MXjaPcnkDJS6d6Ckb3GX0JArd0RN
	 PDPUP3fLE9ZpCN6lp+hNVxaHh6aoSOi99dx9YsamMRrBLCT+/gmxJ+34mpF2oZ7SBag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795794558;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pm/8tep73L9V4TMW2Ch55CTSshK2JxETa/tNsbYXksY=;
	b=afY6s0oNUW5MGMT9SynFmXPGzuftVmyRYks1tr7r6ceegoSRxkWg3CELx0FsfD/Wu1V/
	 7dVSRR0w4zIMkgkK4vOI21Zsk45BxLDlHL7xaB+chaup4yPUkypiK2boCvX58Xc4uhZMh
	 92yqa/bNknxvZs6OcDDNWsb71J0L2S8QIWy79OytdmSf0A9vemq47Og0xbevNPj1C8+yq
	 wGnb2wwZCCRqn5GVfWh+6nD0fLUlezaKcO0888tAediY3ndZ/HGXU9rT4fs50PI/pyS9G
	 YEWxVylyIfmoZDgf3UdN0z+xGr8hjT9w3ce8SUlYAFB3w2vV/GkBV5GZ+F+w4DIamtg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="r7/DC2ns";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B1B606A323
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:49:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69B1B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r7/DC2ns
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-55c5b6584ceso60214931cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 07:49:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795794557; cv=none;
        d=google.com; s=arc-20260327;
        b=Zf0eVlSDM49CUW1n8uCbMAnr4E9w6K2lzWIzJP8SD2+iDhYz4nEaF0HycrorXwoDtp
         5ylNn7g/HCFCu/FbEF84RQrbQ7ybX/jwmI4d7kELiTwEnn2d+pzQEn8Ivl1YFLN49Lf8
         KzjjTykqtTUGKWe6weXAyT38VwoHHw1c94ymmvXoNzfGq9OhZ3dIiFVtrTP/TbE7TFYH
         IMULUY7xhdB7cnL6+XRLX3sXG6AeHizqAaYL57leLHZiK7+iDHZB4l29+YQBPsD/HEbq
         EK8tzTJkQ/XxxyAs/mKHWx6K9NxnzRN/zN7qvEq3cxwcTH69vyAZRnyI/FYUuCFqmKGT
         HWEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pm/8tep73L9V4TMW2Ch55CTSshK2JxETa/tNsbYXksY=;
        fh=MgPjllyif3G2AAQVHG1g276y5E/3f4byWd2sinMLkgg=;
        b=Vi3Fl/r49GjmBXHnAHl5729tihUg8lmFP6BN6bLFVYhUckFIckvXiknWUB5Vm35JOU
         a8vH8tpzJbD/xin3Xehtz83kMrUc6R3KLLF/39sKJOcPhFM1CqggmwMRqCYYXFrBLZxy
         QEoBo3RR85/PIIiVDKUTWDnVQdd48qfzFSR0i96h7Npho/E1jT9/7nUjb39NhzdzIGOw
         RNZC2UPIpRRE0dt2oTnwVeN8ojdoauww6h7CNH3VxVZ+/ZFBHNaPJI6U252lUqny5o3K
         +t2FoBELvkkwr4t80ODgBDXVYXBVrExLl+wxiigGdrJL+8cNj2yvZAR8MqWD9ekVkwG2
         LgVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795794557; x=1796399357; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pm/8tep73L9V4TMW2Ch55CTSshK2JxETa/tNsbYXksY=;
        b=r7/DC2nsFPcFfujXShUyJum92nAAXkR0SPOC0ulHRZV7FF+2KOagqIU8llcBM/1sWW
         HYzyUhkof0c/LZk5o5X3JnEQKrn3MUj5T1ypXIw/5hWZmTHABodP102dd5j1T+V2b7gP
         uU56XPDlh5ZFSTI35HOlaxOXnUIs0Bq2gQxx49Ngr/1l/H+LtZEYC7Eq+3wXVagvXjei
         zv+r/9ePDQbmXnLvvT8OhCZj4Svf+Fd/hJlVd8jNwy65xC5Jl0wbhcweHGLgF7t63Kdo
         wUNQIrBPNig40zlbv0oC2Bw+Pi3AYT+5OnLLzteFop3u7hLGUeT16D85qVO3NjtWaIph
         Fn2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795794557; x=1796399357;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pm/8tep73L9V4TMW2Ch55CTSshK2JxETa/tNsbYXksY=;
        b=qZyfp8C5iD207eG4tVDM9vcgUPQSIJUwpNdNT4/r5hE8DkclgDvt8tSI2XuI6y9XZ+
         5xf5A5LsrIKaHT2ioDc8cNzbieDrJ8nBaMJwDmQsmxkBmAk+QvyYHou1bZDyeCTL3yAR
         gKikftgOmcEbuFPY4E9KIl4xr4GlfbuRKy6yuiw2cCvUEdBOCVzfO0fNDU2NtTXPqTCy
         XmERdgVdJ8gwtd9vwlOk/AMzjRlT3vcsu9AGtDy1g6xCJhg/l3jwWNn1jX/kortkBq57
         X79CaF7sNBg6Ee6MrlqISImpC4nxLpxHiWNF+Rm1m3OSeMA+gVPbAuBihNVXYOVL+Mh9
         TlRA==
X-Forwarded-Encrypted: i=1; AL+hErEvO+fcDhmDq6IawvK92DsESQYKg6Jk0/9lqET1egnxsrPITUBOutTsX++E5qnr6NTvqwAk4SHKKq4J0kE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+P5I4Usd/n98mcTeORO4H38fOFAf8rDPXnMNl1SyVon1xThQQ1
	sOPSuvX5+se/Pdj9Tllmunf0CA1pGqgg/kjx5Rx+yi4k0w9F23uwJgjs8ndhq6kMun/XfFHfvae
	QIdCKlLz64vwOrVj2loXRnCqbFJu7I0c=
X-Gm-Gg: AZFdTZflkY+G8yy0VLO5KUWNoqh1kjlNcj3EFjqMRzUmwJyTsHP/eQX7hR/OJuegfn1
	4udraVwhkHdnVY0MxwCUa8GbqkCnd+15tZsuEQ4Z2+lmZ8h4nZRA4ibMrBaHFJKWC+iizvpjle2
	lTm+mewsZgOwUIHCintoTtgXiBygQC+X23EwCARUWSKA6TPQWS7KP7v+Nf9khvkRwITbje3XtD9
	7LbVmvK7kQrgExiCrXhafVanvVBsyXvjOG1jXcBwlhez7CH6MeqmDqpWi6g4Ga5h6qv3TVEnjWl
	4J8J6VkuOaxcYm1+FDrCcJSslkfvIMX1drpkhCGubaqk5sDK86TyOXhe2MvRy6iNvRCLN2fv8zi
	AFoMOUHi/7yh7SbJlSyaGTd8/QYO6/5blhmw3c82cwgpcRb9CAYuZtRQWA1AF6uhiQTEVCcBKj0
	99x997sx5nSQpWTMrCqLKlgNmixC7LqxWHZ69CwtyapUUItwwbxZYhGY+0obavO/WrWvD1wjiII
	Kui/m4lT4wFtAUXFIhokidpnG06AllWVw==
X-Received: by 2002:ac8:5754:0:b0:535:a5fa:edff with SMTP id
 d75a77b69052e-55d76a59807mr476389711cf.63.1795794557235; Fri, 27 Nov 2026
 07:49:17 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261126031506.165973-1-kaynak.oguzhan0@gmail.com> <awkzEjrVEz2jB1Ma@z790sl>
In-Reply-To: <awkzEjrVEz2jB1Ma@z790sl>
From: =?UTF-8?Q?O=C4=9Fuzhan_Kaynak?= <kaynak.oguzhan0@gmail.com>
Date: Fri, 27 Nov 2026 18:49:05 +0300
X-Gm-Features: Aa3M54oG8qNSkma9SYEe5bEWuLV762AYfcjKVO9GWl8LUMyf097tEckGvgVUriY
Message-ID: <CAAKAQ7KpM5hT-Q0mdJr-0VnHy1DeFBoODjYM-FCoXiS+5DW+cA@mail.gmail.com>
Subject: Re: [PATCH] ntb: ntb_tool: accept hexadecimal addresses in
 peer_mw_trans again
To: Koichiro Den <den@valinux.co.jp>
Cc: Jon Mason <jdmason@kudzu.us>, Dave Jiang <dave.jiang@intel.com>, 
	Allen Hubbe <allenbh@gmail.com>, ntb@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, regressions@lists.linux.dev, 
	yangqixiao <yangqixiao@inspur.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Koichiro Den <den@valinux.co.jp>, 27 Kas 2026 Cum, 11:01 tarihinde =C5=9Fun=
u yazd=C4=B1:
>
> On Thu, Nov 26, 2026 at 06:15:06AM +0300, Oguzhan KAYNAK wrote:
> > -     n =3D sscanf(buf, "%llu:%zu", &addr, &wsize);
> > +     n =3D sscanf(buf, "%lli:%zu", &addr, &wsize);
>
> Just to clarify, do we have any rule about negative values for the addres=
s part,
> like in "-1:4096"? 21fbdc4d0b1e mentions "-1" as a possible input for the=
 size
> part, but doesn't mention it for the address part. (For either part, "-1"=
 is
> really odd, but that's not the point.) As you mention, your patch starts
> accepting it for the address part again. Perhaps we should keep rejecting=
 it
> there?
>
> If so, to cover the cases broguht up so far, perhaps it would be an optio=
n to
> split the input at ":" with strsep() and use kstrtou64() with base 0 for =
the
> address?

Good point, thanks. A negative address was rejected before my patch,
so it should stay that way. v2 does what you suggested: strsep() at ':'
and kstrtou64() with base 0 for the address. I did not carry your
Reviewed-by over, since the code changed.

v2: https://lore.kernel.org/all/20261127154157.3541-1-kaynak.oguzhan0@gmail=
.com/

Oguzhan
