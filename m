Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540672;
	b=sf4CUtZwRwTNOSoggTW1cQrcYe6RPMBCl6od84IEOsKyyTqsPGpcwpzPXJQPpDO8nbp4
	 eBLNHZaeNbd6VX8/1rJ0XzYj11wEOrLsznPUOPWnOcJyc4xjecvkRnzptWSmvYKdkQMa4
	 N6B+gwewHB78DW3EEuuiHw6OPZu7X8pvWqHcLUCR24kL1RMUNHedKrC/5mPBuQ4p/+GRT
	 v16YI1F8gULuwslNHjjNeCm7+aAINb5NiH+Kfg9f5QlLo97qPk0UZxOFyHdev0DbYXDY5
	 850B3ajOwnjOjfM4BTbXrFlgyuHSy+J+tlIu8+aLukF45rfD36Gk+b7b90QgFMWznvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540672;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=rwV1o794KwZGEsGhZETm6YzL4xqv7bjdDBF/FfhUy3I=;
	b=OEJqStb7ocFlZfLW+4ZszCWirGTZpHE9MtcgRa/tEJRK5oZMrezHfG9k4i+QtSyGsFYl
	 foH3ofb4I4a/Lk3SfutiNv7bwRlYOomZaGwsUjph1s3DGKN+0BHIiLW/jdT3iAB4CdJQB
	 KDBbkzPqWSAui2vbQGljXzFgWJEs1sqPq9w6NbMRm/Yje71tf2VLyJZQc7+nTkL6ChATH
	 SYuj2WxyuJZeimNTxpCzW90yoCzVRzBB4il6kLUVfRcc5yTMcAy6mJ6Li3aM4fTw2gjk7
	 HUBodzpnw0Sq/lpXWh4YSgLHTP9ogdmbFenXWkT5fnKfWNfDeE1W4m9sCadGO6lE7YA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G9sO9vWy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8D1606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G9sO9vWy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABD791F000D2;
	Tue, 24 Nov 2026 17:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795540671;
	bh=rwV1o794KwZGEsGhZETm6YzL4xqv7bjdDBF/FfhUy3I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=G9sO9vWyqFzjiBo62OvvX1Y0y7p4tM0RFeaUqs0/VwFytZRlq4fBpvyLw8DyIGwpO
	 mQ3Fiv/mu3HwnRRrS6ME72ycvF18rwhaI6toyD0/k8khpbzgfFzfoBnvnBtWO7ceDD
	 gPaDgFqfg0vkfzjlB092lChGR4nJlPQDznJv5Sv/JPq2LIrHzNdIJ4da969ASDueHm
	 6y5Mqn2QUd6mmdcHKa1f3bSPMit+Yb+6Mrln07E4vWNLKMtRrBVGVa9eS5ewsValWy
	 M3iuQ+tvJ1wOHd2xoYuhwgVNKhWekO2ETse3WNioJZ1loweJypPsrlgH0yJcZplWks
	 lvLzkCSBu2x8A==
From: Mark Brown <broonie@kernel.org>
To: simont@opensource.cirrus.com, ckeepax@opensource.cirrus.com, 
 rf@opensource.cirrus.com, Andrey Zakharov <dedemorow@gmail.com>
Cc: patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
In-Reply-To: <20261124113655.610791-1-dedemorow@gmail.com>
References: <20261124113655.610791-1-dedemorow@gmail.com>
Subject: Re: [PATCH] firmware: cs_dsp: Replace strlcat() with seq_buf in
 KUnit tests
Message-Id: <179552935611.264265.8945762204743074133.b4-ty@b4>
Date: Tue, 24 Nov 2026 14:09:16 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1147; i=broonie@kernel.org;
 h=from:subject:message-id; bh=oltsrRb68yvYBgQnqKPhhPdbj0QUM8iabe4nVfxiozU=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJZj+2xtWXTPFRzX+/PnnDuTq1U73+NK70Or7lzouYUr
 8HR57sFOkpZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjARw8mMDP+YbpU5sPFeO2n1
 h1vy6+1AlTWutlUzdEQkr6QnbH1twsrwV5aJbZ6v8BymDX+SJF/d5KlRyriSvttS3NlH4+gB6fo
 +JgA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 24 Nov 2026 14:36:55 +0300, Andrey Zakharov wrote:
> firmware: cs_dsp: Replace strlcat() with seq_buf in KUnit tests

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] firmware: cs_dsp: Replace strlcat() with seq_buf in KUnit tests
      https://git.kernel.org/broonie/sound/c/b4dbaf7b9352

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

