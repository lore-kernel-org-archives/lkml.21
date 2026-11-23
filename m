Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795443333;
	b=x2UGNSHeuDWJq5lbM3zN5X5u0Jf5TpJNNdMLpbt9z9GYs3setdLG/XvS9+ESWjRKWzos
	 2Kp8xS7YbGYfmEzvHSFc0QTI9IUcGUToIN75onxPj9Y9/Qxz0XyVXNVhemSZn4koJESuD
	 KB+ff62AKR/4vnOd+xfXdytBlBL33il5yp/qbOt7vWDFJjJRkLbyMhTmD+mrrg0aoZa/C
	 ZVWA3eDYHUzZ+r0vWhGlTuk+BoB0YmZIu0OTojZVz/dNxXl8wtkB8OSsjCgGjMtIMCm6G
	 67FmElKPOTa0zxbAsPByS7VM3dVn6qPvHmDrpBR8Y8GZOejFeQnvPsNOnOHQWuLAZVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443333;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:X-Mailer:
	 References:In-Reply-To;
	bh=SVkCiAZ9hVspPzZuKZbqXCYeKQk4BcDbwlCFk9p1ut0=;
	b=k2qawnXgbbFBQgi88XOvzZgc30CmB8ElZQLvvaW03+/FFyfhHmhX0S1LynIQefxVRv1P
	 7VtSijoj4pCBJ85yrREuRitsmsCGYZ6K96LmI8LZRXLVkPbWnqQOp3mNBWdKQ6/M2rFkC
	 K0s+jfR83K1wDSrGaX3lPThkgnYm5J7RgtQLX8JeFHDgIbhkpWJ6x/mWqN0IvFnlq4nnd
	 gTi+9sz+Mg70UGBw0tGwMJtbGNO46OpDtZ34tiQIPWemT7iffb/Du77gJAlcSbFGkVGZc
	 yDFmPKEXEDJLxrhskBzZUb4GfC7AzpNFIRbA1LKyp3b3AkBFLNgTRMHBtmyXQ/T3yWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LhurUaLd;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967BF606A681
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:15:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 967BF606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LhurUaLd
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4a358881793so1668532f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795443328; x=1796048128; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SVkCiAZ9hVspPzZuKZbqXCYeKQk4BcDbwlCFk9p1ut0=;
        b=LhurUaLdrrD6el1BtOOCJ70R+8KqK05u0u89mfuXWG8+J9Bw3rVb386658OMP5zMq0
         decyq5yItprIln2niTvSLmNubbRMdoF++9VmjkmrA05HZdXvZxDurdMDYBuXSM2/ru83
         DL0zGzc4TqwjCvYZ5gt34/pSFJf4/mCtDoKXgpXPt+Sv7g1Y86AFw3XQ6uM+o5M48dZA
         fsqr7/KfuhPw2PRwDKKUwpkICKW7wj5qvnFdYfxcb8shaROlLIM069A9F1sNO6bSCk2N
         auXzk8QjTdj3SnDJjqubihTVZqQWZzgbhHEkWSyJVafh+Xk4iboolLWwWkG1XoRweIGi
         qdfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443328; x=1796048128;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SVkCiAZ9hVspPzZuKZbqXCYeKQk4BcDbwlCFk9p1ut0=;
        b=m+OgG/xnWP183t6vFTbb9ObyGavIMUq6mH5C/eEBvOCoLkir0XdZeIN4vZCU+pdKmW
         zZwQc+GIiQ5iVOYiJgP7ge/puv4GeFA4/V4D1IVSCUfrJD+7gK8aHyNpTVlz9td1oSn8
         dCcfk2BiHdmgwES6fZQM3jU7tj2hjUP9aojIUskuKq1dxx8nallI6eVEV1AbgKzXK4/3
         BKLK1rwIk6FeTubVMcWOUpI1O5qEQC7ZhnNNrvGZBbHiAZyJn5xpgoK7822zLCIxV0LY
         8VUfnmoGtUwxHdd6mlSIiMEfsrjgufs3O2JhGqYXBkQ73dBUyIs1QDY9I9T5ALFQULbM
         3Jhg==
X-Forwarded-Encrypted: i=1; AL+hErHOKl91NZkPycWc/E4fiX+QYWslyq2aubXSxqtJFC/FeS2bKIUOENKFaDldq0RJvFF2MH3uivCTh+7Yvls=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OkF7dDhDGJkr6R0WefDNUd1HHPq6KyvVdT1Ow3H15ey4fZK4P
	csH4ssFBtFj8pCwW6J9llQpzNpyPZ6WoCNlL/YeOPi5U6KTmtoDXHpyy
X-Gm-Gg: AZFdTZePZNclhXYrugje5RF8F4wEXik2rUBIKSnOYm8AL2F9pghkOIp5uKNfVykpk+e
	L/fpRMeg7WaCpLQP/SAwNhJ3q+o9bkHWzWBT4pA5y7+R9zyCN2gXo0JyuyOEBPaBnYHNfFeV6aW
	RG2e6GnsgwT3/9Baau3+TC+XxBzkEUZjcil56vVJ9eaWICYLWlsZ003TZjC0wtSLYMC8nj3hbOH
	nyAWLaDU1cWrTocJNyLKx/bG/YPBQCq6cGXNxHQf61t0/lPwcWTKDDwjxnIYeHl4mMWTX3gX4JN
	6Q9YOgMTVTmMgzjQNB9GTruFJnP3+5hbkbs1Y5/7bu4o0j5wiIj9mAHubptxMs1A4teS/Phpouc
	4qbdMA5FQGO15js1b0JFEzAir3YZXppuMcvlmo/inhYwKdt+dZLvB/LuqAg/YuVQ5T3zjL75UHl
	5HX72lkM10poGmTtsOTTLyrG9RqthnUoBmKuipJSuWuQuEnNMN7DjVJpOkusv8FdwZWjoBkfNJO
	njdgNHlitnocNMzWNZurhAyycwH7hVsuAsIeOAmnerVZFgNkbXQSWCTzqhU++jXwMA6QUE9LdRy
	NEIIoY0tjsnDBTTv8eKe1gEYhqA=
X-Received: by 2002:a05:6000:4b0f:b0:48e:d7c:4bc8 with SMTP id ffacd0b85a97d-4abad6a1782mr21438558f8f.7.1795443327853;
        Mon, 23 Nov 2026 06:15:27 -0800 (PST)
Received: from localhost ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ad6403fdbbsm15815535f8f.15.2026.11.23.06.15.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 06:15:27 -0800 (PST)
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
 boundary=d4d0d8ea600ad9a6a0e804d6ccca97eae7564ecdc87e5749b6027a98fdf4;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Mon, 23 Nov 2026 15:15:25 +0100
Message-Id: <DN2NJH234CC4.2LSWRSOO4TX5I@gmail.com>
Cc: "Namjae Jeon" <linkinjeon@kernel.org>, "Hyunchul Lee"
 <hyc.lee@gmail.com>, "Alexander Viro" <viro@zeniv.linux.org.uk>, "Christian
 Brauner" <brauner@kernel.org>, "Chuck Lever" <cel@kernel.org>, "Jeff
 Layton" <jlayton@kernel.org>, "Jan Kara" <jack@suse.cz>, "Darrick J . Wong"
 <djwong@kernel.org>, "Amir Goldstein" <amir73il@gmail.com>,
 =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, "Lauri Gates"
 <lauri.gates@gmail.com>, "Christoph Hellwig" <hch@infradead.org>, "Dave
 Chinner" <dgc@kernel.org>, <linux-btrfs@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-fsdevel@vger.kernel.org>, <ntfs@lists.linux.dev>,
 <linux-nfs@vger.kernel.org>, <linux-api@vger.kernel.org>
Subject: Re: [PATCH 1/3] vfs: use goto out on error in vfs_fileattr_set()
From: "koraynilay" <koray.fra@gmail.com>
To: "Andrey Albershteyn" <aalbersh@kernel.org>, "koraynilay"
 <koray.fra@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261122000856.536902-1-koray.fra@gmail.com>
 <20261122000856.536902-2-koray.fra@gmail.com>
 <awP8S5KF9v-nqWVY@aalbersh-thinkpadx1carbongen13.rmtcz.csb>
In-Reply-To: <awP8S5KF9v-nqWVY@aalbersh-thinkpadx1carbongen13.rmtcz.csb>

--d4d0d8ea600ad9a6a0e804d6ccca97eae7564ecdc87e5749b6027a98fdf4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Nov 23, 2026 at 9:42 AM CET, Andrey Albershteyn wrote:
> On 2026-11-22 01:08:54, koraynilay wrote:
>> Switch from using if (!err) { ... } to the cleaner if (err) goto out;
>> in the main body of vfs_fileattr_set().
>>=20
>> Signed-off-by: koraynilay <koray.fra@gmail.com>
>
> Looks good to me
> Reviewed-by: Andrey Albershteyn <aalbersh@kernel.org>

Thank you, can I add this tag to the v2 version of this patch (since it
won't be changed, and link to this thread in the comment section of the
patch)?

Thanks,
koraynilay

--d4d0d8ea600ad9a6a0e804d6ccca97eae7564ecdc87e5749b6027a98fdf4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSgVimKafU5DQMcjcDmj22qf5IGXAUCawRKfQAKCRDmj22qf5IG
XGk/AP9j2YLEmAts6UKmrX6qw0EDoHRjv0eLrfHDRJfhkjSDdQEAixfLgqqT3tMt
wDbEqGGddyloPl2sCvNgcE83htldvgM=
=8yb/
-----END PGP SIGNATURE-----

--d4d0d8ea600ad9a6a0e804d6ccca97eae7564ecdc87e5749b6027a98fdf4--
