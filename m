Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795706171;
	b=0UQc73Em33MQF7TBECFeX+5jIhSiSJewu9MWtxT+Eu3L2vvZZ5v31fBd+7lwfEHjHyfO
	 Xr6kBECm5RHXS9GIB3ATqAGewhsMeu48WY7GzcqRy0KgU+vDkIlT/gh47/u4iNkuEBfqy
	 HNzOqhWxRP50HUXHoRkYHxdbJQKMGpl80Xck9tdOiVz/ZDgsfYj/gfSSRdeY/osu6WHOj
	 8AI2rpIbcak0q6DFgGvOZyFvpAGTUQJw0WR5aWVTb7UMgMAjxE6Hq7glJjz2H3/YCHst8
	 59NutNo88H59PnRqS38booeFuhQEHr/v8IuZdk8hx4PQIIPscqUBHt5wTbBV5PHRnyQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706171;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mBvXmBLkI+5ZVDxMnAotYXXXMOB1nSxF2QoCNRUPkp8=;
	b=ee0VHKV2RzIN6LYRytr095p0hyJmBIWy0mK/Up/oypZeBgy1tyyCGTHAsdU7NYB1e8o7
	 IkttXlx2TxvbIzCEXxEfQGZwI4GT2lL02uuuXEnNqndqOFoYuGP27QaIwJ+ijruPlNwyh
	 RhIYdCthJLLzsiUNK1/1l+3Z956H1GZOAKK8Hqa9+uZDXnuABUX6/xtcyNQ76vd4dVzO/
	 Eon9aY5tueZGBwCp2tz/tFPTzaAdk8NqnRBWV0RuAOwT3sCIdL4YWOLWO03yOczLCmtO6
	 iVDyy56sB1mMJrV2F6MkQp9RSEWdQGKGEQNjuPehqHbLU1mULVCXIGGll7qi/3HBNCw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GhoTT+3h;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE368606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:16:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE368606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GhoTT+3h
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so92069005e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:16:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795706169; cv=none;
        d=google.com; s=arc-20260327;
        b=Eqii3e1xdxszNt98ewPqlWgAOjYr4FO22hALgwu+rXECdQhmtvnttgqyG8NFuCmQmL
         TcbuD/aKDq4bajvZHSGjAjBHIzzR5IJIf0dXy/H9TWWw7pTbTfDZKXBGYGGp5GKQyF2Y
         WBAKMGdCS/qO532RfAnwZjUzfy1jdNZNog4ALdE8PWne4AZ24aocXqcnNIf+nUjtb9Xp
         iNtXjnWepFnj3hLGY1pm2fAOxqnp8qLa2PeBpVEtrU6r6sJvae80P3aodyQw3BJ3HTns
         FLttlNbfsfOf7XoelUffa8l7Ufl0fBCkAtq+o330mk6cQ5EvuPaj/XBBthHSVHNbYMPn
         1piQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mBvXmBLkI+5ZVDxMnAotYXXXMOB1nSxF2QoCNRUPkp8=;
        fh=8UF1TiC0tDsO/EK+nba+n/LVQgb1HnZNsOA+SPXSwyw=;
        b=LQs/mZ02FuWDZn4jcuwAzi5RYxFUTPIaEB13oxNLw8LvpS3MMIIfkSpU4EGGYw+FHg
         ZCaFbRg7k6wKgZH9SiDkFnMolfx/cTzPsJeoZt5UXocAd3sEduTe/A2tWEhlWRKMycEQ
         7+ZhrxHNA16dZiKzKyaeSgaAbY3ProAZeEUYlZ631naAtH6ijtlwd+/wSmBONpGxACBU
         fYyl8pL4XQrN5nsCx0HQkWGexHjn1shU9UADy8iCj3jdbIMAZpChzfeJ8j/2CidqlFxM
         298wbRz0UH+FSoISHXCroIAIgnLdgYNJX63tDYpUZdG8G6DDB3NWhRtwfqwG4N1WkqvP
         3I6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795706169; x=1796310969; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mBvXmBLkI+5ZVDxMnAotYXXXMOB1nSxF2QoCNRUPkp8=;
        b=GhoTT+3hqhyTVwyAIWWrKhhvS3ulJ3gnLZmpoO8ekmItLfPnswvDvTb1d9fxSE6ODK
         qbifDHjnqj1LYSaKPeFKR/bKkcyOsXV9khDMPqKx8EhATt2qmZ+UAUJfF1Aw/JaA/+fh
         HcgqFxa26KkfxEzmerkJAymeRBm4huWFkkX1T6fnTZae8pq5GCUe/dt5h6QgmU2uxKTE
         USj8hNiuIfDuRFhTHvfAzTq9iJ8CPvgDkIQzlE4J5lOYX/YWKbNikkf+iDWCn/EuWI9s
         H71z0k9M1ab2zlQOVd/hiwXjMpT83N0jDbdgVatlCoMUYfjwt+5tyY+dw5mrugVQeRli
         R9wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795706169; x=1796310969;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mBvXmBLkI+5ZVDxMnAotYXXXMOB1nSxF2QoCNRUPkp8=;
        b=S7Ls4ZLNZKnBubOxhVBAD+fX5128TNqR0SDtd12malbanH3DgMZrcom3jEePPXqTAy
         0oVrDXHfQrUtt243U+cWB2JnseIyWi0IoxtAyyyu9Mfx2bYmyzB9wL6ifXc52wbq9yCW
         2uU9A2sgvnqRLbO9QmxVYFaNLv7ePBnjxV8zHduQCQaZQ+EoN6yP5GXO+EZOQ7fuDyAu
         aKjmJIHz5kvx9z0vEwdafw/Nb6csuvWMTQRhkE2sVxghSnFV3INbSiwQ2sZsOUjKifIy
         N9t+N4MgOn/JbhylSG1w8oFucyivG5iSFbFu2GUZZ0A9mypCAlhmazAIZi6ecuhrWbHu
         WVLg==
X-Forwarded-Encrypted: i=1; AL+hErHx0uIWW2mVDUgqc3RGfxc9BJ3NhzLoWuvfV3Zli4O1wYJVmXNz9R0xBkG/mP95UrQUQ5thFW42e2++jiA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/CSq1NINlsEQAkE00kbJx787qtDGVoQv28hE/vgo1/ak5zLfIw
	hGk2oldbrXMKgTk8uZLWDd48HwyZ8wxQI69ylOIaRC+4eScbyEuxBYiEOm7v8XgJPm6pY2A/3J+
	bm85IT8IwUKRydprGZVAerbvJBf2g5MtCt6Zm+5ii
X-Gm-Gg: AZFdTZcLde3XMqdY7MQYKb/zTrlB6H8HXe4VDa3anyTIVR6Cmx9Yz2CECSmk0ad3f+7
	ooLup/4U+Qdx0MPz0PGuu3onkSChYCzvWrOBeXNKKUIfrEmP/KJJNpoF+8F90HBPggS+zgD0foN
	1haF950tMy11JK8QqfxZQdh9p5oXogGh8QUkGpGze9O916iEEn/6Eg9L+tA5Kbo1gWNUOJ+siFf
	NJxJR/EY0qB7uhwV+Q54C5K1Z8v7+eEWgMHY8bnudmOzQG4Et9VT6InQsYcz4p4b1rghzgomp+Y
	YwuVaNS8Yh1nCQz+LCa2dUGpO1GRQyBsnH+YHG3aPXMfbNGdcM1k1QgEuqq9oPTHmD4BAl+tYsj
	/jFUFtZTHu2WHdyxVcb2v//TjfxLYgajhvln+XtZyBZnUHuXhxD337ya4ERzlog5NGE6OWXNdCX
	Gtj2SfXjwlj7/l9N/R7kJNrFv4r5s7FxSfZMdSwHLe0q1T
X-Received: by 2002:a05:600c:16c9:b0:4bb:7ad9:311d with SMTP id
 5b1f17b1804b1-4bb861692a1mr332818735e9.19.1795706168571; Thu, 26 Nov 2026
 07:16:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119215046.2892839-1-xinmengs@nvidia.com> <20261119215046.2892839-8-xinmengs@nvidia.com>
 <DN4P1UAAVP8G.2TUW0Q8UEQVCG@kernel.org>
In-Reply-To: <DN4P1UAAVP8G.2TUW0Q8UEQVCG@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 26 Nov 2026 15:15:56 +0000
X-Gm-Features: Aa3M54o7yVaAHH6adwEWSabFuYapgO-QYKd3fskOtzrfMLGKtESTl7nq44reziM
Message-ID: <CAH5fLggYpTiLKDXMQ9UYBGZ9VuZBWbNfCZn9fs=i82-xf6A-1g@mail.gmail.com>
Subject: Re: [PATCH v3 7/9] rust: vfio: add PCI variant driver abstractions
To: Danilo Krummrich <dakr@kernel.org>
Cc: Simon Song <xinmengs@nvidia.com>, acourbot@nvidia.com, kvm@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, nova-gpu@lists.linux.dev, 
	linux-pci@vger.kernel.org, alex@shazbot.org, jgg@nvidia.com, 
	yishaih@nvidia.com, skolothumtho@nvidia.com, kevin.tian@intel.com, 
	airlied@gmail.com, simona@ffwll.ch, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	jhubbard@nvidia.com, ecourtney@nvidia.com, cjia@nvidia.com, smitra@nvidia.com, 
	kjaju@nvidia.com, alkumar@nvidia.com, ankita@nvidia.com, aniketa@nvidia.com, 
	kwankhede@nvidia.com, targupta@nvidia.com, linux-kernel@vger.kernel.org, 
	zhiwang@kernel.org, zhiw@nvidia.com, boqun@kernel.org, 
	daniel.almeida@collabora.com, tamird@kernel.org, work@onurozkan.dev, 
	jgg@ziepe.ca, bhelgaas@google.com, kwilczynski@kernel.org, 
	dri-devel@lists.freedesktop.org, peter@colberg.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 11:51=E2=80=AFPM Danilo Krummrich <dakr@kernel.org>=
 wrote:

I suspect Mapping<'a> should wrap a VmaNew instead of VmaRef.

Alice
