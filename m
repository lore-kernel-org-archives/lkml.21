Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795847031;
	b=UjT+2s2qxREvaA5COoZ09fRlxRu4orwz4X9GD0Tfcqhsrs9hs6giCTyJ/F2cGhrVWuUN
	 aPsd5Ab+kszyOj55cmBMqlpHp8i6mI1NiAJ2z6eTpk0qxMhXZIJI/tutRNEX8AHHD+wGK
	 87ayOICiTkkyXezB19TMbcFg9ACBAYXh5KjQc8D+TgZLlqC7jgAXMx9HpDS5Kohwz0Ez4
	 7/es4XMxA2KDIDGZ2dE1E67yvjinj63HFukM57aApWqgGdu4vOpGJRTqAA9TJby+NW0l+
	 zx7lj1eI+uR5Ai6YonTb1fSB9s4Hn/hukob16n32ce/MEUjSx5dyEuOPrw+rh6AqaoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795847031;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HP9YpPstHQsS2pBvnT8vtHxMveIHDezOw1ggWURVis4=;
	b=09et4sLZNnu2QuH2Xe260QLqSfDGsEp/rpTK6q0SycRuAoc25RicgMMgThu3AFjq+71Z
	 5U1qJj7+hCnRYgSSBbAzQa7RyhJTPovHSIsOo553bnWP8RBAJZLakqgLbRqenwoI443qQ
	 BubpXyT5EWfqozayp3zOWSzDDmysNrvvLZ1fr58Ak3vX1VshC4dCxPIaGSLnSRNKw4SY/
	 7F0rDEUIYRw6Uz8v7iMdv0itcI7eZSQvIbw6GP+mP9z2Ws5lV+Rzje/nfxme99Bn9bR2+
	 kTrZ1GOM/1vs9c4Mq1gLY2v1jaJdzieU8f9pG5flsKsUVF9WQdCIbVt+NbfRT2Xonvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TnSRteEK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21860606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 06:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TnSRteEK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6DC01F00893
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 06:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795847030;
	bh=HP9YpPstHQsS2pBvnT8vtHxMveIHDezOw1ggWURVis4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=TnSRteEKBi5+5l6x1GjVNyXrgUxRIZe5QVUou9H9gs709Z1bR/3IEzKDyxpXg9DMj
	 PfkCCFCqK8McaYtdFK+i65QC0kfZkdfp6HCG5ilzK6pvTrbuoJd/8ZAJL7YDz8Cdxm
	 oJjHU2q7tSdhG1li9xErqhUwzupACUWZNWHlKunc+bgWtp5+2CqF0sOZcPeiVpxGNO
	 P/jCu2oWq2c7xDbA017fiIOtPFu/voQWVn7Fh0nhOrRNGGCC/Gfh8mKTACY3OfKWSl
	 sPmy8jNosVcOAfTokmheER7L/K2cYP5BVytpndhpReBtL6ygZS7FvNlPo7QBfNFsbY
	 kZufn1SDI2aPg==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c5127c7abd5so1338433666b.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 22:23:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGPTulfpSGO06ZNnJ78HYuo7eV8OERA6tFJp4J48YYhNc1214Yf3XFHEtn7ztv1lXc0QGCc5VwgDcuk2wE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rsxYqnaKaIG9fSvb5JJYXtI2C4jnbC262eoxS86vBVKMXUOJ8
	befunhHicbVN6HQUVMmx8ZyfowhCaOAyz8wulHfk9OwbnjJ9MjNHvDKFwB7gXOAQEcFG0kEjp7u
	bpHTySgoaB9676Q4/0JzzZdaB51ikRnk=
X-Received: by 2002:a17:907:6ea9:b0:c46:645f:cee2 with SMTP id
 a640c23a62f3a-c513a3ab024mr2327095666b.4.1795847029415; Fri, 27 Nov 2026
 22:23:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261128013952.1691873-1-icb@fastmail.org> <CAKYAXd-qC2UZbsOUEWvt3mhViwOyvHEqHt9hLK5+aiiuMC-4iQ@mail.gmail.com>
 <20261128031631.1713665-1-icb@fastmail.org>
In-Reply-To: <20261128031631.1713665-1-icb@fastmail.org>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Sat, 28 Nov 2026 15:23:36 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_TEwt3fDdXUme28HK=KcBjkyYiU9xWdE6ZjuqNifBBLw@mail.gmail.com>
X-Gm-Features: Aa3M54p5HaVxjWOJRYeYz-YfvbE3jrdjd7jCcoLAMtPaXx4muAmsAfg2_ifRP64
Message-ID: <CAKYAXd_TEwt3fDdXUme28HK=KcBjkyYiU9xWdE6ZjuqNifBBLw@mail.gmail.com>
Subject: Re: [PATCH] ksmbd: return the cause of a failed link
To: Ian Bridges <icb@fastmail.org>
Cc: senozhatsky@chromium.org, tom@talpey.com, chenxiaosong@chenxiaosong.com, 
	linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 28, 2026 at 12:16=E2=80=AFPM Ian Bridges <icb@fastmail.org> wro=
te:
>
> Hi Namjae,
Hi Ian,
>
> Thanks for the review. You're right that passing the errors through
> does not handle all the link failures correctly.
>
> I'd like to propose one default mapping for errors from the VFS, shared
> by the handlers, with the link path as its first user. It would cover
> the cases you named, STATUS_NOT_SUPPORTED for a filesystem without hard
> links and STATUS_TOO_MANY_LINKS. Results that a handler carries in an
> errno today, such as -EPERM for a sharing violation in smb2_open(),
> would set the status directly instead. The other handlers would move
> over later, each in its own patch.
>
> Would you like a v2 of this patch along those lines?
Sounds good, thanks!

>
> Thanks,
> Ian
