Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795048503;
	b=J3M3neNjuyaC7IeGxmog9aLJwB4dIBqc8cWjNmtPEiYhhnBxM8nQc1ywU5x6HlB9m9QF
	 22D3pQQE1tL7CVQy7ynxiooUy3HOhahFXoazdHAucbfUaSnqZHVqhlJk+8ityqhhiKXBM
	 /DBoxzKgiVt5C5+NVLi6O2o4Yrdw9ExwvZJk+HC7GCo95DI40A2bSDFAmZ73iNYc0F66B
	 dCPx7yXsE+Bqiu14RazxEAH9wcnmqFNT5E2+Wb8E1q3Ob8KC/x2bMsdmIJSw7Fhzfs5l0
	 eDMyjwTX+FMImpuVa52mNHqfG03Z/rvzb899NGth1ZKdqUFb9qlEVfuWyV4OYZdWxuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795048503;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=MBBdgGDR7k0GmtCp45XGw03/tk3C3N8PKF7SzK43N5U=;
	b=Q4isbf/O1MKElnhkapTIZ3avigqrjA+jSsQTc8Ecga+FZnBWoakhjhPADlNutkG5Jp5L
	 Y4p5ppnQCnZ5aXATOpLxMQ5nwnxYKTto4KkQcOsgvZhExHTVW4iB7XdFhwmjLliz0r8BW
	 ZZ8wqR8nmxAX8cxZwZDxLij+PFVZnWCl8yireC/wYRUCQV0x0XH+HJ9NqvYlhMosjzbBu
	 MEdnvoQghX+Fw1MvKeyfFH37NOvymfzGKw03jqAf7RAmZKvtxLc32z7Nd910jVlTLsEJz
	 5lwNkrzIFxuTPMiiLKrKjaogFGlavFQu/FWWbkZ6j/3+IFE5yO5o3P6ThMMVbETp0cA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hzdZfoOz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14559606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hzdZfoOz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5A2A1F000CA
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795048502;
	bh=MBBdgGDR7k0GmtCp45XGw03/tk3C3N8PKF7SzK43N5U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=hzdZfoOz4qhWIzfgruDW1Kd+gft1453MXvX7LgOndhJMKzkuW7bajHsyoNI4vFFEy
	 35C3B7xRaej32NwRr0CIJIsPQlhjCgBOc/d9antnXYkHB4Ly+PjIF3vek2LprObnXZ
	 dA84J4lXBePzLxKz3NwVFD4e5nlB5V+RZgGD25rpRsD6I/LHJ1ytwQ2vQkAZJ82LVh
	 0p2NF/kSGjeYoKbo+H/nEtfQoRGSpzTx07vkJeCiuKb6T9DiiadItZAZ7BfD4er4jf
	 43BZbYwB2Z4s7Dk7uyz5MXBeatmUqbgiShw4HNaLmJ5w1tS8GL5hZQdY3lADZ0XMyO
	 kg7KLNwdyoG8g==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c5118deebcfso184478266b.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:35:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEl2T1ZTyvwAKwctff3/cmTR5gb9WbJgKeYrCvIhNhQKNhZQPG5bFVA3lC4+hEW1YtrPubctPTLkR1fOHA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+Iqh8RXlH6G9fAbl24OzwZnNC/qNk70xKs93l4/kMrbYe1mhA
	vo1YvlrBQJgl73joh/AztVU0GJvCWQdzHXcz5DwKKy1V2RUPEzE7SuVdsjKWr66DonGmwBmMyjk
	1IK007C28f3wjAIhXw/93Ib3BZdfi6nI=
X-Received: by 2002:a17:907:9811:b0:c2a:cf73:63fe with SMTP id
 a640c23a62f3a-c510debebf5mr392519766b.6.1795048501493; Wed, 18 Nov 2026
 16:35:01 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118174000.76954-1-icb@fastmail.org>
In-Reply-To: <20261118174000.76954-1-icb@fastmail.org>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 19 Nov 2026 09:34:48 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8FnWOeohb9gzST+x0oe6_QK_=JqXfqLKZYzzq6Z8EBzA@mail.gmail.com>
X-Gm-Features: AclHuK97zaeMYjWZZ83Hgsf-wGk-vKxVOO46xSw5KQzFmTQ4PV1AujEyr7nL6Xs
Message-ID: <CAKYAXd8FnWOeohb9gzST+x0oe6_QK_=JqXfqLKZYzzq6Z8EBzA@mail.gmail.com>
Subject: Re: [PATCH] ksmbd: clear DACL_PRESENT when the query omits the DACL
To: Ian Bridges <icb@fastmail.org>
Cc: senozhatsky@chromium.org, tom@talpey.com, chenxiaosong@chenxiaosong.com, 
	linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> @@ -1077,8 +1077,9 @@ int build_sec_desc(const struct mnt_idmap *idmap,
>         pntsd->sacloffset = 0;
>         pntsd->revision = cpu_to_le16(1);
>         pntsd->type = cpu_to_le16(SELF_RELATIVE);
> +       /* DACL_PRESENT is set below when the DACL is requested */
>         if (ppntsd)
> -               pntsd->type |= ppntsd->type;
> +               pntsd->type |= ppntsd->type & ~cpu_to_le16(DACL_PRESENT);
ksmbd can set DACL_PROTECTED or DACL_AUTO_INHERITED as well as
DACL_PRESENT. But this patch only removes DACL_PRESENT.
Thanks.
