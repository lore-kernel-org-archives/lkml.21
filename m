Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795117043;
	b=zUl1p56O3r7iJOQpKXY8Qhs4lg1WZCsCibS/ZggiZBtQgFCtcawfPkLnR80LIQs8eAFM
	 KnUnwHQeQ1+uNVvKA9t0ghKJkjOn/Ksb0YLsVlDZAZSF6jK83J/Hd6jODEmOXKOeODomi
	 gC7rmx7ue+CBsGxd5/4JDx6hc1e2AqVvGQyuhVONBcvM0S4ExVKMNLuVvuIxKYHK9V3m1
	 rsSroHg3Ym0HAnEiqePdN/9l1fg95kzBAaddtz9b0sEPYQVi4ntKk2Jaz0ggH0I7oHK1A
	 wg3wTOWqQ4+7TmX9l54Fz+v/cToLmrHtL/lL+oY+Y8sCTjCCE6bsMS6uzTYicuM6PtQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795117043;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ki7N7oUyczI7L7J7QNsuIKVYOIpUcziCfllCfxy/ZJM=;
	b=skrIvoORHmltpxz404mbxoCBdCsG+vPJHbOkeMM/g3nS93MT3MrN0L0Ix+EUKLeBe1yL
	 PFP41PW2uZOhRm+ztLfDYOMmbwl8PkXaMf2XyioTkBqqX/reOSZlHoAiXSXTdpDvqb15J
	 f6vKxVZr6ct5uSl4TFXIwrXIuTsrtvSU2Y/duI9BsBDus9oUBkZAKRNaWkowhVE+Fu7mo
	 UFcAgs0ZZu/e4MjkNxtL7V7+0fiZ4bOipxhCJOMl8F5TzwsNuWS5ut4JMoS1KNDvZXf9i
	 5UIc0t7CtjxMymecfOz0v25/k4w8Izd9k9g8PfkymY60331ETT/RdX0rKax4DiJct4g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paul-moore.com;
	spf=pass smtp.mailfrom=paul-moore.com;
	dkim=pass header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=XodjmMdN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE2C606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:37:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFE2C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=XodjmMdN
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b3e85baf7cso148123a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:37:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795117042; cv=none;
        d=google.com; s=arc-20260327;
        b=lmsQczfQTOfMIwt6IxhBkna5YM2hRxlpiCn96+LJDzVTta4ypgzkmStlGROvP/FTo6
         FtqMYAiXmyUfh1I7Er6Op+3sEg42ifNcHpyw+lBRNCIP1+/qeUevKdilO1U+FE0W9d30
         vLKwKcIKrxfFzVSyLlqrZ5hFU+obZgbLyhW+an7GAZDJnoWWtCqrxowXvxWQCi6oqrTa
         6EknLMl/f3LV6VcoQ2PcP0Li4fwKpWoZmQ++5wJRrtsfk+6axAKg2d76K6aOnoMVBx9R
         jrktlSHhvLQuzhsUHlRGH2g/i//2UYDJQ2ERMI/T14iFIZ2U9Rn2Iz9o1Q8ouApwjYLM
         U9gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ki7N7oUyczI7L7J7QNsuIKVYOIpUcziCfllCfxy/ZJM=;
        fh=GJh2HLcNaJpcqw6ZdKGR1urOCyEHK+DuLFg8rj6DXaM=;
        b=qSKAovnSBDJ4PoL789Z0YYNtFxVrapioIhZYstI5MbRSJ4Cllf8QopyqClXFAh26Jj
         dV0V/HRHKhD+iVe91OUVurcTxotWHqX0YmXLc84fl4BJHZiesNEkj7qFz5UiF+IyrArD
         4Ef6vd2t1qB/DSGCKhA3aWZuK1L+VayHB0Upx6m0kk2JEhonz7Ptoho6bC0OOl8vixAl
         +ATdkEqtcLPh7tpBgW5LFGeX1I+2Xiz2ZRrDlEh0AP8ny/d8B5oUG2arODQcTwF9Lwwe
         zvzPY8oxHaLz03PgoKej9d1+0GKm8P9yUJaORp97kC/tijdrqWyoLveW5VzGt1eLIz1v
         /J1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1795117042; x=1795721842; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ki7N7oUyczI7L7J7QNsuIKVYOIpUcziCfllCfxy/ZJM=;
        b=XodjmMdNd66sSQHPxgX0Iw77xrzUpXmpUh6FvrO/B/Hk8c1K7J/ubNP1xulYRVIUn7
         0zNyz12Ie31a/acpAaE2JdzOyVZ1FIPVGXO2gq3/Xb7Bd1z8v8sJz+XnGPwAxvBt8xIt
         nRTm2fO0Elbyrfw7YtQ+JmWuR1ealDi/ibMo7Imi71oY+hqZsiiaQQ9dG+C12cSBrwK/
         yX57pzVy1ZeFaPnMkTQAWdMaSdjisCW3A9pZcG19vKHgRG7aioh+XHJFJMVZ6Bw9H536
         yCz7GWX5rzmqjUzUXrTu98st6r2v67k8vlpr+1E/DOMY+/p5qBpWJAVdWcPbbrF9cIW6
         mN0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795117042; x=1795721842;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ki7N7oUyczI7L7J7QNsuIKVYOIpUcziCfllCfxy/ZJM=;
        b=kB/SPKkv/RqUEhg56k1GrHipaRTsEmVnzjV8AzD8lXKtL0N2KEVX7T+OYchJwCJg1g
         ryMzkp4jCq7S6fIV7RXLm3faDPbIta0ad/0vFxiJ6/r4L7v+X4myxjoPST7OrndXnwH7
         Na3DiK2Ts1UfBrFIIFqdLTlG0UFaF9Dp4y5b0dUhQUDIQ41QegyUvynY35eZeR1n4uSI
         pZiqENqu494YQjbKhK39Dz7MXMwzRCAh3ggkGfTDQOwUTqBKAqFxiQnIaozi36g2cqgf
         c2iJTakf1vEzCezONzL45GCcKJzQE8wPJoI72rHnPJog9QKozSK9IppKLG7H28yVVeBL
         ApUQ==
X-Forwarded-Encrypted: i=1; AL+hErGYG/lRmsrFxsIu6Kumbo/NTZQXeAYk4uwEq7tH5cv7iurrg/WkRYlvEE8j3b9NDGTgbLVIhbhl6PHdPwk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mZEnSCdp8mtOPz0ugJdxCuFKPOmAYZdrBHtSYwkMDg7Dt0pgG
	6RGFzpmbV5PEiW7lmdQSXGyzi2eA8THOkugOGh6TPk+yM27SVz3xd+ZwQ1dTN+pMDuub/9BCqIn
	vO+C7RGs38noPqGNjWVFGtQbT6oRPS8iXvA9wYgtp
X-Gm-Gg: AZFdTZeaeZXBqsDUKOoUdQGeS7YsVADmmJxgxixTuTIyX+IGNWj8NXXZZY08t+UgCpo
	1DQEXj4I5fuvGJRbc8qO+K1Wbh1p/wCn60Eq7ZdurPT4A00Pqikauk2/pfEEdIIJ9lWKEpq6UOj
	VR2QnH0W7YFtBWoWC3s0OeaHJgReWvFDDjrcobToiUyy8p6IQCvy5MBtbJKIBuVFLyjbi2c6pzm
	+kvQmrHf9rFHEpDKHVHxYi+qILb39MpfdV7mgvnutwQKFqm1PFHHhh+pHe+OOjulhQVgFdMwBBx
	6LTulfDWWwvdmACSKD6DSeaYLhSbVg6y0f1cyMYj8703OhGmvO8kLIVEb4abjWcZDoJffeSmVNA
	u9lqhczcqRf1gbvhyxB0nyEBqzuDYZ4CLE+GwDBQcK3CQV7z8INGFeU8LE9UqQ9f+zhvDdw==
X-Received: by 2002:a17:90b:4a48:b0:3ab:2d17:51c5 with SMTP id
 98e67ed59e1d1-3b41c7b60b5mr394543a91.6.1795117042197; Thu, 19 Nov 2026
 11:37:22 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <d85ece6e-27f9-4d9f-83af-4101bc76fef6@app.fastmail.com>
 <356db94e-f5d6-4fb2-839a-b97aef72256b@app.fastmail.com> <CAHC9VhR9sjunJRnM9gy-BkBZkapQTrr8a8FtmaK7JkAmUqTrLA@mail.gmail.com>
 <CAEf4BzZKmn6g0SK8OddjKFj_vAmZFvpZv32Hs_S+GHgT7VNfrg@mail.gmail.com>
 <9d6bdc31-e57c-4187-be78-29d82471f710@app.fastmail.com> <9695ec3d-7b81-488d-989f-0bd411d673f2@linux.dev>
 <CAPa8sAh6b5xn4rZzPfM0nZ+_kkywWj22fy8deLq+6qYews0rdQ@mail.gmail.com>
 <MRYP264MB7057096D13282544720793F2E67A2@MRYP264MB7057.FRAP264.PROD.OUTLOOK.COM>
 <CAEf4BzZWEU24+ZC0W_20hc3t+qnEHncQA1ztTF7ZPPOf3DDPVA@mail.gmail.com>
In-Reply-To: <CAEf4BzZWEU24+ZC0W_20hc3t+qnEHncQA1ztTF7ZPPOf3DDPVA@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 19 Nov 2026 14:37:06 -0500
X-Gm-Features: AclHuK8huO5hL8Cq37FykvhPQRmji6J0FCQEXOUl5eyoX-lYuZrqwKkD8osBd6E
Message-ID: <CAHC9VhSFvOiP5Tyt=rOFMwg=Ro1jRw+hfcw4AdCkEyftZJHQCQ@mail.gmail.com>
Subject: Re: [BUG] bpf, lsm: new first argument in 7.4 inode hooks silently
 breaks BPF LSMs
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: Paul Mabileau <paul.mabileau@harfanglab.fr>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Daan De Meyer <daan@amutable.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, roblabla <linux@roblab.la>, 
	"bpf@vger.kernel.org" <bpf@vger.kernel.org>, 
	"linux-security-module@vger.kernel.org" <linux-security-module@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andrii Nakryiko <andrii@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 12:59=E2=80=AFPM Andrii Nakryiko
<andrii.nakryiko@gmail.com> wrote:
> On Wed, Nov 18, 2026 at 7:14=E2=80=AFAM Paul Mabileau
> <paul.mabileau@harfanglab.fr> wrote:
> >
> > Hello,
> >
> > On our end, we also have already merged code to adapt our eBPFs to the =
argument order change. However, we would still prefer if this easily-avoida=
ble breakage could be fixed by moving the argument to the end, even if it m=
eans having to revert our fix.
> >
> > This is motivated by the fact that such a change is not made in place o=
n our end because we ship our software to environments we don't control, me=
aning that any and potentially all versions ranging from 4.11 to the very l=
atest should be supported, so the change is made by compiling and shipping =
a new variant of the concerned eBPFs for the version interval it is valid f=
or (7.4+ in this case). And that has to be done every time there is an upst=
ream change like this, so the total installation size and overall complexit=
y grows accordingly.
> >
> > If we could avoid that, especially for such trivial root causes, it wou=
ld be nice.
> >
>
> I agree, and that's why I'm asking Paul to accept the patch reordering
> the newly added argument before 7.4 final is released.
>
> I do not think that the maintainer's personal preference for argument
> ordering beats real user pain.

As stated several times in the past, the problem lies not with the LSM
framework but with the lack of an abstraction layer in the BPF LSM
providing a stable API.  As far as I can tell the lack of an
abstraction layer in the BPF LSM is by design, and while that does
provide some advantages, one of the notable disadvantages is that the
API is unstable.  If you want to be upset at anyone, direct your
frustrations towards the design and current implementation of the BPF
LSM.

--=20
paul-moore.com
