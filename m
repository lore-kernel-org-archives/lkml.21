Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795082862;
	b=g6WQKff7BBenY0EqxlG3joFqvnp4tWEdWqVQiCiMNpjaEU6Yi8eigjRsI+HDMcDyrgkl
	 RiI78cAdqxb4op3sTPL8twsBTeqIYm7CLjlTgAyEXUi6pdcSdku/3LbcKh5FhTUOxY0pL
	 XmVkTUNJNof8MmvDr7AyRcqJb9jTLhHx0BTp2iTnBTKaH59acqEioUUqARtq+r52cnEDm
	 ajDqXz6OQT401bRHHq2k8CaAD5PTsDtp2R0zOsbinj6aYGgg0s03DoOvqcMzGnhRxEel7
	 M095yxG9uXJqkvyaf5tLTA0gIJrg5Tl1XKCPz6qNHyjsf8pmmiYmFXoxVApapxjzDiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795082862;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rdNNbl9xjS7fw25SeJHWSaw1USK+R4l2BVmzQBe1r44=;
	b=QwHtRjLCAZUpxgkvaQ47cTsitRII0GHmZnsEInOT4VX9I8Wkwjaxp9LpTwHSAfl5zjEb
	 5O6aI9IgLgADeypKS7EWhsr3Wa3/CJjngCfMtGP5F9V92WUGsvmypi5zu3ScsVSXM+azR
	 hWHxNsnoeozqA+1bh+8gaf/R2CvKwpZiDG0Hv+biUvglW/kGrGaJJzJ8IAN2bm9uddNOk
	 gXw6XQq9ze5gtXSF7QJ+CPOLrJ7yTsXNBvL5Z3dFWTNMZcE12sLH2X13xRZFk7mOfcj6u
	 i7cqMx5M6hjiXZEbbvVgf1PsfxLo+emRS+CTe0Zn2C4n0UajhV5T6F4jHn6Pk6uDdZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="GwHJqmL/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1DC860A2602
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GwHJqmL/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50EC31F000CC
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795082862;
	bh=rdNNbl9xjS7fw25SeJHWSaw1USK+R4l2BVmzQBe1r44=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=GwHJqmL/daSbnsD7Jpppugk7O7cBsMZE0ILmiEitcaran+3uPzA+t5RTOslQ8M58Z
	 UG7a3nxtUxPUNxN8TbkDCgA6eJb19mv9zkLUxdAt5eNlz4/L5q7eD2kWkEdYAeX3wF
	 oYKZXHtIbEusg4E+1WfNhdFkn+mWUWL1he4WpUAorxNT3RUasq433zYa9+l56eqwHQ
	 8T5KiSMf+8baKdUV4kIopYOgBPhJWld5hpuuDr7ROxp3MQt3mIQ54gVzG1rl/ZLDYm
	 L9DBgUQ+NDEjztzXDP8K0BTBC7seHkXnVsPmXxN+41c1vobLIkG9khccB9tckA7rOt
	 TvF2qoNuV8jHQ==
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-706113e92f9so1238181eaf.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 02:07:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHzfN8Cek3PNkVfAPt48fMNyZPXkd2c1/tT57wDYXDz0z6r+FjDF5ShXsUY/T/S14vZ4auY/IKfk8wQHUg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8e9GELZ0t6oTKgv9akU4Xn3zn3FhjWoQOrMjA6thw8P0jrF81E
	KTEJSFPCDRtjkZgYK0TCxm/4JlSDjnxQtUigwBut321Gsg4ETJOwbWCo7bk0/mPAD262sLG0oZ/
	3XSuL6sjRaeWY6R4D3ReJ6r/qEfDzxsU=
X-Received: by 2002:a05:6820:4887:b0:71a:fcbf:2470 with SMTP id
 006d021491bc7-71b18487cb0mr3689287eaf.35.1795082861721; Thu, 19 Nov 2026
 02:07:41 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119100414.13635-1-zihengw03@163.com>
In-Reply-To: <20261119100414.13635-1-zihengw03@163.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Thu, 19 Nov 2026 11:07:30 +0100
X-Gmail-Original-Message-ID: <CAL4Wiirt_H2OK6pBNG4tOZdiVOQQpAJDK=Vo6vkKJsasMw4AXw@mail.gmail.com>
X-Gm-Features: AclHuK9nktjco5gsyxNqtp3kam55uGY77qmevX_EOfaPr5ulVyu6PcDAfnwyusk
Message-ID: <CAL4Wiirt_H2OK6pBNG4tOZdiVOQQpAJDK=Vo6vkKJsasMw4AXw@mail.gmail.com>
Subject: Re: [PATCH net-next v2] net: do not use SOCK_INODE() in sock_init_data_uid()
To: Ziheng Wei <zihengw03@163.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Willem de Bruijn <willemb@google.com>, Simon Horman <horms@kernel.org>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 19 nov. 2026 =C3=A0 11:04, Ziheng Wei <zihengw03@163.com> a =C3=A9c=
rit :
>
> Since commit 5d6b58c932ec ("net: lockless sock_i_ino()"),
> sk_set_socket() reads i_uid and i_ino through SOCK_INODE(sock).
> sock_init_data_uid() calls sk_set_socket(), but its only direct users
> are tun and tap, which pass &tfile->socket and &q->sock. Those sockets
> are embedded in struct tun_file and struct tap_queue, not in a struct
> socket_alloc, so SOCK_INODE() points at whatever follows the socket in
> those structures and both reads return unrelated data.
>
> sk_uid is overwritten a few lines later with the uid passed in, and
> nothing reads sk_ino of a tun or tap socket today, so the result is
> not used. The reads themselves are still out of type, and with
> CONFIG_RANDSTRUCT the inode fields can land beyond the end of struct
> tap_queue.
>
> sock_init_data_uid() was added so that tun and tap would not use
> SOCK_INODE() on these sockets. Set sk_socket directly there, clear
> sk_ino, and let sock_init_data(), whose sockets always come from
> sockfs, fill in sk_ino.
>
> Found by LLM-assisted source review and confirmed by code inspection
> only; the out-of-type reads were not triggered at runtime. The fix was
> build tested only; it was not run against selftests.
>
> Fixes: 5d6b58c932ec ("net: lockless sock_i_ino()")
> Signed-off-by: Ziheng Wei <zihengw03@163.com>
> ---

Reviewed-by: Eric Dumazet <edumazet@kernel.org>

Thanks.
