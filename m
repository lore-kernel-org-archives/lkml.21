Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795198184;
	b=H/QBC4jFTpLkuyKojv9b6H88oCWxF0thE8CLF586K857NTcW6O0Ne0T4wWHStXY+S7J1
	 YkLHIEdjslBkDylASPNHGZ1Mt6bKjNXiezAbnRfhTdB3cnTsOscgnM3UJvwyVzx/4adnK
	 NsYxQ6DWS7ANV2GDE7h/IFCItowUR4wj+jqPZgSsFFOQA0nnyXe1OMdogsR+28p1WJSWB
	 W740yVZ9bwwBaAJC2C9Cwl4fKKJMlEdQf0yaPgV8OdANFDfze+YVB5hhF17GlpO+x1yML
	 llV5e0HPSVrn+CkeaV/5hA82h6Ua38l3YmOMQWEcJeX5pokNC/3RICneLm6HBkajPkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795198184;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=zResQ5ZFMg/74d81DhEnv17MvM7X6Q7FueU5zTYSKMY=;
	b=RVW880E0UvAO9Hc0V86Hh02cQdbSbqXCzDHTkTobXMlzhj/5jMYNYkpJf9PnACQgW4Lu
	 td5rsHiMO8YE05MXmfOqN0Ra2iBykGexwSLgVUnwuvcpfe72LWyfMHev43nWOvw37Z1ba
	 EBandaILfi5PgdjJHSQFWOKjJb2oxeQ6TeoR1A2YaNr6U7hi8P46A2JpWRurjtkYu/nlX
	 pMEtw6An7WFkjPi56TIzUZZdWb4XfC+vmsSF2MVfT7DcE44j8YPwME93Hv/RZ7nfryxDp
	 yP1WGW7TkY+ZhV2eyjxnF7G4p/c7aykf3u7SP525oFvr2jivschG/KcbutxSIHice/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=gl467aguv5ev5iqs2hsem64xuu.protonmail2 header.b=GU0CcjcQ;
	arc=none smtp.remote-ip=79.135.106.98
Received: from mail-10698.protonmail.ch (mail-10698.protonmail.ch [79.135.106.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE79B60A2603
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 18:09:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE79B60A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=gl467aguv5ev5iqs2hsem64xuu.protonmail2 header.b=GU0CcjcQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=gl467aguv5ev5iqs2hsem64xuu.protonmail2; t=1795198181;
	x=1795457381; bh=zResQ5ZFMg/74d81DhEnv17MvM7X6Q7FueU5zTYSKMY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=GU0CcjcQG8ylfbomRVopPquWwjR/Se0fAhQAkCsKeiRhYP5i5gtVT3cmFCbgMTt9c
	 LOJiM/a0euW5IUfsnXqjfYRcUH4bd3YpFhk+IfIP/mPEtOJZJuRqFWE+aSBq3i5Tka
	 2BJUKkvkYtytCkszT9yE5klqJPadwAL3AuBcZXwb9LPN26dDWjnhGFmJeFdBwfoy/y
	 5olxgaZ4Fl1MfqgqljgGoR+i+qqL5xmHG2S85mPIAZ9jcYkwCz66p1gOwwlxPcP2DO
	 ik94CnNb/YQN1al2hveGdvAJu8mQi5iI8Jl++KkbQjTXo85giR0Th21jKs0KXdxwtG
	 ukoLqhZV6brSA==
Date: Fri, 20 Nov 2026 18:09:35 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>
From: "armandas.kvietkus" <armandas.kvietkus@proton.me>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v5 0/2] media: i2c: Samsung S5K3T2 image sensor
Message-ID: <n9KhEjcupYPV3bWTkYxQ7HeEpYlqJh_SNsFRzgdw_aRJ6FxhfOx08ZCBNjERg_S6P7K3Fu9F__f8f7O3fh8vXQ7SxZbLYk0VrA3V7vhDbFw=@proton.me>
In-Reply-To: <av9wGCsEhX-kIW9H@kekkonen.localdomain>
References: <20261117-upstream-s5k3t2-v5-0-1f7f5fde9e2a@proton.me> <av9wGCsEhX-kIW9H@kekkonen.localdomain>
Feedback-ID: 164226125:user:proton
X-Pm-Message-ID: 86d5e5f045ece75d1abeddd62650a96a8fbcf9b0
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

Hi Sakari,

On Thu, Nov 19, 2026 at 11:54:32PM +0200, Sakari Ailus wrote:
> I don't remember whether this was discussed earlier, but link frequency
> determines which modes are available, even in a register list based drive=
r.

Thanks, that answers my question from v3. In v6 the link frequency
control is writable, and only the modes for the selected frequency are
offered.

v6: https://lore.kernel.org/all/20261120-upstream-s5k3t2-v6-0-dd345fa4201c@=
proton.me/

Thanks,
Armandas

