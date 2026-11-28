Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795828662;
	b=us7QAhAWb8orqLdoe170bL3hFRGHRsQLVw5uMMY2aaeCeguRQ9Bds/BJ4ZCPiuN6PHP4
	 UzkyMGqxsbXPY4MSnzAqin+fWAAG3asl37+wMbtVD7H/+DDJDBKMfku0BLUnlQQ90aZD2
	 SBc/eH35J7Ino5A5EkEKaG6ksZUwd35OiEyoi8ink5TAviXTKgl57E2foDBh4YZ0pQt1l
	 wMartLsK3sqev76PGvxQNgRRXjayEP3zSP27TBDXqsSNXFKcoVx+sm7AzAQALlZI2PcPN
	 CMhPg/vufs2gMYU4qwakzM6GTX2kOOeMNEUzea88NooOpKIvlNvoq8CqM4W7MfAMWUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795828662;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ynYpBMFbnjt1BZ3puDYcCNO837G+Oo0nRDEUrJjBmwA=;
	b=BGqIf3A0wvgVFYiV65ZuvYWdMZwOG4CSsWamDW76/CHZVv7wr7GLjqMbOGYysB2CcArD
	 IOCEJsde4RsEW4t5tGdlL8fl5E+X0L19Dwah83mk6VwBH8/kI3RtEmlEBaE1gAyeOwcsi
	 vGBmEHg1XHy5SlhT+QSUk5vAb7jto19Sh5x1u26R4WGfBNNwnJym4ywTn7TilCDNkZteQ
	 A27v2/1jRCoOjfsqHlz1GMc2fHlhDduus+3mF3detKWMDDI+nut9xGP4f2xf1Amz4L0CA
	 VMaPMijbTWv0gQVKRQKO8Ow1Rm9XwJnIPLJ0/rlCq23e4J+04CPy8rYCfctdd61N55g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fknHhXfK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6A2606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 01:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fknHhXfK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51BBD1F00929
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 01:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795828662;
	bh=ynYpBMFbnjt1BZ3puDYcCNO837G+Oo0nRDEUrJjBmwA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fknHhXfKVkJOJtN4EUHQe0uCE0r0o4h4teyp+31+R0yo5r9nzyYzWzWF6YH7CpY1F
	 w3MA/7cIGbzLsBiTiQCx07IcSV5GfW9MzE4Yk4CS8YOay32MR5EY8y3+cPoED1epbv
	 T0+M6jWFfdDANAo04Lvn3rPWDm224OUNGNxtUmmc44X+yqHShw3mCw16SsIrXC2PcP
	 3Ho1EV9UsIZEPH5epP+mhi+bPm2UwfsN+15qm739+sWqNmH7IFn2LXC6esiDSt/QgG
	 JL3vN++Azd8ggesX34Lb7d8ONhqb+XWn2E2bSwzLoKyiAImdw7rDkUIzKJAA8xee1P
	 NV7vQiZyh2BDg==
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4322d310e7so464965966b.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 17:17:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF4RFbsxQYmRRnxydQvaLVvw1DfirzmsGmBACEHUh/fNGNpmUKdroImyVdwnvdj7WTLvoUuh2OklgtqEzU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NM5Hk7AJ3Uo4eupAvQW/Z392lVvqAE9bNaEeQBmTP1v1SsHS+
	t/LIRqEXPNV74NHWo/pR15X1AT5vGkj2S8bMMPCh2HF0AzOlDbhtGz+BNcpmiDyLg3aJW03qHJJ
	VL1YHno/gbOduYwb7/rGYqI+SFjI7ons=
X-Received: by 2002:a17:906:f59d:b0:c31:5bb8:4b3b with SMTP id
 a640c23a62f3a-c513a47d551mr2219289266b.2.1795828660929; Fri, 27 Nov 2026
 17:17:40 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261128003913.1684555-1-icb@fastmail.org>
In-Reply-To: <20261128003913.1684555-1-icb@fastmail.org>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Sat, 28 Nov 2026 10:17:28 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9As9f-7Q=F7CJBqcF7qCdbwnFeQYQ0HytdU5wTvBPuag@mail.gmail.com>
X-Gm-Features: Aa3M54oxvdO9s8JRrz7L-H09Rdnc8vxQ05eSOl7Ki45QmXcG_h5g_M20FbFOIH4
Message-ID: <CAKYAXd9As9f-7Q=F7CJBqcF7qCdbwnFeQYQ0HytdU5wTvBPuag@mail.gmail.com>
Subject: Re: [PATCH] ksmbd: don't create a missing stream for FILE_OVERWRITE
To: Ian Bridges <icb@fastmail.org>
Cc: senozhatsky@chromium.org, tom@talpey.com, chenxiaosong@chenxiaosong.com, 
	linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 28, 2026 at 9:39=E2=80=AFAM Ian Bridges <icb@fastmail.org> wrot=
e:
>
> An open of a named stream that does not exist fails with
> STATUS_OBJECT_NAME_NOT_FOUND only for FILE_OPEN. With FILE_OVERWRITE
> the stream is created and the open succeeds. MS-FSA 2.1.5.1.2 fails
> both dispositions when the stream is not found. Fail FILE_OVERWRITE the
> same way. FILE_OVERWRITE_IF still creates the stream.
>
> Signed-off-by: Ian Bridges <icb@fastmail.org>
Applied it to #ksmbd-for-next.
Thanks!
