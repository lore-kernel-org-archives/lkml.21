Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795101440;
	b=HfLpQImIB0RYrmYOSCfyu0FY/+tVPVMdLtXfAeu4HK/jWdmceq19MYZv2CIxuxJlK+KE
	 iwrgChBZWQmB5wNsbmz954Tx7W1LoauTWzHbLgJtsrxKP7wFGlHvcAdn9r4b3ndeGjOdS
	 GexpUgWCLwk3VN1589hgFgH0H7thrI4xIdQo3FCwuAZb0jjXctuX37TvZqjeyCcC2A0FA
	 KjBAcUbHvOxwwnIcaxJNCBKikF1blhnlDB7a0n3su7G4gS59h0L9wX7S6t4hRHspPoD4n
	 Qn6pQ90rN7DE8fUkODOvOtfNQ23o5dAvukSB9fEjd8lWrjOMTgIgqonSx1aHsUgZsJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795101440;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=SyuDrpmJ1XWa7Wlz59e6x5byHk/40wmc7cULUycDuXU=;
	b=3RZ33vtp4TY8SVwus74gzcXdb32aLCkEFZxlNl0W9SOn6zQVEHqNXqzyuju2okwClecW
	 bhyEf1+asCsWobEVQC+BXdFQ/AsOGPw7QM3/NVxA84E1jI+d2Bey3QrbcAxlRuztUkgXs
	 qRGRxG0pQTNZxIdWbhaZysaenvH7Ug3e8pdilJqT4JZ8EFX6Sk2oHTwHgS98Ta4BMc2ZH
	 ttnE0p77V7WpbKH8IP2kiKEHN8VNKeTounc1sNAo4zm1mRAcxfkHPlTswk6gVffDYQZLG
	 5eAchDAZgGBe6pypip8zLto9BVtf8IQPLgKW/YKybcM1I8nEc1LwIitT7aujCgiL8HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SZUILlph;
	arc=none smtp.remote-ip=209.85.128.69
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8F5606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:17:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C8F5606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SZUILlph
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4b764ffc014so20388265e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795101439; x=1795706239; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SyuDrpmJ1XWa7Wlz59e6x5byHk/40wmc7cULUycDuXU=;
        b=SZUILlphfgXGTDYE08I0YC8MVrpEvtcaFAbcGCcLFbLmTdSpr2hXCd9KEru7b4TsYN
         hi2Q2IAypjpu0LlG/zbsNNCHF/CtE++P/3i7QQgkmywfT/C2jSOIh69lTS2n+flXdfkR
         fsk8LU7HO1J968fKLDZ2Ro5h1RwyGNdjHwkHqqsMBopTGBGKLoW+IataHJj5j/nofwM4
         bz+f71x8khN+jjnhoWl0m4DwKFCVZaMNaf35lOPesszaJVHIP6yiKNxRP3VHtrNjsSRd
         Q7SzyoUUxgtpLXQxoozSUqKRy9tPYa1pUuEzQylHSu5b3RkZFkjcigYpbeVlYTQGStFv
         eooA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795101439; x=1795706239;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SyuDrpmJ1XWa7Wlz59e6x5byHk/40wmc7cULUycDuXU=;
        b=Sd3dz60dur8wU/7tNuGq6ILiksQqXm+vha42kaOX/jmce0gJsuQiLlMAb0SBulJ/wj
         lrt5hfA/d37JWmgbHhZ5/vu8gAxIDLjdaeW0JsjQmELQltvlADQp6GywnD+FSckTrFJE
         hwGqIrBrYL0Q7LRU22xGzD2OdA1/W13Zus3uZQDreUyu5gW4HB4K9MR9amQDZ6ub/RJx
         SB4gIze1z07ksngsi5X/84CHlbn8d3heLZ77oqOiQ/+cw3O2VIzHW0Gq075dAw/rlPDT
         zBBW9QKzQE1aUHFajJgIyL2nhy9xM4NpFsr3Lq9GRWWcgyz2OtqN6R7wNi2NvhIUakiP
         FNuQ==
X-Forwarded-Encrypted: i=1; AL+hErGJb9ws5JXsWdufn7VEwQnoaxDipI2o5DpGYR8rWdZyqYywzcBiLtZ0n7rTL64iDUfA/nHr+A+F80+MF4I=@vger.kernel.org
X-Gm-Message-State: APuU4Z9x705No6QU9Lz+dy3MdEI5ZQ8tR/FpmJgerV1LWLUTojQ7g2RC
	pAg1sfIIXUFFEZEkivXQX3LL7X5CMUNuLSb1PqbaIsWMn4KzSuHSveZG/4hNZC10txN8/ioN8r9
	cdgaqgb88fexpDxaQrw==
X-Received: from wmix24-n2.prod.google.com ([2002:a05:600c:e558:20b0:4bb:5200:da9e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4ecf:b0:4bb:60da:56af with SMTP id 5b1f17b1804b1-4bb7da391b7mr128329965e9.25.1795101438587;
 Thu, 19 Nov 2026 07:17:18 -0800 (PST)
Date: Thu, 19 Nov 2026 15:17:17 +0000
In-Reply-To: <DMZ9I1E2XDQ7.3F0NFO0VNO0BU@garyguo.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261119-rust-workqueue-v4-0-707c68994940@google.com>
 <20261119-rust-workqueue-v4-1-707c68994940@google.com> <DMZ9I1E2XDQ7.3F0NFO0VNO0BU@garyguo.net>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119151717.682282-1-aliceryhl@google.com>
Subject: Re: [PATCH v4 1/5] rust: workqueue: support stack-allocated work items
From: Alice Ryhl <aliceryhl@google.com>
To: Gary Guo <gary@garyguo.net>
Cc: Alice Ryhl <aliceryhl@google.com>, Tejun Heo <tj@kernel.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Danilo Krummrich <dakr@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, 
	John Hubbard <jhubbard@nvidia.com>, Philipp Stanner <phasta@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 19, 2026 at 02:37:17PM +0000, Gary Guo wrote:
> On Thu Nov 19, 2026 at 2:12 PM GMT, Alice Ryhl wrote:
> >  __rust_helper void rust_helper_init_work_with_key(struct work_struct *work,
> >  						  work_func_t func,
> > -						  bool onstack,
> >  						  const char *name,
> >  						  struct lock_class_key *key)
> >  {
> > -	__init_work(work, onstack);
> > +	__init_work(work, object_is_on_stack(work));
> 
> Is this fully optimized out if !CONFIG_DEBUG_OBJECTS_WORK?

Yes, on normal architectures (checked x86_64 and arm64 with Clang and
GCC): `get_current()` omits `volatile` and `current->stack` is a plain
load, so DCE removes all of `object_is_on_stack(work)` once the empty
`__init_work()` stub is inlined.

The one exception is `ARCH=um` with `CONFIG_SMP=y`, where `get_current()`
calls an external `uml_curr_cpu()` function without `__attribute_const__`
(and under `CONFIG_RUST_INLINE_HELPERS`, the dead `mrs`/`movq %gs:...`
inline asm stays in `helpers.bc` until backend codegen drops it). I can
wrap it in `if (IS_ENABLED(CONFIG_DEBUG_OBJECTS_WORK))` if I send a v5.

Alice
