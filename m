Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795631729;
	b=B8e1aANjrPLhY82VBX9YK7SPE9QZ7nmKcevBL8s/QlL2/4ipL/aRrm7Ulp9HsUy1+QtC
	 BtsjkKKcwr57VmfCKC+9MOFyAM5tFn6I5+SZFQdhHhh/SD7oH+a+LB2SQxshyu1wJGQzu
	 C6AnpnZo/YriqIB18vlhp/XCOOgbDxpvNAmDP3TGGe8uIAvWaCpulBNfPED8w93I8f+js
	 QzCSHamZQfkKPg4wge0iWn38zT/u+LRbO8m967YbXRnjPnOoSoVU7T0U37mCSlv2ujrbS
	 R/b1GW/kn4VviIYg6m5pHjFWlqcxy4hoMQt4Kmw6jL/zxonlIuj5KvuHXyLsaQrD0Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795631729;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9xVD7bdz9+WmMAUxY10TyWuzNNqlkKipL2zUO5K9vKY=;
	b=WiNZoZCiIFpFFjKZpUzFtfry0S6FM4aHH0+jBYmm82zG4uScF0AQxRpYZd1SIxdGHkc0
	 gSqR6nP4+NoKRnSVrUWFeX95Kgkqavy2ETqGmIQL2SvyLaF/l1lnMNZIGCqzp1qrZPEpr
	 n0yhAkbkRoQgsRYmxMWbJXKxGQFTFD2PEjt5I+lUASx4C1FVDzz6UDJ47IqvoARBi7/S8
	 XZtsuIi3/m+sVfDCsjr6IllHPMggQUXoh2qp5kzoS52XDZxhkpRLh/Usk8YSNyMj0sy0/
	 5hCue5hPRRyc0HnIUeZDSeKhhCsIVxjcHszDsbqfl9A/82QDjeUOwnmu46m6gq3OMWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Se44L7Q4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6E3606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Se44L7Q4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9235F1F000E0
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795631729;
	bh=9xVD7bdz9+WmMAUxY10TyWuzNNqlkKipL2zUO5K9vKY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Se44L7Q4cJUXGUkTEzWkUfaYZtmSE6mglSqozkwjpXGe25j0WfPbfVDEuR+zdqMSo
	 +o2GmmVafalPbZPHZPxBFUmdC3o/h2ruPQT2dDO3Zv1pg28lG0J5weslKOmg+EwG+Z
	 NNRKA16MLuY2hkb/A7a4lIJzuioAVut7n9LtTYVzU7H4zOY66qVzTsyyJ1wp+nHVqm
	 PzW6MG9aopLXb/fzYrO924LnIfnCOlSdXmhm7j3qXS5BDdLN30oJsQJhI5GiyM+2dz
	 nGQc8G9kJew6QqIDQPjbb43XIFb6PzaB1cS2Hp51up7jhxHOBGEhY/qP6Gv9WiigSj
	 SYQ1O3gm/GHMA==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5be53e5fce1so5623987e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:35:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE7lWdAGF97Ke1PUyLPv5CdWMOntYImfCTOgsvX3TYuhAncW9g4lMFgRoxXg3Qkhsw7PRgOs4pLE7UM4fg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8pxgQMLX4yZ9uLHwNu4EfXSu8hLQAP1Gxao9Smb9wiW+cFveet
	K+cmK4RTAP69ioyFBQ4ScYkZWR5e0CewEN6bwvx6TYiGI4D/OQSx78Ee/OQ8Z6YTXBFw/qf8uvf
	4/GXV7qTrrNQ1t1Vmi9b/FoA2Chkl9vM=
X-Received: by 2002:a05:6512:3ca7:b0:5c1:57c1:bc89 with SMTP id
 2adb3069b0e04-5c1bc8c6d32mr5057176e87.65.1795631728358; Wed, 25 Nov 2026
 10:35:28 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119204748.2558209-1-lee@kernel.org> <20261119204748.2558209-5-lee@kernel.org>
In-Reply-To: <20261119204748.2558209-5-lee@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 25 Nov 2026 19:35:15 +0100
X-Gmail-Original-Message-ID: <CAD++jLmPs3MxaRvk3+csA5wwx04ccaYF=DqC61Twb+b+Q5Ys+A@mail.gmail.com>
X-Gm-Features: Aa3M54pSiUm-Sabn52M6gTOmNq3pyFFBJdM-jwrYQTrlBs-ynEpBtUVfQzaBT0w
Message-ID: <CAD++jLmPs3MxaRvk3+csA5wwx04ccaYF=DqC61Twb+b+Q5Ys+A@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] pinctrl: mediatek: Guard against NULL eint in
 mtk_eint_do_suspend() and mtk_eint_do_resume()
To: Lee Jones <lee@kernel.org>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Maoguang Meng <maoguang.meng@mediatek.com>, Hao Chang <ot_chhao.chang@mediatek.com>, 
	Qingliang Li <qingliang.li@mediatek.com>, Nicolas Boichat <drinkcat@chromium.org>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 9:48=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:

> mtk_paris_pinctrl_probe() treats mtk_build_eint() failure as non-fatal,
> logging a warning and completing probe with hw->eint left as NULL
> whenever EINT initialisation is skipped or fails.  However, the system
> sleep callbacks pass pctl->eint unconditionally to
> mtk_eint_do_suspend() and mtk_eint_do_resume(), both of which
> dereference eint without checking for NULL.
>
> Return 0 early from mtk_eint_do_suspend() and mtk_eint_do_resume() when
> eint is NULL.
>
> Fixes: 5c0904488a20 ("pinctrl: mediatek: Add pm_ops to pinctrl-paris")
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Patch applied!

Yours,
Linus Walleij
