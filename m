Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795185334;
	b=Ind0Mn3wpR27RA2YJN4RFMJUYUCHYhRlBQtDcdsuXAzRU38bjcTm5eDtD07QS2GsF4OU
	 kMlXuIiHMXdTgpwZe5CpMEqdhGOU3KX7ftFGsFgXR56noqBI3PoyAuU1M8CvRsipNxVbN
	 1vLLmi3yeot5BKozK2b/FkmP69Zjj5o+Usmtp+a7A43SNnJkYbJMqlu8GcdgFnHHNpT11
	 41nxG8AHwCTbd3VnDgnxtgP9XpVFId1iDR0GhtfbKr2vw7P6lper7cVc2MWRqwt8i/l/y
	 uNz/w95vhJzvo2AqM9DQNORUTfhZg+REn23775eLsX08EBKE7NmHFe49OMS64ENwhag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795185334;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=/FdR1q9O9I2L2zxw02LwOzMzKMzS0D65RjqrFU2qEZA=;
	b=QucRmHiY83sLWD3erlqBLOuHTghvbpli9EofgifSvrC6C1CBr8n1k0TGOanfQLmjU+Ga
	 RON8FmjK2RMQ6dZe+3IP8cMG6VifDS1mcZFO30Zul49sd94lg+w2bL2HzGVkaFCfw7YSU
	 6bj2vvaln2VW+oeS2H1X+Bfqw5Y5fv8F9YdUjz63GMHUoe1F59tTDj+4SNgYOHMdbhhH0
	 1wWeWEZNA6dgQcXQJfoWjzJ80ZdeHY499z0ejRmiUMi8Ue3mBz4pKMQij/eGL3WrwkXVl
	 sbuzuiaA8AIrc15cdTj+YD203/91IednD9gewm57Aqg/9QAZgRvJkTCaegtNqjieH3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B5aTzMzw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C24606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B5aTzMzw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1D8E1F000D3;
	Fri, 20 Nov 2026 14:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795185333;
	bh=/FdR1q9O9I2L2zxw02LwOzMzKMzS0D65RjqrFU2qEZA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=B5aTzMzwj0L56nERf5V40KTzCopI5tEdklPnWaEE3mMgjcOXsjaXyQHm6Nw5Zucnh
	 YLxH3bNmIuyHtdoniHwoj8Lri3pHtSC9kkYO2V9uT4qhY5qU9ealm/ppUhffgK7fAT
	 AeujDuTX0ENNhGIYYwJZp57ZBAzOQZhss/jcf/XFAMNdV6lfmhkWup6r0lMeYZEbwJ
	 9REc3/g/wFcOfjpWPEmHD4pVhgWjpDwamjcKR8ZAZEuCabkDxgImJ11Y/oMBNTZCu6
	 Xno17w/OVWBC5K53fMAA428euutdSc9rL8OlLId8e1dNZ2gutPaIaLBopJR6Q1Q0mt
	 VDSfaIAJbnOHA==
From: Mark Brown <broonie@kernel.org>
To: Victor Chernyakin <chernyakin.victor.j@outlook.com>
Cc: linux-kernel@vger.kernel.org, Andy Shevchenko <andy@kernel.org>
In-Reply-To: <SN1PR12MB2528812E26B65457239E9EEDA57F2@SN1PR12MB2528.namprd12.prod.outlook.com>
References: <SN1PR12MB2528812E26B65457239E9EEDA57F2@SN1PR12MB2528.namprd12.prod.outlook.com>
Subject: Re: (subset) [RFC PATCH v2 0/2] regmap: add APIs to bypass
 regmap_field and work with reg_field directly
Message-Id: <179518320476.6016.16423558619154368104.b4-ty@b4>
Date: Fri, 20 Nov 2026 14:00:04 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1648; i=broonie@kernel.org;
 h=from:subject:message-id; bh=K0ynlG3BDXTJwCrALZ6g9wprnzm0zkDKhJw8Qil5l4g=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIZojYFeBROun3qzokskbXvP5xXlvmW7ROc8DNtUfBJh
 8y8oMOnOkpZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjCRcGeGvxL7phl+dp5bmD5j
 1zVWfWkLazXzJWFVORMeVz8+oD9hUy/Df5cv1zcwfGqqrlnyeJ6FieBfhZ02ER97W5ekbXZp3tc
 sxgIA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 13 Nov 2026 00:55:44 -0600, Victor Chernyakin wrote:
> regmap: add APIs to bypass regmap_field and work with reg_field directly
> 
> Working with the existing regmap_field_* APIs requires you to define
> a reg_field, then use one of the regmap_field_*_alloc functions to turn
> it into a dynamically allocated regmap_field. But reg_field and
> regmap_field are practically the same struct; all the *_alloc functions do
> is shuffle the data around. So this RFC proposes adding functions that
> cut out the middleman and take reg_field directly. Patch 1 adds two
> of them: regmap_reg_field_read and regmap_reg_field_write.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-7.5

Thanks!

[1/2] regmap: add regmap_reg_field_* APIs
      https://git.kernel.org/broonie/regmap/c/39e628387d32

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

