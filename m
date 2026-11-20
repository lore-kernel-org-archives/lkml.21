Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795193322;
	b=jHTBTCizL+TniA6pdiYAmGLVu1hbtD8lfy3Ws0sYB32UQKUOxQFj3Ys63PkWPLVLRTmc
	 Ftr+i/Qe+hTcgkQZ/iC3MDE68cyN7w1qAfW7hJyf0j/N1G1GBseA1QmMAqdbGFMFMxzrZ
	 R/MYTrDHh36Z3rGj5Vfc8T53bS+7BlIlWRx7YgHHo/jDYpM4bpZvJdQl0Pwt+VFSHFGHC
	 Iyz2sBm/j+6KCmFSC6RXpGL0xbnHqNqABNKogVakNkFVt4HodhZDFuC/SCoMxoMQZtpbV
	 AU5B112AM+ZkvAkfvJK0sFmKUxqKOXZrzJ4RhbYqd3UiPJ5AawR1Hlhr7wWPssf0OQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795193322;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=bfyjauXkdda14TZQkJmia5dShZ8rR0trlEvtPbJzkjU=;
	b=ifwXMI81yX4tXaPzebYgCPhFcHC6m9XHtet/VB24Lq82YwqhCFAUvYW7GXXXrJP9oY/8
	 l0Z5b/ocx8IG7pti3NXKa+v7CXckDOtyByySaMRmJwbPi9C1X8jVsPoFJHpMQ6veIK15p
	 LGaQWmCS5gYF3d7EPjo90SoMWGcjxS9GWinGGRVwPWlKWFxFZR2n+OPyax6iPO4kSbdP+
	 PKcB/BZ/JYyCQQZGtCjV/+vamDn0vCtkZ4+2wvqbjGVx92ZHOFRCrzpIZtBH2M94GSdnB
	 2uXHEFXBgXFiGaopVdlA2QPX7IZlDgCeNY9NPkebrB0lmavBfwsbd1N2IO+y5ZFljZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=RNAMJ6sM;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7716960A2600
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:48:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7716960A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=RNAMJ6sM
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so8808715e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795193320; x=1795798120; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bfyjauXkdda14TZQkJmia5dShZ8rR0trlEvtPbJzkjU=;
        b=RNAMJ6sMUpkWN4HrB0XYJTVcOtjWWEYhH6d3S9pj85lhBPRg5KkeaWo1USMBh8nDxJ
         w/2T2XYDMgVkyVrFeq/jl71c4n93hO/4Nc7iCIfX2OaYcsUU5pWUfNweZrU7lY4qEIxS
         4eh9dpGdnLaPp6u/BJuIaSUEM9sKLBQrNTbenH1nsZTez+0/KglhUPE3Mx537/pB4xRP
         8US4Tq4WX3HzsJOKtAtUGRlXjScW3SZXmw2uEC/7LSr2f9aIch+VfB/A7NqU30NL7hee
         0gL2JYNXK9f/Y2bCnqnXnDCx6SIjdqdoRXZ4BKvTX66tKXa7T7/hV4E9yjYAFoJPIXic
         WR7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795193320; x=1795798120;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bfyjauXkdda14TZQkJmia5dShZ8rR0trlEvtPbJzkjU=;
        b=o7g5+Z3AWBDG+Mmng40n2sDsOEydiajkbR0Xwhg6nOVQgjEhBgO1BVFabADbCTtVVv
         uHnI9q8GtBfBy9t/HIY3PYkb/zFKMPS63bj170cyCMBE2eOgvt9tWBNDgLNSlktj0v2U
         KGHRUUdTAxe7NDLIgr4rzti8InvgQkH++b/qfyIi6T65znC7vyaymLnZCz1VPArekzIL
         2rSShrdueDslZqhCmLlkqsGXUmMUe2rCCEtBs5wbAYE5TWgRAgPjhkOmE94OnTKA7TW+
         U9nDFsmn26wgWXLjuSQgIKf9C7h9VZRnTthBSXQDB8UsEkdjjHld8/G58U//jh0A0v6n
         aGfQ==
X-Forwarded-Encrypted: i=1; AL+hErHOvkhexn4EnI0XpD04oB2j3WYWg2Cd91aOxAchvYO6oA+NS+T+E9MfpY297ZiQ3w1+h8SDABGrRfep2UY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xXc3zxa4+tLgH5n10HvUq2Ewqn3oHN+d3NmiJM3xv9HsOkoXb
	DbTzwqoMhggd0re9zPXzYSjU1n/khKn0pcgmgpoczggKGxDeenqJMjCUoOt/hTtWG/I=
X-Gm-Gg: AYBFou2gj9NI9ZfFjgRilJMJRtjiIaPDsEe9hi+tRzldQOUPghr38LqNZBX2Iod8Hbd
	Ia+qNOgUIjmHYiQeQ6qcbjejdj7nC4NAxSURxKZ6axopeOv3f5FbcqlM9Dk/dG1BfqwL/dxP5TH
	BkZKBOb0ZEbBdVNkMfnmaE1UILtnqwo06VI1aOmmU6hgPhdGjq+SfIZ17x/OYt4eLzEAt08RQjV
	uFAbdTzFJsAhk+k049Kh6Jrz9ucCGQQfdamENar2t4+UUteq2cqLzMx6Gade8jqXeRY7YhqejM4
	rLAmbpZegXNcp9H72nYGAO9+g6EDq+ERejYB2xvmyUUVI17onCzYSXNZProCquSrZW5CaBozZgd
	FTnUCIE35eUqmKdVs+C62Fwy04+gfba/NraPaVr6oUfFdoWDDfIpLF9nY0n4heuO/GWbWCkcyXf
	L2sGHMC+HRYId0TsMdavyq+rarzqGRzeC+ApLVvLy6y+Ke9Ila3hZf40D3bngtRlSd+eEKIlSUR
	fpwVJUbHxMnhkWJyveUYi50gbPqYESbuDla4Bw5OqbcIHjFsfaM+NNRVND4Tt16iughH5zLOLIw
	9NMBoH0Cy+uZBuy76joBv380V9GXxYDTUZ/mLwPcnmI2WRmi
X-Received: by 2002:a05:600c:848d:b0:4bb:6b6b:fbaa with SMTP id 5b1f17b1804b1-4bb8880fd0amr81601005e9.16.1795193319985;
        Fri, 20 Nov 2026 08:48:39 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm102415595e9.15.2026.11.20.08.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 08:48:39 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 0/7] Clk improvements
From: Jerome Brunet <jbrunet@baylibre.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Danilo Krummrich <dakr@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Michal Wilczynski <m.wilczynski@samsung.com>, 
 Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 linux-pm <linux-pm@vger.kernel.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 linux-pwm <linux-pwm@vger.kernel.org>, 
 linux-clk <linux-clk@vger.kernel.org>, 
 rust-for-linux <rust-for-linux@vger.kernel.org>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Maurice Hieronymus <mhi@mailbox.org>, Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <1a1cb87df11.2c57f9fa237371.844135553238709982@collabora.com>
References: <20261013-clk-type-state-v6-0-a5e9977b3509@collabora.com>
 <1a1cb87df11.2c57f9fa237371.844135553238709982@collabora.com>
Date: Fri, 20 Nov 2026 17:48:38 +0100
Message-Id: <179519331840.3795820.8047048832159165355.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2089; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=4z3/sdMgR1NP7DfsDZx0tYiu2dW9UOhvaq59u1rg0JU=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNkMlc+2Ksh+kZXIPh/3rDDW4Kn27hqR6Y15t/Vndc9nY
 JL6uuFhRykLgxgXg6yYIksNd7X4O0mtL7Om69yGmcPKBDKEgYtTACYSOYfhf77/s+M/3jXtP6oy
 5+cRhk+hnv9r4q4aztv7e7Xt8cINxx8zMkx3PJygYGn8ecrZdJeblhwduyRv7OkO5akz19EKybu
 wlhsA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On 2026-11-11 13:54:01-03:00, Daniel Almeida wrote:
> Hi all,
> 
>  > This series contains a few improvements that simplify clock handling for
>  > drivers.
>  > 
>  > Patch 1 converts clk.rs to the kernel-vertical style for imports.
>  > 
>  > Patch 2 replaces OptionalClk with Clk::get_optional(). There is no struct
>  > optional_clk in C, and Clk already allows a NULL pointer.
>  > 
>  > Patch 3 implements the same typestate pattern that has been used
>  > successfully for Regulators. This is needed because otherwise drivers
>  > will be responsible for unpreparing and disabling clocks themselves and
>  > ultimately handling the reference counts on their own. This is
>  > undesirable. The patch automatically encodes this information using the
>  > type system so that no misuse can occur.
>  > 
>  > Patch 4 adds guards that prepare and/or enable a clock for the lifetime
>  > of the guard without consuming the Clk, so that a driver can keep a
>  > long-lived Clk<Prepared> and enable it for scoped sections.
>  > 
>  > Patch 5 makes things more convenient by offering devres-managed APIs. This
>  > lets drivers set clock parameters once and forget about lifetime
>  > management.
>  > 
>  > Patch 6 adds ExclusiveClk<T>, which holds rate exclusivity over a Clk<T>
>  > in any state until it is dropped.
>  > 
>  > Patch 7 uses it in pwm-th1520 to lock the clock rate for the lifetime of
>  > the driver data.

Hi there,

I was wondering how the rust folks expect these changes to be handled since they
touch the rust/ dir. Should the clock changes go through the clock tree or the
rust one ? it is fine with me either way.

I've added small comments on patch 3, with my understanding of what of what you
are trying to do. Please take them with a grain of salt. While I'm eager to help
rust grow in the kernel, I'm definetely very new to it. It is very likely I got
things wrong.

If there are pain points regarding clocks with Rust, please feel free to
reach me or Brian. We are happy to help if we can.

Cheers

-- 
Jerome

