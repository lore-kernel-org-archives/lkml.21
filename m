Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795443551;
	b=qCe3rahErdtvAbNOY0pU1Ly3jrQeub6UrM2asanGpAyCoDSl1qlk8k/5/RbCi94Na2Ol
	 zF3eyaIuXMmPNWIE9de9ap6vDcIfEEQmoDk4Zu/YQB6piyrlagX+ICWyvOXzTF9rKO8D/
	 qz8w9SUO06DcKZ+RwvkHFWHe8evvg+/n+TL4m1QpEUq/e5PEFhw8OwnkGMt24V/kF7+l4
	 yhWHCZlvc5PkzB+ZxGvRaKdsUvw/gkFxFOK9ZWVBBEHq3Wa/taAjka/h0LbNSgi8GjFaT
	 f7HoOiizpmtr7UOkJYfdXtjAMwcMsVeveagaHoExDn427K1kF7xSVCLgFTJPCdnr4Qg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443551;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=SGqpzMMXOxhLnysXHPX7ervAuuBOMpPxjnvIFfmSlbo=;
	b=5giPpB307XUHs9ZsdQirD6UA3ge1NNY2AAc8JeciDtvfDDFubAgfwOksxt2AA8FMornf
	 p+B6NBU3mfNMquZBtaNZF4re4sB7hyFjx1n0pAyva3jdV+PLkAtZN7UneWszcYkvDFp+o
	 swK2qGHiPRhMGWKwNYepe6Nm3JB1ayQH1fJnaXpdTrFQR4jZ787S0jTdfS2miQv7TROFF
	 3Cvu2UVxdPHd/46IvMGtJH3Qy5THlw8oYXehVaaez7D6avumPiqeyNeXj3qFESnAiLYMH
	 4ZR9dNDRnU0h3+y17rYqK7CVd5KWZ9UzqpdIqcuMWchQ4Rn4iK2WyuBQhMs3drBOJzw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ia/9bOu8";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C32606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:19:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86C32606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ia/9bOu8
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b8977f2785so4402612a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:19:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795443550; cv=none;
        d=google.com; s=arc-20260327;
        b=BwDFGyRyV/BKmRGqlDDU/Rz4BW9F0LeyIzbeI4ZouXY4g84lgJoPj5qTSzornJKB5N
         lhESxzUF10/FmSr3ubov+/xpSNVoZkmsN4JDbr8c9ZZrYOi5hxj8k3PIKrixdAx/8HIX
         F4STnAOAwX0vuCB3VtbPtjhnt+SozZkgQ/jRo6/in6L8J7Jf6DIK23FLKorz+h82vtdW
         TpWDLSj5CcxLoeDNJcneEoixqZ2WkTYFHOWpIhDUBbR5Hc25uweZ8XxpSOB5Iy3T8901
         i46sXfvzv/YndFSGaH6fAn8mokK7SSaEefgxlcg5iDZIMs11t6kuG5ipEYlvnhDy3s8n
         NaGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SGqpzMMXOxhLnysXHPX7ervAuuBOMpPxjnvIFfmSlbo=;
        fh=5lpMu1TCU+fwxooL4+bnuej+eYywsTMrAb3dCK4RE78=;
        b=ZO+q20HaINqar1UXiqGp5h05Uro87gr7bo/2LIqYfC3vqGQwrRt3djBwoDY28oTUP3
         v/z24BO13qiZ2jQvORfyboIX2U+hgMkJykXnqFFWpbyKQvs1KsHWOLSl+PcEb1X9FkiK
         CCFWHiw8ndM4CI1StboGrQG+z0j+Q+6CBxTiDF6Yqg9kz7xcmkxEDeRxA+/YbB7uLU2/
         vyJO05znZhKut28isytCe/e9tySBOJmQ5oVNrx5BERRyYg46dZyhHNzMc01tHtcU0c98
         OPSIJJg9wPNlSHN25OBIydzDMprac60pZbRYYPu052QwhjU1fqKXajinsym8rEadhR3C
         7xXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795443550; x=1796048350; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SGqpzMMXOxhLnysXHPX7ervAuuBOMpPxjnvIFfmSlbo=;
        b=ia/9bOu8jSdEcdklu7sre/wKzZoFdki81W2YJr5dws7NTbMa6eVh8vfd8h7EZAJ14D
         zJ0mFNzTG9vSV7EDC7ZzObA4FfyyFHJFmlg2OfQnE1GzlKJYEiaPGS+81TXDzscV3Lmf
         e1X/UPfaxn/OuM29vOeBkbikjniBtlasyUheiBxZBmZndMWZEYV/NoVgu4CKY5knEIJ4
         FHLmL5+7Zqnk0SKhO1f5Rpk1eEaOfaYiP0nRtrE5LwUEhOM5CmVruhmq/q9f3TExFydB
         fjuNhxX5EXWG9T9dmW5z9mMjNIKUvdWzXZN1cU45mM7c3rZLJkxX3+ShE2gwYEV7l3VB
         J4+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443550; x=1796048350;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SGqpzMMXOxhLnysXHPX7ervAuuBOMpPxjnvIFfmSlbo=;
        b=JCkJNpNWoGpIOA08PxiZcCpIpWBfAXI2mLNztA/kpSJ0zzTgi6mBm90LoYegaDQby+
         9mMWDjOFW8hJPqvsdPSbCyKST8TknXVNPoruP0jeFK6fbb7Ua0rod75XLcDQSxnXPfPt
         kq3YJU8Q0QsaMtIKI1cwMt08Q8X1JWUO/CymkiJQRcSfqlyNtDMls7b6iCUavIPhkMXQ
         +JSPuGcKUKYuyRozqJgqwzjzMvXkoYEperPyZQjcFX1TxUugrHEZxFkC7R6rwtJAAWxH
         Vja1K47CIi2vCokcMOaytemnSrUl+JVpa+w4PKgkb9sE7osSkAnVLJ9adK0snoFmqRkB
         3saQ==
X-Forwarded-Encrypted: i=1; AL+hErHtsUeJYjML9Fz3VQgjuienlHDA4omQnT/dDvTWEf/tuzymlyDTk9u670bg7PgauUKwABWkV3G2NUGR1c4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8pV6PRZAmaUxwrjF6Y/xaS/8lXIomNWtTt4w5ir2i1FuIG0ydG
	wyXDspx0va/5WKBXcIg4y69JKAxVv9mkTelv3ze8cM28GQ/ir704Rx9gXu3cOgI8onnmPlkKMqK
	V9pZlUIaxhwsQi+kOKHy8pEs9rdeTtLw=
X-Gm-Gg: AZFdTZeg380sBe/Xd8yqs9R2/dBkr05sq9zXsziPrX5FMiU6eZ2OEW8pZ/O+n5jpoKe
	PFGnuLYEPjvMEeQUAzG/bSTUtrZzm6MN3/A+SIb1u61e2ZsBlcW80c6EVamAglnB9UcVl7tCbzW
	EqZTLXfraYxABahkgyZMqZ2xgCiwjMkaCU5mNzwRIok4A6eeQ/HkDt7/v9yZ/4YyrSFu4qC7N0G
	cqWM6jRu9f9nfrQc6A1DYBzlizFD8WchbARJkklhJ3UiwekDqQ55neDE7fjrNMsDwgHRrA1gYJ2
	bKJhKQWYeuU7OgcSH21BJHqdV33CCCMd/CR8R4s+P7XkEXA04lr2OE9jzNsK6h15N9ctA6o+d2s
	5Q55HChEgDf2Q1jfCJg9dYYCN07JEUxrL3JFsElEGoMlqMLsXL42swWb8CWCmvTjkORZGvA==
X-Received: by 2002:aa7:c61a:0:b0:6b9:86d:bb5e with SMTP id
 4fb4d7f45d1cf-6ba37e91e14mr6755202a12.41.1795443549130; Mon, 23 Nov 2026
 06:19:09 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122000856.536902-1-koray.fra@gmail.com> <20261122000856.536902-2-koray.fra@gmail.com>
 <awP8S5KF9v-nqWVY@aalbersh-thinkpadx1carbongen13.rmtcz.csb> <DN2NJH234CC4.2LSWRSOO4TX5I@gmail.com>
In-Reply-To: <DN2NJH234CC4.2LSWRSOO4TX5I@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 23 Nov 2026 15:18:57 +0100
X-Gm-Features: Aa3M54qCw9X0Tb0EaHQOCg1GMA-OBfzeB1bXtwNxs39Fn8cRfeeS4nOAW1KHDXc
Message-ID: <CAOQ4uxiREfVU-WKiUVRZLb-uzMXzDEsmG13FVMW7YBoyq10=Nw@mail.gmail.com>
Subject: Re: [PATCH 1/3] vfs: use goto out on error in vfs_fileattr_set()
To: koraynilay <koray.fra@gmail.com>
Cc: Andrey Albershteyn <aalbersh@kernel.org>, Namjae Jeon <linkinjeon@kernel.org>, 
	Hyunchul Lee <hyc.lee@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Chuck Lever <cel@kernel.org>, Jeff Layton <jlayton@kernel.org>, 
	Jan Kara <jack@suse.cz>, "Darrick J . Wong" <djwong@kernel.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	Lauri Gates <lauri.gates@gmail.com>, Christoph Hellwig <hch@infradead.org>, Dave Chinner <dgc@kernel.org>, 
	linux-btrfs@vger.kernel.org, linux-xfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	ntfs@lists.linux.dev, linux-nfs@vger.kernel.org, linux-api@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 3:15=E2=80=AFPM koraynilay <koray.fra@gmail.com> wr=
ote:
>
> On Mon Nov 23, 2026 at 9:42 AM CET, Andrey Albershteyn wrote:
> > On 2026-11-22 01:08:54, koraynilay wrote:
> >> Switch from using if (!err) { ... } to the cleaner if (err) goto out;
> >> in the main body of vfs_fileattr_set().
> >>
> >> Signed-off-by: koraynilay <koray.fra@gmail.com>
> >
> > Looks good to me
> > Reviewed-by: Andrey Albershteyn <aalbersh@kernel.org>
>
> Thank you, can I add this tag to the v2 version of this patch (since it
> won't be changed, and link to this thread in the comment section of the
> patch)?

You should always keep RVB when re-posting without meaningful
changes to a patch.

That's how reviewing works.

Thanks,
Amir.
