Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795036195;
	b=Dql+j+DcoCgVdpbfk6ZqykMZWsjv4zUCZ2JE5hf602+gb/5c7hLKestWq38iuXJGTAfO
	 pCBth6xhc74gVHhMbP5wLdmfOypqGgRhnZIivYWAiQ4rSNcloy3ZGHNtB4usihpjmwScg
	 2No74+DrZ1QePjaUz3fW3o1QxeTHMXDM+0M2Afa18vpkU5mTQDyyfZ67r932KgEZ9kPmH
	 7ramqarxzgaHJMVQUpXMzRNnbxEhI4m7ZWn+TNIJM4POBVXMgG4czled85JqBsF/BYGQX
	 VDIgm5clkXkY6rkuLoEnANGBWICvPtodkkU9Jl6fRdSduGEAvss2E+cCbEa7gmkvYOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795036195;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=jr2i5Ws8efXcq7fsLottyNoSDK02f27nflx3w/WwBX4=;
	b=Q/JXy3RTKmw+TC/ocYMVPR0ny/ymCNs7dZpRFudEYWC1Elw7lMyhLxrZKWZYtKb3GXOs
	 2MSov8VubmQtBp/RHp5tnl8IxEYgOdEklQbBTw3UqiYPTwXBdl7fApyFDgWCA9svdOdSh
	 d33wG7mDywipyCU5ne1ZF9q9Sy367/LcvQepuk1HNEhuSlfI5cRBlZtqU5yk8qHsezzin
	 NaK35H/nsmRPovO1oR1sdFYxAuBAJw1SeUI79VaELSk2hpNXr7MT049J0UKzEwc669IRn
	 AJcZO3aatZayGHKrIUKZXOPjW+qOxG+feZ0xYbEYaWmB5DgUn84uB/xUfGnqLouYZkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="e/v+eP0h";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D37606A32F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e/v+eP0h
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70BA91F000CB
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795036195;
	bh=jr2i5Ws8efXcq7fsLottyNoSDK02f27nflx3w/WwBX4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=e/v+eP0hWOV6kjrBAYvATcWqJ/gpTYajGabAuTPKDi7RdPofCoC4e4edajjc5vl40
	 9yfvw4ZdmUN7Uf2c53lZTCOqs505LhW/o4zhZIDc+pnvObwR31spw8mxRUee1Al9y8
	 tMCLQxfN0H8Y8nP2MqZA1EC3Wyb3Hb0imIEt6VKrRrtYYbZ0OfGkb5yehDHQqfy5DZ
	 fNqnR2Ds/v3WKlR+NbSZQ1jSa65a8kBBXS8dDyquOO89DCX7OWtqJiKP51UimA9hNt
	 W+8MYCG0JCTZKPxdOJ8Zz7jjSftDVIP+0zfe7+dV58zgGOzzdco5q6OTz8JltFYLQP
	 EpFBCJR/jEn5w==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3ae2ab35d82so13392721fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:09:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGZz/8KgeGIkMQSgyjWWP3YkIUHuJ7PRPimLWxoWN2RQ9EdMI07QpxYhbRMSUdBRYCXEABCAm/fJrbmCzc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Hd8UnSd+8bJMbcq2yiqUl9j+391ha69DAE4JIFRB3iZFa8lXV
	NbC7Kbx3CtJyRarOrJI4EQp+jFgM4D4mlRPpwIwqnG7VWeSFkwY3GOA3lhRuW07WXK9V2CH4oXo
	nKD624YOvb6ZJFUiRTPrwBVI6BdUhgcE=
X-Received: by 2002:a05:6512:6891:10b0:5c1:b107:2bb with SMTP id
 2adb3069b0e04-5c1b107097dmr214230e87.29.1795036194225; Wed, 18 Nov 2026
 13:09:54 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110083253.1525-1-laixiangwu@cmss.chinamobile.com>
In-Reply-To: <20261110083253.1525-1-laixiangwu@cmss.chinamobile.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 18 Nov 2026 22:09:40 +0100
X-Gmail-Original-Message-ID: <CAD++jLn1P9hT-YH9vM9VSvoMRei5LJv+hDZMH1en6CfFXPB-5w@mail.gmail.com>
X-Gm-Features: Aa3M54qVfEnBQGnC1md9osy2E13w8uoX854ImpVfar6VoMvtX9B4F6U4NV-DAk4
Message-ID: <CAD++jLn1P9hT-YH9vM9VSvoMRei5LJv+hDZMH1en6CfFXPB-5w@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: stm32: Fix reset control leak in
 stm32_pctl_probe() error paths
To: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Cc: antonio.borneo@foss.st.com, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 9:32=E2=80=AFAM Xiangwu Lai
<laixiangwu@cmss.chinamobile.com> wrote:

> Signed-off-by: laixiangwu <laixiangwu@cmss.chinamobile.com>

Fix your email address in .gitconfig please so you don't use
your login name as name.

Example:

[user]
        name =3D Linus Walleij
        email =3D linusw@kernel.org


Yours,
Linus Walleij
