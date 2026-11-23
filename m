Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437534;
	b=VAvrZnXwISaND0XSIb7Ey+xQF/WTOifYbR64AaiGFmoB79J0gYWGMXcuNRbOPGPoz8QI
	 lZ6x0nmEo5BZMHA/A4EIhCjK0EVGhMFxFkCUw78Ewp4MC/trAAznPsbmhzp3l7/bWjESY
	 RfmIorbyYNvT1fldQ0akxXKZGO08pUmaBJPs9XjaTc2Cngt2woYBXXGLZtr3+bQQEw83e
	 CeKFjydX1d/6SeHrtHzM+86nR4tF8e9Lc/cHYk3ghUt7Ngff1QSkgFMYKCI7zwNFDeJaF
	 jTgF0hp1x9m/TeqIM05WPIuVF0JkvQWhIW7DDXjDwz+NOS2jQRLWWGzMQP1yzz+fjyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437534;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Subject:From:To:Cc:X-Mailer:References:In-Reply-To;
	bh=59RxTHGvhltoNw2gc0/13upvGG9pwIkmUmOzptR+Lb0=;
	b=Vfpx+soZgflKocPixXN+4liMDOgkJhpcYwrdzlYFjpFrC0A7anbswh4jJlbWuSe9WPy7
	 rJOglECq8TR7VLZ2kIf/yZfXlUghVQ0eJy0VcgYvxRXr+vw5wVLzs9n/qYW8JMv2H3uaK
	 8stIsyzbrUENGEnwK6yNAWjaIbWIX7S3JiGkYfyJclAok85SNLBGbJ1tJRaPnV+/h8BIi
	 OFlhg6tjmlOW+Z1tagmmC77xbGiXl3l6iHu5NCjib0DL1O7+ZQ71Ol5lHgl4inn+qdXcj
	 Dg6jsa5MgnFx4cW9T6Vz0qZWoYfT/R1jT3AOh/9rU7MD24QkW6eKRrYbgoAcoCYcTYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ieGbhYkm;
	arc=none smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936AA606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:38:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 936AA606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ieGbhYkm
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b3402105b9so21062727b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795437533; x=1796042333; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=59RxTHGvhltoNw2gc0/13upvGG9pwIkmUmOzptR+Lb0=;
        b=ieGbhYkmA1tVgB8nYy25uSifUEyfNr8bR6537VLozGv55qw9nCYaRuq9fAxvEmCRMq
         MTqXrhD+3lp5K8wNSXipcOgFNc/jazfFRTKaErMwRbDBigni1Tb19BJY2WoKKTi0ep9s
         UjF0IVRN+sVlNPIACAkprYnZ0OvYo5JDiWaty9hcMySXmPn+ddeePMFFVt3Hhb0bwLbb
         XVSw+IGS2sDadCblffLCz7CnkDF7L4XIR89egfCjJefrxkrx6BgzEkyAcxdenqz4+GnO
         S9o3fIUHacY7saE0XJ9vYdy8r/BVcuXNE9yh3x5s4FT53/9eTtvj6SiefaVycA4XGlEl
         FmQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795437533; x=1796042333;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=59RxTHGvhltoNw2gc0/13upvGG9pwIkmUmOzptR+Lb0=;
        b=NStedC1le59PGppOw37GVSQ0UtK03j4WcmpKG+MBZljoiOr2I5ZCZY+e7S66FL3iXm
         rO/QDGz2yk3L+zRhYkvRLLlzpfIxIma9P4V+sHvPLGzEKT63qdMvfWMcxPv5/64gslc4
         LQ87NauWOC23YAWlKvPOp/ebksoqOmBpbAgYoY99gLCIqG8/t+L9yszY5uqUsO4ehqu4
         pNPIgn8hI8wj3rpLDUrPVAuTvhjk+2tMA0NSChH1XMqWGPnql4jNnOu+IBQzJ3c20Q4x
         PsXE8/W+tifPpqeQ1EWNWs+ulWfJh7BRlvd53eZVW7kvCxASwTvchxjKA06MmlFtO9U+
         H8SQ==
X-Forwarded-Encrypted: i=1; AL+hErGMT1dgfLZPJ/DouBiCN23+c4h8BBlu4zvQcxj+GRZjFKh13aVuZbFfOOmVCwu7uGHNZgGPAueMMeIwo8Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/b7Jfm8bfOXPqjohotZ7jDE29EW+2hygSWpZ/XMr1eAXzpRdMH
	VGTLXDRMLPcsEufkia8o7kYXRnipylGXds3cTU7Jh7L7wi7Hs+aw73i3
X-Gm-Gg: AZFdTZcYD0xCmVq5ILfm/zISWXr87efcnecDe3R2pDk22FPYd2elSF3iCsPYtpTgXQh
	MLGlDDdtyQRuXZpQ+BSCvYpN0HOgt9f+WiU4WPWiXVZ+5N1yo4zJf7n3Y1aerc0sol6+mV3yZ5t
	oKG9fttms6tCK5RGm0KSkkIt/VgIs+BJQTg8VxmAoPEg/fCTvBnxAWGfwp7yeZ42qlU4zsvrEtk
	w29xLUNStGDD+eVYi4/MTia6SKtAPSkK2fFaakpPafePwMPfQ+0bIxpCrDCqFnqe1CEs1mYxc8D
	UdFx3pHGuVOWz7hZ2gzTHecD5pIKGb7tyDKvecVL1Dwt6VNYrkaK127TAs5l+XI5fJRqIquSZ1B
	hYWO6gVG8G2NKxnTEYgqKsGdBoeFHfNKa1CY1tFrL2xxXP06D40Igt0xIujpqeIfggkBCp50ubq
	SjPrI1oBjbpo/NZj2NrZ0xzYk2q8aLY98v1+EWiCwph0Di0DrAf4sIx7IZPm+Brlp+ULT9ziBzR
	l4DpNbjqkiQuwgGrGtTNbNsXtKjwk7RJs9/BFDEOzZO4ltIvNnoE9KtJ4hase6djHRYUo0LY2o1
	tJv6xxHZdyYsbzU=
X-Received: by 2002:a05:690c:3749:b0:8a9:d5f2:f5a6 with SMTP id 00721157ae682-8b5204cd1b8mr37167077b3.67.1795437532672;
        Mon, 23 Nov 2026 04:38:52 -0800 (PST)
Received: from localhost ([2600:1700:4a51:2210::11])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5201b8cdbsm43605117b3.1.2026.11.23.04.38.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 04:38:52 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 07:38:51 -0500
Message-Id: <DN2LHJ9Y8KM2.1GHH6E9738JCS@gmail.com>
Subject: Re: [PATCH net-next v5 1/6] psp: support rx rekey operation
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: <netdev-bot+sashiko@kernel.org>, <daniel.zahka@gmail.com>
Cc: <kuba@kernel.org>, <willemdebruijn.kernel@gmail.com>,
 <davem@davemloft.net>, <edumazet@kernel.org>, <pabeni@redhat.com>,
 <horms@kernel.org>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
 <rdunlap@infradead.org>, <donald.hunter@gmail.com>,
 <andrew+netdev@lunn.ch>, <shuah@kernel.org>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <willemb@google.com>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20261118-psp-v5-1-b9ec840e0296@gmail.com>
 <179530218118.3135.6547111851222246419@kernel.org>
In-Reply-To: <179530218118.3135.6547111851222246419@kernel.org>

On Sat Nov 21, 2026 at 6:03 PM EST, netdev-bot+sashiko wrote:
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in ca=
se
> you want to address the nit picks below when you respin.
>
> Low priority / nit picks for your consideration:
>
> - [Low] The uAPI doc for the rx-assoc op in
>   Documentation/netlink/specs/psp.yaml now reads "If the socket already=
=E2=80=A6
> - [Low] psp_assocs_key_rotated() (net/psp/psp_sock.c) now does a plain
>   read-modify-write `pas->prev_generation |=3D ~PSP_GEN_VALID_MASK` on=E2=
=80=A6
>
> --
>
> psp: support rx rekey operation
>
> This commit lets rx-assoc run on a socket that already has full PSP
> state. It creates a new psp_assoc that keeps the existing Tx state and
> gets new Rx state. The previous Rx SPI and generation are kept as a
> fallback, so packets sent by the peer before it switches keys are still
> accepted.
>
>> diff --git a/Documentation/netlink/specs/psp.yaml b/Documentation/netlin=
k/specs/psp.yaml
>> index f3266763c3253..d5713f5d1af7e 100644
>> --- a/Documentation/netlink/specs/psp.yaml
>> +++ b/Documentation/netlink/specs/psp.yaml
>> @@ -265,7 +265,9 @@ operations:
>> =20
>>      -
>>        name: rx-assoc
>> -      doc: Allocate a new Rx key + SPI pair, associate it with a socket=
.
>> +      doc: |
>> +        Allocate a new Rx key + SPI pair, associate it with a socket.
>> +        If the socket already has PSP state, rekey its Rx direction.
>
> [Severity: Low]
> Does this doc match the behaviour for every socket that has PSP state?
> psp_sock_rx_rekey() in net/psp/psp_sock.c rejects the rekey unless both
> directions are set up:
>
> 	if (!prev->tx.spi || !prev->peer_tx) {
> 		NL_SET_ERR_MSG(extack, "Socket PSP state is not fully established");
> 		return -EBUSY;
> 	}
>
> So a second rx-assoc on a socket that only has Rx state still fails with
> -EBUSY.
>
> psp.rst describes this precondition, but the YAML spec, which ynl and
> the generated docs use, does not. Should the op doc say something like
> "If the socket already has fully established PSP state, rekey its Rx
> direction."?
>
>>        attribute-set: assoc
>>        do:
>>          request:
>
> [ ... ]
>
>> diff --git a/net/psp/psp_sock.c b/net/psp/psp_sock.c
>> index f2cba3fa3a235..c1e38845f08c3 100644
>> --- a/net/psp/psp_sock.c
>> +++ b/net/psp/psp_sock.c
>
> [ ... ]
>
>> @@ -302,8 +333,21 @@ void psp_assocs_key_rotated(struct psp_dev *psd)
>>  	 */
>>  	list_for_each_entry_safe(pas, next, &psd->prev_assocs, assocs_list) {
>>  		pas->generation |=3D ~PSP_GEN_VALID_MASK;
>> +		pas->prev_generation |=3D ~PSP_GEN_VALID_MASK;
>>  		psd->stats.stales++;
>>  	}
>> +
>> +	/* Don't allow SPI from two generations ago to alias one from the
>> +	 * current generation. Rx rekeying under the same device key generatio=
n
>> +	 * is currently permitted, so skip if the previous SPI is from just on=
e
>> +	 * generation ago.
>> +	 */
>> +	list_for_each_entry(pas, &psd->active_assocs, assocs_list) {
>> +		if ((pas->rx.spi ^ pas->prev_spi) &
>> +		    cpu_to_be32(PSP_SPI_KEY_PHASE))
>> +			pas->prev_generation |=3D ~PSP_GEN_VALID_MASK;
>> +	}
>
> [Severity: Low]
> Can these plain writes to prev_generation race with the Rx datapath?
>
> These assocs are still published through sk->psp_assoc. The only lock
> held here is psd->lock, which the pre-hook of psp_nl_key_rotate_doit()
> takes.
>
> The reader in psp_pse_matches_pas() runs without psd->lock and without
> READ_ONCE():
>
> 	(pas->prev_spi && pas->prev_spi =3D=3D pse->spi &&
> 	 pas->prev_generation =3D=3D pse->generation));
>
> It is reached from paths that hold only the socket lock or RCU:
>
>   tcp_v4_do_rcv() / tcp_v6_do_rcv()
>     -> psp_sk_rx_policy_check()
>       -> __psp_sk_rx_policy_check()
>         -> psp_pse_matches_pas()
>
>   psp_twsk_rx_policy_check()  (RCU only)
>     -> __psp_sk_rx_policy_check()
>       -> psp_pse_matches_pas()
>
> So a key-rotate running while PSP packets arrive on an rx-rekeyed socket
> is an unannotated data race that KCSAN would report. The field is a u8,
> so it can't tear, and the result is unordered against the rotation in
> any case.
>
> The existing pas->generation write already works this way. This patch
> applies the same pattern to a new field that the datapath reads, and
> adds a second write site in the active_assocs loop.
>
> Would it make sense to use WRITE_ONCE() here and READ_ONCE() in
> psp_pse_matches_pas()?
>
>> +
>>  	list_splice_init(&psd->prev_assocs, &psd->stale_assocs);
>>  	list_splice_init(&psd->active_assocs, &psd->prev_assocs);

This review is the same as two revisions ago, so I'll just refer to:
https://lore.kernel.org/all/DMQOJPJ4AT7P.3DUQ9O213TZBI@gmail.com/
