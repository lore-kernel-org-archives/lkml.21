Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795193336;
	b=d7h51pKTiIJPkg8/BGYL1Pr3h+Bk2W7J+clOvfriCRQ7vsbQs37Hxfnl10tiD1wq/atV
	 beqgMBPkYPJ+icqUbZkAiRVjZtuMViZJ9xWflH1v39AW9iOvZNRVBot37zIgmdAlY6oOF
	 KLzh/9+lx7Xnc5eLvs/w2MzMI0qOp0qd/9MlwL+Y8ofAWhitA4SYacd5HbWLU4DDnLK3Z
	 E50roAoxLH1fHwSuqsxs1B6Orkmqo6rL0D9sYehJc5etDSCjhu45b9mwSGPsJrRqYmBry
	 V2sevU7nhI0LdizvacEktSYXIWTy15JKyp52Gr7k9BtsAmlA0OEQ/WThp1mmjprvbiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795193336;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=h6ErIQcXg/IQfSzNOukoWYAaLWArDLpy/6tOg0mzvho=;
	b=B8meqQ9fuSzfE16pqgbGH/0C9jBphU/o79YLBelWjyaj7loVw/mloC0cbSiE0W9M0uiq
	 3Q8ddHx+tiRGZHNKrWlzt2xEsxBDZMCtEOGMe/JoZXoT6jFbXxHJkjyxBzIoMPmmos8So
	 RCYDJ43NkvyiLXhN8t9B0OrtmLl3eFJkmoUjUZlDplOZ98EhCBPCYsI+c+h5JM4fLnrTE
	 bqsH9kWy0rX0Qe38aO7/1gLD8JeSm9vjYq7LnLuQSdjUWhtjIOIvBQgYE41IAYVWT0ipo
	 qDplK05DJ+JHBFmXrHGZuvL3rboamoHV2CaoM+yex94rhCWFSvMQrJoeL8XP85Na2gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ThqzXs9e;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED16606A334
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:48:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AED16606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ThqzXs9e
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4ad6219f7d8so453180f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795193334; x=1795798134; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=h6ErIQcXg/IQfSzNOukoWYAaLWArDLpy/6tOg0mzvho=;
        b=ThqzXs9ebiZGDM31gPGl6udrq/rds0mEtWQp5ii2kuizKVYwjIt1mRHIaBc6Fzz0d2
         gZA+3ggV2soL3PWUUsf4dGrZlqtGT3N8dW9S0rzOvNQN+sX7aPjYnnjG8vMoBzwfpOwz
         tGsIJXI43jmP1C3DUXG6T02SB7eruboytZi8alvfqyxGspyzlXpROvgdj6SReMSKJXLK
         kDHyIrCBfTy88WmXKjhS4HGD4CbC9N1lhIR5d7S7XuHHH+BaFEQY+gThdDukbyRKw4qQ
         /zWnhCNKVVlyZbltXIvRV9hF2hZzKltNgnSRMcwh1bP3tRso+GxfXCMD6VYbl97yZMt/
         Dyiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795193334; x=1795798134;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h6ErIQcXg/IQfSzNOukoWYAaLWArDLpy/6tOg0mzvho=;
        b=Oljm75zIu51FO9F47aVpYvDDMY3oN8GUXvFfqw5cvpjrNogYgb+OCPZzIvCbyJMAOM
         e3UIAvq0fN4nTCg0zQ2eYYEwPqHPYzRI8dDxVGtphgcW07OV747oT0h96qThk9ooEaS3
         /Fa9ZLmLpmEc2O/MeNHTdkRLJVbUQoRm2MUgQu/bYudJajn/HXfi8NUsswNhJAPHE6Zs
         bgRQ4xBOULhmLvuR+sdT0HWL36Y7CbB3AJYtwB9pllPZXIi2Y0puUFmJcJyuOSEy+is4
         R1M8vd5vM9qg/9qm0m1s3N2BDlrrSutOWGH23A0HCmHQuTeUTVc80+RqlM7Jx7wyWZH6
         Ri0A==
X-Forwarded-Encrypted: i=1; AL+hErGwxswZJrz+JS4jgSfVjBCOSbJYHjJ0iE8x1tO5Ld3DAix9rqFeax5clFha4AV3rEPa4lsTtUrf4XF7f+U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vi+Cza9KbJ5zyRKU6xMht8t8Nu99Fcx8y6mjxWXB1aMfXS/6H
	vYCl9yvZV3Un5jYY6Z0hj4wA6jZ9gbzUTaCrOehR6a40spnOfreB/CTgQ2rJyD6BSWk=
X-Gm-Gg: AZFdTZdJSSsJSoZD0FjXy6QPV4x2EBPPYhFmQhbMDRytmh/J6o3KIdHM9ThNWEEpVIv
	xbTrJVYElyebx930ust7WCByQQRTwvcXAfPsMQ+UCfdzVjQixdkNwAkdMp3f7WX/sBwuutcVuqp
	475FdZY8LQc2lCY5pD2/iv34LjJTi/ed7nDBdg9ZN+/8au/9fybpISR3v+WeDudhUeULQ1EQUus
	SkFDRyGXrYL3ShGn4XXyx7sbjvpEbNE5nqZqqnXOCrOB98rgPUT54eSFZzBDztPOmyk3sg2LWEW
	llcWUVRwj4hZjEDtj+y1Oz5fBYbvYF9pj/NWdTJsXo24xLX05Uy0+vcEXuXzM5ZKnA2hB8yYk3O
	KeSmhwe1/zt3XS+in+6a22rs4NuY36CelK4Cr7Tac45xyAKwNQPVs2EgtelaG8+w0HEGP6UbnG7
	BUjiCV7106ziqBKr/HPa7Oa5bNSNE5XFZ8kXORFDmiaex+JKnDuBEgtpTVXLnSyvNsbYOcjdwUl
	cNfsNMDXWr0I1E9x3kF1zflfOAnsbTMrNA9KvCPqzbCnPYrJcpIwv3djN816gav15ivDKLnlxbV
	URLPSL4Vp5Z8HuoV2mbRM3qBy0RoFJU9A23kYYXqSBFWnG62
X-Received: by 2002:a05:6000:2c0e:b0:48c:58d5:30fb with SMTP id ffacd0b85a97d-4abad5ac62emr8227901f8f.5.1795193333959;
        Fri, 20 Nov 2026 08:48:53 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm6034212f8f.34.2026.11.20.08.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 08:48:53 -0800 (PST)
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
Subject: Re: [PATCH v6 3/7] rust: clk: use the type-state pattern
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
 Alexandre Courbot <acourbot@nvidia.com>, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org, 
 linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Maurice Hieronymus <mhi@mailbox.org>, Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20261013-clk-type-state-v6-3-a5e9977b3509@collabora.com>
References: <20261013-clk-type-state-v6-0-a5e9977b3509@collabora.com>
 <20261013-clk-type-state-v6-3-a5e9977b3509@collabora.com>
Date: Fri, 20 Nov 2026 17:48:51 +0100
Message-Id: <179519333138.3795820.61438010297111723.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1734; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=vYLwHzMkZLjjbU0w6/Ec7PCJHgruiB342xDmGbUK7jQ=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNkMlV+EGpr8GpuXL66eHBu5Y3mWWeFV4a/G+0oUxUrer
 RUIcefpKGVhEONikBVTZKnhrhZ/J6n1ZdZ0ndswc1iZQIYwcHEKwETm3mJk+BtiEpjsotk54bty
 cAsHW8fEZPaiNRy3p1XOeRy6T/PLD0aGzfPKGdIZvNz7xBo2Ljp/6Q+/laCNSwnzT95L3nMcLF+
 wAwA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> The current Clk abstraction can still be improved on the following issues:
> 
> a) It only keeps track of a count to clk_get(), which means that users have
> to manually call disable() and unprepare(), or a variation of those, like
> disable_unprepare().
> 
> b) It allows repeated calls to prepare() or enable(), but it keeps no track
> of how often these were called, i.e., it's currently legal to write the
> following:
> 
> clk.prepare();
> clk.prepare();
> clk.enable();
> clk.enable();

This particular sequence is indeed allowed in C. I don't get why it should not
be ? (in general and/or in rust)

If you dis-allow this in rust, the 2 sides drift apart, don't they ?
I mean they start behaving differently. I suppose this is not something
desirable ?

> 
> And nothing gets undone on drop().
> 
> c) It does not let a user express the state of the clk through the
> type system. For example, there is currently no way to encode that a Clk is
> enabled via the type system alone.
> 
> Following the Regulator abstraction, switch this abstraction to use the
> type-state pattern instead. It solves both a) and b) by establishing a
> number of states and the valid ways to transition between them. It also
> automatically undoes any call to clk_get(), clk_prepare() and clk_enable()
> as applicable on drop(), so users do not have to do anything special
> before Clk goes out of scope.

So the point the is automatically clean-up (as in disable()) clock when they
go out of scope ? In C, the equivalent would be calling clk_put() with a non
NULL enable/prepare count. We do complain loudly when this happen. I don't
people should encouraged to not actively care for this.

-- 
Jerome

