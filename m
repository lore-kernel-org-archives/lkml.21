Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795593479;
	b=vOp1clTRJnY1kzrmuX3vzh8HDhuwS7t/j0FevIBFqqFasMZJ9x/9TcmXXQwBPNb2Uu6N
	 Q3RGxMNU8UKV5F8IHpfqlTlswKWviHxBcnez20xtO/D+6vJ9YuSDx0q1ZyiwEuhqHSQUn
	 PtnaMOQ7TRLOnYoBGJN7ysonfegVeEr7uawTdtkME+TD58w7IznAjMNvj7xEYvV81eamI
	 Xwsf7tCM3cep7Rn3oxsBy3LA4s+Sk/W2Fy6jM/zzUzF3+0xCAfKYmWmKLeMZEkQA0mXQC
	 mmcXK3s4So8cdBB2mlyBePFbKn9FLQ5IU693ThAROKOVsYc6cfzBuZYkuVPyLWOGHBg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795593479;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:From:In-Reply-To:References:X-Google-Nh-Sender:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=ul5eVM6to8I5k6j4gyfBybKY8kBadnDIJAoBs2N8ESE=;
	b=rmADgtke+GeU0XCmaH3JsPDaxX2ZNX/Mt/GVkKKN7Pj+Sd1uVx2gMWBF5HqwoTVSqHnz
	 cEujW/AfHLb+XYKYtjCMmNJQa/4tGTcf/xyKenpp3sC9bz3zhxO04v8OfmNCnXotQcCsg
	 +TArBx5R8yJ+bpqE3veawXttQ/UgTL2R1OFjwQW6+EALGxjfpIpBYUB4YVd3nWnv1ZYZ/
	 C+jnsp/LM1bmIz3q5w9DsdrqBDr4xaF7KoGlWWjANOXThDe0vAp32H3j/vr92epA5lQCj
	 Onb4qgAijgjSAoPmu5fNVgrK884+hs7xwijSdI7KhZ47KoUD4Ma+Pztaa98wiSiNSNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="os1wA2k/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C525F606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:57:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C525F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=os1wA2k/
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b4fb5d96b3so84074067b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:57:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795593478; cv=none;
        d=google.com; s=arc-20260327;
        b=MaUSS+l6WFuo5tTrRL1M+LK9e62bF6TB6ZJXVa+Yz6JEWR1qAFUchLbdnwIsodITXe
         FrEnUFMqaAhdayxKqUo/yeMDuPGQfpZPQqK6Wfiz3bhtGpK7iF7XOjCAao9LKb+XpgDu
         d2g1I5CDzjbm4kh0RvRw1zHgNxmoR/D6OczfQn1yA6s5FyAsW9Fav8o2jjvwPhE1psJq
         LDjKvQZ3GMtaUDLA5MaIsWM5Rw120ilZKQ54+QC9lpbV+mwEhDe2aC9NAytZTJ7BJZMY
         rBXg8vG1940ikRByu0eR+wAPR1vBY3rLpmQNVJrabsnXUhmNqBpSp4y9V2b+Vh0aeFQz
         v2nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :in-reply-to:from:mime-version:dkim-signature;
        bh=ul5eVM6to8I5k6j4gyfBybKY8kBadnDIJAoBs2N8ESE=;
        fh=yIbYfMJPVnhAo8rp6fm3HCPMnLhUoBb/NpDLmTz4ODs=;
        b=fApv9dd+uDHkX5Jb7P7siS2gQ607gBqLehgbFMynfSA/rfMYBzBleUtorpCl71UKVu
         zUblLEtCaCY0NmOokaphLYQz9KnDohIWmpW68jzjLewTQzIKqBr9g7m9erKZo6PkTeZd
         ZmaIJz40g+soOJiP7eu0wC3bzgYMY6kWd90XOfxmZhdXM/MAnt4KJ+vGyRE0cA7ibHKN
         2GPJZvruQludJb8qPsTQJcEM8IOUNdkPpddaaB6BUh+jwlA0uJZED6e4fN+GSPOyNuI3
         PXumpOU5KfIzwJa0wSsIS6gEQB7Hw+kohIzEF/6NBY2JzPJAa7FqQG44YfDfNYlqPxYn
         L2Qw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795593478; x=1796198278; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:references:in-reply-to:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ul5eVM6to8I5k6j4gyfBybKY8kBadnDIJAoBs2N8ESE=;
        b=os1wA2k/HDuNvLOaitHw6lCGdTi+dEc/77bcad7q/Cu5ogAwKJHE0EweBTKXoYNZ3q
         jVXKK6GCAyaD0jVtVZdL6H8f9BvyREOelAZj4bOmo6musSrOQcm2I6qtPKZYmANkJgtf
         PAtdjK+LHTv+2YwVQSJlID2FQUl7YFH8HK9PY92IFdTQo1peOEG3/+yyU0GTEDvavyhu
         DdS4bs9nslw9cHJwgvc92uZLmExB7pc27FAXPhQU3udgT9wH37yd+CXniwBi9lGXDgeM
         ykdBgdC2bYVbCE2YR+bk9LjUvXp6KtbtEVJR8EhGZ+WOYv9aCoikhvZq1yZ6D3IgMA52
         YXaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795593478; x=1796198278;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:references:in-reply-to:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ul5eVM6to8I5k6j4gyfBybKY8kBadnDIJAoBs2N8ESE=;
        b=1zK4noJc5XSSKNv3DG6QVacNbQ0URwRc3oP+Im5fNhRX8VjS3mwVu/YEattcs4BH8o
         o7XjP1J8P6OyNlRbwjj2L32OQsWS4V8Gu2KPEJl8XfFXbm6wmtZV5RLAKwyRFGfZ/tn7
         i9KxseWQXiwBxTkoycgIrJLWefmwIeCyQ5/+hR1AyW0qYJ5UOp0RRubC7hhG2uaMZGNt
         6ELE3nzaNahD5DDWEOLkve7Np6ZAZ61GTpEHONvYfmGOaH3jaCRTPgR6FrnK/4UEQSWI
         aC6RfoZ6JCjkIInJYN5q+tmMXyOB7lplfn7fT9S2Y+k87tU5/0KGenvJ3Bt/7nSYiHAi
         6CVg==
X-Forwarded-Encrypted: i=1; AL+hErGsslUwvAyN1lSdtiPfbKEEfrZfNNsmiwm1UJI/GrF8k5qFTXw21C8ICGeNCmdnMLaXmJjFR4a89/HjsZk=@vger.kernel.org
X-Gm-Message-State: APuU4Z92gua2/0BIeHGxFX7vwSSfATqkPx8nYlK3CA2wKGeInPEeNIvC
	IZHdhv164m36mK3ndJAfxhBY5R5gR2ar3NCBO5WmZJ8ffCX2iSJNeiUXB5rzjKJPAmYe4FDmV+W
	50HA4ZCCP1SfXdVCGT3L8FrJQ1vEaPeQ=
X-Gm-Gg: AZFdTZcBX+7ECbeFbcVDbkgpEzS9fWLRUqSrcCdmcuWwgzZc4SlxigsZEydenxrbY4m
	KlAWOBlaC/LOfuAgfnvXiHU/94T0kFVIhJwz67m1x0DK7YGPMph27+geJulTSndYH8MxJaLpn/o
	WkamEu2RdeT1UCIvJEb+uH5pm9v/NtawTR2z7dsMEcAw2d8BTJBfHP3jMFN3Kdp5nDVymZzA63r
	zf8PqgyGVC6zKyUGgQOrh2onQN/epmvGTy5koev1FaLodtJoOTP22C6TPvRxp1ImN3+9lnHaW93
	o7PPY+/BPMEmop4oIVFzvJRocf7o2o/YTM8Vbc0JJrM/SMFtHqP6roNzHJpQFsQPYnMKmtIZaYK
	23k+auYfx0qOVmD2WhABtevOJXzpWZs7zc+Ad1BiFMPXtWBGXMHxv+IxjOomeCp4dJ8IWxs+5nO
	55Gs0F0jt9eeGHVLmPVCoSbL73OzrGEo5nkdfuvjcGgmuquKykgpAnOaLlscWQCFZ4+O5v3lTVs
	sWH0iA=
X-Received: by 2002:a05:690c:60c4:b0:8b3:b01:74c3 with SMTP id
 00721157ae682-8b518f19782mr69361117b3.23.1795593477817; Tue, 24 Nov 2026
 23:57:57 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 25 Nov 2026 01:57:56 -0600
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: peder.bergan@gmail.com
In-Reply-To: <20261124185427.3821700-1-aliceryhl@google.com>
References: <20261119-fix-drm-rust-fdinfo-v1-1-c10f4134488d@gmail.com> <20261124185427.3821700-1-aliceryhl@google.com>
X-Google-Nh-Sender: AW_J_UoiGWtwg6qnqUMBw-OJ-1UVFEbjy0wfv5Rh44W6JIMxd7U4y8mFVkrNI5HtQOK7ljja6JOiAjS7xwkZiGXEFdl0Ulsl2DyARbLE2OBtjbGtkeGRZSW5XZ0J_3lGWC7feWPG6jWtexTx2GjMEIk-wJteUIn1NtnDiX31bUda1vsE4L49hwYvar3comaDfsQX3th1DE1l2TZIEwwsgH3CoUYV2ANOWtkRhrYjuGo-r5eEdHFq0arOpzb1pjIEWnQXWuL9
Date: Wed, 25 Nov 2026 01:57:56 -0600
X-Gm-Features: Aa3M54p1LUGsSOwrIWll983HQ7Jb_OQJyMjmYeIZbB_tbx53ZIZvkiW3hGwAhAA
Message-ID: <nh-b28a5938-34e4-4077-822b-71fae5f4773b@google.com>
Subject: Re: [PATCH] rust: drm: enable standard fdinfo for Rust drivers
To: Danilo Krummrich <dakr@kernel.org>
Cc: Janne Grunau <j@jannau.net>, Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Asahi Lina <lina+kernel@asahilina.net>, Lyude Paul <lyude@redhat.com>, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-api@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the reviews, and thanks Janne for testing on Asahi. I agree
that the Fixes tag should go.

Danilo, I=E2=80=99ve prepared a v2 against drm-rust-next with the callback =
in
UnregisteredDevice::FOPS. Would you like me to send it?

Peder


On Tue, 24 Nov 2026 18:54:27 +0000, Alice Ryhl <aliceryhl@google.com> wrote=
:
> On Thu, Nov 19, 2026 at 10:48:47AM +0100, Peder Bergan wrote:
> > DRM monitoring tools use drm-driver and drm-client-id in procfs fdinfo
> > to identify DRM clients. The common Rust DRM file operations leave
> > show_fdinfo unset, so these entries are missing for those clients.
> >
> > Set show_fdinfo to drm_show_fdinfo. The DRM core helper emits the
> > standard client information and calls the separate driver statistics
> > hook if the driver provides one.
> >
> > Fixes: c284d3e42338 ("rust: drm: gem: Add GEM object abstraction")
> > Closes: https://github.com/Rust-for-Linux/linux/issues/1266
> > Signed-off-by: Peder Bergan <peder.bergan@gmail.com>
>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
>
> Alice
