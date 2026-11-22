Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795346344;
	b=YNsjakOgwIOawZcrv8mE/haraF8GQOsRuVa1vRzSpz9PmeFhCcqU1tgzwTHtPtzMOnUw
	 NjHkB688EFfgcdN9MA8CbCpwv6d4RXy1XLaCxp1YddogdwaD1y56FUai7vbbzlDyaFtnc
	 NQXN0dcNZd47z4Xi7haj3JWB/K0YbRKIR4M7BcQYJl9oeze4Vr7e5m0Ae30+7ZIlGENNE
	 3DEoIPvpdraHx2vOJFWmJs2GDXStiuhjJiQT6Z8RIGJxJLVxmM7NXkeYtlRMCxFmMkqCZ
	 zXUVAZty1QxdkEoL7s6liPjM4yVueV1xC8TO5tFpyhIFVNcaxI9aSDtxOlwRcrnWetA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795346344;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hyHy++0zL/3iZJh4EWGXxPjXDqs+oXNpItpwmf74lkQ=;
	b=rqufuFfjSvj4lfO4aIztldrj8DbJk5aqmqvUdBD3/n4T+e/mc+IRVDqfkBCxeq7UR4ON
	 LQ6nq8WVQVld7OKJzH8WMJM8DrVGX/3nNtvmtQHOBFtD0uUUnpNnN6t3WBH7cBIwckX4l
	 1DaSscUi8rELrD/3R30RYBbiBbzgisYiIPSkyTx9xghsbuVWcBfCCG/kVaCytQjapLh8h
	 KncAdo6OTpCjTt4bdw3ECva7KiMvI344lh8S9ul/sf5a1IEe/XuOkILrM1yoUSStoornl
	 jH6P6LqxHrTR5kQGU/inJFXcr1bg4A6OwZaauX281MOSympZkC+akFjwZyjwqlqxdQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OelbFzPT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E63606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 11:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OelbFzPT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD9831F000D2
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 11:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795346343;
	bh=hyHy++0zL/3iZJh4EWGXxPjXDqs+oXNpItpwmf74lkQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=OelbFzPTbuEPZOvFP8JotWpHR2OBndlgv47AO+EhpAp7bI+5vQXKp7APS97YXDmoC
	 9kDIkzZtFEJIYXNf8unOU8/Yr03fRVbZq3VjHC2BVWlEIA5YG1wrhZczuCfcshaj5f
	 r2a2kSIzUG4qpX4u54yzbbPUV7G/8uMattnpOJMnklFZtxTiZysgJiUHStKypoomzC
	 VZMoDCrqGhfNcIpnE6H/rupBj4DOS8+RR6ZOFALlzhSVX+XmhaFHCKvlHfMaqG/9hj
	 5dYYOg5Hk3KlG74k5yn+OSyiRqhEz/oT/LBOlZH+uI31JCPH/0B9AImpYu7mnXUK9e
	 UTbVy7pdT+56Q==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c516a574bffso52621466b.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 03:19:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGafvq9db7UDIDE8dl2uFwVbzqNmR9wkjIHH0FqKByKGkro8Gs6SGcnlfHgnlN5ZApN/9/whNq7nJf7J0E=@vger.kernel.org
X-Gm-Message-State: APuU4Z89937cW8+qcyZdSZe4cuAj98B2LrnfQd1VouayOKMimh+DXYOA
	y/uDn40ZrmGE7rEck0MgBEWm7IOPVOzqH26w0phrhUC7pI6hb2au4bdlGa/VK4XixCc7ICxHyOM
	ETq4NRAhzc1FUAeR2W560lh4K5vcKVSg=
X-Received: by 2002:a05:6402:1ed6:b0:6ba:8541:e530 with SMTP id
 4fb4d7f45d1cf-6ba8541e8ccmr1801725a12.45.1795346342461; Sun, 22 Nov 2026
 03:19:02 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118090701.1858849-1-wangxuewen_ky@163.com> <20261118090701.1858849-10-wangxuewen_ky@163.com>
In-Reply-To: <20261118090701.1858849-10-wangxuewen_ky@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Sun, 22 Nov 2026 20:18:49 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9YHOVPzk771JSBfMcsva0EeHn-gmJguPQFMcCtm7QXgQ@mail.gmail.com>
X-Gm-Features: Aa3M54oYX_UHhy0oWnxJo8zFfoutjullRupWp8711P36a39MDXckKM0fkGi6Uyo
Message-ID: <CAKYAXd9YHOVPzk771JSBfMcsva0EeHn-gmJguPQFMcCtm7QXgQ@mail.gmail.com>
Subject: Re: [PATCH v6 09/37] ntfs: serialize export parent reconstruction
To: Xuewen Wang <wangxuewen_ky@163.com>
Cc: hyc.lee@gmail.com, liubaolin12138@163.com, ntfs@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Xuewen Wang <wangxuewen@kylinos.cn>, 
	Baolin Liu <liubaolin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 6:08=E2=80=AFPM Xuewen Wang <wangxuewen_ky@163.com>=
 wrote:
>
> From: Xuewen Wang <wangxuewen@kylinos.cn>
>
> Exportfs calls ntfs_get_parent() without holding the child's inode lock.
> FILE_NAME lookup and parent loading can therefore race with rename or
> rmdir, despite the function's existing locking comment.
>
> Hold the child's mrec_lock across the lookup and parent load. Release it
> on every error path and before d_obtain_alias().
>
> Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
> Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
Applied it to #ntfs-next.
Thanks!
