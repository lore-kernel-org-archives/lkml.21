Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795802217;
	b=xM5qrGEfwHYc8G3Y3v7oGt+3FZgrRCx9WuZFwLInB3w3FaxHpfQY29MILG3TVBaZF3EX
	 9NKcySIrxlnAJCQQBq5spyZnaYO8VIQLUNF5wSqK8naX+dI5BHtOP+dhrBlbsuQixQJRZ
	 WgqH4X72d4ATQTHFAM2NPd77/O+Yrmdn+TAeChqkPkSgvNNDG5prlHu+Acpd74HE59gwP
	 p8qWU9TsznVmBN3dhyhPRVSZcv8FFvIq4tCu4LUgsKbZPQqqAl1/zCq3b99Cev9c2i6P7
	 wyMiTxuoNnvGVLvZs2AvLXVVTa9XyvU8gnkHur88ffau5/xUPE3dcFr58mA3XY2rchA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795802217;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=9d/Wi5+niKKQp3umNIsJBpc53BekU1YR9TZcw4SOdF8=;
	b=ocfExJTIk03XilhZgb9DGAhzc6EbFJv6gKv72YTB+oMg26ZGGXJ1yECzWtSRLulNc8Wz
	 WEW0cUW7rWOsf2adZII8mdjMEhuBqjdZKGv8Tt0B/NeDvxz8owZfYcL6yU1FTVZU/EEgH
	 f3k2CDavWuKyALNGymexExU4ZMEY7gQo72XtetIGZSNRhQdN+dKgQiGhjUukRQpdurqPC
	 6TeWNyCAXLvxpRl0/BZ1OUMXkLH9+o3ubXfbPX590B5HVHz8nuHNkABKCrsUviT833Y5V
	 L8/8DFl76P6nmtNIObkHCn738Q16/v8DLYn3t6PZ+Owry/T8O5iJahdfZcb2svSoJYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=S2RtunyL;
	arc=none smtp.remote-ip=109.224.244.18
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB179606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 17:56:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB179606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=S2RtunyL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1795802211; x=1796061411;
	bh=9d/Wi5+niKKQp3umNIsJBpc53BekU1YR9TZcw4SOdF8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=S2RtunyLpG7AW2lM24pI/U7rKd6i69buF+keQMLZs0G8NLrzeYl5j8V6vBXvfB08Q
	 GQkR8M3KrYLf06dyBxdeFKGBk0ce4/yIFlQ/PcaTMeFDdMnptOFxh3Ti8Xxdet6eVH
	 T+3lQjCYH/g3A/UMhHgpXKuOhrXnhM38G2GuccDP856QDBO6JlJNkuWH5VXPb/ZOUk
	 mqtHtCTjQjQetKQvwHw1pcEg2gaNhpDyE9TrlAOExdufHNKKXQeS4tU+mxm1/RnQbV
	 PzGh+nV9trw1fhTxYvZLiLDGcVnv4dgD7WuT1PPuTGYTqmlrDSE7LUsaa+cejHscG0
	 00KLmzD3+VgGw==
Date: Fri, 27 Nov 2026 17:56:47 +0000
To: iasnezhkov@gmail.com
From: Roman Vivchar <rva333@protonmail.com>
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, amergnat@baylibre.com, me@adomerle.pw, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: soc: mediatek: pwrap: Add compatible for MT6789
Message-ID: <GE3qRi7GaGOm4q3DQ5CGxw5EBsl7PZAaMFuN0ZZ0deeH8ibregEYkJBSZjrh9s_wO7n-eNViVRUkNI4B-dEtUWtgtAprhKViuPTy4t2oj2s=@protonmail.com>
In-Reply-To: <20261127030009.10572-2-iasnezhkov@gmail.com>
References: <20261127030009.10572-1-iasnezhkov@gmail.com> <20261127030009.10572-2-iasnezhkov@gmail.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: 76cd1cefd60693b41ceda656ca77dd37e48de0da
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

On Friday, November 27th, 2026 at 5:00 AM, Ilia Snezhkov via B4 Relay <devn=
ull+iasnezhkov.gmail.com@kernel.org> wrote:

> From: Arseniy Velikanov <me@adomerle.pw>
>=20
> Add a compatible for the PMIC Wrapper found on the MT6789 SoC.
>=20
> Signed-off-by: Arseniy Velikanov <me@adomerle.pw>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Ilia Snezhkov <iasnezhkov@gmail.com>
> ---

Reviewed-by: Roman Vivchar <rva333@protonmail.com>

Best regards,
Roman
