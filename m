Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795475398;
	b=wbbGJc8LwACjEXNW2rGMltCysU9r7KL1cHCOfQfUDuWu1b5KoVYGEQH4KWUKkzKmOTa5
	 oRNamHHQPxMSLCyiANmr8tSoBEvSySvP4rHwRpjm4j6fQ5KFGLAGai9w/thxnCo+tYziG
	 ZFQ6Y3R6XNR1nQo++I6YN2Kx5rG5uRSMZFBeyg7UEcFrhjDnDnaAZXpp43lobsm2C5LO5
	 KJekKJQVnyosBVOda196BeXP4Jys36wd3i0Cbcg0CnWVqy8eOnDTApw9XhGZzzIuRv1bd
	 s9AjbHwL8oIvI36SxMDOL6Nax9G2sAXcGxplrofOkEd1AOHiC8t7uUVW7bw4Qd002XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795475398;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dE4EaqDyK41gAj04ZPpghBrG/bBl2Jc6ioru4NaQWk4=;
	b=VUQrgh1WdzTfrGeRSogCpu1BVBNUQvZm02z+kmbuAuFdIAXhYL1qAl+7dCDDbOyQEFT4
	 QsFJE7T3OobXmzOMHrRrs7FW3B17XgFa+FZ6/AXXPuSxwIV1TJsdXL0S2FUWxqL9BG35O
	 Y5U+oRE8k/zQabZ/6niqBhwe7k6A3vAh5Pd0HucRUXkDnrZCNGXQZwvVm2j0G4JMlQUV4
	 UXxOhMDgnceUfz9NH/DudSzvEVKgm4EN1s0YgbGPPRn31qQy+C+GXNux5XL1lbtnFZ4hF
	 OvukBpwLr5lbTHGhrwQPGN/m6/rdnvux3VVXnCMrLfUBdb78EsqSeEqHFUx/bsec3lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WlPTtXXP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7103606A326
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WlPTtXXP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C29C01F000D0
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795475397;
	bh=dE4EaqDyK41gAj04ZPpghBrG/bBl2Jc6ioru4NaQWk4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=WlPTtXXPaEhtS0UNcttHmNX9yIWLASI3pzLGLNt0v8NJfuYvC9Ale1DYta/z2oe8W
	 Qrw2Vb2UHID1u77Hy0264Rwh1aEwUYIwu2VUKorji0Bp96MMOyq1Gk/nkgON2L3G3i
	 6KpfsHkq4894oIuyQE8TGjf9sedVbEdCo70GWSTzu4oPfddMAQwZ2g6TzzDetMS8Rz
	 cCvYZtCcia/etrczLHrv1hRNmTaOztxzZRfOrwXAz6W0YIuJyMugf4v2QJ09fsd67P
	 sX5CV8em7aDuLHIV+FaXolM7gnaBLv14/W01td8TS1ySmSNcKuLgXLAKPRZOlG04lT
	 G/ygW/91HhIfQ==
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c51373ae637so592584466b.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:09:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHssb11avD6p8neDhcfyl6LILcAln0zKp4Tqe5/0qlh5o+iimnBM3xCKvpMbulJvhxVSyjsLlHy+AbSGOA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8JZwBq3M89Pw5apw8AaHKaePY2rHxkY2ktneOoJhGWe4PieYc
	fQfYj1LKgaW3pH0eu8hwKbdAgKOoc5s3T7GBTAuK7hVIJkaWfZARblBb9D2N+OzOaQf/A91Niyz
	gQ+b5RlV5nDZieB+Iyuv6Upd8fjUQed0=
X-Received: by 2002:a17:906:f8d2:b0:c50:bf14:8eb1 with SMTP id
 a640c23a62f3a-c513a84d84emr825676166b.14.1795475396432; Mon, 23 Nov 2026
 15:09:56 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122155604.401963-1-icb@fastmail.org>
In-Reply-To: <20261122155604.401963-1-icb@fastmail.org>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 24 Nov 2026 08:09:44 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-u5tFFu1W1qSD5v4crSdRXc1VdD-n2LKRbWo=GS2izEg@mail.gmail.com>
X-Gm-Features: Aa3M54qCrHEh_Sq068v7ffrEsHDVyhRBFdMOgL5-5OEMKKg3aevGtdGfOT_QBM0
Message-ID: <CAKYAXd-u5tFFu1W1qSD5v4crSdRXc1VdD-n2LKRbWo=GS2izEg@mail.gmail.com>
Subject: Re: [PATCH] ksmbd: reject a security descriptor with OffsetDacl but
 no DACL_PRESENT
To: Ian Bridges <icb@fastmail.org>
Cc: senozhatsky@chromium.org, tom@talpey.com, chenxiaosong@chenxiaosong.com, 
	linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 12:56=E2=80=AFAM Ian Bridges <icb@fastmail.org> wro=
te:
>
> parse_sec_desc() returns early when DACL_PRESENT is clear and checks
> nothing else in the descriptor. set_info_sec() then removes the POSIX
> ACLs and stores the descriptor as sent, OffsetDacl included. The
> access check, inheritance and QUERY use the DACL at OffsetDacl without
> looking at DACL_PRESENT. A SET_INFO without the flag can therefore
> store a DACL that was never checked or mapped to the mode, and that
> DACL is enforced.
>
> A descriptor without DACL_PRESENT has no DACL, so its OffsetDacl must
> be zero. Reject a nonzero OffsetDacl in that case with -EINVAL, as
> parse_sec_desc() does for other malformed descriptors.
>
> Fixes: e2f34481b24d ("cifsd: add server-side procedures for SMB3")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ian Bridges <icb@fastmail.org>
Applied it to #ksmbd-for-next.
Thanks!
