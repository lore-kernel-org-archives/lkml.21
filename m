Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795631766;
	b=DOVdzoEt4IcO8jEVjgRI7rYDO0HggP7GU5Q3clA6J3FkAhuoi9zmR0Iyn/YPrqkMrtTX
	 +DKEjHFhkdStt0Fb+5rWox/0PuTZIAWCFsEGC6ypPW0F2v/OUWvDmh2FmQxAUbmMdlY+T
	 3lPTMOHqRosWi2G4/fDEbfbFHiGTrPqyruEEtkWU8+71SEwSt1KG9KMFphDv9Z9sDRW+4
	 qRTcOgtrewZsTWA5oCw5I3fQDoE7As2QMcv4MpAQM/eaWNcoXo0HhL+CBV1TBIt4qY+d4
	 FPVIGACJLaJHjhMQkYNw5gQo2z3M48ZA5N5C09hysMi6y4YgRrQ5p8izDHLe/Gj8Nnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795631766;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=prrX32fJ5wksd3jSdKGTMIlOF4TSPJHLdr5EwTLREDg=;
	b=kO2C3n2bETW+WAhRZ9MN254QrKuTxDt4NxQalId+rS4n9ChbSOVGpB4cltacSgr6jTs6
	 DX1rXtoOOo9CS36EYqZ0DPNdY6zH7XNWq+LbLzGlBOELEmHr/HqL+scraJDNib+Vv3v8B
	 YCrQNrf7o4gH4GPER9ynvNQlmQgWF/jvUMEv4KAKI8mdnFzuRJGIe7lnJIhOXU6jV3QiF
	 DTrpKZ++laNMNuGDT6qD+a+CkUwpuOx0PiRMhmlWfzXT1E95TuvtY039zvKy5o2O/kPwu
	 xQERFgUDHdv0kWim2Asb3C4RSqHaOCLyzdqvNcN4/CMVylcspKhqr+R4Szfp7awU3mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MKwKUi1f;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40348606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MKwKUi1f
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F1B91F000D2
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795631766;
	bh=prrX32fJ5wksd3jSdKGTMIlOF4TSPJHLdr5EwTLREDg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=MKwKUi1fJJvcCPVdLLxu8p50q0lnzCJf9bfKw3VLUaOnYBTQeZVi70M9Q58NAnrgN
	 Q579fHlrscQ8TCiJBKkDa1/WHtu40DMUvC01Rud71CSQqnqo/hMXAJxqJtF64KqOlT
	 33cT/TxT0+HgAA6PnIfL0jMWqkVu/aQeb391FcsZUts2JlnFYJF2VSdrg7tx+gdI/h
	 8Jyb6qA5oYxFxfTtbxHBWl7dhKSC5Hw3Y2qoMMHAoupwu9/d0AdzteuIwZFsYm5888
	 Ym5VngmyEn9Ipj8Y8UhpLvSOQFRw1PBJ8O923JC1LbqbKNxwArgV6CR/wtKnTYTHPX
	 rpQUJHgZi3uxg==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3afa1c39d76so9126571fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:36:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE0GOzxZRehXWod77xf9a4S27MbkeT/J8fvsDPMQYdtlRxuxzydVCtC6swsBuaGE7z9LvmOb9vGpSKfuas=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mkMJnvQcWYwNxz3lONorcufll6ZFb3dWUi7u3KDKwR9h4fqfg
	s0PzWjhUgUemPyrcIv2mSSnxwIdHh/sZmymlZHcPGk0vBxXYkFeXHcPnuYmx2WgM12tRZOrOIwA
	NpAJjKKqosYnad4yXAPhxm79JzURQMOQ=
X-Received: by 2002:a05:6512:1585:b0:5c1:4cd0:16d6 with SMTP id
 2adb3069b0e04-5c1bc9055eemr5174503e87.65.1795631764829; Wed, 25 Nov 2026
 10:36:04 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119204748.2558209-1-lee@kernel.org> <20261119204748.2558209-7-lee@kernel.org>
In-Reply-To: <20261119204748.2558209-7-lee@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 25 Nov 2026 19:35:52 +0100
X-Gmail-Original-Message-ID: <CAD++jLmAsPibiNju4HzAYztN96fwdErzZa2DS1tyThiUAtgzXw@mail.gmail.com>
X-Gm-Features: Aa3M54qVG3vyGiBbOuH0mxEC3oK27vU7UJnEn5z_uqUEslE_IpB0bR_gdzrAv9A
Message-ID: <CAD++jLmAsPibiNju4HzAYztN96fwdErzZa2DS1tyThiUAtgzXw@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] pinctrl: mediatek: Prevent divide-by-zero for pins
 with fixed drive strength
To: Lee Jones <lee@kernel.org>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"Ryder.Lee" <ryder.lee@mediatek.com>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 9:48=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:

> mtk_drive[] only defines entries for DRV_GRP0 (1) through DRV_GRP4 (5),
> leaving mtk_drive[DRV_FIXED] (0) zero-initialised with min =3D 0, max =3D=
 0,
> step =3D 0, and scal =3D 0.  If mtk_pinconf_drive_set() or
> mtk_pinconf_drive_set_rev1() is called with arg =3D 0 on a pin with
> drv_n =3D=3D DRV_FIXED, the range check (0 >=3D 0 && 0 <=3D 0) succeeds a=
nd
> !(arg % tb->step) divides by zero.  Similarly, mtk_pinconf_drive_get()
> and mtk_pinconf_drive_get_rev1() divide by tb->scal (0) if the pin has
> drive register fields defined.
>
> Return -ENOTSUPP immediately when desc->drv_n =3D=3D DRV_FIXED.
>
> Fixes: c28321979ba8 ("pinctrl: mediatek: add driving strength related sup=
port to pinctrl-mtk-common-v2.c")
> Closes: https://sashiko.dev/#/bug/linux-d3852d37-6806-4c41-a493-f249dd59d=
0c6
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Patch applied!

Yours,
Linus Walleij
