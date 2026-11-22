Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795344715;
	b=hSm/v33IDj1lx6L7ReeHpxUvyUNQp30SkDgxungFZ5mizKb4j+WUaXF9oD4lpuz/r4Ex
	 utU/G+0m2ANsit4IfSPno555r6fh/JLGY1S2n7yMFJZO68gpSr+RXq3H5J83VEhWu50QQ
	 I+gVVjnFFUvgLIZFyH7+c2ULZMPpD4FIPo0dtYpSDrZlF/VD5KYaI8hNrNTyXs5RlIU+R
	 kOYHlM068Vpmz/F+V1L0Pp7eKWHCYW4dKc/gCVCt/W1IZDy66n6FqFoWPRU7XOuUKDL+Q
	 swc3LQwFOgX8UaVfjYtvPnNa0/BwzBkLz33J7L9R7ynrux+9Tqc7GwrcuCJ86nuuKWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795344715;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+jU8K94xAjYiywEJ8VshTm6rd9DxC8pS0Hn50pv8F14=;
	b=1PgVmLrtRDnGdJogCN7jHQjaBIee9D84VZHW1vTx5kPT0flO9oDdU99xGUxjG3JNnxKN
	 aJAXUuBd7OsULFQGPnznxTfkeFvUVdbOLG7954dYa0P+agsxQq/3qFg1zZdijhHu4Ts1b
	 nJxmRyRRtsL8KRUlfQ0bDAMHjiN1gasAa6r5jU+DDk+msb+dlwrRcrsTiiHFS+jCFvSHV
	 IgPORswoUzsmndsjI8Yz9pBLUF+TF3OIPqTz4zVBFvuerzj3oVs1dyOuv+26l/Wk6+dg2
	 RMxqFkslQqS9rSkBo2xoY0A799OXh6msZd+OEBO2yiZ5U1nFM/2hRC8vKZqIo2wzpVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jck99Jkf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CA1606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jck99Jkf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02D9C1F000C0
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795344715;
	bh=+jU8K94xAjYiywEJ8VshTm6rd9DxC8pS0Hn50pv8F14=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Jck99Jkf7qoMf0NC8HWi54nesMdMXBVUUuPpE7DWPRu9htDqNilP40sHKQndGf03L
	 cYuW3314YaUi7EWP+TKcs9YopYB8meL2/KZvNOze8GCxSyuPFGD7bdGcHyCjJCmcrv
	 DYW3aE0FGPc/nqfVaoowrRe7XnQ1CDHBqUTMRGqANgfHvPR+pgHX/yWGF22uQBXFgJ
	 Y03Z9SYYpLhYiaS5LmZ9yhZdqDOd3WghSP0vBdBMlgmY0oEOZFKOqA7DVF8lIhKbx6
	 EuqvmZ3rXmftfByClfLJVeI8l8UhGyQElUoOEnW66rlwt18x+STutsvLXDJMHk/yUM
	 gIzzE9HxSSE1w==
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c516a160d24so49889466b.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 02:51:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF1wUwsQIyPC9pXI0h3iF4vWcJyeZj4yvYWwmuInEO2SYKkbWgwinblu7a6+JqTkAz3o+V3cT3PuOrxSfc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9KszTS2vkjGCzh9Nd4asXrd/TFLwnMdAqb6Gb6FiiOZs65RZf+
	pTI1Vos+jZUFYaSJx/j76On7BEIgnHGR8gKzNDjl7nvz+5v5D4iXyizuws0gAMS88jX6MWqTo9M
	GzDWUZPYNuJtuWj/zebDYtGf0o1OoD/o=
X-Received: by 2002:a17:907:c641:10b0:c42:e6c8:e494 with SMTP id
 a640c23a62f3a-c513ab47855mr475814666b.37.1795344713676; Sun, 22 Nov 2026
 02:51:53 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118090701.1858849-1-wangxuewen_ky@163.com> <20261118090701.1858849-5-wangxuewen_ky@163.com>
In-Reply-To: <20261118090701.1858849-5-wangxuewen_ky@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Sun, 22 Nov 2026 19:51:41 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_LEPWSSHrHXJn-X7SoCxrrdGarcyo3PFBmWN=pM4mMaQ@mail.gmail.com>
X-Gm-Features: Aa3M54ovR4WvPkRinwSfIvYlrrzdQdjNbVsoP8jqjOaQP__dGiofWVR-b-7Em5Q
Message-ID: <CAKYAXd_LEPWSSHrHXJn-X7SoCxrrdGarcyo3PFBmWN=pM4mMaQ@mail.gmail.com>
Subject: Re: [PATCH v6 04/37] ntfs: preserve attribute search context
 initialization errors
To: Xuewen Wang <wangxuewen_ky@163.com>
Cc: hyc.lee@gmail.com, liubaolin12138@163.com, ntfs@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Xuewen Wang <wangxuewen@kylinos.cn>, 
	Baolin Liu <liubaolin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 6:07=E2=80=AFPM Xuewen Wang <wangxuewen_ky@163.com>=
 wrote:
>
> From: Xuewen Wang <wangxuewen@kylinos.cn>
>
> ntfs_attr_get_search_ctx() returns NULL for both allocation and MFT
> mapping failures, causing callers to misreport mapping errors as ENOMEM.
>
> Return error pointers carrying the original errno and convert all callers
> and the documented usage. Clear error pointers before shared cleanup.
> Make ntfs_attr_exist() return 1 for present, 0 only for a lookup miss and
> a negative errno on failure. Update the index and reparse callers so a
> failed lookup cannot be mistaken for an absent attribute.
>
> Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
> Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
Applied it to #ntfs-next.
Thanks.
