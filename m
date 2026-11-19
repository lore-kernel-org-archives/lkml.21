Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.167.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795084555;
	b=WCjAjmdOUV+lnr7eub/u2wD2g3NndyeGjx68c8XsqBUSYuQDHy0sGp9PB4HleWs3NXsU
	 2PlwcgzyDHP9Lat0llpAq1SMAG5ihjjkNh+eTdFfplhhxSq0VyoS3G8Pt5+d5ibi8dLow
	 eDQ5JJPTjBYltn/qZ9g1Q6l4dWhJFU3KFFHJV0EC9bxRRfXMWc2m8mRWC88+Lc4J+QbcU
	 HBbELAUxZMeE+brqW6lv/fELtMVooNf8ITnd/oWBDYZrv5TqvZdYCtnyKnjKy6VkPIpTg
	 6zX9B/1DcrwbkV0lWl2oflh7Yc6w1T18Wkl3Ju4rC0bnFsGMBZK/vZPupq2LOUEPa7A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795084555;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VSgqe+2+NVZ79+o9y80nGA+xBFTNkQAJQWULoWfKhj4=;
	b=c0U23tfvjPEZQHfPGBgQaEmos2qabwsMAE9AQBxrcSk27xTmtrpPWsIEzRaCcWrenzOm
	 0IrmS09mPEmJbrq1QHSfp/b1I7AJR2J3srnd0o/sRAxboVgLN+K6L/imPtjASl2pwlU7w
	 0AUkxjylWP7KFVVr5/RLaq5UU9Zk98VhpkNUHNhTacApgR9pCA18gvMDAR7OacyqqgEM1
	 VA32eqVMDK15KokHygXLtdoSknfeyTkM9NOYiQWhZolwGxzeTrXQVoZsURYHrkeZbGskP
	 V8Ki+myrUbcKhfY+9hBf1g0wgrg7ZL+ea40Egi1vJezNUCD32SZ4JKUWKXW1YY8QHkg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ndNtRwto;
	arc=fail smtp.remote-ip=209.85.167.44
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608D5606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:35:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 608D5606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ndNtRwto
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5c09e2ed679so91932e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 02:35:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795084553; cv=none;
        d=google.com; s=arc-20260327;
        b=EJY2xdiFo/qPCswzMGwZj4fvvLG2SRqaMpisgWwYNzWkOnF2/bQqhguEiNuP/EtB9+
         doiFa0o5QIlSXtqznZQimqc21c7pxuKtsltSMmOqwyNlHfYlga4zv47UdF3+tUB2Wluw
         C8XloB28q2TInSENfJDssLsmhn6pCS0y5QF4vH0C5hrX7OmRskXYvb9H1X9X3OzNksnM
         +18Xtp56Oyg7UKwN+SKCObSahd1hrmMH9YENlkbCCYQaX7wOnSd3gKOJDbDFDDfb7rmb
         Fg2xFMU7MwOY5TLE8tcy9d5OOwix1haKWDpO07wkNBM2zpOf8c/1GkLGRdae0ObiX2ZS
         v/Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VSgqe+2+NVZ79+o9y80nGA+xBFTNkQAJQWULoWfKhj4=;
        fh=GYb+kLWnpRHedtxkHzo38qBAXmnuRrYvNM8/gz5s+eI=;
        b=n+Um+DKJLHY8BGY6iO+OX33k6ahwssqNzuPXb8myPi0Qel97U8SgP1PMJTRiE/Zpsm
         WptdD1MSXvZZmIZiPAcGZzTQpvIfOlq8HaWs8n2eIu2gfwAyeEgQT1Ma75Wg/MG54MqN
         CioeO7z0Dqtjf3FEHCcV0gz5dfZN2Zng73nRw/hqVkNGVLnULZvkFmXH2V5+tQlzei86
         jYEpaM+F1nXcwhWOQaYtMwuUYZuG7mXB4A7hnQgtg+1zyXo7KqRC8q05A6XSegM8Fqol
         aJZ7QWzDVmQUExI2INgKmkxE2/lnNUnKhF7jDHtbEq6C+opMMp5OhmYxVxdrSj+cwxtW
         c4Ig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795084553; x=1795689353; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VSgqe+2+NVZ79+o9y80nGA+xBFTNkQAJQWULoWfKhj4=;
        b=ndNtRwtomifqkf55G94YIgPKmDQUiD1m8EZ0+rvEQ5fkWplEwCT3vrhuUg0TybVOFc
         FDFhMom0dL9XIOE8MwORLs3b0sX2v1NcddjdZy61EQI1R+b+77xyN7bQMdYLzPEQcUeA
         GbHDXy1p6acrSdRhEeh5KCPm/a0R4nREHWcqmHYS8rggx0IEtnl3xzZFq5mo4la95cxg
         09VZAgLtvaU3CWng6N+vH0dxl16QWS9xS+ATMjZZiov4ZKGz0nw8A1UYvZFV/N5To0mT
         6wEpigqmx+96yWAIwqBmSPS7X2ChmDnmqaLIJXgL1SspyBHFL96vSQveV7KWzfymuCZ2
         BJ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795084553; x=1795689353;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VSgqe+2+NVZ79+o9y80nGA+xBFTNkQAJQWULoWfKhj4=;
        b=TzCQmP8Dd3Cy1UCWrx93ILK8VOh1SiwEZrW58apbtuPB6sjaKTzUN24lVI3x3sBdkW
         m6L1sX0f9Aiy1U8fWDrykumKXTXEYSGJrbGZZ4HD4Pl4930pUAi7gguA6t8eRlEHJe+s
         ylDwA4qmnpAz+Mlm9KVACUn0pbZlcysv5BvPIDYFKCpH+jiJvL2frUGsw4Whq6XYRv3J
         hx+0ddPId8YLzGQJluYeuXumsAdKtBpOjo+s0+gCWYQuyjUQOKYE+nhu0zq/dx0fdgf6
         k+8Y2anGD2osneyY5dxdQ7kPo7sx/A8jL+4MGKE7GVpb4TvIiiIKX9JsWkUpQ+JXDHAW
         34Jg==
X-Forwarded-Encrypted: i=1; AL+hErHH9cbzQvGnJFJ7GgqkfvVMrEGy9z8KasbubxieqJDxANOo9d2cL111SDtvSH6vUKQN+iprT40jq6vdP0k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/F/+rR1PGNClfkRC7LsLb6fwrNCSNajtQ0QMmKCp16tgYtXhWH
	2CoQ3x0lhabwwL9YPVLashPPDnnU0sYtjMr5pVJhfsQD9qw/BSxxWgH7HYE7ZF4fSfKm9YvSca5
	MjqSn+Q1abR8h/NyJMgTkykrvEFFZaEc=
X-Gm-Gg: AYBFou3Ip+XCm8ayUwLSc15T+2URHYY7uN6t0L904wlGA/V+yzS+e+jBqurfJvQte/8
	KrZl6ddPtTHXVjk7ONTn6PciSALAnARCjhjC3DouvxC85XqZteXtP/0epJBfGalQR016hK9xvnF
	Qrsh6/p5ICxqlq483GWOBs8B9IAs6+HBoOVQOmgX2tLb8A8fW+MC7fPNnfXTV8P4x5m3LHDtY+6
	1pTWnTO9Vrb/s9edmpcEMvE4sDukQ8pSeCJIuMXGW2dvVSQZCFwZ97FQYNm6xESj/JCm0R+Da4x
	7yOlVMgtfCVXMr43+dDEHtjycvs48O6HniaqgGs+UQrb3TS4GJzzi0Q+AKAHsWnJPK5WwEDMj6e
	I2p9vnAmg6dFHQ4bDhUlVehF03ZWMK6ZB15kJpLZcCpXh7BYqGkOnkRw/0YH6a0WAX0ZOgWkyyI
	MlLVtpY7oL7IaIc5sHES0oqtDAtOQeZZGWHv2gTJNNjEsJp7sWhfQKHGAr5lsCKdng2qTVblxbq
	5uFNKhRv+9sCvCtOee5+chDsFIBBv1M73wVgtWg7dSFZgjLQQBurPa7O0mCdjbjlpY0v0Av
X-Received: by 2002:a05:6512:6201:b0:5c0:465:3fc6 with SMTP id
 2adb3069b0e04-5c1aa04086amr2064153e87.4.1795084553237; Thu, 19 Nov 2026
 02:35:53 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-rust-merge-functions-v1-1-fe86126522b9@google.com>
In-Reply-To: <20261118-rust-merge-functions-v1-1-fe86126522b9@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 19 Nov 2026 11:35:41 +0100
X-Gm-Features: Aa3M54oL5-b8rD0ZNwQf4CmOodKRTjORBepmsgS7qWBa91ie7LuuwJN18wbz1S0
Message-ID: <CANiq72m0uZRVWG=SwzUUzHo1nPX=2Q3npz-9jU_ORBSdcoAGeA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rust: disable function merging unconditionally
To: Alice Ryhl <aliceryhl@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Matthew Maurer <mmaurer@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 2:09=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Function merging causes various different issues:
>
> * For CONFIG_CFI there's an LLVM bug causing functions with different
>   CFI hashes to get merged. This can lead to crashes at runtime.
> * For gendwarfksyms it causes functions with different CRCs to get
>   merged. This leads to broken MODVERSIONS information if the function
>   changes in the future so that it can no longer be merged.
> * Wrong backtraces when a crash occurs in a merged function.
> * Possibly also issues with pahole/BTF as the merged function's debug
>   info is lost.
>
> These issues are new to Rust because in clang, function merging is off
> by default, so these things have never come up before. Because of this,
> turn this option off for all configurations.
>
> Link: https://lore.kernel.org/all/avy_9SPRaPSKD8b4@google.com/
> Fixes: ac61506bf2d1 ("rust: Use gendwarfksyms + extended modversions for =
CONFIG_MODVERSIONS")
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Applied to `rust-fixes` -- thanks everyone!

I also added Cc: stable@

    [ The LLVM bug is tracked at [1]. Nick asked what function merging
      refers to here, and Alice writes [2]:

        No, this isn't linker ICF. rustc doesn't pass --icf, and in any cas=
e
        kbuild invokes rustc with --emit=3Dobj and does the final link itse=
lf, so
        rustc's linker arguments never come into play.

        What I'm referring to is LLVM's MergeFunctions IR pass
        (llvm/lib/Transforms/IPO/MergeFunctions.cpp). It runs as part of th=
e
        optimization pipeline, within a single codegen unit, before any obj=
ect
        file is emitted. Clang only enables it with the cc1-only flag
        -fmerge-functions, which the kernel never passes, so C code in the
        kernel never sees it.

        rustc, however, enables it by default whenever optimizing for speed=
 or
        size (opt-level 2, 3, s or z), which covers both kernel configurati=
ons.
        It uses the "aliases" mode: when two functions have identical bodie=
s,
        one is deleted and its symbol becomes a GlobalAlias to the other. Y=
ou
        can turn it off with -Zmerge-functions=3Ddisabled.

          - Miguel ]

Cheers,
Miguel
