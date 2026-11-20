Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795210479;
	b=Bz/tsfguv6eMxbTqjuXDsGcwzJ3tWyF385l+jHftgbVIStPW/HXV/MMGuUZ4/hh6ty/F
	 /Qngzw4ujNHSLbKHCFQ7tLAmz4QFkO3Eh/Mm/bTTJldgQ3UMiW/drTKUOXCTOIYuN+N14
	 8GOAL74lTz+2ULGPRGIQww1AqEXS3VA90EukGk0Y+Rh2A3gFeWxFxmJJ5oGKwU2rm9Vxe
	 3HYp5g2B+CrzlSgkJ0jAsjDILlKYAMidfLZ2A37RlrgUap8KJlg2RNOzP7DMQDyYLg4mA
	 /E0KrKTOCYWhHFSn4Z03joDhJBmkWdUIeVc3gCz5frde3HthKZQyaon1psTqmUl6CBA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795210479;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8ybDpcTLc48ilAjH0O6ivdBYWvKm9L7gemRZOYABRPk=;
	b=hexYnzwmIWdRny/s8IzTy8xjFt/ldgXE5y2DRmzzYzsDNyp5dqpcNMa6S+iL0xGad0MV
	 EAWkaP14csayvJPTZ88AU9buGB+Mc4ithOw3oSYB3cES8DwhSODzXikWfhAl1P8I38xsQ
	 6lbQPLvQ+lvrw6OE5H63ktbGIx0qAvKOE1QryVPK1CSha8LVQ3QEd259ElUU3VJE3eLEF
	 blXp0gJfji4/jiF//eWo6r/7A9KO/+j4dXDKkua7a1erG6VTamCUBo9RiTO5qeZb4Fz2F
	 WBeaQ5zhoi7r6IlbJkhdTqKmzfeV3lqka1+/m+bv+ImleAdS8YaRKJeYsnH/yeRkAaA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HB+I7Anq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.179
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04C3606A6AE
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 21:34:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A04C3606A6AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HB+I7Anq
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3ab43d1dbceso1961281fa.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:34:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795210477; cv=none;
        d=google.com; s=arc-20260327;
        b=EVW8z2i78LD/7xPGekYub2owvnGGlKqGCY25Fk2RN7EJXZy9dR5pgQSAqkJ7eIY+Po
         S8KogTRlH+LMMoCJ++xhNkHOFEhXvltf5v7XEN6Cgxxw+8T8nRFbgjiEVhPqEBEQBunQ
         bmwR4CWlXI5g64IgVuo2KFixOL8oYh9rvoiAs4Bu4omLCA2AcCsmogkg3hBiqJJTjOmL
         /Tv0svhiUYoZkCufE2Pc/NHM9T+FRIBaZM+Hn896Q/cCgQ/Y8xzUUruJ0Itd49yGJvxx
         Vdx9O1ubUGqcW73hbKUqRRWubPB6sD1VOU8BjYbeoyB1sA/kqcMEOFinA098EVcwforh
         A5yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8ybDpcTLc48ilAjH0O6ivdBYWvKm9L7gemRZOYABRPk=;
        fh=yJK1naD5bfrfLP2mSe34L4tNJUIm7wtFyzPGU1/dt2s=;
        b=S2k9PasqAz8QS43hOD7Ioh0BL34/nw1ZHSsYrDloXdffNhGBctBog+R6qzMa48TGhA
         MSqBNccGYuiAelEvlpLRAAmZJF9RdAYjO3lg2Vfj3hcVYeD1fRacN/vKOhsxNoFAAJka
         Q6Oj9mLB69yOimm891LZge9W8MnvbTFlp26zBYL+0TNSgJd5sVkvV5qHqUeBOWVPXqkA
         popzZt5wNgWPlnIGQfLWwyIDtn72XeKDKdU+ROr647W0xUgarXkep/Kd8dJscIw5Ez2M
         thdRBfLcEAwS0OaFmiFcp0V5hFkxv6Sp18oFEP73Kulz4gjfcyLg8kgkWIbV0p0weMu+
         hHZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795210477; x=1795815277; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8ybDpcTLc48ilAjH0O6ivdBYWvKm9L7gemRZOYABRPk=;
        b=HB+I7Anqk8a0LDDlLIYOJaoJreFMMqIY+QYMOorsLogFkuG7OzQO/A2edDDVMNTo6N
         1jRF5SLbDq91vi+eRygoxIL7qtuiJy5+cJ0g0aDRWzRgP7XoqsAGNWdVjTTTjUmWGfYK
         iiMezMoIQocPUOMcJavvaxuVszqAH92Ri1lCIiIDn4HjBos+iXMAPy2qUTSKMZofY2l7
         fidmz5iN+Q/G8nvtUpep+Sqk9X8+2SesBOwQqky8Y3xavoh44aPDqVd3EA2Gl1co/EmY
         x5yOqQ2fbvIrRKR5ACugdugikV61qEUhVzU7duNsOFNGhb7IhVgjZhxSjx8j329j6Efh
         SlSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795210477; x=1795815277;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ybDpcTLc48ilAjH0O6ivdBYWvKm9L7gemRZOYABRPk=;
        b=CLlbqolBT/UTVXcqqvCr4S5MuI4/YR1eY8gCt9JJSxGUEtEU+w9sf63tdNYZR3kIMB
         5Kb6KWWiTG+pypx/K2GNaDByNV71rtMepdmTw+OCrXcYrWqBD9V4p5+m9jisYHLRPD+N
         jeodK+0WM2sDxaEM/W8f2hJhyzFDBO0+O8xLRAqjRdLjK6aXOkwMTZFzSlCAwxrTaeiM
         yjsk/jZwgK/MaJOhGq7siL0HRkwWKM6/aZG1tPpsa7m2VDdlO7Xx3q1iaVE39sh9JM6f
         FV91hzUx+SQWs8e3F42ccW9+vespqtq9HswHAGsBv5mIZaVv0I5UUOgib+p/f/Z2e/WI
         4MyA==
X-Forwarded-Encrypted: i=1; AL+hErE7OORah/OKfFfv9bkWl10VWOcssvL64xIcnKZDMTxNTKuSw+ycbgtO34Lwcd2DdKkiII5aGr4UhsUBzEo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+88AqT8mSNDw7cOlQ17iiMKWR3QxN4uXvniHB/K2sqIE+Fg6AD
	TlZGy2a660BdOV2rv+JmRU6PrUyiCwbesFi+O4vr0KGlreO2eGK037Yz7YH5i7BGYb3vtKlMzBL
	PnEXhF188Fnpf1pKb4w/Tu98WGedUjhg=
X-Gm-Gg: AZFdTZfi2LQ2fFx3QW72hNReybndp1p7R62TbKUfzz2ns6aOy9S17rzxqpEH8eZmluV
	ymNOoF5sFIX1zdT/Wdt13zInqdi1+m0ZN5WN728lHWEtFbJSbrUhS+yzNNrXsKJ0oC1BRZNigPC
	pwdR3sexHqO2XvQ2XGPjtENuPNTPLP6ORy72iGeg101AByPDFTNDGcLrEMPI/XdTLL2iYtJQaBY
	AluodKiICykdZLnZQAyAnIhMLupn24Sz+NFgBeIgFrYN1Dod/iWi2/zAGH5ORCGkmzve5jSlERj
	t3c14JPEmSqpCQLnowfd3sMyI2xnH4c//NQLSrYzaITBF8B4QatvMP5VGhj5NI20Tx+Df4TkX21
	ApLecBm7Xh7enGzAWCOgpwH8aW+oGkvguDeYffmg0Kk1X3Bu90eC1Yc0TJ55x3DXb/af0Emn+Im
	WOc2PtOtu8kjPW7UlZNoiRFVlO2pnTlZDPPTDGgBFs0KDyIGApb0sY2JBnMSu2XaGddKbQtJbsH
	I1+VEH6r1gKx7EhW2eGbG6QjR/UtVELM3nKSdY3exCi7U/ABkFGje1W+vSCEthGe2QrPLQS/O70
	R4TW/NBLsAzq6HqsBQ==
X-Received: by 2002:ac2:5692:0:b0:5c0:ca1:46c6 with SMTP id
 2adb3069b0e04-5c1bc7b71b0mr1742929e87.4.1795210476660; Fri, 20 Nov 2026
 13:34:36 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120-rust-helper-namespace-v1-1-3b9a05553ff6@gmail.com>
In-Reply-To: <20261120-rust-helper-namespace-v1-1-3b9a05553ff6@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 20 Nov 2026 22:34:24 +0100
X-Gm-Features: Aa3M54pYIKS8y5j5sPhIHPrhwaCObEpFTxTtsZ6oNI_ybFTVM7rT8kqynPU1RAw
Message-ID: <CANiq72kWXzP1SWUvhOT2k-rNjopnySXeBkjwrx63V2QUaLpnGQ@mail.gmail.com>
Subject: Re: [PATCH] rust: put C helper exports in a dedicated namespace
To: peder.bergan@gmail.com
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Giuliano Procida <gprocida@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 5:32=E2=80=AFPM Peder Bergan via B4 Relay
<devnull+peder.bergan.gmail.com@kernel.org> wrote:
>
> Suggested-by: Wedson Almeida Filho <wedsonaf@gmail.com>
> Link: https://github.com/Rust-for-Linux/linux/issues/216

Nice, thanks for going through these old issues! :)

> +rust_export_macro =3D EXPORT_SYMBOL_RUST_GPL

Do we need a recursively expanded variable?

> +++ b/rust/exports.c

Conflicts ahead; this file happens to be going away with:

  https://lore.kernel.org/rust-for-linux/20261112121512.1670347-3-gprocida@=
google.com/

Cc'ing Giuliano.

Also, what Sashiko says seems reasonable: if we do it this way, then
we may need manual `MODULE_IMPORT_NS()`s in some places, which may
become a bit annoying, even if there aren't that many mixed language
modules so far.

Actually, perhaps we could just import it in modpost if a Rust module
has any Rust translation unit in it...

Cheers,
Miguel
