Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795778094;
	b=cE9SYAnxiAeFhLSswUNYpewgVCByKS7U15U9YnzIlLi0BX2VDhpuQ3IXaiwn2lqocFBr
	 NmNRA6jBzTzRzSOYZ+p/h+A6/1XkFR43wbVnMpKqZyKov0CPFT5heeerjMeBFL9+9pVzN
	 1ne+VyilhyWMlFuYHETzn6tPPGokHA0lix7jUcH09r0T1lxbNG40g3UYw2MrkM6iFYaR/
	 4ISQvu5c8up9d9YmQOgPWCvGrSfR+HZJCOum42GSOc54LODGohLlhZomswjTuDGjzimeP
	 cfk+hwF4MBNVwinyyMlvgQo0wjsm5VjreHT6oGMy8kv6dknq6lVkNPEDAe9K3/0NRag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795778094;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=idzCgy/by+Iz7ThGrgxkXNQ6zVzn4IvdXbfeIGiFH7o=;
	b=4is34suXPJIN+CngDDjna2UomBMDVKa5aXz/Y0LbCPw4QLcDVd6s2vPA6CGu2K6ouZfO
	 oc7nyj3c7lapagtJkOqTKJs9bnpkO9lrZfvWAsCH3jVtCtuPkga09icIqeNbJlQcIKUXy
	 pB2NfQOKAMVwBWFXjLojBtqTo+1fgQl9PmI4fMt1aZ9w5/HEmFpfGJig/MOJll+pkYbys
	 OMtuwtLxIGz04CHKX2etYrMBx7eT9/r4C+VBYKvJ5grJjknsQnjBNDiG+uD6AvId2lWH4
	 70bZzbHzKQ7YjF8hEwuR4xkvhl62um/RoGwQbEI+4vvPi2qoEMxdjTlX6ZCMDCtijIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AQuNOhg+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E71B606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AQuNOhg+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14FC21F000C1;
	Fri, 27 Nov 2026 11:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795778093;
	bh=idzCgy/by+Iz7ThGrgxkXNQ6zVzn4IvdXbfeIGiFH7o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=AQuNOhg+e8dpmk5byhcN6939UlsafQiW9iRkldu/WMK4O4FmqSwe1PfptdVMAbzad
	 wlvbRX+PulneDdloRJ9+KDYSSNoMqoGMIEguLWdaoayV3EoOnzzEAjgGMqgtdNfsMH
	 XGb5aIL7RPBnV8yNJe5Q6DCXHX4AjiS74rldibyVbq5HgCmTtQ50Uw51IpyuxH2zBA
	 nEDW5vCx+T9Di7gR2PPtNcBSsADEXxhvMLcYJeeLKtosPjy8f3EHVABAddkMd6o+bV
	 T0SOOD5I8QYQIliZb6VBduehFxRNqXKjtQ2pcNrIYqt8xDAs1iRqa4HUFMOz+BXH5p
	 FbAjIVWehVQHA==
From: Srinivas Kandagatla <srini@kernel.org>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
 Michael Walle <mwalle@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Michael Walle <michael@walle.cc>, Linus Walleij <linusw@kernel.org>, 
 Khouloud Touil <ktouil@baylibre.com>, Bartosz Golaszewski <brgl@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Paul Cercueil <paul@crapouillou.net>, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org
In-Reply-To: <20261120-submit-nvmem-provider-lifetime-v1-v3-0-523610652402@gmail.com>
References: <20261120-submit-nvmem-provider-lifetime-v1-v3-0-523610652402@gmail.com>
Subject: Re: (subset) [PATCH v3 00/11] nvmem: complete provider and layout
 disconnection
Message-Id: <179577809082.20168.7510408670870857172.b4-ty@kernel.org>
Date: Fri, 27 Nov 2026 11:14:50 +0000
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
X-Mailer: b4 0.14.3


On Fri, 20 Nov 2026 13:08:30 -0700, James Hilliard wrote:
> NVMEM unregister already disconnects register callbacks with SRCU. Some
> accesses extend beyond those callbacks: keepout traversal, cell
> post-processing, DT fixups and device matching can still use provider
> state. Layout unbind also leaves its cells and their callbacks available
> to retained consumers.
> 
> Extend the existing drain to those accesses, and retire layout-owned
> cells independently of provider cells. Old handles retain core-owned
> metadata and reject further access. Explicit cell references and sysfs
> group ownership make layout removal and rebind independent of existing
> consumers. Release the write-protect GPIO when callbacks are drained so
> a retained consumer does not prevent provider reprobe.
> 
> [...]

Applied, thanks!

[01/11] nvmem: retain the provider node until device release
        commit: e5cb8ebd4c5387c5d7eddefbbd89e98efa359878
[02/11] nvmem: drain keepout and cell post-processing accesses
        commit: e770f469df98a02f10e97c2ebe6abf93fec460f7
[03/11] nvmem: exclude disconnected providers from callback admission
        commit: 4508485e8156afd4c9d901f6192d4fe13867e698
[04/11] nvmem: release write protection when the provider disconnects
        commit: 189dc217748ae8ad4198bed150d94aa82a44fa6c

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>

