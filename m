Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795126186;
	b=WdK+mrSf3BKUsBsK3+aK6KevniGUSg3HNoF4wubq0QefEfENtJbtITPIv88U22BrvrGe
	 Ye1tOOdfVl0sJyFDXbvbNm8qyjp0p/IZyVBRPEBWgkry1cCc0Eoq6io+A14rnFKY+gHFK
	 MF004XQSAH69Ejf1o0zwTmV2ACvUXquCkI0XJ9fYIJl8BzUCzavr+2CsWrXdoLFyZW4Ry
	 EE14fjTGoqQ7GvamNpIQc8zWzHL20Vrw/v0RuX6F12Q/L7RpE9atIfVtXV7txBFcCodS8
	 9p6h8oYfsECMXvl7NBGU8OXoZN/FUZoil4vODN94a+TVGcUF7lpj5Ddbr8G7S/dM9rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795126186;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=LJJJphSpkcmZiOiduY2/41Fd5r8y4RK3Bv3vN06K7oE=;
	b=DSf7FcgCBTO9/58JCbGbLxqH352cH5C1dxLDmoAjRD4MRgmPqy1ucRDJeaHMcItdfNhx
	 2YEb+NC5Z2aN1AaJp2J6QDNgeAlP0UafMGZaCK74a0cbdcj0zRrZHa0aFBWuz5DWCMqan
	 tlPeQETQrXcEKsWHQ+CFRAiQFs24Rol34uLJKY32JXdXWF1CO9RE+324OgTJ6FYpd/kJK
	 I9WxJOg3zuqp7RWRkPsURPAmCGJfzpUpPUK6GkiRYHXiCzv3jYn1kvgAba6w/efPAF7RD
	 SKO4Oc8xFkvQaGI3CHBnO/KuGLZ5uUmh1Qj8Rzn95JJ0NMbiDywb/+PLyp87uEZi93A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MhTYs61J;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C035E606A33B
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 22:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MhTYs61J
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CB711F000D4;
	Thu, 19 Nov 2026 22:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795126186;
	bh=LJJJphSpkcmZiOiduY2/41Fd5r8y4RK3Bv3vN06K7oE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=MhTYs61J8orzDyAmOl/as7tzaohrcDQ4G/1YszAcNynaZobkt8SIzmq6BznMynTgA
	 jtrWZHHLykfcsb8Q1Oyjxrdte7Z+kl994ynu4hlUX40l2jqVSEVdbfg+hLxxndGqma
	 507nvfMkrtqvNaeDtSemxgtjKcKAl3urAFxDSB/AZAyBn0mACBbAVxn8myLYl2nxEj
	 vhltXhiltGJb2fTCjhuFeYtpyYVnZ9nFAB9aWcG2HOKtVAcfnq8DHiG3gZvOMAFoKI
	 IMCroMXrA5n2vy3L5iolmp9qz/ujoKHVxLPXS3GIM6yLJnRkzDdyUKGqn2onKgoonx
	 ZBgEoIYEwVVeQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20261113-rgp-91-mt6363-key-lock-v2-1-adbd48f0f830@baylibre.com>
References: <20261113-rgp-91-mt6363-key-lock-v2-1-adbd48f0f830@baylibre.com>
Subject: Re: [PATCH v2] regulator: mt6363: Serialize BUCK_TOP key access
Message-Id: <179511291010.116416.9577252743085979937.b4-ty@b4>
Date: Thu, 19 Nov 2026 18:28:30 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1127; i=broonie@kernel.org;
 h=from:subject:message-id; bh=JNdnc9gqp+eN6TQ5wBFxBkuYGTrKYyKoiaiGTpGAVQQ=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLL+Fy9/aJYiycW6fv6ZrlNlvwLv+uxcahdcKW36bEv9t
 t6tPBtfdpSyMIhxMciKKbLEZXG/rC95vYbv4MI2mDmsTCBDGLg4BWAiMo6MDOvFS7N0dxY/1V14
 ryLxee2rh4u3XKzZ4T49f87cPck3TS4z/DOw2rdzr7bK2VksV82fzH2Y45w4P3XG3atGDKuT3xz
 /ZMAOAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 13 Nov 2026 05:29:02 +0000, Alexandre Mergnat wrote:
> regulator: mt6363: Serialize BUCK_TOP key access

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.4

Thanks!

[1/1] regulator: mt6363: Serialize BUCK_TOP key access
      https://git.kernel.org/broonie/regulator/c/b544ca82abb4

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

