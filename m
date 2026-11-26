Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795680836;
	b=2FN/a0tvTCv4qeNMIHc8P2brBYo18eZ7jxOvNgbqt8Zz67VHjytcPaBdmMVPSJlMqkJO
	 cBd4RHlnnNnASwDE3Fh2WZtzJ/QSsbXUIM3QIaab5Q88aWE5pzhrrH0dedrjMmcivjnD4
	 Ax9OShqcuoXjZ+hc2KB2qVbR509uRMiLGEmfNtnpqWfyehM/2K/YpAxr5sSSfJ1hskqai
	 qgmxOM+AC7KdT+fMo/XyDSn5bAA6IkGcwowiPiekc8QUMWnoejXVzJtGSCHBSvDwEPutf
	 FkayCtYPt1SlWh01vMkQBrxKtog1fjp4CyRmPiFYwhg5QIla+y6EX6AMjvjmzi9/BaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795680836;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=WVH3s10tcaCw9+DG19YQgdVEPUmM+p4Y3mX4LGTO7Kg=;
	b=P0dZyiN8rfOyiZZIOos7SY3skFd8e07UDMrYG+QgeVekhy+HBosgkJYPa9K0609VmLaf
	 7OjdOYhtvqh05AV5egENngYfPe3wdm9aCT8Sp2w5m+8IJENyTzLzOlxs/mJh3dE2qBECE
	 br6okjbyXdD3hYvq8UGfzAbRlRMmIuy5fa/mSMzt6Lqs10BbvrWCI3WuskXacSSv7w7to
	 bCAgykydymQ80eg2GVHx+SRiil3TWyDGYncNHEzU+u0hUQQDBMXgAXrAuRtKF6d5KrLpZ
	 YiqbSITcXBDXGZlf6/nJYlYNP6fG2Tsdahi6ag993BAbErRr+BpXAyQ/S6AgzUxiDjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ih3nUqid;
	arc=none smtp.remote-ip=209.85.221.72
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD14606A33C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:13:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AD14606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ih3nUqid
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48e0461e040so5265497f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 00:13:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795680832; x=1796285632; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WVH3s10tcaCw9+DG19YQgdVEPUmM+p4Y3mX4LGTO7Kg=;
        b=ih3nUqidlANnxrMlP+nrLNu2mMYkPYWJ9H35iadP7Uf+z0o1dOMWCLSQtv9LfoVmKu
         xoV1AgneAv8gXunrisfQfryGbvznRoWy8BUnm+tFualPu65NtzdiApKPgDgETv8BLWSd
         PTP6Ob5nAqKbAkOt7dfuqlAEq/r8MOu5J46VDB11lGRtLcSh6VWqJV7TRLnnzIz/xv+M
         ZLf+KYv+TUhEEokVWJg0x6+zSPzfedPoaa+cYLhUKLqkEPgo9R0nHVPFsj/98tHkMlmR
         6eNWR8Cfnw1o0IrxmwEm4LFqr1vV0nOKA7MqEpip2/HVbln/nHcIEEXbgsDjWA7s6yd5
         Ae0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795680832; x=1796285632;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WVH3s10tcaCw9+DG19YQgdVEPUmM+p4Y3mX4LGTO7Kg=;
        b=rOpRUBtzD3GWRsGTMkWe7qzenSxbhdf05yXRo02DV1t1SP87fqSgw/Qs08bYlyRBkC
         1UyPdUrHOdUNLR016nK4w5ZSf/JbKkRh74/j3Hmd9wqGEMwlv5LCCwZHN0PWMPlmY51y
         CYGaZJ8WLNiP5F+2qwoffAl/tfw0WsdIubhdkNJsFZbRRhfSzHlQjtZ82G8UYe3OE1A3
         J0Pld/lC+8QoQ+ZBB4LaDlWvjoboYlvdb2Tu2qgcN/17JVE6n0Rb9gQvLI/PNPrRkuzJ
         FQHFKdMi7pzD6iXrBgwogTSGW7PzLzuEbrLZxKHsNybxNJdSGSyddbMooFn5XUflkYl7
         ABtg==
X-Forwarded-Encrypted: i=1; AL+hErEr92U9QeCdDfrGZDneR5LZxz2rZjrODwqM7hBHvL0I9iBl407J1oOc73rxkoDJQsPJ4G87RImAShq0jzA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CW8oktbK9kYC6rr3b3AKl169C/wf0EYkUO3l7iu/aTVMYSasB
	7ATScAFdl3UfjAcYw5U4nx6n1PAsPGCjLhA5OvlHMtIK6qLW3JHQrwmlXY0GPi4413l+gAHuSki
	NTDawPJa6+D9RpPLwKw==
X-Received: from wrbdy12.prod.google.com ([2002:a05:6000:e4c:b0:4a4:a9ad:286])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:adf:e00c:0:20b0:4a7:9630:7b5c with SMTP id ffacd0b85a97d-4abb225e976mr27696136f8f.29.1795680832256;
 Thu, 26 Nov 2026 00:13:52 -0800 (PST)
Date: Thu, 26 Nov 2026 08:13:44 +0000
In-Reply-To: <20261124-dev-pin-init-doc-v1-1-dd0a3eda9018@garyguo.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261124-dev-pin-init-doc-v1-1-dd0a3eda9018@garyguo.net>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261126081346.3466629-1-aliceryhl@google.com>
Subject: Re: [PATCH] rust: pin-init: document self-referential feature
From: Alice Ryhl <aliceryhl@google.com>
To: Gary Guo <gary@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Benno Lossin <lossin@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Gary Guo <gary@garyguo.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 10:16:23PM +0000, Gary Guo wrote:
> +/// When initializing such a struct with [`pin_init!`], every named init=
ialized field have a
> +/// binding generated for it (as `&T`/`Pin<&T>` for fields share-borrowe=
d, or `&mut`/`Pin<&mut T>`
> +/// for fields mutably-borrowed), so a field can borrow from the fields =
initialized before it:

A couple of minor typos here:
- "have a" -> "has a"
- "share-borrowed" -> "shared-borrowed" (to match "Mutable Borrows" below)
- "`&mut`/`Pin<&mut T>`" -> "`&mut T`/`Pin<&mut T>`"

> +/// Note that `&mut`/`Pin<&mut T>` bindings are also generated for non-b=
orrowed field, but access to
> +/// them are limited to within the initializer.

Same here:
- "`&mut`/`Pin<&mut T>`" -> "`&mut T`/`Pin<&mut T>`"
- "non-borrowed field" -> "non-borrowed fields"
- "access to them are" -> "access to them is"

> +/// The macro verifies that captures marked covariant really are covaria=
nt. `#[uses]` accepts a
> +/// comma-separated list of lifetimes, each with an optional variance (t=
he default being
> +/// `covariant`). The special lifetime `'_` stands for all field lifetim=
es mentioned in the type
> +/// of the field, e.g. `#[uses('_: invariant)]`.

I think `'_` also applies to existential lifetimes mentioned in the
field type, not just field lifetimes.

> +/// An existential lifetime is not a parameter of the struct, so just li=
ke a field lifetime it is
> +/// hidden from the type of the struct. Unlike a field lifetime, it is n=
ot tied to a field; the
> +/// only bounds placed on it are those written in the where clause (here=
 `'x: 'a`).

I think it'd be useful to explicitly say:

	are those written in the where clause (here `'x: 'a`, i.e. 'x is
	shorter than 'a).

> +/// - `project(self: Pin<&mut Self>)` =E2=80=94 the pin projection: `#[p=
in]` fields are projected as
> +///   `Pin<&mut T>`, all other fields as `&mut T`. Fields that capture a=
 field lifetime covariantly
> +///   are only projected as (possibly pinned) shared references; fields =
with invariant field
> +///   lifetime capture are omitted entirely.
> +/// - `with_project(self: Pin<&mut Self>, f)` =E2=80=94 calls `f` with a=
 projection in which every
> +///   visible field has its actual field lifetime, so even invariant cap=
tures are visible.
> +/// - `with_project_ref(self: Pin<&Self>, f)` =E2=80=94 the shared versi=
on of `with_project`.
> +///
> +/// For all projections, shared borrow fields are only accessible with s=
hared references, and
> +/// mutably borrowed fields are omitted (they are only accessible throug=
h the fields that borrow
> +/// them).

"shared borrow fields" -> "shared-borrowed fields" (to match "mutably
borrowed fields" and avoid sounding like fields that hold a borrow).

> +/// The fields are initialized in the order that they appear in the init=
ializer. A let binding
> +/// is generated so already initialized fields can be read. For [self-re=
ferential
> +/// structs](pin_data#self-referential-structs), you may also use such g=
enerated bindings to
> +/// initialize fields that borrow from them.

`init!` just below still has `- no references to fields are allowed to
be created inside of the initializer.` even though `init!` generates the
same `let` bindings for named fields.

Alice
