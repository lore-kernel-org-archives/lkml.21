Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448166;
	b=Fn+v/KQpwkTpawxUGi0YRhmJmGP0QbQDCnEeecxsa8mMQBDMzJuJGwZdWIYNLO7rli9S
	 0baNKruezr6dkaTJVB9chdZkNoSDqtZ2A5Fv5VbKxEXs89YSQbVYWkAIX68J0Srjrfdef
	 jJz3oAvYhOrShQOhkZXSQbCQYx8q9O/Ui62D1d1E0qsOPpHEn4m9CQQyS6M/vC0uBdPUl
	 rNwmMRaJAv351z9lq4qy2Eo64HQkT+URKynqbPNJju2k1phpkXyjqRBc2/shglpjTs53t
	 BgofOYtf0L8WRUy4FytYhdibg5p9iO+MjctZQLpeCrqGz8KzEn5aJypKPx60qUw1glA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448166;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UXpd3Nh2t45ncSVSh4QPOrYvcJiFSBL00rNMi7DJgJk=;
	b=SuNNIeP1PQYhvoAEg8IaouYon2GveLEyZlEWM4fz1Z4EdGZ0ndfNOFdQw1ddmn9hxMtD
	 qmF/w27WdufFAu1RZqQ/iGY6yPmhkUDgRgF1CSNj/UXJNE9IjA0X9lR1mOZiKUCyewWZS
	 II76T4PgfZe9caKx2qSDWp4d46Ge7F3yY7fFFiYEcPg+cLGycBpCjga7bOSuTiTDmrRbw
	 784PqGja2j29ueajn7/wnZzfoQluU2VoujXoYs+OBCJo51EiYZeJEk+8kiByKgb/tqL44
	 6HgIihAQlbs8uVDuNc+fhaFPVBIh3Y1o9357owq3lt0Sj6b+Uhi4mYShnH+NpZK3vHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XfPB5P93;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CED5606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XfPB5P93
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A4BE1F00ADF
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795448166;
	bh=UXpd3Nh2t45ncSVSh4QPOrYvcJiFSBL00rNMi7DJgJk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=XfPB5P93HP4vbKYlZWXIzvsr39OBy4OsyaLsBLvVeoS9AAZ6PTkbcgp0qeWPSkkrV
	 wxzI/QYnUkCNN+zR1cYRChx0Twos7wOKJ3HYbovl51vv3hQp2J/sgIQy95EJDqeG1w
	 eEDo644Q+/um0iNAjY0VsuG9sJTu9mcn+f1HdKCYRH2Mi7+1jsBXqUTkQBpWHC5Xt2
	 PFB70kEXrhiVblbGVZu5igGcOFMWyN8HBX9vsokuGGg1aOiIYOqzOIXjR2jRtIV3RH
	 7PhUC+AYpUv9Br5airvjFVcL/Qo638f5xSffOhjyZ6wWon88bDx9D7NvKQPwYtYpFa
	 fArKNB97Aa3fw==
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-38190551625so7133587eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:36:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG3PNTppxeXjcDS3ZRG4AswDZkhb9YfD2omZ4ivmx/lJ5OxDizSo38z9FMLZ4z2kLCfUGuziEPDwCGxams=@vger.kernel.org
X-Gm-Message-State: APuU4Z+floiUDWSXBPBojRRGzYtjlnkzLXH60rX3G3DMU1I8wmGYK93W
	RriDq//K0qXZtwucWKTwKAezOibys6OYhZdDSipYE04FbxwLLoga+ZdJUq0URipY6O90oY4zkh/
	CkaaCZIit+ZcYuoFptgKNM/SIb8iV/g==
X-Received: by 2002:a05:701b:2514:b0:16a:c6f2:60c2 with SMTP id
 a92af1059eb24-1b55689fcb2mr10673901c88.12.1795448165577; Mon, 23 Nov 2026
 07:36:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261010115539.9237-1-l.scorcia@gmail.com> <20261010115539.9237-7-l.scorcia@gmail.com>
In-Reply-To: <20261010115539.9237-7-l.scorcia@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 23 Nov 2026 15:35:53 +0000
X-Gmail-Original-Message-ID: <CAAOTY__jNESf=ZofZWN8SxBMkzeRrXEJv=J0QE4guC71hvBKGw@mail.gmail.com>
X-Gm-Features: Aa3M54qi2_k27JpUO0fxBJ7jBDU5evrvHmSEsv1tBfznyzC71R2OzkCm3lxw8do
Message-ID: <CAAOTY__jNESf=ZofZWN8SxBMkzeRrXEJv=J0QE4guC71hvBKGw@mail.gmail.com>
Subject: Re: [PATCH 6/7] drm/mediatek: mtk_hdmi: Improve the secure output bit toggle
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	Fabien Parent <fparent@baylibre.com>, chunhui dai <chunhui.dai@mediatek.com>, 
	CK Hu <ck.hu@mediatek.com>, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Luca Leonardo Scorcia <l.scorcia@gmail.com> =E6=96=BC 2026=E5=B9=B410=E6=9C=
=8810=E6=97=A5=E9=80=B1=E5=85=AD =E4=B8=8A=E5=8D=8811:56=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> The secure output control bit toggle for mt2701/mt8167 currently sets
> bit 0 (DEEP_COLOR_EN), 1-2 (DEEP_COLOR_MODE), 15 (HDMI_PSECUR_EN) and 31
> (HDMI_PCLK_FREE_RUN_EN) in the same operation, but only bit 15 is actuall=
y
> controlling the HDMI_PSECUR_EN bit, the rest of them are already being se=
t
> in separate operations later. Add a define for bit 15 and clean up the bi=
t
> update operation.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: 0fc721b2968e ("drm/mediatek: add hdmi driver for MT2701 and MT7623=
")
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
