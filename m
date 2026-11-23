Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441827;
	b=l5Exfu/4pnvfOB3eLYv/vhVRXNQCpJQC0c3IJhEaE55vhbDlv9k1mMTKMX2OUNvTxYdT
	 0/eJA8Z8eDCkGtSq6exy9EL5jgCEooR/S6njySsOom9/JAtjHliHRozl05Dg4qU7sbmid
	 7ZwYpNvdCq+iNWHZln2G/tC6qkHJHkMotvlrdhKCkCOU5pY0vPS/IIuBrloAsOjupkGCK
	 Ci2zZ3JUryQX13gs3Nz0t2kmtrFvUiFZcKM5o1kPC4g3bPcFycAbb8F5wNMHFaxdspoGK
	 UyT2UliqnZFTWQ9HYnbH2klCsw0zjqYIw8RrKz9JTAxi4y87dRUridvoyF/GZDyHGog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441827;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zwVSvYFkSgVnLdrPSlQycgfZHzRjqVRKUpq6eL/vxSc=;
	b=eK92YYyy7jZk5GWU3rd4khzvBFK+ZESOGMCiITUj7d6QcMHzY+35u2ktWxV3RJfO5Auc
	 M0GMR5ecj/901SVb4q99s62Wy2Rs3IzjfeoSmEPQ8OJuHEwNGVxkBQjoquhFuXy9BIQRm
	 S35AzIQo2XhH9jl6M/Xmc5VPLtA0xh3mTBwvMwYPiqyEJVXfjI1yPaG540KFYXdf8fgq4
	 YKVMxvPkCXptz4a/HigCJXtzkAOmyh4+IOLpt0a6JxSefyzlvE5ZoASaB57TmAqdajtCx
	 X8qgqwMcXL2Kan6PfP3e6+njbtLX+5oLL+dDOmyJaYUZ/rz3RpIdJlTNZn4JVNVKevw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OUIl9Heo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50F8606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OUIl9Heo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AAAD1F000D2
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795441827;
	bh=zwVSvYFkSgVnLdrPSlQycgfZHzRjqVRKUpq6eL/vxSc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=OUIl9HeolUgHlmaLkcOiVE06pQMRlgXmWdgJEMvi9sW3be3i2uR38dSf3y11nXCXs
	 GvbwS3Y0z+8TwVgD2QznGJNxs98UhneDCsEEOp90KmshhHluaCeKIi1yhiuFKDPl4U
	 biqN3rcTh1hf+yTc/Sq8DITxrNGFWutP7dckOVhvvnDwV9oWwwRsSP9V0A+tJn5SbD
	 m+ChPATPV0rwFE71DK+W6TkD/YWqt/zl39leLC0t/4AM/JCqT0/VgMfScMVnCsPO72
	 /BMicY8R4J3ZrIXUyeDIb8+J4qfHmkDEhqPRffjRL5DJi9oG5mqjvInfJ7JEqR2Tsb
	 4Nb9WD3///l6w==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5bcdae234ecso4396986e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:50:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEmz4betFBkucO+qIy2jdzXEfbRbbIKCqVVcRfPMmIVnlBx5w3mU4t9WQgp4wf7HkAhofriA2rvhd38KHM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lAklsynDMl8nNTVlA7W/J6+i3khheJShpkFSmcCOr5iqM+tQu
	jFaAu/N6okgfDJqmjK6R6gZZSEQIIjMl0gpJ4nUZ1T9/D5TWwfW7n7zRsM+K6GcaqrgpmVG86uL
	nyCmhjhHL7SUfzKMDhwJuyCf6q+8gowo=
X-Received: by 2002:a05:6512:1241:b0:5c1:a403:628 with SMTP id
 2adb3069b0e04-5c1bc819550mr3138167e87.51.1795441826283; Mon, 23 Nov 2026
 05:50:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121174527.19690-1-ku.loong@gapp.nthu.edu.tw>
In-Reply-To: <20261121174527.19690-1-ku.loong@gapp.nthu.edu.tw>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 23 Nov 2026 14:50:12 +0100
X-Gmail-Original-Message-ID: <CAD++jLkq3GOK=-HCXho+prJEnv_tzmqzGDaftP-P_47UqXD0HA@mail.gmail.com>
X-Gm-Features: Aa3M54rHdIamdzT_778YDJQlqcvu4tASR7Fn_vus4QlgHHMUgADXgMguOV-p1MU
Message-ID: <CAD++jLkq3GOK=-HCXho+prJEnv_tzmqzGDaftP-P_47UqXD0HA@mail.gmail.com>
Subject: Re: [PATCH] gpio: amdpt: Use __func__ instead of hardcoded function names
To: Chen Jung Ku <ku.loong@gapp.nthu.edu.tw>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 21, 2026 at 6:46=E2=80=AFPM Chen Jung Ku <ku.loong@gapp.nthu.ed=
u.tw> wrote:

> Replace hardcoded function names with __func__ in the dev_dbg()
> messages to fix checkpatch.pl warnings.
>
> No functional changes.
>
> Signed-off-by: Chen Jung Ku <ku.loong@gapp.nthu.edu.tw>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
